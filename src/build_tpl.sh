set -e
cd /tmp/brand
PY=/Library/Developer/CommandLineTools/usr/bin/python3
# gen.py skipped: reusing the fragments already on disk
$PY - <<'EOF'
import io,os,re
tpl=io.open('page3.tpl',encoding='utf-8').read()
for tok,f in [('__DECK_WORK__','deck_work.html'),('__DECK_BUILDS__','deck_builds.html'),
              ('__DECK_STAKE__','deck_stake.html'),('__DECK_TOOLS__','deck_tools.html'),
              ('__DECK_EDU__','deck_edu.html'),('__DECK_PROJECTS__','deck_proj.html'),
              ('__PANES__','panes.html'),
              ('__REFS__','refs.html'),
              ('__RESUME_PAGES__','resume_pages.html'),
              ('__RESUME__','resume.txt'),
              ('__PORTRAIT__','portrait.txt')]:
    assert tok in tpl, "missing token "+tok
    tpl=tpl.replace(tok, io.open(f,encoding='utf-8').read())
# Most images live inside sections that start collapsed, yet the browser still
# fetched all of them on first paint. Deferring them means a phone downloads the
# hero and nothing else until a section is actually opened. The one image that
# already carries decoding= is the portrait, which must stay eager.
tpl, nlazy = re.subn(r'<img (?![^>]*\bdecoding=)', '<img loading="lazy" decoding="async" ', tpl)
# entity-encode every non-ASCII codepoint
out=''.join(c if ord(c)<128 else '&#%d;'%ord(c) for c in tpl)
tmp='final3.html.tmp'
io.open(tmp,'w',encoding='ascii').write(out)
os.replace(tmp,'final3.html')
n=os.path.getsize('final3.html')
print("PAGE %.2f MB | videos %d | placeholders %d | tiles %d | lazy imgs %d"%(
    n/1048576.0, out.count('<source '), out.count('<div class="dt-ph">'), out.count('<button class="dtile'), nlazy))
EOF
DEST="/Users/shamarrobinson/Library/Application Support/Claude/scratch-workspaces/b482d34d-74ca-4e2c-86ed-cca8538bc8b4/5739a358-43c8-4d97-a7ce-9aec2713a991/scratch-2026-09-17-962496/index.html"
cp final3.html "$DEST"
cp page3.tpl page3.backup.tpl
echo "synced -> index.html  $(wc -c < "$DEST") B"
