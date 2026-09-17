<title>Shamar Robinson</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo:wdth,wght@62..125,400..900&family=IBM+Plex+Mono:wght@400;500&family=IBM+Plex+Sans:wght@400;500;600&display=swap">
<style>
:root{
  --n0:#0A1626; --n1:#102640; --n2:#17355A; --n3:#1F4772; --n4:#2A5C90;
  --platinum:#EFF5FC; --silver:#C4D6EA; --muted:#A4BBD4; --faint:#7A93AE;
  --azure:#5FA8FF; --cyan:#86D6FF; --ice:#BBD9FF; --emerald:#3FD9A0;
  --wbd:94 226 214; --lgd:245 201 108; --dbt:126 178 255; --dtva:190 165 255; --tlv:74 226 170;
  --hair:rgba(190,220,255,.16); --hair2:rgba(190,220,255,.28);
  --panel:rgba(8,20,36,.46);
  --d:cubic-bezier(.22,.61,.36,1);
  --sans:"IBM Plex Sans",-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif;
  --disp:"Archivo","Helvetica Neue",Impact,sans-serif;
  --mono:"IBM Plex Mono",ui-monospace,SFMono-Regular,Menlo,monospace;
}
*{box-sizing:border-box}
body{
  margin:0;color:var(--platinum);font-family:var(--sans);font-size:15px;line-height:1.6;
  -webkit-font-smoothing:antialiased;overflow-x:hidden;
  background:
    linear-gradient(168deg,#23548A 0%,#1A4170 16%,#122C4C 40%,#0D1E36 62%,#153962 86%,#1E4A7C 100%);
  background-attachment:fixed;
}
/* ── ambient field ─────────────────────────────── */
.field{position:fixed;inset:0;z-index:0;pointer-events:none;overflow:hidden}
#weave{position:absolute;inset:0;width:100%;height:100%;opacity:.55}
.bloom{position:absolute;border-radius:50%;filter:blur(88px);will-change:transform}
.b1{width:72vw;height:72vw;max-width:980px;max-height:980px;top:-24vw;left:-12vw;opacity:.62;
  background:radial-gradient(circle,rgba(120,190,255,.55),transparent 66%)}
.b2{width:60vw;height:60vw;max-width:800px;max-height:800px;top:30vh;right:-18vw;opacity:.42;
  background:radial-gradient(circle,rgba(63,217,160,.40),transparent 68%)}
.b3{width:66vw;height:66vw;max-width:880px;max-height:880px;bottom:-22vw;left:6vw;opacity:.50;
  background:radial-gradient(circle,rgba(150,205,255,.42),transparent 70%)}
/* brushed-metal grain + opulent sheen */
.metal{position:absolute;inset:-20%;
  background:
    repeating-linear-gradient(113deg,rgba(255,255,255,.040) 0px,rgba(255,255,255,0) 2px,
      rgba(255,255,255,0) 5px,rgba(255,255,255,.022) 7px,rgba(255,255,255,0) 9px),
    repeating-linear-gradient(113deg,rgba(10,26,48,.30) 0px,rgba(255,255,255,0) 3px,
      rgba(255,255,255,0) 11px,rgba(10,26,48,.18) 14px);
  opacity:.55;will-change:transform}
.sheen{position:absolute;inset:0;
  background:linear-gradient(113deg,transparent 14%,rgba(255,255,255,.10) 34%,
    rgba(255,255,255,.03) 44%,transparent 58%,rgba(190,225,255,.07) 74%,transparent 88%)}
.spot{position:absolute;width:840px;height:840px;border-radius:50%;left:0;top:0;
  margin:-420px 0 0 -420px;pointer-events:none;opacity:.55;
  background:radial-gradient(circle,rgba(175,220,255,.20),rgba(120,180,255,.07) 42%,transparent 68%);
  will-change:transform}
.edge{position:absolute;inset:0;
  background:
    linear-gradient(90deg,rgba(10,70,58,.42),transparent 12%,transparent 88%,rgba(10,70,58,.42)),
    radial-gradient(135% 82% at 50% 0%,transparent 42%,rgba(6,16,30,.62) 100%);}
.grain{position:absolute;inset:0;opacity:.14;mix-blend-mode:overlay;
  background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='160' height='160'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.85' numOctaves='3'/%3E%3C/filter%3E%3Crect width='160' height='160' filter='url(%23n)' opacity='.5'/%3E%3C/svg%3E")}
/* ── shell ─────────────────────────────────────── */
.shell{position:relative;z-index:1;max-width:1180px;margin:0 auto;padding-inline:24px}
section{padding-block:clamp(56px,8vw,104px);scroll-margin-top:84px}
/* ── nav ───────────────────────────────────────── */
.nav{position:sticky;top:env(safe-area-inset-top,0px);z-index:40;
  backdrop-filter:blur(20px) saturate(160%);-webkit-backdrop-filter:blur(20px) saturate(160%);
  background:linear-gradient(180deg,rgba(11,28,50,.80),rgba(11,28,50,.34));
  border-bottom:1px solid var(--hair)}
.nav-in{max-width:1180px;margin:0 auto;padding:13px 24px;display:flex;align-items:center;gap:20px}
.mark{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:12.5px;letter-spacing:.16em;text-transform:uppercase;white-space:nowrap}
.mark i{font-style:normal;color:var(--cyan)}
.nav-links{margin-left:auto;display:flex;gap:6px;flex-wrap:wrap}
.nav a{font-family:var(--mono);font-size:11px;letter-spacing:.11em;text-transform:uppercase;
  color:var(--muted);text-decoration:none;padding:7px 11px;border-radius:7px;
  transition:color .25s var(--d),background .25s var(--d)}
.nav a:hover,.nav a:focus-visible{color:var(--platinum);background:rgba(190,225,255,.12)}
/* ── hero ──────────────────────────────────────── */
.hero{padding-block:clamp(52px,9vw,112px) clamp(40px,6vw,72px)}
.eyebrow{font-family:var(--mono);font-size:11px;letter-spacing:.26em;text-transform:uppercase;
  color:var(--muted);display:flex;align-items:center;gap:12px;margin-bottom:26px}
.eyebrow::after{content:"";height:1px;flex:1;max-width:230px;
  background:linear-gradient(90deg,rgba(134,214,255,.8),transparent)}
.name{font-family:var(--disp);font-variation-settings:"wdth" 118,"wght" 900;
  font-size:clamp(3rem,13.5vw,9.2rem);line-height:.86;letter-spacing:-.022em;
  text-transform:uppercase;margin:0;text-wrap:balance;
  background:linear-gradient(104deg,#FFFFFF 0%,#DCEBFB 13%,#9DB8D2 29%,#FFFFFF 43%,
    #C6DCF0 57%,#7E9BB6 73%,#F0F7FF 89%,#FFFFFF 100%);
  background-size:230% 100%;background-position:var(--sheen,42%) 50%;
  -webkit-background-clip:text;background-clip:text;color:transparent;
  filter:drop-shadow(0 3px 34px rgba(120,190,255,.45));
  transition:background-position .5s var(--d)}
.thesis{margin:30px 0 0;max-width:34em;font-size:clamp(1.02rem,2.1vw,1.3rem);
  line-height:1.52;color:var(--silver);text-wrap:pretty}
.thesis b{color:#fff;font-weight:600}
.sub{margin:16px 0 0;max-width:40em;font-size:15px;color:var(--muted);line-height:1.6}
.hero-meta{display:flex;flex-wrap:wrap;gap:9px;margin-top:32px}
.chip{display:inline-flex;align-items:center;gap:8px;padding:9px 15px;border-radius:999px;
  background:rgba(190,225,255,.10);border:1px solid var(--hair);backdrop-filter:blur(10px);
  font-family:var(--mono);font-size:11.5px;letter-spacing:.055em;color:var(--silver);
  text-decoration:none;transition:all .28s var(--d)}
a.chip:hover,a.chip:focus-visible{border-color:rgba(134,214,255,.75);color:#fff;
  background:rgba(134,214,255,.20);transform:translateY(-1px)}
/* ── ledger ────────────────────────────────────── */
.ledger{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
  gap:1px;background:var(--hair);border:1px solid var(--hair);border-radius:16px;
  overflow:hidden;backdrop-filter:blur(14px);
  box-shadow:0 20px 50px -28px rgba(4,14,28,.9),inset 0 1px 0 rgba(255,255,255,.12)}
.led{background:linear-gradient(165deg,rgba(190,225,255,.13),rgba(10,24,42,.30));
  padding:24px 20px;transition:background .35s var(--d)}
.led:hover{background:linear-gradient(165deg,rgba(134,214,255,.26),rgba(10,24,42,.22))}
.led-n{font-family:var(--disp);font-variation-settings:"wdth" 108,"wght" 800;
  font-size:clamp(1.9rem,4.6vw,2.7rem);line-height:1;letter-spacing:-.02em;
  font-variant-numeric:tabular-nums;
  background:linear-gradient(170deg,#FFFFFF,#BFD8F0 55%,#8FAFCC);
  -webkit-background-clip:text;background-clip:text;color:transparent}
.led-l{font-family:var(--mono);font-size:10.5px;letter-spacing:.14em;text-transform:uppercase;
  color:var(--muted);margin-top:10px;line-height:1.45}
/* ── heads ─────────────────────────────────────── */
.head{display:flex;align-items:baseline;gap:16px;margin-bottom:34px;flex-wrap:wrap}
.head h2{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:clamp(1.5rem,4vw,2.3rem);letter-spacing:-.012em;text-transform:uppercase;
  margin:0;color:#fff}
.head .idx{font-family:var(--mono);font-size:11px;color:var(--cyan);letter-spacing:.16em}
.head .note{font-family:var(--mono);font-size:11px;color:var(--muted);letter-spacing:.07em;
  margin-left:auto}
/* ── role tiles ────────────────────────────────── */
.tiles{display:flex;flex-direction:column;gap:22px}
.tile{position:relative;border-radius:22px;overflow:hidden;isolation:isolate;
  background:linear-gradient(158deg,rgba(190,225,255,.14),var(--panel) 46%,rgba(12,30,52,.52));
  border:1px solid var(--hair);
  backdrop-filter:blur(18px) saturate(150%);-webkit-backdrop-filter:blur(18px) saturate(150%);
  box-shadow:0 26px 58px -30px rgba(3,12,26,.92),inset 0 1px 0 rgba(255,255,255,.16);
  transition:border-color .4s var(--d),transform .4s var(--d),box-shadow .4s var(--d)}
.shot{position:absolute;inset:0;z-index:-2;background-size:cover;background-position:center 34%;
  filter:grayscale(.72) contrast(1.10) brightness(.80) saturate(1.15);
  opacity:.30;transform:scale(1.04);
  -webkit-mask-image:linear-gradient(100deg,transparent 4%,rgba(0,0,0,.30) 40%,rgba(0,0,0,.95) 82%);
  mask-image:linear-gradient(100deg,transparent 4%,rgba(0,0,0,.30) 40%,rgba(0,0,0,.95) 82%);
  transition:opacity .6s var(--d),transform .9s var(--d)}
.tile::after{content:"";position:absolute;inset:0;z-index:-1;pointer-events:none;
  background:linear-gradient(100deg,rgba(10,26,46,.86) 22%,rgba(10,26,46,.34) 62%,transparent),
    linear-gradient(0deg,rgb(var(--c) / .10),transparent 60%)}
.tile:hover{transform:translateY(-4px);border-color:rgb(var(--c) / .55);
  box-shadow:0 36px 72px -32px rgba(3,12,26,.96),0 0 0 1px rgb(var(--c) / .20),
    inset 0 1px 0 rgba(255,255,255,.24)}
.tile:hover .shot{opacity:.46;transform:scale(1.0)}
.rail{position:absolute;left:0;top:0;bottom:0;width:3px;z-index:2;
  background:linear-gradient(180deg,rgb(var(--c)),rgb(var(--c) / .10));
  box-shadow:0 0 18px rgb(var(--c) / .55)}
.tile-in{position:relative;z-index:1;padding:clamp(24px,3.4vw,38px)}
.tile-top{display:flex;gap:22px;align-items:flex-start;flex-wrap:wrap}
.logo{height:34px;width:auto;max-width:210px;object-fit:contain;object-position:left center;
  filter:brightness(0) invert(1) drop-shadow(0 2px 10px rgba(0,0,0,.5));opacity:.96;flex:none}
.crest{width:58px;height:58px;flex:none;border-radius:16px;display:grid;place-items:center;
  font-family:var(--disp);font-variation-settings:"wdth" 74,"wght" 800;font-size:13px;
  color:rgb(var(--c));
  background:radial-gradient(120% 120% at 30% 20%,rgb(var(--c) / .34),rgb(var(--c) / .07));
  border:1px solid rgb(var(--c) / .50);
  box-shadow:inset 0 1px 0 rgba(255,255,255,.30),0 0 24px -6px rgb(var(--c) / .65)}
.tile-id{min-width:0;flex:1}
.org{font-family:var(--disp);font-variation-settings:"wdth" 108,"wght" 800;
  font-size:clamp(1.18rem,2.9vw,1.74rem);line-height:1.12;letter-spacing:-.012em;
  margin:0;color:#fff;text-wrap:balance;text-shadow:0 2px 16px rgba(4,14,28,.6)}
.role{font-size:14px;color:var(--silver);margin:7px 0 0;line-height:1.45}
.term{font-family:var(--mono);font-size:11px;letter-spacing:.11em;text-transform:uppercase;
  color:rgb(var(--c));white-space:nowrap;padding-top:6px}
.rhythm{margin:24px 0 0;padding-left:17px;border-left:2px solid rgb(var(--c) / .55);
  font-size:15px;line-height:1.6;color:var(--silver);max-width:62ch;text-wrap:pretty}
.proof{display:flex;flex-wrap:wrap;gap:8px;margin-top:22px}
.pf{font-family:var(--mono);font-size:11px;letter-spacing:.05em;padding:8px 13px;border-radius:9px;
  background:rgb(var(--c) / .16);border:1px solid rgb(var(--c) / .38);color:#fff;
  backdrop-filter:blur(6px)}
/* time */
.tl{font-family:var(--mono);font-size:10.5px;letter-spacing:.16em;text-transform:uppercase;
  color:var(--muted);margin:30px 0 12px}
.stack{display:flex;height:10px;border-radius:999px;overflow:hidden;
  background:rgba(8,22,40,.55);border:1px solid var(--hair);
  box-shadow:inset 0 1px 2px rgba(0,0,0,.4)}
.seg{height:100%;transition:flex-grow .9s var(--d)}
.split{margin-top:6px}
.row{display:grid;grid-template-columns:1fr 92px 44px;gap:18px;align-items:center;
  padding:12px 0;border-top:1px solid rgba(190,220,255,.11)}
.row-l{font-size:14px;color:#fff;font-weight:500;line-height:1.35;display:block}
.row-g{font-size:12.8px;color:var(--muted);line-height:1.5;display:block;margin-top:3px;
  max-width:64ch}
.row-t{display:block;height:5px;border-radius:999px;background:rgba(8,22,40,.6);overflow:hidden}
.row-f{display:block;height:100%;border-radius:999px;width:var(--w);
  background:linear-gradient(90deg,rgb(var(--c) / .55),rgb(var(--c)));
  box-shadow:0 0 10px rgb(var(--c) / .55);transition:width .95s var(--d)}
.row-v{font-family:var(--mono);font-size:13px;color:#fff;text-align:right;
  font-variant-numeric:tabular-nums}
/* disclosure */
details{margin-top:24px;border-top:1px solid var(--hair);padding-top:17px}
summary{list-style:none;cursor:pointer;display:inline-flex;align-items:center;gap:9px;
  font-family:var(--mono);font-size:11px;letter-spacing:.13em;text-transform:uppercase;
  color:var(--muted);border-radius:7px;padding:5px 2px;transition:color .25s var(--d)}
summary::-webkit-details-marker{display:none}
summary:hover,summary:focus-visible{color:rgb(var(--c))}
summary .cvr{width:16px;height:16px;border-radius:5px;display:grid;place-items:center;
  border:1px solid rgb(var(--c) / .6);color:rgb(var(--c));font-size:11px;line-height:1;
  transition:transform .35s var(--d)}
details[open] summary .cvr{transform:rotate(45deg)}
.drawer{display:grid;grid-template-columns:repeat(auto-fit,minmax(232px,1fr));gap:26px;padding-top:21px}
.dk{font-family:var(--mono);font-size:10.5px;letter-spacing:.15em;text-transform:uppercase;
  color:rgb(var(--c));margin-bottom:12px}
.dl{margin:0;padding:0;list-style:none;display:flex;flex-direction:column;gap:8px}
.dl li{font-size:13.4px;color:var(--silver);line-height:1.55;padding-left:15px;position:relative}
.dl li::before{content:"";position:absolute;left:0;top:.65em;width:6px;height:1px;
  background:rgb(var(--c))}
.dl b{color:#fff;font-weight:600}
.tags{display:flex;flex-wrap:wrap;gap:6px}
.tag{font-family:var(--mono);font-size:10.5px;padding:6px 10px;border-radius:7px;
  background:rgba(190,225,255,.10);border:1px solid var(--hair);color:var(--silver)}
/* ── builds ────────────────────────────────────── */
.builds{display:grid;grid-template-columns:repeat(auto-fit,minmax(310px,1fr));gap:18px}
.build{position:relative;border-radius:18px;padding:28px;border:1px solid var(--hair);
  background:linear-gradient(158deg,rgba(190,225,255,.15),var(--panel) 52%,rgba(12,30,52,.50));
  backdrop-filter:blur(16px);overflow:hidden;
  box-shadow:0 20px 48px -30px rgba(3,12,26,.9),inset 0 1px 0 rgba(255,255,255,.15);
  transition:border-color .35s var(--d),transform .35s var(--d)}
.build:hover{border-color:rgba(134,214,255,.55);transform:translateY(-3px)}
.build-w{font-family:var(--mono);font-size:10px;letter-spacing:.17em;text-transform:uppercase;
  color:var(--cyan);margin-bottom:13px}
.build h3{font-family:var(--disp);font-variation-settings:"wdth" 104,"wght" 800;
  font-size:1.16rem;margin:0 0 12px;color:#fff;line-height:1.2}
.build .plain{font-size:14.6px;color:var(--silver);line-height:1.6;margin:0 0 15px}
.build .tech{font-family:var(--mono);font-size:12px;color:var(--muted);line-height:1.68;
  margin:0;padding-top:13px;border-top:1px solid rgba(190,220,255,.13)}
/* ── stack ─────────────────────────────────────── */
.grid3{display:grid;grid-template-columns:repeat(auto-fit,minmax(258px,1fr));gap:16px}
.card{border-radius:16px;padding:24px;border:1px solid var(--hair);
  background:linear-gradient(158deg,rgba(190,225,255,.13),var(--panel) 55%,rgba(12,30,52,.46));
  backdrop-filter:blur(14px);box-shadow:inset 0 1px 0 rgba(255,255,255,.14);
  transition:border-color .35s var(--d),transform .35s var(--d)}
.card:hover{border-color:rgba(134,214,255,.5);transform:translateY(-2px)}
.card h3{font-family:var(--mono);font-size:10.5px;letter-spacing:.16em;text-transform:uppercase;
  color:var(--cyan);margin:0 0 15px}
.card p{margin:0;font-size:14px;color:var(--silver);line-height:1.65}
.earlier{font-family:var(--mono);font-size:11.5px;color:var(--muted);letter-spacing:.05em;
  line-height:1.9;margin-top:24px;padding:17px 21px;border-radius:13px;
  background:rgba(190,225,255,.07);border:1px solid var(--hair)}
.earlier b{color:var(--platinum);font-weight:500}
/* ── footer ────────────────────────────────────── */
.foot{border-top:1px solid var(--hair);margin-top:44px;
  padding-block:46px calc(40px + env(safe-area-inset-bottom,0px));
  display:flex;flex-wrap:wrap;gap:22px;align-items:center;justify-content:space-between}
.foot-n{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:1.15rem;letter-spacing:.04em;text-transform:uppercase;color:#fff}
.foot small{font-family:var(--mono);font-size:10.5px;color:var(--muted);
  letter-spacing:.06em;display:block;margin-top:8px;max-width:52ch;line-height:1.7}
.credits{width:100%;font-family:var(--mono);font-size:9.5px;color:var(--faint);
  letter-spacing:.04em;line-height:1.75;padding-top:22px;border-top:1px solid rgba(190,220,255,.09)}
:focus-visible{outline:2px solid var(--cyan);outline-offset:3px;border-radius:5px}
@media (max-width:660px){
  .term{padding-top:0}
  .row{grid-template-columns:1fr 46px;gap:12px}
  .row-t{display:none}
  .logo{height:28px}
}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition-duration:.01ms!important}}
</style>

<div class="field" aria-hidden="true">
  <canvas id="weave"></canvas>
  <div class="bloom b1" data-px="26"></div>
  <div class="bloom b2" data-px="-34"></div>
  <div class="bloom b3" data-px="18"></div>
  <div class="metal" data-px="-10"></div>
  <div class="sheen"></div>
  <div class="spot" id="spot"></div>
  <div class="edge"></div>
  <div class="grain"></div>
</div>

<nav class="nav">
  <div class="nav-in">
    <span class="mark">SR<i>.</i></span>
    <div class="nav-links">
      <a href="#work">Work</a><a href="#builds">Builds</a>
      <a href="#stack">Stack</a><a href="#contact">Contact</a>
    </div>
  </div>
</nav>

<div class="shell">
  <header class="hero">
    <div class="eyebrow">Portfolio &mdash; MMXXVI</div>
    <h1 class="name" id="nm">Shamar<br>Robinson</h1>
    <p class="thesis">Seven years as the <b>accuracy layer</b> between a contractual obligation
      and the money that moved because of it.</p>
    <p class="sub">Warner Bros. Discovery. Legendary. Disney. The contracts behind the content,
      turned into numbers leadership could act on.</p>
    <div class="hero-meta">
      <a class="chip" href="mailto:shamarrobinson31@gmail.com">shamarrobinson31@gmail.com</a>
      <a class="chip" href="https://linkedin.com/in/shamarrobinson" target="_blank" rel="noopener">LinkedIn &#8599;</a>
    </div>
  </header>

  <section aria-label="At a glance" style="padding-block:0 clamp(48px,7vw,88px)">
    <div class="ledger">
      <div class="led"><div class="led-n">1,900+</div><div class="led-l">Agreements<br>analyzed</div></div>
      <div class="led"><div class="led-n">100+</div><div class="led-l">Agreements<br>drafted</div></div>
      <div class="led"><div class="led-n">4</div><div class="led-l">Major<br>studios</div></div>
      <div class="led"><div class="led-n">12+</div><div class="led-l">Departments per<br>deliverable</div></div>
      <div class="led"><div class="led-n">45&middot;60&middot;90</div><div class="led-l">Day contractual<br>clocks held</div></div>
    </div>
  </section>

  <section id="work">
    <div class="head"><span class="idx">01</span><h2>The Work</h2>
      <span class="note">How the days actually broke down</span></div>
    <div class="tiles">
__TILES__
    </div>
    <p class="earlier"><b>Earlier</b> &nbsp;&middot;&nbsp; Cox Media &mdash; Contract Coordinator,
      Campaign Fulfillment (2018&ndash;2019) &nbsp;&middot;&nbsp; The Coca-Cola Company &mdash;
      Account Coordinator, Marketing &amp; Sales Support (2017&ndash;2018)</p>
  </section>

  <section id="builds">
    <div class="head"><span class="idx">02</span><h2>Signature Builds</h2>
      <span class="note">Plain english first &middot; specifics under it</span></div>
    <div class="builds">
      <article class="build">
        <div class="build-w">Warner Bros. Discovery</div>
        <h3>Partner statement packages</h3>
        <p class="plain">Four media partners, each owed a full accounting every quarter &mdash; on
          separate 45, 60 and 90-day contractual clocks, all keyed to a single close. Miss one and
          it is a breach, not a late report.</p>
        <p class="tech">Three monthly rights reports per partner, consolidated into one package.
          Built in Excel with Power Query so each quarter was a refresh rather than a rebuild.</p>
      </article>
      <article class="build">
        <div class="build-w">Warner Bros. Discovery</div>
        <h3>The financial abstract</h3>
        <p class="plain">The controlling document behind every payment on a title. It turns a stack
          of signed contracts into the exact parameters a payment system calculates from. Get one
          field wrong and every payment downstream is wrong.</p>
        <p class="tech">Participant roster, governing financial definition, fee schedule, recoupment
          terms, breakeven mechanics. Maker-checker review: preparer, peer reviewer, two approvers.</p>
      </article>
      <article class="build">
        <div class="build-w">Warner Bros. Discovery</div>
        <h3>Status tracking workbook</h3>
        <p class="plain">A live view of every open item, built so leadership could read the pipeline
          without calling a meeting or asking me for an update.</p>
        <p class="tech">Multi-sheet tracker scoring each item on an eight-state progress legend with
          days due, participant count, proposed completion date and a dated narrative per item.</p>
      </article>
      <article class="build">
        <div class="build-w">Legendary Entertainment</div>
        <h3>Rights management system build</h3>
        <p class="plain">Represented business and legal affairs on the team that built the studio's
          rights platform &mdash; translating what each group needed into how the system stored it.
          Getting everyone to agree on definitions was the hard part.</p>
        <p class="tech">Defined baseline contract and contact records, then ran live entry as deals
          closed. Twenty percent of the role by the department's own weighting.</p>
      </article>
    </div>
  </section>

  <section id="stack">
    <div class="head"><span class="idx">03</span><h2>The Stack</h2>
      <span class="note">Platforms, analysis, credentials</span></div>
    <div class="grid3">
      <div class="card"><h3>Analysis &amp; Modeling</h3>
        <div class="tags"><span class="tag">Excel &mdash; Power Query</span><span class="tag">Pivot tables</span>
          <span class="tag">XLOOKUP / INDEX-MATCH</span><span class="tag">SUMIFS</span>
          <span class="tag">SQL</span><span class="tag">Python</span><span class="tag">Tableau</span></div></div>
      <div class="card"><h3>Enterprise Systems</h3>
        <div class="tags"><span class="tag">SAP</span><span class="tag">Salesforce</span>
          <span class="tag">Business Objects</span><span class="tag">QuickBase</span>
          <span class="tag">PostgreSQL</span></div></div>
      <div class="card"><h3>Contract &amp; Rights</h3>
        <div class="tags"><span class="tag">FilmTrack</span><span class="tag">Sylvester</span>
          <span class="tag">Alliant</span><span class="tag">BLAST</span></div></div>
      <div class="card"><h3>Workflow &amp; Documents</h3>
        <div class="tags"><span class="tag">Jira</span><span class="tag">Asana</span>
          <span class="tag">SharePoint</span><span class="tag">iManage</span><span class="tag">Box</span>
          <span class="tag">DocuSign</span><span class="tag">AdobeSign</span></div></div>
      <div class="card"><h3>Education</h3>
        <p>M.B.A., Lynn University &middot; 2019<br>
          B.A. Journalism &amp; B.A. Film &amp; Video, Georgia State &middot; 2017</p></div>
      <div class="card"><h3>Certifications &mdash; 2026</h3>
        <p>IBM Data Analyst Professional Certificate<br>
          Tableau Business Intelligence Analyst Professional Certificate</p></div>
    </div>
  </section>

  <footer class="foot" id="contact">
    <div>
      <div class="foot-n">Shamar Robinson</div>
      <small>A dozen departments feeding one deliverable. None of them reporting to me.
        All on their own deadlines.</small>
    </div>
    <div class="hero-meta" style="margin-top:0">
      <a class="chip" href="mailto:shamarrobinson31@gmail.com">Email</a>
      <a class="chip" href="https://linkedin.com/in/shamarrobinson" target="_blank" rel="noopener">LinkedIn &#8599;</a>
    </div>
    <div class="credits">
      Studio marks are the property of their respective owners and appear here solely to identify
      past employment. Photography via Wikimedia Commons &mdash; Warner Bros. water tower by Chris
      Yarzab (CC BY 2.0) &middot; Disney gate by Coolcaesar (CC BY-SA 4.0) &middot; Team Disney
      building by Junkyardsparkle (CC0) &middot; Las Vegas by King of Hearts (CC BY-SA 4.0).
    </div>
  </footer>
</div>

<script>
(function(){
  var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var px = -0.5, py = -0.5, tx = -0.5, ty = -0.5, mx = -9999, my = -9999;

  /* ── pointer plumbing ── */
  window.addEventListener("pointermove", function(e){
    tx = e.clientX / window.innerWidth - 0.5;
    ty = e.clientY / window.innerHeight - 0.5;
    mx = e.clientX; my = e.clientY;
    var nm = document.getElementById("nm");
    if (nm && !reduce) nm.style.setProperty("--sheen", (18 + (tx + 0.5) * 64) + "%");
  }, {passive:true});
  window.addEventListener("pointerleave", function(){ mx = -9999; my = -9999; }, {passive:true});

  var layers = [].slice.call(document.querySelectorAll("[data-px]"));
  var spot = document.getElementById("spot");

  /* ── canvas weave: drifting metallic constellation ── */
  var cv = document.getElementById("weave"), ctx = cv && cv.getContext("2d");
  var pts = [], W = 0, H = 0, dpr = 1;
  function size(){
    if (!cv) return;
    dpr = Math.min(window.devicePixelRatio || 1, 2);
    W = cv.clientWidth; H = cv.clientHeight;
    cv.width = Math.round(W * dpr); cv.height = Math.round(H * dpr);
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    var target = Math.min(110, Math.round((W * H) / 15000));
    pts = [];
    for (var i = 0; i < target; i++){
      pts.push({ x: Math.random()*W, y: Math.random()*H,
                 vx: (Math.random()-0.5)*0.16, vy: (Math.random()-0.5)*0.16,
                 r: Math.random()*1.5 + 0.5,
                 g: Math.random() < 0.18 });
    }
  }
  function frame(){
    if (!ctx) return;
    ctx.clearRect(0,0,W,H);
    var i, j, a, b, dx, dy, d2;
    for (i = 0; i < pts.length; i++){
      a = pts[i];
      a.x += a.vx; a.y += a.vy;
      if (a.x < -20) a.x = W+20; if (a.x > W+20) a.x = -20;
      if (a.y < -20) a.y = H+20; if (a.y > H+20) a.y = -20;
      dx = a.x - mx; dy = a.y - my; d2 = dx*dx + dy*dy;
      var near = d2 < 46000;
      ctx.beginPath();
      ctx.arc(a.x, a.y, a.r * (near ? 2.0 : 1), 0, 6.2832);
      ctx.fillStyle = a.g ? "rgba(96,226,178," + (near ? .85 : .40) + ")"
                          : "rgba(196,228,255," + (near ? .95 : .46) + ")";
      ctx.fill();
      if (near){
        ctx.beginPath(); ctx.moveTo(a.x, a.y); ctx.lineTo(mx, my);
        ctx.strokeStyle = "rgba(150,212,255," + (0.30 * (1 - d2/46000)) + ")";
        ctx.lineWidth = 0.7; ctx.stroke();
      }
      for (j = i+1; j < pts.length; j++){
        b = pts[j]; dx = a.x-b.x; dy = a.y-b.y; d2 = dx*dx + dy*dy;
        if (d2 < 15000){
          ctx.beginPath(); ctx.moveTo(a.x,a.y); ctx.lineTo(b.x,b.y);
          ctx.strokeStyle = "rgba(168,214,255," + (0.17 * (1 - d2/15000)) + ")";
          ctx.lineWidth = 0.6; ctx.stroke();
        }
      }
    }
  }
  function loop(){
    px += (tx - px) * 0.055; py += (ty - py) * 0.055;
    layers.forEach(function(el){
      var k = parseFloat(el.getAttribute("data-px")) || 0;
      el.style.transform = "translate3d(" + (px*k) + "px," + (py*k) + "px,0)";
    });
    if (spot && mx > -9998) spot.style.transform = "translate3d(" + mx + "px," + my + "px,0)";
    frame();
    raf = requestAnimationFrame(loop);
  }
  var raf = null;
  if (!reduce && cv){
    size(); window.addEventListener("resize", size);
    loop();
    document.addEventListener("visibilitychange", function(){
      if (document.hidden){ cancelAnimationFrame(raf); raf = null; }
      else if (!raf){ raf = requestAnimationFrame(loop); }
    });
  } else if (cv){ cv.style.display = "none"; }

  /* ── bars grow on reveal; correct at rest without JS ── */
  if (!reduce && "IntersectionObserver" in window){
    var io = new IntersectionObserver(function(en){
      en.forEach(function(e){
        if (!e.isIntersecting) return;
        io.unobserve(e.target);
        e.target.querySelectorAll(".row-f").forEach(function(f){
          var w = f.style.getPropertyValue("--w"); f.style.width = "0%";
          requestAnimationFrame(function(){ requestAnimationFrame(function(){ f.style.width = w; }); });
        });
        e.target.querySelectorAll(".seg").forEach(function(s){
          var g = s.style.flexGrow; s.style.flexGrow = "0.001";
          requestAnimationFrame(function(){ requestAnimationFrame(function(){ s.style.flexGrow = g; }); });
        });
      });
    }, {threshold:0.2});
    document.querySelectorAll(".tile").forEach(function(t){ io.observe(t); });
  }

  document.querySelectorAll('.nav a[href^="#"]').forEach(function(a){
    a.addEventListener("click", function(e){
      var t = document.querySelector(a.getAttribute("href"));
      if (!t) return; e.preventDefault();
      t.scrollIntoView({behavior: reduce ? "auto" : "smooth", block:"start"});
    });
  });
})();
</script>
