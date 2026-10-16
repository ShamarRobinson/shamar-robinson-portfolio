"""Turn the single-file artifact build into a static site for real hosting.

The artifact sandbox blocks external files, so every asset is base64 inlined
there. On a normal host that is pure cost: base64 inflates binary by a third
and nothing renders until the whole document arrives. This pulls the assets
back out into real files and lets the browser fetch them on demand.
"""
import re, os, base64, hashlib, shutil, sys

SRC = 'final3.html'
SITE_DEFAULT = ('/Users/shamarrobinson/Library/Application Support/Claude/scratch-workspaces/'
                'b482d34d-74ca-4e2c-86ed-cca8538bc8b4/5739a358-43c8-4d97-a7ce-9aec2713a991/'
                'scratch-2026-09-17-962496/site')
# default to the workspace site dir, not a 'site' beside this script: publishing
# from the wrong one ships a stale page that still looks plausible
OUT = sys.argv[1] if len(sys.argv) > 1 else SITE_DEFAULT
EXT = {'image/webp':'webp','image/svg+xml':'svg','video/mp4':'mp4',
       'image/png':'png','image/jpeg':'jpg','application/pdf':'pdf'}

shutil.rmtree(OUT, ignore_errors=True)
os.makedirs(OUT + '/assets', exist_ok=True)

html = open(SRC, encoding='ascii').read()
seen = {}

def repl(m):
    mime, b64 = m.group(1), m.group(2)
    if b64 in seen: return seen[b64]
    raw = base64.b64decode(b64)
    if mime == 'application/pdf':
        name = 'Shamar_Robinson_Resume.pdf'
    else:
        name = hashlib.sha1(raw).hexdigest()[:16] + '.' + EXT.get(mime, 'bin')
    open(os.path.join(OUT, 'assets', name), 'wb').write(raw)
    seen[b64] = 'assets/' + name
    return seen[b64]

out = re.sub(r'data:([a-zA-Z0-9/+.\-]+);base64,([A-Za-z0-9+/=]+)', repl, html)
assert 'base64,' not in out, 'an asset was left inlined'

# Inline data never needed a preload hint; real files do. Dropping the autoplay
# attribute was tried first and does defer the fetch, but Chrome then refuses the
# observer's play() call and every tile sits frozen on its poster. So autoplay
# stays and the source URL is withheld instead: no src means no request, and the
# moment a tile nears the viewport the src is filled in and autoplay takes over.
out, n = re.subn(r'preload="auto"', 'preload="none"', out)
out, n2 = re.subn(r'(<source )src="(assets/[^"]+\.mp4)"', r'\1data-src="\2"', out)
assert n == n2, 'video rewrite mismatch (%d preload / %d source)' % (n, n2)

# loading="lazy" does nothing for an image inside a collapsed section: with no
# layout box it never intersects, and Chrome simply fetches it anyway. Measured
# on this page, 106 of 107 such images still downloaded on first paint. So the
# source is withheld the same way the reels withhold theirs, and filled in when
# the image is actually shown.
out, nimg = re.subn(r'(<img )loading="lazy" decoding="async" ([^>]*?)src="(assets/[^"]+)"',
                    r'\1decoding="async" \2data-src="\3"', out)

IMGDEFER = """
<script>
/* Fill in an image's source once it is actually displayed. Images in collapsed
   sections have no layout box, so they never intersect and never load until the
   section opens -- which is the point. */
(function(){
  var imgs = [].slice.call(document.querySelectorAll("img[data-src]"));
  if (!imgs.length) return;
  function load(i){
    var u = i.getAttribute("data-src");
    if (!u) return;
    i.src = u;
    i.removeAttribute("data-src");
  }
  if (!("IntersectionObserver" in window)) { imgs.forEach(load); return; }
  var io = new IntersectionObserver(function(entries){
    entries.forEach(function(e){
      if (e.isIntersecting) { load(e.target); io.unobserve(e.target); }
    });
  }, {rootMargin: "400px"});
  imgs.forEach(function(i){ io.observe(i); });
})();
</script>
"""

DEFER = """
<script>
/* Fill in each reel's source only as its tile comes into view. */
(function(){
  var vids = [].slice.call(document.querySelectorAll(".dt-video"));
  if (!vids.length) return;
  function load(v){
    var s = v.querySelector("source[data-src]");
    if (!s) return;
    s.src = s.getAttribute("data-src");
    s.removeAttribute("data-src");
    v.load();
    var p = v.play(); if (p && p.catch) p.catch(function(){});
  }
  if (!("IntersectionObserver" in window)) { vids.forEach(load); return; }
  var io = new IntersectionObserver(function(entries){
    entries.forEach(function(e){
      if (e.isIntersecting) { load(e.target); io.unobserve(e.target); }
    });
  }, {rootMargin: "300px"});
  vids.forEach(function(v){ io.observe(v); });
})();
</script>
"""
# A link preview needs an image URL, and the portrait only gets a real filename
# once the assets are split out. Relative is resolved by some scrapers and not
# others; swap it for an absolute URL once the site has its final domain.
m = re.search(r'<figure class="portrait"[^>]*>\s*<img[^>]+src="(assets/[^"]+)"', out)
if m:
    og = '<meta property="og:image" content="https://shamarrobinson.github.io/shamar-robinson-portfolio/%s">\n' % m.group(1)
    out = out.replace('<meta property="og:type"', og + '<meta property="og:type"', 1)
    print('og:image -> %s' % m.group(1))

BOTH = DEFER + IMGDEFER
out = (out.replace('</body>', BOTH + '</body>', 1)
       if '</body>' in out else out.rstrip() + '\n' + BOTH)

open(os.path.join(OUT, 'index.html'), 'w', encoding='ascii').write(out)
open(os.path.join(OUT, '.nojekyll'), 'w').write('')

files = [(f, os.path.getsize(os.path.join(OUT, 'assets', f)))
         for f in sorted(os.listdir(OUT + '/assets'))]
vid = sum(s for f, s in files if f.endswith('.mp4'))
img = sum(s for f, s in files if not f.endswith('.mp4'))
print('index.html  %6.1f KB   (single-file build: %.2f MB)'
      % (os.path.getsize(OUT + '/index.html')/1024, os.path.getsize(SRC)/1048576))
print('assets      %d files   images %.2f MB   video %.2f MB' % (len(files), img/1048576, vid/1048576))
print('deferred until shown: %d reels, %d images' % (n, nimg))
