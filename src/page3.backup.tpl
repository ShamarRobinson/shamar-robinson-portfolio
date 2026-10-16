<!doctype html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shamar Robinson</title>
<meta name="description" content="I make complicated information accurate, clear and on time — then put it in front of the people who decide.">
<meta name="theme-color" content="#05203A">
<meta property="og:url" content="https://shamarrobinson.github.io/shamar-robinson-portfolio/">
<meta property="og:type" content="website">
<meta property="og:title" content="Shamar Robinson">
<meta property="og:description" content="I make complicated information accurate, clear and on time — then put it in front of the people who decide.">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Shamar Robinson">
<meta name="twitter:description" content="I make complicated information accurate, clear and on time — then put it in front of the people who decide.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo:wdth,wght@62..125,400..900&family=IBM+Plex+Mono:wght@400;500&family=IBM+Plex+Sans:wght@400;500;600&display=swap">
<style>
:root{
  --n0:#0A1626; --n1:#102640; --n2:#17355A; --n3:#1F4772; --n4:#2A5C90;
  --platinum:#EFF5FC; --silver:#C4D6EA; --muted:#A4BBD4; --faint:#7A93AE;
  --azure:#5FA8FF; --cyan:#86D6FF; --ice:#BBD9FF; --emerald:#3FD9A0;
  --wbd:94 230 214; --lgd:247 199 96; --dbt:127 196 255; --dtva:196 166 255; --tlv:88 240 176;
  --hair:rgba(190,220,255,.16); --hair2:rgba(190,220,255,.28);
  /* a soft white halo that lifts each tile off the field */
  --tglow:0 0 24px -2px rgba(255,255,255,.13),0 0 58px -14px rgba(208,233,255,.17);
  --panel:rgba(8,20,36,.46);
  --d:cubic-bezier(.22,.61,.36,1);
  --sans:"IBM Plex Sans",-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif;
  --disp:"Archivo","Helvetica Neue",Impact,sans-serif;
  --mono:"IBM Plex Mono",ui-monospace,SFMono-Regular,Menlo,monospace;
}
*{box-sizing:border-box}
/* The full-bleed scrims behind the hero and the footer are sized in vw, which
   counts the scrollbar, so they overhang the content box by its width. Clip
   rather than hide: clip does not turn the root into a scroll container, so
   the sticky nav keeps working. */
html{overflow-x:clip}
body{
  margin:0;color:var(--platinum);font-family:var(--sans);font-size:15px;line-height:1.6;
  -webkit-font-smoothing:antialiased;overflow-x:hidden;
  /* Fluted glass, drawn rather than photographed so it stays sharp at any size.
     This layer is the light behind the panel; the ribs themselves are the
     overlay in .field, which keeps its seams dark right across the bright middle. */
  background:
    radial-gradient(ellipse 58% 82% at 74% 17%,
      #D9D9D9 0%, #D1D7D9 12%, #B8CFD8 24%, #8DC0D1 37%, #5BADCE 54%,
      #2E7FA8 72%, #12456B 88%, #061F36 100%),
    linear-gradient(90deg,#010A14 0%,#05203A 12%,#0F4870 30%,#1E76A4 52%,
      #1C6E96 70%,#176080 86%,#124F6A 100%);
  background-attachment:fixed;
  background-color:#05203A;
}
/* &#9472;&#9472; ambient field &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.field{position:fixed;inset:0;z-index:0;pointer-events:none;overflow:hidden}
/* The flutes: a hard seam, a specular highlight just inside each rib's left
   edge, then a teal shadow running off its right. Laid over the light rather
   than under it, so the seams stay dark even where the panel is blown out.
   The pitch tracks the viewport, so the panel keeps its proportions. */
.glare{position:absolute;inset:0;pointer-events:none;
  background:
    linear-gradient(rgba(4,14,26,.054),rgba(4,14,26,.054)),
    linear-gradient(180deg,rgba(0,6,14,.059) 0%,rgba(0,6,14,0) 12%,
      rgba(0,6,14,0) 34%,rgba(0,6,14,.158) 62%,rgba(0,6,14,.239) 100%)}
/* Each rib is a cylindrical lens, so the profile is a thin refraction seam,
   a narrow specular where the curve faces the light, a clear middle that lets
   the bloom through, then a soft teal falloff with a faint back-surface glint.
   Nothing is opaque -- glass transmits, which is what separates this from a
   slat. The mask ties rib contrast to the light behind, so the panel reads
   blown out where it is lit and quiet where it is not, instead of one flat
   repeat across the whole page. */
.flutes{position:absolute;inset:0;pointer-events:none;
  background:repeating-linear-gradient(90deg,
    rgba(6,20,34,.70) 0%,
    rgba(10,30,48,.44) 3%,
    rgba(180,228,255,.10) 7%,
    rgba(236,250,255,.40) 11%,
    rgba(210,240,255,.22) 15%,
    rgba(255,255,255,.10) 21%,
    rgba(255,255,255,.02) 30%,
    rgba(255,255,255,0) 42%,
    rgba(6,40,52,.10) 56%,
    rgba(6,46,58,.22) 68%,
    rgba(5,38,52,.34) 78%,
    rgba(8,34,50,.29) 86%,
    rgba(6,24,40,.52) 92%,
    rgba(6,20,34,.70) 100%);
  background-size:clamp(22px,2.42vw,40px) 100%;
  opacity:.87;
  -webkit-mask-image:radial-gradient(ellipse 86% 104% at 74% 17%,
    #000 0%,rgba(0,0,0,.94) 34%,rgba(0,0,0,.78) 62%,rgba(0,0,0,.6) 100%);
  mask-image:radial-gradient(ellipse 86% 104% at 74% 17%,
    #000 0%,rgba(0,0,0,.94) 34%,rgba(0,0,0,.78) 62%,rgba(0,0,0,.6) 100%)}
/* Contrast shaping for the content column. The section bars run the full
   width with their titles hard left and their Click Here buttons hard right,
   so both edges are darkened; the vertical mask holds it off the hero so the
   open upper-right keeps its bloom. */
.shade{position:absolute;inset:0;pointer-events:none;
  background:
    linear-gradient(90deg,rgba(2,10,20,0) 0%,rgba(2,10,20,0) 1.5%,
      rgba(2,10,20,.279) 5%,rgba(2,10,20,.153) 18%,rgba(2,10,20,0) 40%),
    linear-gradient(270deg,rgba(2,10,20,0) 0%,rgba(2,10,20,0) 1.5%,
      rgba(2,10,20,.243) 5%,rgba(2,10,20,.126) 16%,rgba(2,10,20,0) 38%);
  -webkit-mask-image:linear-gradient(180deg,transparent 0%,transparent 26%,
    #000 52%,#000 100%);
  mask-image:linear-gradient(180deg,transparent 0%,transparent 26%,
    #000 52%,#000 100%)}
.bloom{position:absolute;border-radius:50%;filter:blur(88px);will-change:transform}
.b1{width:72vw;height:72vw;max-width:980px;max-height:980px;top:-24vw;left:-12vw;opacity:.62;
  background:radial-gradient(circle,rgba(120,190,255,.55),transparent 66%)}
.b2{width:60vw;height:60vw;max-width:800px;max-height:800px;top:30vh;right:-18vw;opacity:.42;
  background:radial-gradient(circle,rgba(176,216,255,.34),transparent 68%)}
.b3{width:66vw;height:66vw;max-width:880px;max-height:880px;bottom:-22vw;left:6vw;opacity:.50;
  background:radial-gradient(circle,rgba(150,205,255,.42),transparent 70%)}
/* brushed-metal grain + opulent sheen */
.wash{position:absolute;border-radius:50%;mix-blend-mode:screen;pointer-events:none;
  will-change:transform;filter:blur(90px);opacity:.62}
.w1{width:74vw;height:56vh;left:-14vw;bottom:-14vh;
  background:radial-gradient(ellipse at 45% 60%,rgba(214,244,255,.62) 0%,
    rgba(112,206,255,.42) 24%,rgba(58,132,226,.24) 48%,transparent 76%)}
.w2{width:58vw;height:44vh;right:-14vw;top:-8vh;
  background:radial-gradient(ellipse at 55% 45%,rgba(196,236,255,.46) 0%,
    rgba(152,212,255,.28) 26%,rgba(78,124,226,.16) 52%,transparent 78%)}
.sheen{position:absolute;inset:0;
  background:linear-gradient(113deg,transparent 14%,rgba(255,255,255,.10) 34%,
    rgba(255,255,255,.03) 44%,transparent 58%,rgba(190,225,255,.07) 74%,transparent 88%)}
.edge{position:absolute;inset:0;
  background:radial-gradient(135% 82% at 50% 0%,transparent 42%,rgba(6,16,30,.279) 100%)}
/* Two architectural LED tubes standing at the page edges. Each is one thin bright
   core with a vertical taper for its end caps, plus a long inverse-square spill.
   Screen blending means they add light to the field instead of painting over it. */
/* Absolute forefront. The hero and footer scrims live inside .shell, which
   paints above z-index 0, so at that level the lights were being covered by the
   very gradients they are meant to cut through. At 200 they clear the shell,
   the nav, the section overlay and the lightbox, and screen against everything
   beneath them. pointer-events:none keeps the whole page clickable through it. */
.tube{position:fixed;top:-4%;bottom:-4%;width:min(31vw,430px);pointer-events:none;
  z-index:200;mix-blend-mode:screen;animation:tubebreathe 7.5s ease-in-out infinite}
.tube-l{left:0}
.tube-r{right:0;transform:scaleX(-1);animation-delay:-3.4s}
.tube::before{content:"";position:absolute;inset:0;
  background:linear-gradient(90deg,
    rgba(242,251,255,.55) 0px,
    rgba(230,246,255,.355) 5px,
    rgba(208,234,255,.20) 14px,
    rgba(188,223,255,.114) 32px,
    rgba(174,213,255,.065) 70px,
    rgba(164,205,255,.032) 140px,
    rgba(156,200,255,.014) 250px,
    transparent 100%)}
.tube::after{content:"";position:absolute;left:0;top:0;bottom:0;width:4px;border-radius:3px;
  background:linear-gradient(180deg,rgba(255,255,255,.17) 0%,rgba(255,255,255,.86) 8%,
    rgba(255,255,255,.94) 46%,rgba(255,255,255,.86) 92%,rgba(255,255,255,.17) 100%);
  filter:blur(.5px);
  box-shadow:0 0 8px 1px rgba(255,255,255,.72),0 0 24px 4px rgba(216,241,255,.45),
    0 0 60px 15px rgba(182,220,255,.24),0 0 140px 42px rgba(158,203,255,.112)}
@keyframes tubebreathe{0%,100%{opacity:.84}50%{opacity:.94}}
.grain{position:absolute;inset:0;opacity:.14;mix-blend-mode:overlay;
  background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='160' height='160'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.85' numOctaves='3'/%3E%3C/filter%3E%3Crect width='160' height='160' filter='url(%23n)' opacity='.5'/%3E%3C/svg%3E")}
/* &#9472;&#9472; shell &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.shell{position:relative;z-index:1;max-width:1320px;margin:0 auto;padding-inline:24px}
section{padding-block:clamp(6px,1.1vh,42px);scroll-margin-top:84px}
/* &#9472;&#9472; nav &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.nav{position:sticky;top:env(safe-area-inset-top,0px);z-index:40;
  backdrop-filter:blur(20px) saturate(160%);-webkit-backdrop-filter:blur(20px) saturate(160%);
  background:linear-gradient(180deg,rgba(11,28,50,.80),rgba(11,28,50,.34));
  border-bottom:1px solid var(--hair)}
.nav-in{max-width:1320px;margin:0 auto;padding:13px 24px;display:flex;align-items:center;gap:20px}
.mark{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:12.5px;letter-spacing:.16em;text-transform:uppercase;white-space:nowrap}
.mark i{font-style:normal;color:var(--cyan)}
.nav-links{margin-left:auto;display:flex;gap:6px;flex-wrap:wrap}
.nav a{font-family:var(--mono);font-size:11px;letter-spacing:.11em;text-transform:uppercase;
  color:var(--muted);text-decoration:none;padding:7px 11px;border-radius:7px;
  transition:color .25s var(--d),background .25s var(--d)}
.nav a:hover,.nav a:focus-visible{color:var(--platinum);background:rgba(190,225,255,.12)}
.nav-links{align-items:center}
.nav-div{width:1px;height:16px;margin:0 5px;background:var(--hair);flex:none}
/* the marks sit in the nav's own silver at rest and take their brand colour on
   hover, so the bar stays one palette until someone reaches for it */
.nav a.nav-ic{display:grid;place-items:center;padding:6px;color:var(--muted)}
.nav-ic svg{width:15px;height:15px;display:block;fill:currentColor;
  transition:fill .25s var(--d)}
.nav-links{position:relative}
.nav .nav-mail{display:grid;place-items:center;padding:6px;color:var(--muted);
  background:none;border:0;cursor:pointer;border-radius:7px;
  -webkit-appearance:none;appearance:none;
  transition:color .25s var(--d),background .25s var(--d)}
.nav .nav-mail:hover,.nav .nav-mail:focus-visible{color:var(--platinum);
  background:rgba(190,225,255,.16)}
/* the address drops out of the bar rather than pushing the row around */
.mailpop{position:absolute;top:calc(100% + 9px);right:0;z-index:5;
  display:flex;align-items:center;gap:10px;white-space:nowrap;
  padding:9px 14px;border-radius:999px;
  background:rgba(8,22,40,.94);border:1px solid rgba(180,232,255,.5);
  backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px);
  box-shadow:0 18px 40px -22px rgba(2,9,20,.95),0 0 24px -9px rgba(130,205,255,.75);
  opacity:0;transform:translateY(-5px);
  transition:opacity .26s var(--d),transform .26s var(--d)}
.mailpop[hidden]{display:none}
.mailpop.on{opacity:1;transform:none}
.mailpop-a{font-family:var(--mono);font-size:11px;letter-spacing:.04em;color:#fff}
.mailpop-n{font-family:var(--mono);font-size:9px;letter-spacing:.14em;text-transform:uppercase;
  color:var(--faint)}
.mailpop.copied .mailpop-n{color:var(--emerald)}
.nav a.ic-li:hover,.nav a.ic-li:focus-visible{color:#3B9BE0;background:rgba(59,155,224,.14)}
.nav a.ic-gh:hover,.nav a.ic-gh:focus-visible{color:#EAF4FF;background:rgba(190,225,255,.16)}
/* on a phone the six section links plus two marks wrap into a tall stack, so the
   bar tightens up rather than eating a quarter of the screen */
@media (max-width:760px){
  .nav-in{padding:9px 14px;gap:8px}
  .mark{font-size:11px;letter-spacing:.12em}
  .nav-links{gap:1px}
  .nav a{font-size:9.5px;letter-spacing:.05em;padding:5px 6px}
  .nav-div{margin:0 3px;height:13px}
  .nav a.nav-ic{padding:5px}
  .nav-ic svg{width:13px;height:13px}
}
/* &#9472;&#9472; hero &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.hero{position:relative;padding-block:clamp(14px,3.4vh,86px) clamp(8px,1.6vh,44px);
  display:grid;grid-template-columns:minmax(0,1fr) clamp(250px,32vw,404px);
  column-gap:clamp(26px,3.4vw,58px);align-items:start}
.hero>.eyebrow{grid-column:1;grid-row:1}
.hero>.name{grid-column:1;grid-row:2}
.hero>.thesis{grid-column:1;grid-row:3}
.hero>.sub{grid-column:1;grid-row:4}
.hero::before{content:"";position:absolute;z-index:-1;
  top:-8vh;bottom:-4vh;left:50%;width:100vw;margin-left:-50vw;pointer-events:none;
  background:linear-gradient(90deg,rgba(3,12,24,.333) 0%,rgba(3,12,24,.306) 34%,
    rgba(3,12,24,.189) 56%,rgba(3,12,24,0) 76%);
  -webkit-mask-image:linear-gradient(180deg,#000 0%,#000 66%,transparent 100%);
  mask-image:linear-gradient(180deg,#000 0%,#000 66%,transparent 100%)}
.eyebrow{font-family:var(--mono);font-size:11px;letter-spacing:.26em;text-transform:uppercase;
  color:var(--muted);display:flex;align-items:center;gap:12px;margin-bottom:clamp(6px,1.2vh,24px)}
.eyebrow::after{content:"";height:1px;flex:1;max-width:230px;
  background:linear-gradient(90deg,rgba(134,214,255,.8),transparent)}
.name{position:relative;z-index:2;font-family:var(--disp);font-variation-settings:"wdth" 118,"wght" 900;
  font-size:clamp(2rem,min(7.1vw,7.6vh),6.4rem);line-height:.88;letter-spacing:-.02em;
  text-transform:uppercase;margin:0;text-wrap:balance;
  background:linear-gradient(104deg,#FFFFFF 0%,#DCEBFB 13%,#9DB8D2 29%,#FFFFFF 43%,
    #C6DCF0 57%,#7E9BB6 73%,#F0F7FF 89%,#FFFFFF 100%);
  background-size:230% 100%;background-position:var(--sheen,42%) 50%;
  -webkit-background-clip:text;background-clip:text;color:transparent;
  filter:drop-shadow(0 3px 34px rgba(120,190,255,.45));
  transition:background-position .5s var(--d)}
.thesis{margin:clamp(8px,1.6vh,28px) 0 0;max-width:34em;font-size:clamp(.95rem,min(2.1vw,2.1vh),1.3rem);
  line-height:1.52;color:var(--silver);text-wrap:pretty}
.thesis b{color:#fff;font-weight:600}
.sub{margin:clamp(8px,1.4vh,16px) 0 0;max-width:40em;font-size:clamp(12.5px,1.8vh,15px);
  color:var(--muted);line-height:1.55}
.hero-meta{display:flex;flex-wrap:wrap;gap:9px;margin-top:clamp(8px,1.6vh,30px)}
.chip{display:inline-flex;align-items:center;gap:8px;padding:9px 15px;border-radius:999px;
  background:rgba(190,225,255,.10);border:1px solid var(--hair);backdrop-filter:blur(10px);
  font-family:var(--mono);font-size:11.5px;letter-spacing:.055em;color:var(--silver);
  text-decoration:none;transition:all .28s var(--d)}
a.chip:hover,a.chip:focus-visible,button.chip:hover,button.chip:focus-visible{
  border-color:rgba(134,214,255,.75);color:#fff;
  background:rgba(134,214,255,.20);transform:translateY(-1px)}
button.chip{font:inherit;font-family:var(--mono);font-size:11.5px;letter-spacing:.055em;
  cursor:pointer;-webkit-appearance:none;appearance:none}
.chip-rv::after{content:"";width:5px;height:5px;border-right:1px solid currentColor;
  border-bottom:1px solid currentColor;transform:rotate(-45deg);opacity:.6;margin-left:1px}
.chip-mail{position:relative;overflow:visible}
.copy,.chip-x{position:absolute;top:-9px;width:24px;height:24px;border-radius:50%;
  display:grid;place-items:center;padding:0;cursor:pointer;
  background:rgba(12,30,52,.97);border:1px solid var(--hair);color:var(--silver);
  box-shadow:0 5px 16px -7px rgba(0,0,0,.85);transition:all .25s var(--d)}
.copy{right:-9px}
.chip-x{left:-9px}
.copy:hover,.copy:focus-visible,.chip-x:hover,.chip-x:focus-visible{
  border-color:rgba(134,214,255,.8);color:#fff;
  background:rgba(134,214,255,.28);transform:translateY(-1px)}
.copy svg,.chip-x svg{width:11px;height:11px;display:block}
.copy.done{border-color:rgba(126,231,178,.9);color:#7ee7b2;background:rgba(126,231,178,.18)}
.copy-t{position:absolute;bottom:calc(100% + 11px);right:-6px;font-family:var(--mono);
  font-size:9px;letter-spacing:.13em;text-transform:uppercase;color:#7ee7b2;
  opacity:0;transform:translateY(3px);transition:opacity .22s var(--d),transform .22s var(--d);
  pointer-events:none;white-space:nowrap}
.copy-t.show{opacity:1;transform:translateY(0)}
/* &#9472;&#9472; ledger &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.ledger{display:grid;grid-template-columns:repeat(auto-fit,minmax(152px,1fr));gap:12px}
.led{position:relative;border-radius:16px;padding:clamp(9px,1.5vh,24px) 20px;cursor:pointer;
  -webkit-tap-highlight-color:transparent;
  background:linear-gradient(165deg,rgba(190,225,255,.13),rgba(10,24,42,.34));
  border:1px solid var(--hair);backdrop-filter:blur(14px);
  box-shadow:0 14px 36px -26px rgba(4,14,28,.9),inset 0 1px 0 rgba(255,255,255,.14);
  transition:transform .38s var(--d),box-shadow .38s var(--d),
    border-color .38s var(--d),background .38s var(--d)}
.led:hover{transform:translateY(-8px) scale(1.022);z-index:2;
  background:linear-gradient(165deg,rgba(150,222,255,.34),rgba(14,40,70,.42));
  border-color:rgba(150,222,255,.72);
  box-shadow:0 34px 60px -26px rgba(2,10,22,.95),0 0 0 1px rgba(150,222,255,.30),
    0 0 44px -10px rgba(120,200,255,.55),inset 0 1px 0 rgba(255,255,255,.34)}
.led:hover .led-n{background:linear-gradient(170deg,#FFFFFF,#E4F2FF 50%,#B6D6F4);
  -webkit-background-clip:text;background-clip:text}
.led:hover .led-l{color:var(--ice)}
/* when a figure lands, a gold line is drawn around the card edge -- it starts at
   the top left and runs left to right, all the way round, then fades. The card
   itself never changes colour; it stays blue-silver throughout. */
/* The trace sits on the card's own edge: inset -1px so the svg covers the border
   box rather than the padding box, which is what put it out of register before.
   Three strokes stack into a laser -- a soft bloom, a near-white core, and a
   bright head that runs ahead of the draw. */
.ledline{position:absolute;inset:-1px;
  width:calc(100% + 2px);height:calc(100% + 2px);overflow:visible;
  pointer-events:none;z-index:3}
.ledline rect{fill:none;stroke-linecap:round;stroke-dasharray:100;
  stroke-dashoffset:100;opacity:0}
.ledline .lz-glow{stroke:rgba(247,199,96,.55);stroke-width:5;
  filter:blur(3px) drop-shadow(0 0 8px rgba(247,199,96,.85))}
.ledline .lz-core{stroke:#FFF6DC;stroke-width:1.5;
  filter:drop-shadow(0 0 4px rgba(255,224,146,.95))}
.ledline .lz-head{stroke:#FFFFFF;stroke-width:2.6;stroke-dasharray:4 96;
  filter:drop-shadow(0 0 8px rgba(255,236,180,1))
         drop-shadow(0 0 17px rgba(247,199,96,.85))}
.led.firing .ledline .lz-glow,
.led.firing .ledline .lz-core{animation:lzdraw 1.15s cubic-bezier(.34,.72,.28,1) 1}
.led.firing .ledline .lz-head{animation:lzhead 1.15s cubic-bezier(.34,.72,.28,1) 1}
@keyframes lzdraw{
  0%{stroke-dashoffset:100;opacity:1}
  58%{stroke-dashoffset:0;opacity:1}
  80%{stroke-dashoffset:0;opacity:1}
  100%{stroke-dashoffset:0;opacity:0}}
@keyframes lzhead{
  0%{stroke-dashoffset:100;opacity:1}
  56%{stroke-dashoffset:2;opacity:1}
  64%{stroke-dashoffset:0;opacity:0}
  100%{stroke-dashoffset:0;opacity:0}}
.led.firing{animation:ledpop .5s cubic-bezier(.22,.9,.3,1) 1}
@keyframes ledpop{0%{transform:none}36%{transform:translateY(-3px) scale(1.022)}100%{transform:none}}
.led.firing.from-hover{animation:ledpopH .5s cubic-bezier(.22,.9,.3,1) 1}
@keyframes ledpopH{0%{transform:translateY(-8px) scale(1.022)}
  36%{transform:translateY(-12px) scale(1.042)}
  100%{transform:translateY(-8px) scale(1.022)}}
.led:focus-visible{outline:2px solid rgba(160,226,255,.9);outline-offset:4px}
.led-n{font-family:var(--disp);font-variation-settings:"wdth" 108,"wght" 800;
  font-size:clamp(1.35rem,min(4.6vw,3.4vh),2.7rem);line-height:1;letter-spacing:-.02em;
  font-variant-numeric:tabular-nums;
  background:linear-gradient(170deg,#FFFFFF,#BFD8F0 55%,#8FAFCC);
  -webkit-background-clip:text;background-clip:text;color:transparent}
/* A small figure arrives one count at a time and each step lands a hit. A large
   one ramps: it jitters and glows while it climbs, then lands hard. Sparks are
   thrown on every impact. */
.led-n{transform-origin:left center;will-change:transform,filter}
@keyframes numhit{0%{transform:scale(1)}14%{transform:scale(1.3)}
  38%{transform:scale(.94)}62%{transform:scale(1.05)}100%{transform:scale(1)}}
.led-n.hit{animation:numhit .34s cubic-bezier(.2,.9,.25,1) 1}
@keyframes numjit{0%{transform:translate(0,0)}
  20%{transform:translate(calc(var(--jit,1.5px) * -1),calc(var(--jit,1.5px) * .66))}
  40%{transform:translate(var(--jit,1.5px),calc(var(--jit,1.5px) * -.66))}
  60%{transform:translate(calc(var(--jit,1.5px) * -.66),calc(var(--jit,1.5px) * -1))}
  80%{transform:translate(calc(var(--jit,1.5px) * .66),var(--jit,1.5px))}
  100%{transform:translate(0,0)}}
.led-n.climb{animation:numjit .11s linear infinite;
  filter:drop-shadow(0 0 7px rgba(198,232,255,.8)) drop-shadow(0 0 18px rgba(247,199,96,.38))}
@keyframes numland{0%{transform:scale(1)}12%{transform:scale(1.4)}
  34%{transform:scale(.9)}58%{transform:scale(1.09)}100%{transform:scale(1)}}
.led-n.land{animation:numland .52s cubic-bezier(.18,.92,.24,1) 1;
  filter:drop-shadow(0 0 11px rgba(255,238,194,.92))}
/* the biggest figure lands with a mini explosion: a flash and two shockwaves */
.boom{position:absolute;border-radius:50%;pointer-events:none;z-index:4;
  border:2px solid rgba(255,232,178,.95);
  box-shadow:0 0 18px 4px rgba(247,199,96,.5),inset 0 0 14px rgba(255,238,196,.45);
  transform:translate(-50%,-50%) scale(.15);opacity:0}
@keyframes boomring{0%{opacity:1;transform:translate(-50%,-50%) scale(.15)}
  55%{opacity:.7}
  100%{opacity:0;transform:translate(-50%,-50%) scale(1)}}
.flash{position:absolute;border-radius:50%;pointer-events:none;z-index:3;
  background:radial-gradient(circle,rgba(255,246,222,.92),rgba(247,199,96,.34) 46%,transparent 72%);
  transform:translate(-50%,-50%) scale(.25);opacity:0}
@keyframes boomflash{0%{opacity:.95;transform:translate(-50%,-50%) scale(.22)}
  100%{opacity:0;transform:translate(-50%,-50%) scale(1.2)}}
.spk{position:absolute;width:3px;height:3px;border-radius:50%;background:#FFE7AE;
  box-shadow:0 0 6px 1px rgba(247,199,96,.9);pointer-events:none;z-index:4;opacity:0}
@keyframes spkfly{0%{opacity:1;transform:translate(0,0) scale(1)}
  70%{opacity:.85}
  100%{opacity:0;transform:translate(var(--dx),var(--dy)) scale(.25)}}
.led-l{font-family:var(--mono);font-size:10.5px;letter-spacing:.14em;text-transform:uppercase;
  color:var(--muted);margin-top:clamp(5px,1vh,10px);line-height:1.4}
/* &#9472;&#9472; heads &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.head{display:flex;align-items:baseline;gap:16px;margin-bottom:34px;flex-wrap:wrap}
.head h2{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:clamp(1.5rem,4vw,2.3rem);letter-spacing:-.012em;text-transform:uppercase;
  margin:0;color:#fff}
.head .idx{font-family:var(--mono);font-size:11px;color:var(--cyan);letter-spacing:.16em}
.head .note{font-family:var(--mono);font-size:11px;color:var(--muted);letter-spacing:.07em;
  margin-left:auto}
/* &#9472;&#9472; role tiles &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
/* collapsible section header: illuminated metallic bar */
.sechead{position:relative;display:flex;align-items:center;gap:18px;width:100%;
  padding:clamp(9px,1.4vh,24px) clamp(18px,2.4vw,28px);border-radius:18px;cursor:pointer;
  overflow:hidden;isolation:isolate;text-align:left;font:inherit;color:inherit;
  border:1px solid var(--hair2);-webkit-appearance:none;appearance:none;
  box-shadow:0 22px 48px -30px rgba(2,9,20,.95),inset 0 1px 0 rgba(255,255,255,.26);
  transition:transform .35s var(--d),border-color .35s var(--d),box-shadow .35s var(--d)}
.sechead:hover,.sechead:focus-visible{transform:translateY(-3px);
  border-color:rgba(160,226,255,.85);
  box-shadow:0 34px 66px -30px rgba(2,9,20,.98),0 0 44px -14px rgba(130,205,255,.5),
    inset 0 1px 0 rgba(255,255,255,.4)}
.sh-metal{position:absolute;inset:0;z-index:-2;
  background:
    repeating-linear-gradient(104deg,rgba(255,255,255,.055) 0 1px,rgba(255,255,255,0) 1px 5px),
    linear-gradient(104deg,#0E2237 0%,#1B3A5C 14%,#2E5B88 26%,#8FBEE4 38%,#EAF6FF 45%,
      #9CC8EA 52%,#33618F 64%,#1A3859 78%,#0E2237 100%);
  background-size:auto,300% 100%;
  animation:shmetal 14s linear infinite}
@keyframes shmetal{0%{background-position:0 0,0% 50%}100%{background-position:0 0,300% 50%}}
.sh-sheen{position:absolute;inset:0;z-index:-1;pointer-events:none;
  background:linear-gradient(180deg,rgba(255,255,255,.16),rgba(6,16,30,.55) 46%,rgba(6,16,30,.82))}
.sh-idx{font-family:var(--mono);font-size:11px;letter-spacing:.16em;color:var(--ice);flex:none;
  text-shadow:0 1px 6px rgba(0,0,0,.8)}
.sh-title{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:clamp(1.05rem,min(3.6vw,2.9vh),2.15rem);letter-spacing:-.012em;text-transform:uppercase;
  color:#fff;line-height:1;text-shadow:0 2px 18px rgba(2,9,20,.9);flex:none}
.cta{flex:none;margin-left:auto;display:inline-flex;align-items:center;gap:9px;padding:10px 16px;border-radius:999px;
  background:rgba(8,22,40,.62);border:1px solid rgba(180,232,255,.55);backdrop-filter:blur(8px);
  box-shadow:0 0 22px -6px rgba(130,205,255,.65),inset 0 1px 0 rgba(255,255,255,.3);
  transition:all .3s var(--d)}
.cta-t{font-family:var(--mono);font-size:10.5px;letter-spacing:.15em;text-transform:uppercase;
  color:#fff;white-space:nowrap}
.cta-i{position:relative;width:11px;height:11px;flex:none}
.cta-i::before,.cta-i::after{content:"";position:absolute;background:#fff;border-radius:2px;
  transition:transform .34s var(--d),opacity .34s var(--d)}
.cta-i::before{left:0;top:4.75px;width:11px;height:1.5px}
.cta-i::after{left:4.75px;top:0;width:1.5px;height:11px}
.sechead:hover .cta{background:rgba(150,222,255,.30);border-color:#bfe8ff;
  box-shadow:0 0 30px -4px rgba(150,222,255,.9),inset 0 1px 0 rgba(255,255,255,.5)}
.sechead[aria-expanded="true"] .cta-i::after{transform:scaleY(0);opacity:0}
.cta.blink{animation:ctablink .46s ease-in-out 1}
@keyframes ctablink{
  0%{box-shadow:0 0 22px -6px rgba(130,205,255,.65);background:rgba(8,22,40,.62)}
  18%{box-shadow:0 0 46px 6px rgba(200,244,255,1);background:rgba(220,246,255,.95)}
  36%{box-shadow:0 0 18px -8px rgba(130,205,255,.4);background:rgba(8,22,40,.62)}
  56%{box-shadow:0 0 46px 6px rgba(200,244,255,1);background:rgba(220,246,255,.95)}
  100%{box-shadow:0 0 22px -6px rgba(130,205,255,.65);background:rgba(8,22,40,.62)}}
.cta.blink .cta-t{color:#06192c}
.cta.blink .cta-i::before,.cta.blink .cta-i::after{background:#06192c}
/* closing gets one silver pulse -- a single beat, and neutral rather than cyan,
   so it reads as the opposite gesture to the opening blink */
/* The silver peak is near white, and the pill's own border is a pale
   translucent line, so at full brightness the button lost its outline and
   read as having vanished. A dark edge during the beat keeps the shape. */
.cta.flash{animation:ctaflash .46s ease-in-out 1;border-color:rgba(10,28,48,.55)}
@keyframes ctaflash{
  0%{box-shadow:0 0 22px -6px rgba(130,205,255,.45);background:rgba(8,22,40,.62)}
  26%{box-shadow:0 0 46px 5px rgba(232,240,248,.98);background:rgba(230,238,246,.97)}
  54%{box-shadow:0 0 46px 5px rgba(232,240,248,.98);background:rgba(230,238,246,.97)}
  100%{box-shadow:0 0 22px -6px rgba(130,205,255,.45);background:rgba(8,22,40,.62)}}
.cta.flash .cta-t{color:#0d1f33}
.cta.flash .cta-i::before,.cta.flash .cta-i::after{background:#0d1f33}
.deckwrap{overflow:hidden}
.deckwrap:not([hidden]){animation:deckIn .55s var(--d) 1}
@keyframes deckIn{from{opacity:0;transform:translateY(-10px)}to{opacity:1;transform:none}}
.deckwrap .deck{padding-top:22px}
/* diagonal reveal sweep when a pane opens */
.sweep{position:absolute;inset:0;z-index:15;pointer-events:none;overflow:hidden;opacity:0;
  border-radius:inherit}
.sheet.sweeping .sweep{opacity:1}
.sweep::before{content:"";position:absolute;top:-45%;bottom:-45%;width:42%;left:-70%;
  transform:skewX(-18deg);filter:blur(3px);
  background:linear-gradient(90deg,transparent,rgba(190,232,255,.12) 26%,
    rgba(255,255,255,.62) 50%,rgba(190,232,255,.12) 74%,transparent)}
.sheet.sweeping .sweep::before{animation:swipe 1.05s cubic-bezier(.22,.68,.28,1) 1}
@keyframes swipe{from{left:-70%}to{left:135%}}
.sheet.sweeping .pane:not([hidden]){animation:paneIn .62s var(--d) 1}
@keyframes paneIn{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:none}}
@media (max-height:860px){
  .sub{display:none}
  .eyebrow::after{max-width:140px}
}
@media (max-height:700px){
  .thesis{display:none}
  .ledger{gap:8px}
}
@media (max-width:1000px){
  .sechead{gap:12px;flex-wrap:wrap}
}
@media (prefers-reduced-motion:reduce){
  .sh-metal{animation:none}
  .sheet.sweeping .sweep::before,.sheet.sweeping .pane:not([hidden]),
  .deckwrap:not([hidden]),.cta.blink,.cta.flash,.tube{animation:none}
  .dt-media .dt-shot,.dtile[data-pane^="p-ed-"] .dt-shot{transition:none}
  .dtile:hover .dt-media .dt-shot,.dtile:focus-visible .dt-media .dt-shot{transform:scale(1.01)}
}
.deck{display:flex;flex-wrap:wrap;gap:18px;justify-content:center}
/* Three across, wide enough that no bold heading wraps. The tiles are built two
   ways -- a screen with a chin below, or copy over a photo -- so their natural
   heights differ; a shared min-height that tracks the tile's own width makes
   every tile on the page the same size at any viewport. */
.dtile{flex:0 0 calc((100% - 54px) / 4);min-width:min(230px,100%);
  min-height:calc(15.7vw + 92px)}
@media (min-width:1320px){
  .dtile{min-height:300px}
}
@media (max-width:1163px){
  .dtile{flex-basis:calc((100% - 18px) / 2);min-width:min(230px,100%);
    min-height:calc(31.2vw + 68px)}
}
@media (max-width:780px){
  .dtile{flex-basis:100%;min-height:calc(58vw + 88px)}
}
/* a zero-height full-width item forces a wrap without changing tile size;
   the negative margin cancels the row gap it would otherwise introduce */
.deck-break{flex:0 0 100%;height:0;margin-block:-9px}
.dtile{position:relative;display:block;width:100%;padding:0;border:1px solid var(--hair);
  border-radius:18px;overflow:hidden;cursor:pointer;text-align:left;isolation:isolate;
  background:linear-gradient(158deg,rgba(190,225,255,.14),var(--panel) 48%,rgba(12,30,52,.54));
  box-shadow:var(--tglow),0 20px 44px -28px rgba(2,9,20,.92),inset 0 1px 0 rgba(255,255,255,.15);
  transition:transform .4s var(--d),border-color .4s var(--d),box-shadow .4s var(--d);
  font:inherit;color:inherit;-webkit-appearance:none;appearance:none}
.dtile:hover,.dtile:focus-visible{transform:translateY(-7px) scale(1.012);
  border-color:rgb(var(--c) / .80);
  box-shadow:0 0 30px -2px rgba(255,255,255,.19),0 0 72px -14px rgba(208,233,255,.24),
    0 42px 78px -34px rgba(2,9,20,.98),0 0 0 1px rgb(var(--c) / .32),
    0 0 62px -16px rgb(var(--c) / .42),inset 0 1px 0 rgba(255,255,255,.30)}
.dt-media{display:block;position:relative;width:100%;aspect-ratio:16/10;overflow:hidden;
  background:#06131f}
.dt-media video{width:100%;height:100%;object-fit:cover;display:block}
/* The section 01 reels run a quarter brighter. The rule sits on the video
   itself rather than on the tile, so the lift carries over when the element
   moves into an opened pane. Five of the seven are dialled back from there
   -- 8%, then another 5% -- so only Turbo LV and Legendary hold the full
   quarter. */
.dt-video{filter:brightness(1.25)}
.dt-video[aria-label^="Warner Bros. Discovery"],
.dt-video[aria-label^="Disney Channel"],
.dt-video[aria-label^="Disney Television Animation"],
.dt-video[aria-label^="Cox Media Group"],
.dt-video[aria-label^="The Coca-Cola Company"]{filter:brightness(1.0925)}
/* A still in a tile gets a very slow push so the deck never reads as static.
   It alternates rather than looping, so there is no snap back to the start. */
.dt-media .dg{display:block;width:100%;height:100%}
/* an opened tile that has a diagram runs its copy down the left and stands the
   screen on the right, where it holds position while the text scrolls */
.pane-split{display:grid;grid-template-columns:minmax(0,1fr) minmax(360px,52%);
  gap:28px;align-items:start;margin-top:4px}
.pane-col{min-width:0}
.pane-dg{position:sticky;top:6px}
.dgscreen{padding:9px 9px 11px;border-radius:15px;border:1px solid #0A1017;
  background:linear-gradient(168deg,#3A4550 0%,#222C37 44%,#151D26 100%);
  box-shadow:0 22px 46px -26px rgba(2,9,20,.95),inset 0 1.5px 0 rgba(162,182,206,.30),
    inset 0 -2px 7px rgba(0,0,0,.5)}
.dgscreen .dg{display:block;width:100%;height:auto;aspect-ratio:16/10;border-radius:4px;
  box-shadow:0 0 0 1px #0A1017,inset 0 2px 9px rgba(8,18,32,.26)}
@media (max-width:900px){
  .pane-split{grid-template-columns:1fr;gap:24px}
  .pane-dg{position:static;order:-1}}
/* Section 03: the tile itself is the monitor. Graphite body, an inset white
   panel for the diagram, and the title block below reads as the chin. */
.dtile.scr{padding:10px 10px 0;border-color:#0A1017;
  background:linear-gradient(168deg,#3A4550 0%,#222C37 44%,#151D26 100%);
  box-shadow:var(--tglow),0 22px 46px -26px rgba(2,9,20,.95),
    inset 0 1.5px 0 rgba(162,182,206,.30),inset 0 -2px 7px rgba(0,0,0,.5)}
.dtile.scr:hover,.dtile.scr:focus-visible{border-color:rgb(var(--c) / .8);
  box-shadow:0 0 30px -2px rgba(255,255,255,.19),0 0 72px -14px rgba(208,233,255,.24),
    0 42px 78px -34px rgba(2,9,20,.98),inset 0 1.5px 0 rgba(162,182,206,.34),
    inset 0 -2px 7px rgba(0,0,0,.5)}
.dtile.scr .dt-media{border-radius:4px;background:#fff;
  box-shadow:0 0 0 1px #0A1017,inset 0 2px 9px rgba(8,18,32,.26)}
.dtile.scr .dt-scrim,.dtile.scr .dt-rail{display:none}
/* a <button> centres its content box when the row stretches it taller than its
   content, which pushed each screen down by a different amount and made the
   bezels read as different sizes; pin the screen to the top of every tile */
.dtile.scr{display:flex;flex-direction:column;align-items:stretch}
.dtile.scr .dt-media{flex:none}
.dtile.scr .dt-body{flex:1 1 auto}
.dtile.scr .dt-body{margin-top:0;padding:15px 12px 16px}
/* power indicator on the chin */
.dtile.scr .dt-body::after{content:"";position:absolute;right:14px;bottom:19px;
  width:5px;height:5px;border-radius:50%;background:rgb(var(--c));
  box-shadow:0 0 7px rgb(var(--c) / .9)}
/* a still holds steady until the tile is pointed at, then eases in slowly --
   motion on approach rather than motion all the time */
.dt-media .dt-shot{width:100%;height:100%;object-fit:cover;display:block;
  transform-origin:50% 52%;transform:scale(1.01);
  transition:transform 6.5s cubic-bezier(.16,.62,.28,1)}
.dtile:hover .dt-media .dt-shot,.dtile:focus-visible .dt-media .dt-shot{transform:scale(1.17)}
/* A clip composed inset for the 24:9 pane fills the 16:10 deck tile instead,
   so the tile matches its neighbours and the inset is only seen when opened. */
.dt-media video.dt-inset{transform:scale(1.85);transform-origin:50% 50%}
.dt-ph{position:absolute;inset:0;display:grid;place-items:center;
  background:linear-gradient(115deg,rgba(24,54,88,.9),rgba(12,30,52,.95) 40%,rgba(30,66,106,.9));
  background-size:220% 100%;animation:shim 7s linear infinite}
@keyframes shim{0%{background-position:0% 50%}100%{background-position:200% 50%}}
.dt-phl{font-family:var(--mono);font-size:9px;letter-spacing:.2em;text-transform:uppercase;
  color:rgba(198,226,255,.5);border:1px dashed rgba(198,226,255,.28);
  padding:6px 11px;border-radius:999px}
.dt-scrim{position:absolute;left:0;right:0;top:0;bottom:0;pointer-events:none;
  background:linear-gradient(0deg,rgba(7,18,32,.96) 34%,rgba(7,18,32,.35) 62%,transparent)}
.dt-rail{position:absolute;left:0;top:0;bottom:0;width:3px;z-index:2;
  background:linear-gradient(180deg,rgb(var(--c)),rgb(var(--c) / .10));
  box-shadow:0 0 16px rgb(var(--c) / .6)}
.dt-body{position:relative;display:block;padding:0 18px 18px;margin-top:-64px;z-index:2}
/* Roles tiles: a button centres its content box when the box is shorter than
   the button, which left a band of tile background above each reel. Laying the
   tile out as a column pins the media to the top and lets it take up the slack,
   so the video runs to the tile edge. The copy then sits lower, clear of the
   gradient at the foot of the clip, where it reads properly. */
#dk-work .dtile{display:flex;flex-direction:column;align-items:stretch}
#dk-work .dt-media{flex:1 1 auto}
#dk-work .dt-body{margin-top:-30px}
.dt-logo{display:block;height:24px;width:auto;max-width:130px;object-fit:contain;
  object-position:left center;filter:brightness(0) invert(1) drop-shadow(0 2px 8px rgba(0,0,0,.7));
  opacity:.95;margin-bottom:10px}
.dt-crest{display:inline-grid;place-items:center;height:28px;min-width:40px;padding:0 9px;
  border-radius:8px;margin-bottom:10px;font-family:var(--disp);
  font-variation-settings:"wdth" 76,"wght" 800;font-size:10.5px;color:rgb(var(--c));
  background:rgb(var(--c) / .16);border:1px solid rgb(var(--c) / .46)}
.dt-title{display:block;font-family:var(--disp);font-variation-settings:"wdth" 100,"wght" 800;
  font-size:clamp(.66rem,calc(1.27vw - 4.1px),.79rem);line-height:1.16;color:#fff;text-wrap:balance;
  text-shadow:0 2px 14px rgba(2,9,20,.9)}
.dt-sub{display:block;font-size:12px;color:var(--silver);line-height:1.4;margin-top:5px}
@media (max-width:1163px){
  .dt-title{font-size:.82rem}
}
/* A section title was flex:none, so on a phone the longest of them -- Education
   & Professional Certificates -- ran 126px past its own bar and was cut off by
   the bar's overflow. Letting it shrink and wrap keeps it inside and readable;
   min-width:0 is what actually permits a flex item to go below its text width. */
@media (max-width:760px){
  .sh-title{flex:1 1 auto;min-width:0;white-space:normal}
}
/* the narrowest phones still in use cannot hold the longest heading at the
   clamp floor, so they get one more step down rather than a second line */
@media (max-width:360px){
  .dt-title{font-size:.58rem}
}
.dt-term{display:block;font-family:var(--mono);font-size:9.5px;letter-spacing:.14em;
  text-transform:uppercase;color:rgb(var(--c));margin-top:9px}
.dtile::after{content:"";position:absolute;right:15px;top:15px;width:26px;height:26px;z-index:3;
  border-radius:8px;background-color:rgba(7,18,32,.6);border:1px solid rgba(214,238,255,.34);
  backdrop-filter:blur(6px);
  background-image:linear-gradient(to right,rgba(236,247,255,.95) 0 100%),
    linear-gradient(to bottom,rgba(236,247,255,.95) 0 100%);
  background-size:11px 1.5px,1.5px 11px;background-position:center,center;
  background-repeat:no-repeat;opacity:0;transform:scale(.8);
  transition:opacity .3s var(--d),transform .3s var(--d)}
.dtile:hover::after,.dtile:focus-visible::after{opacity:1;transform:scale(1)}
.ovl{position:fixed;inset:0;z-index:80;background:rgba(6,16,30,.58);
  backdrop-filter:blur(16px) saturate(120%);-webkit-backdrop-filter:blur(16px) saturate(120%);
  opacity:0;transition:opacity .34s var(--d)}
.ovl.on{opacity:1}
.sheetwrap{position:fixed;inset:0;z-index:90;display:grid;place-items:center;
  padding:clamp(12px,3vw,40px);
  padding-top:calc(clamp(12px,3vw,40px) + env(safe-area-inset-top,0px));
  padding-bottom:calc(clamp(12px,3vw,40px) + env(safe-area-inset-bottom,0px))}
.sheetwrap[hidden]{display:none}
.sheet{position:relative;width:min(1080px,100%);max-height:100%;display:flex;flex-direction:column;
  border-radius:22px;overflow:hidden;border:1px solid var(--hair2);
  background:linear-gradient(168deg,#1B3F68 0%,#12263C 34%,#0D1B2B 70%,#153962 100%);
  box-shadow:0 60px 120px -40px rgba(1,6,14,.98),0 0 0 1px rgba(190,225,255,.10),
    inset 0 1px 0 rgba(255,255,255,.22);
  opacity:0;transform:translateY(26px) scale(.975);
  transition:opacity .38s var(--d),transform .38s var(--d)}
.sheetwrap.on .sheet{opacity:1;transform:none}
.sheet-scroll{overflow-y:auto;overscroll-behavior:contain;-webkit-overflow-scrolling:touch;
  padding:clamp(14px,2.4vw,26px)}
.sheet-x{position:absolute;right:14px;top:14px;z-index:20;width:40px;height:40px;
  border-radius:12px;cursor:pointer;display:grid;place-items:center;
  font:300 24px/1 var(--sans);color:var(--platinum);
  background:rgba(8,20,36,.72);border:1px solid var(--hair2);
  backdrop-filter:blur(10px);transition:all .26s var(--d)}
.sheet-x:hover,.sheet-x:focus-visible{background:rgba(150,222,255,.24);
  border-color:rgba(150,222,255,.8);color:#fff;transform:rotate(90deg)}
.sheet .tile{border:none;box-shadow:none;background:none;backdrop-filter:none;border-radius:0}
.sheet .tile:hover{transform:none;box-shadow:none;border-color:transparent}
.sheet .tile .shot{opacity:.30}
.pane-media{margin-bottom:24px;border-radius:14px;overflow:hidden;border:1px solid var(--hair);
  background:#04101c;display:none}
.pane-media:not(:empty){display:block}
/* a certificate is a document, not a reel: no crop, no forced ratio, and it
   opens full size on click */
.pane-media.pm-cert{display:flex;justify-content:center;border:0;background:none;
  border-radius:0;overflow:visible;margin-bottom:26px}
.certbtn{position:relative;display:block;width:min(560px,100%);padding:0;border:0;
  background:none;cursor:zoom-in;border-radius:10px;
  transition:transform .38s var(--d),filter .38s var(--d)}
.certbtn:hover,.certbtn:focus-visible{transform:translateY(-4px) scale(1.014)}
.cert{display:block;width:100%;height:auto;border-radius:10px;
  border:1px solid rgba(190,225,255,.22);
  box-shadow:0 22px 54px -26px rgba(0,0,0,.92)}
.cert-hint{position:absolute;left:50%;bottom:12px;transform:translateX(-50%) translateY(6px);
  font-family:var(--mono);font-size:9px;letter-spacing:.16em;text-transform:uppercase;
  color:rgba(240,248,255,.92);background:rgba(8,20,38,.82);backdrop-filter:blur(8px);
  border:1px solid rgba(190,225,255,.3);border-radius:999px;padding:6px 12px;
  opacity:0;transition:opacity .3s var(--d),transform .3s var(--d);pointer-events:none}
.certbtn:hover .cert-hint,.certbtn:focus-visible .cert-hint{opacity:1;transform:translateX(-50%) translateY(0)}
/* the expanded view sits above the pane sheet */
.lbox{position:fixed;inset:0;z-index:120;display:grid;place-items:center;
  padding:clamp(14px,3vw,48px);background:rgba(4,12,24,.90);
  backdrop-filter:blur(18px) saturate(120%);-webkit-backdrop-filter:blur(18px) saturate(120%);
  opacity:0;transition:opacity .3s var(--d)}
.lbox[hidden]{display:none}
/* Resume: a button in the nav opens a screen holding the PDF itself, with the
   download sitting in the screen's own bar. */
.nav-cv{font-family:var(--mono);font-size:10px;letter-spacing:.11em;text-transform:uppercase;
  color:var(--platinum);background:rgba(8,22,40,.62);cursor:pointer;
  border:1px solid rgba(180,232,255,.5);border-radius:999px;padding:6px 13px;
  box-shadow:0 0 18px -7px rgba(130,205,255,.6),inset 0 1px 0 rgba(255,255,255,.26);
  -webkit-appearance:none;appearance:none;
  transition:color .25s var(--d),background .25s var(--d),
    border-color .25s var(--d),box-shadow .25s var(--d)}
.nav-cv:hover,.nav-cv:focus-visible{background:rgba(150,222,255,.24);
  border-color:rgba(160,226,255,.9);
  box-shadow:0 0 26px -6px rgba(130,205,255,.85),inset 0 1px 0 rgba(255,255,255,.34)}
.cvbox{position:fixed;inset:0;z-index:130;display:grid;place-items:center;
  padding:clamp(10px,2.4vw,34px);background:rgba(4,12,24,.9);
  backdrop-filter:blur(16px);-webkit-backdrop-filter:blur(16px);
  opacity:0;transition:opacity .34s var(--d)}
.cvbox[hidden]{display:none}
.cvbox.on{opacity:1}
.cvsheet{width:min(960px,100%);height:min(92vh,100%);display:flex;flex-direction:column;
  border-radius:16px;overflow:hidden;border:1px solid var(--hair2);
  background:linear-gradient(168deg,rgba(190,225,255,.14),var(--panel) 46%,rgba(12,30,52,.56));
  box-shadow:0 48px 110px -40px rgba(2,9,20,.98),inset 0 1px 0 rgba(255,255,255,.2);
  transform:translateY(12px) scale(.985);transition:transform .38s var(--d)}
.cvbox.on .cvsheet{transform:none}
.cvbar{display:flex;align-items:center;gap:14px;padding:13px 14px 13px 20px;
  border-bottom:1px solid var(--hair);background:rgba(7,18,32,.5)}
.cvttl{font-family:var(--mono);font-size:10.5px;letter-spacing:.13em;text-transform:uppercase;
  color:var(--silver);margin-right:auto;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.cvdl{font-family:var(--mono);font-size:10.5px;letter-spacing:.13em;text-transform:uppercase;
  color:#062033;text-decoration:none;white-space:nowrap;flex:none;
  background:linear-gradient(170deg,#DCEEFF,#9FD0FF 60%,#71B4F2);
  border-radius:999px;padding:8px 16px;
  box-shadow:0 0 22px -8px rgba(150,215,255,.9),inset 0 1px 0 rgba(255,255,255,.7);
  transition:transform .25s var(--d),box-shadow .25s var(--d)}
.cvdl:hover,.cvdl:focus-visible{transform:translateY(-2px);
  box-shadow:0 0 30px -6px rgba(150,215,255,1),inset 0 1px 0 rgba(255,255,255,.8)}
.cvx{width:34px;height:34px;flex:none;border-radius:50%;display:grid;place-items:center;
  font-size:19px;line-height:1;color:var(--silver);cursor:pointer;
  background:rgba(8,22,40,.7);border:1px solid var(--hair2);
  -webkit-appearance:none;appearance:none;
  transition:color .25s var(--d),background .25s var(--d),border-color .25s var(--d)}
.cvx:hover,.cvx:focus-visible{color:#fff;background:rgba(134,214,255,.26);
  border-color:rgba(134,214,255,.8)}
.cvview{position:relative;flex:1 1 auto;min-height:0;overflow:auto;
  background:#0A1626;-webkit-overflow-scrolling:touch}
.cvpages{display:flex;flex-direction:column;align-items:center;gap:18px;
  padding:clamp(12px,2vw,24px)}
.cvpage{display:block;width:100%;max-width:860px;height:auto;border-radius:6px;
  background:#fff;box-shadow:0 22px 50px -26px rgba(2,9,20,.9),0 0 0 1px rgba(190,220,255,.18)}
@media (max-width:620px){
  .cvbar{padding:11px 11px 11px 15px;gap:10px}
  .cvttl{display:none}
  .cvdl{margin-right:auto}
}
.lbox.on{opacity:1}
.lbox img{max-width:min(1500px,96vw);max-height:92vh;width:auto;height:auto;border-radius:10px;
  border:1px solid rgba(190,225,255,.22);box-shadow:0 34px 90px -34px rgba(0,0,0,.95);
  cursor:zoom-out;transform:scale(.97);transition:transform .32s var(--d)}
.lbox.on img{transform:scale(1)}
.lbox-x{position:absolute;top:clamp(12px,2.4vw,30px);right:clamp(12px,2.4vw,30px);
  width:40px;height:40px;border-radius:50%;display:grid;place-items:center;cursor:pointer;
  padding:0;font:inherit;font-size:21px;line-height:1;
  background:rgba(12,30,52,.92);border:1px solid var(--hair);color:var(--silver);
  transition:all .25s var(--d)}
.lbox-x:hover,.lbox-x:focus-visible{border-color:rgba(134,214,255,.8);color:#fff;
  background:rgba(134,214,255,.26)}
.pane-media video{width:100%;display:block;aspect-ratio:24/9;object-fit:cover}
body.locked{overflow:hidden}
@media (max-width:660px){
  .deck{gap:14px}
  .sheet{border-radius:16px}
}
.tiles{display:flex;flex-direction:column;gap:22px}
.tile{position:relative;border-radius:22px;overflow:hidden;isolation:isolate;
  background:linear-gradient(158deg,rgba(190,225,255,.14),var(--panel) 46%,rgba(12,30,52,.52));
  border:1px solid var(--hair);
  backdrop-filter:blur(18px) saturate(150%);-webkit-backdrop-filter:blur(18px) saturate(150%);
  box-shadow:0 26px 58px -30px rgba(3,12,26,.92),inset 0 1px 0 rgba(255,255,255,.16);
  transition:border-color .4s var(--d),transform .4s var(--d),box-shadow .4s var(--d)}
.shot{position:absolute;inset:0;z-index:-2;background-size:contain;background-position:right center;background-repeat:no-repeat;
  filter:grayscale(.28) contrast(1.06) brightness(.95) saturate(1.22);
  opacity:.62;transform:scale(1);
  -webkit-mask-image:linear-gradient(100deg,transparent 2%,rgba(0,0,0,.40) 30%,rgba(0,0,0,1) 62%);
  mask-image:linear-gradient(100deg,transparent 2%,rgba(0,0,0,.40) 30%,rgba(0,0,0,1) 62%);
  transition:opacity .6s var(--d),transform .9s var(--d)}
.tile::after{content:"";position:absolute;inset:0;z-index:-1;pointer-events:none;
  background:linear-gradient(100deg,rgba(10,26,46,.92) 14%,rgba(10,26,46,.46) 44%,rgba(10,26,46,.12) 74%,transparent),
    linear-gradient(0deg,rgb(var(--c) / .10),transparent 60%)}
.tile:hover{transform:translateY(-7px) scale(1.006);border-color:rgb(var(--c) / .80);
  box-shadow:0 48px 96px -34px rgba(2,9,20,.98),0 0 0 1px rgb(var(--c) / .34),
    0 0 70px -16px rgb(var(--c) / .42),inset 0 1px 0 rgba(255,255,255,.34)}
.tile:hover .rail{box-shadow:0 0 30px rgb(var(--c) / .95),0 0 60px rgb(var(--c) / .45)}
.tile:hover .org{text-shadow:0 2px 26px rgba(4,14,28,.85)}
.tile:hover .shot{opacity:.86}
.rail{position:absolute;left:0;top:0;bottom:0;width:3px;z-index:2;
  background:linear-gradient(180deg,rgb(var(--c)),rgb(var(--c) / .10));
  box-shadow:0 0 18px rgb(var(--c) / .55)}
.tile-in{position:relative;z-index:1;padding:clamp(24px,3.4vw,38px)}
.tile-in>*{position:relative}
.vband{position:relative;width:100%;aspect-ratio:24/9;border-radius:14px;overflow:hidden;
  margin-bottom:26px;border:1px solid var(--hair);background:#04101c;
  box-shadow:0 18px 44px -26px rgba(2,9,20,.95),inset 0 1px 0 rgba(255,255,255,.14)}
.vband video{width:100%;height:100%;object-fit:cover;display:block}
.v-scrim{position:absolute;inset:0;pointer-events:none;
  background:linear-gradient(0deg,rgba(5,14,26,.72),rgba(5,14,26,.06) 40%,transparent 62%),
    linear-gradient(90deg,rgba(5,14,26,.26),transparent 28%)}
.lower-third{position:absolute;right:20px;bottom:15px;z-index:2;text-align:right;
  pointer-events:none}
.lt-rule{display:block;height:2px;width:62px;margin:0 0 8px auto;border-radius:2px;
  background:linear-gradient(90deg,transparent,rgb(var(--c)));
  box-shadow:0 0 12px rgb(var(--c) / .8)}
.lt-name{display:block;font-family:var(--disp);font-variation-settings:"wdth" 104,"wght" 800;
  font-size:clamp(.9rem,2.1vw,1.2rem);line-height:1.1;color:#fff;letter-spacing:.005em;
  text-shadow:0 2px 16px rgba(0,0,0,.95),0 0 40px rgba(0,0,0,.6)}
.lt-sub{display:block;font-family:var(--mono);font-size:9.5px;letter-spacing:.17em;
  text-transform:uppercase;color:rgba(226,242,255,.82);margin-top:5px;
  text-shadow:0 1px 10px rgba(0,0,0,.9)}
@media (max-width:660px){.vband{aspect-ratio:16/9}.lower-third{right:13px;bottom:11px}}
.tile-top{display:flex;gap:22px;align-items:flex-start;flex-wrap:wrap}
.logo{height:34px;width:auto;max-width:210px;object-fit:contain;object-position:left center;
  filter:brightness(0) invert(1) drop-shadow(0 2px 10px rgba(0,0,0,.5));opacity:.96;flex:none}
.logo.card{height:52px;width:auto;max-width:250px;border-radius:9px;object-fit:contain;
  filter:none;opacity:1;box-shadow:0 4px 18px -6px rgba(0,0,0,.6),inset 0 1px 0 rgba(255,255,255,.2)}
/* a mark that carries its own colour keeps it; only the drop shadow is retained */
.logo.lfull,.dt-logo.lfull{filter:drop-shadow(0 2px 10px rgba(0,0,0,.55));opacity:1}
/* a disc at a wordmark's height reads far smaller, so give it room */
.logo.lg-disc{height:58px;max-width:58px}
/* a mark that links out lifts slightly and brightens, so it reads as clickable
   without adding underline or colour to the logo itself */
.logolink{display:inline-flex;align-items:center;border-radius:10px;flex:none;
  transition:transform .3s var(--d),filter .3s var(--d)}
.logolink:hover,.logolink:focus-visible{transform:translateY(-2px);
  filter:brightness(1.12) drop-shadow(0 4px 16px rgba(150,210,255,.45))}
.logolink:focus-visible{outline:2px solid rgba(160,226,255,.9);outline-offset:4px}
.logolink .logo{flex:none}
/* A link that is a logo does not look like a link, so in the education panes
   the mark carries its own light: a slow pulse on the rim. The contact chips
   and the email button share the treatment. */
/* the highlight sits on the mark itself -- no padded box reaching toward the
   heading beside it -- and takes the mark's own shape, round for a crest */
.pane[id^="p-ed-"] .logolink{padding:0;margin:0;border-radius:7px;overflow:visible;
  animation:invite 3.6s ease-in-out infinite}
.pane[id^="p-ed-"] .logolink:has(img.lg-disc){border-radius:50%}
@keyframes invite{
  0%,100%{box-shadow:0 0 0 1px rgba(164,222,255,.22),0 0 15px -6px rgba(150,215,255,.6)}
  50%{box-shadow:0 0 0 1px rgba(184,236,255,.62),0 0 30px -4px rgba(150,215,255,1)}}
.chip-glow{position:relative;animation:invite 3.6s ease-in-out infinite}
.chip-glow:hover,.chip-glow:focus-visible{animation-play-state:paused}
.pane[id^="p-ed-"] .logolink:hover,.pane[id^="p-ed-"] .logolink:focus-visible{
  animation-play-state:paused}
@media (prefers-reduced-motion:reduce){
  .pane[id^="p-ed-"] .logolink,.chip-glow{animation:none;
    box-shadow:0 0 0 1px rgba(176,232,255,.34),0 0 20px -7px rgba(150,215,255,.7)}
}
/* the Lynn wordmark is wider than it is tall, so it needs the room to sit whole */
#p-ed-mba .logo{height:40px;max-width:240px}
/* the campus and certificate photographs carry the section, so they run
   brighter than the reels do -- in the deck tile and in the opened pane */
.dtile[data-pane^="p-ed-"] .dt-shot{filter:brightness(1.22) contrast(1.02) saturate(1.1);
  transition:transform 6.5s cubic-bezier(.16,.62,.28,1),filter .45s var(--d)}
.dtile[data-pane^="p-ed-"]:hover .dt-shot,
.dtile[data-pane^="p-ed-"]:focus-visible .dt-shot{
  filter:brightness(1.59) contrast(1.02) saturate(1.13)}
.dtile[data-pane^="p-ed-"] .dt-scrim{
  background:linear-gradient(0deg,rgba(7,18,32,.92) 30%,rgba(7,18,32,.24) 60%,transparent)}
.pane[id^="p-ed-"] .shot{opacity:.92;
  filter:grayscale(0) contrast(1.02) brightness(1.18) saturate(1.16)}
.dt-logo.lg-disc{height:34px;max-width:34px}
.verify{display:flex;align-items:center;gap:13px;flex-wrap:wrap;margin-top:26px;
  padding-top:20px;border-top:1px solid var(--hair)}
a.vchip{gap:7px;padding:10px 18px;border-color:rgb(var(--c) / .5);
  background:rgb(var(--c) / .12);color:#fff;font-size:11px;letter-spacing:.1em;
  text-transform:uppercase}
a.vchip:hover,a.vchip:focus-visible{border-color:rgb(var(--c));background:rgb(var(--c) / .26)}
.vnote{font-family:var(--mono);font-size:9.5px;letter-spacing:.1em;text-transform:uppercase;
  color:var(--faint)}
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
  color:var(--muted);margin:30px 0 10px}
.lead{font-size:14.6px;color:#fff;font-weight:500;line-height:1.5;margin:0 0 16px;max-width:62ch}
.lead em{font-style:normal;color:rgb(var(--c))}
.slate{position:absolute;right:18px;bottom:15px;z-index:2;font-family:var(--mono);
  font-size:9.5px;letter-spacing:.17em;text-transform:uppercase;color:rgba(235,246,255,.62);
  text-shadow:0 1px 8px rgba(4,14,28,.95);pointer-events:none}
.tile.noshot{background:linear-gradient(158deg,rgba(190,225,255,.14),var(--panel) 40%,
  rgb(var(--c) / .10) 78%,rgba(12,30,52,.52))}
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
/* An opened education tile reads as two halves: the copy on the left, the photo
   on the right. The deck's own mask fades the picture in from 30% of the width,
   which put it behind the body text, so an opened pane holds it back past where
   the copy ends. Headings keep the full width they have. */
.pane[id^="p-ed-"] .shot{
  -webkit-mask-image:linear-gradient(100deg,transparent 50%,rgba(0,0,0,.5) 60%,rgba(0,0,0,1) 72%);
  mask-image:linear-gradient(100deg,transparent 50%,rgba(0,0,0,.5) 60%,rgba(0,0,0,1) 72%)}
.pane[id^="p-ed-"] .dl,
.pane[id^="p-ed-"] .verify{max-width:min(46%,520px)}
/* Too narrow for two columns, so the picture moves to a band behind the header
   and clears out before the body copy starts. */
@media (max-width:900px){
  .pane[id^="p-ed-"] .shot{
    background-position:center top;background-size:cover;
    -webkit-mask-image:linear-gradient(180deg,rgba(0,0,0,1) 0%,rgba(0,0,0,.9) 24%,transparent 40%);
    mask-image:linear-gradient(180deg,rgba(0,0,0,1) 0%,rgba(0,0,0,.9) 24%,transparent 40%)}
  .pane[id^="p-ed-"] .dl,
  .pane[id^="p-ed-"] .verify{max-width:none}
}
.gal{--gw:264px;--gap:10px;position:relative;margin-top:24px;overflow:hidden;
  -webkit-mask-image:linear-gradient(90deg,transparent 0,#000 5%,#000 95%,transparent 100%);
  mask-image:linear-gradient(90deg,transparent 0,#000 5%,#000 95%,transparent 100%)}
.gal-track{display:flex;gap:var(--gap);width:max-content;will-change:transform}
.gal.gal-loop .gal-track{animation:galslide calc(var(--n,4) * 7s) linear infinite}
.gal:hover .gal-track,.gal:focus-within .gal-track{animation-play-state:paused}
.gal.gal-static{overflow:visible;-webkit-mask-image:none;mask-image:none}
.gal.gal-static .gal-track{animation:none;width:auto}
.gal.gal-static .gal-track{flex-wrap:wrap}
.gal.gal-static .gal-track .gi{flex:1 1 0;width:auto;min-width:212px}
@keyframes galslide{from{transform:translate3d(0,0,0)}
  to{transform:translate3d(calc((var(--gw) + var(--gap)) * var(--n) * -1),0,0)}}
.gi{margin:0;position:relative;flex:0 0 auto;width:var(--gw,264px);
  border-radius:12px;overflow:hidden;border:1px solid var(--hair);
  background:rgba(8,20,36,.5);box-shadow:0 10px 26px -18px rgba(3,12,26,.9)}
.gi img{display:block;width:100%;aspect-ratio:16/10;object-fit:cover;
  filter:saturate(1.12) contrast(1.04) brightness(.94);
  transition:transform .7s var(--d),filter .5s var(--d)}
.gi:hover img{transform:scale(1.07);filter:saturate(1.3) contrast(1.06) brightness(1.04)}
.gi figcaption{position:absolute;left:0;right:0;bottom:0;padding:16px 10px 8px;
  font-family:var(--mono);font-size:9px;letter-spacing:.13em;text-transform:uppercase;
  color:rgba(240,248,255,.92);
  background:linear-gradient(0deg,rgba(6,16,30,.92),transparent);
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.gi::after{content:"";position:absolute;inset:0;pointer-events:none;
  box-shadow:inset 0 1px 0 rgba(255,255,255,.18);border-radius:12px}
.gi.plate{display:grid;place-items:center;min-height:0;
  background:linear-gradient(150deg,rgba(190,225,255,.20),rgba(10,26,46,.72))}
.gi.plate .pl{aspect-ratio:16/10;width:100%;display:grid;place-items:center;padding:16px}
.gi.plate .pl img{max-width:74%;max-height:58%;object-fit:contain;
  filter:brightness(0) invert(1) drop-shadow(0 2px 10px rgba(0,0,0,.55));opacity:.95}
.gi.plate.colour{background:linear-gradient(150deg,rgba(236,246,255,.90),rgba(196,222,248,.78))}
.gi.plate.colour .pl img{filter:drop-shadow(0 2px 8px rgba(0,0,0,.28));opacity:1;max-width:62%;max-height:64%}
.gi.plate.colour figcaption{background:linear-gradient(0deg,rgba(6,16,30,.80),transparent)}
.gi.plate .pl4{grid-template-columns:1fr 1fr;gap:10px 14px;padding:18px}
.gi.plate .pl4 img{max-width:100%;max-height:30px}
.brief{display:grid;grid-template-columns:repeat(auto-fit,minmax(300px,1fr));gap:20px;margin-top:22px}
.bt{position:relative;border-radius:18px;overflow:hidden;isolation:isolate;border:1px solid var(--hair);
  background:linear-gradient(158deg,rgba(190,225,255,.14),var(--panel) 48%,rgba(12,30,52,.52));
  backdrop-filter:blur(16px);box-shadow:0 20px 48px -30px rgba(3,12,26,.9),inset 0 1px 0 rgba(255,255,255,.15);
  transition:border-color .35s var(--d),transform .35s var(--d)}
.bt:hover{border-color:rgb(var(--c) / .55);transform:translateY(-3px)}
.bt-img{height:120px;background-size:cover;background-position:center;position:relative;
  filter:saturate(1.15) brightness(.86)}
.bt-img::after{content:"";position:absolute;inset:0;
  background:linear-gradient(0deg,rgba(10,26,46,.96),rgba(10,26,46,.25))}
.bt-in{padding:0 22px 22px;margin-top:-34px;position:relative;z-index:1}
.bt img.logo{height:26px;margin-bottom:14px}
.bt h4{font-family:var(--disp);font-variation-settings:"wdth" 106,"wght" 800;font-size:1.02rem;
  margin:0 0 5px;color:#fff}
.bt .r{font-size:13.4px;color:var(--silver);margin:0 0 10px;line-height:1.45}
.bt .t{font-family:var(--mono);font-size:10px;letter-spacing:.12em;text-transform:uppercase;
  color:rgb(var(--c));margin-bottom:11px}
.bt .d{font-size:13.2px;color:var(--muted);line-height:1.6;margin:0}
@media (max-width:820px){.gal{--gw:min(70vw,248px)}}
@media (prefers-reduced-motion:reduce){
  .gal{overflow-x:auto;-webkit-mask-image:none;mask-image:none}
  .gal-track{animation:none}}
.tags{display:flex;flex-wrap:wrap;gap:6px}
.tag{font-family:var(--mono);font-size:10.5px;padding:6px 10px;border-radius:7px;
  background:rgba(190,225,255,.10);border:1px solid var(--hair);color:var(--silver)}
/* &#9472;&#9472; builds &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.builds{display:grid;grid-template-columns:repeat(auto-fit,minmax(310px,1fr));gap:18px}
.build{position:relative;border-radius:18px;padding:28px;border:1px solid var(--hair);
  background:linear-gradient(158deg,rgba(190,225,255,.15),var(--panel) 52%,rgba(12,30,52,.50));
  backdrop-filter:blur(16px);overflow:hidden;
  box-shadow:0 20px 48px -30px rgba(3,12,26,.9),inset 0 1px 0 rgba(255,255,255,.15);
  transition:border-color .35s var(--d),transform .35s var(--d)}
.build:hover{border-color:rgba(134,214,255,.85);transform:translateY(-6px) scale(1.01);
  box-shadow:0 34px 64px -30px rgba(2,9,20,.95),0 0 46px -14px rgba(120,200,255,.48),
    inset 0 1px 0 rgba(255,255,255,.30)}
.build-w{font-family:var(--mono);font-size:10px;letter-spacing:.17em;text-transform:uppercase;
  color:var(--cyan);margin-bottom:13px}
.build h3{font-family:var(--disp);font-variation-settings:"wdth" 104,"wght" 800;
  font-size:1.16rem;margin:0 0 12px;color:#fff;line-height:1.2}
.build .plain{font-size:14.6px;color:var(--silver);line-height:1.6;margin:0 0 15px}
.build .tech{font-family:var(--mono);font-size:12px;color:var(--muted);line-height:1.68;
  margin:0;padding-top:13px;border-top:1px solid rgba(190,220,255,.13)}
/* &#9472;&#9472; stack &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
.grid3{display:grid;grid-template-columns:repeat(auto-fit,minmax(296px,1fr));gap:16px}
.card{border-radius:16px;padding:24px;border:1px solid var(--hair);
  background:linear-gradient(158deg,rgba(190,225,255,.13),var(--panel) 55%,rgba(12,30,52,.46));
  backdrop-filter:blur(14px);box-shadow:inset 0 1px 0 rgba(255,255,255,.14);
  transition:border-color .35s var(--d),transform .35s var(--d)}
.card:hover{border-color:rgba(134,214,255,.80);transform:translateY(-5px) scale(1.012);
  box-shadow:0 28px 54px -28px rgba(2,9,20,.95),0 0 40px -14px rgba(120,200,255,.42),
    inset 0 1px 0 rgba(255,255,255,.28)}
.tools{display:flex;flex-direction:column;gap:15px}
.tool{display:flex;gap:13px;align-items:flex-start}
.tmark{width:38px;height:38px;flex:none;border-radius:10px;display:grid;place-items:center;
  background:linear-gradient(155deg,rgba(190,225,255,.16),rgba(10,24,42,.40));
  border:1px solid var(--hair);box-shadow:inset 0 1px 0 rgba(255,255,255,.18);
  transition:border-color .3s var(--d),background .3s var(--d)}
.tmark img{width:21px;height:21px;object-fit:contain;
  filter:brightness(0) invert(1) drop-shadow(0 1px 3px rgba(0,0,0,.5));opacity:.94}
.tmark.colour img{filter:drop-shadow(0 1px 3px rgba(0,0,0,.6));opacity:1;width:23px;height:23px}
.tmark.mono{font-family:var(--disp);font-variation-settings:"wdth" 74,"wght" 800;
  font-size:11px;color:var(--cyan);letter-spacing:.01em}
.card:hover .tmark{border-color:rgba(134,214,255,.55);
  background:linear-gradient(155deg,rgba(150,222,255,.26),rgba(10,24,42,.34))}
.tinfo{min-width:0;flex:1}
.tname{display:block;font-size:13.5px;color:#fff;font-weight:600;line-height:1.25;margin-bottom:6px}
.tool .tags{gap:5px}
.tool .tag{font-size:10px;padding:4px 8px;letter-spacing:.02em}
.card h3{font-family:var(--mono);font-size:10.5px;letter-spacing:.16em;text-transform:uppercase;
  color:var(--cyan);margin:0 0 15px}
.card p{margin:0;font-size:14px;color:var(--silver);line-height:1.65}
.earlier{font-family:var(--mono);font-size:11.5px;color:var(--muted);letter-spacing:.05em;
  line-height:1.9;margin-top:24px;padding:17px 21px;border-radius:13px;
  background:rgba(190,225,255,.07);border:1px solid var(--hair)}
.earlier b{color:var(--platinum);font-weight:500}
/* &#9472;&#9472; footer &#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472; */
/* Portrait: the image itself is untouched -- only the frame is styled.
   Corners are eased slightly, with a deep drop shadow for lift and two wide
   cool halos so it reads as lit by the same field as the rest of the page. */
.portrait{grid-column:2;grid-row:1 / 5;margin:0;width:100%;
  border-radius:clamp(8px,1.1vw,15px);overflow:hidden;
  box-shadow:0 30px 58px -16px rgba(2,9,20,.96),
             0 0 0 1px rgba(176,222,255,.22),
             0 0 38px -4px rgba(168,220,255,.58),
             0 0 96px -10px rgba(120,190,255,.42)}
.portrait img{display:block;width:100%;height:auto;
  border-radius:clamp(8px,1.1vw,15px)}
/* Click flare. The lens boxes are placed from the reflections measured in the
   photograph itself -- left lens centred at 31.4% across, right at 56.3%, both
   at 36% down -- so the light lands on the glass rather than near it. Screen
   blending keeps it additive over the picture; the picture is never altered.
   The twinkle sits on the right eye, a beat behind the flare. */
.portrait{position:relative;cursor:pointer}
.portrait:focus-visible{outline:2px solid rgba(160,220,255,.9);outline-offset:3px}
.lens,.twinkle{position:absolute;pointer-events:none;opacity:0;mix-blend-mode:screen}
/* The glare is a raked band of light travelling across each lens, clipped to
   the lens shape so it reads as a reflection moving over glass rather than a
   burst sitting on top of it. The rounded rectangle matches the frames. */
.lens{border-radius:13%/20%;overflow:hidden}
.lens-l{left:22.8%;top:31.8%;width:16.2%;height:8.6%}
.lens-r{left:47.3%;top:31.3%;width:17.0%;height:8.9%}
/* A narrow beam, raked just enough to read as glass. It runs far past the lens
   top and bottom so that even with the rake it spans the full height of the
   glass at every point of its travel. */
.lens::after{content:"";position:absolute;top:-120%;bottom:-120%;left:-32%;width:22%;
  background:linear-gradient(90deg,rgba(255,255,255,0) 0%,rgba(206,236,255,.50) 24%,
    rgba(255,255,255,.99) 50%,rgba(206,236,255,.50) 76%,rgba(255,255,255,0) 100%);
  filter:blur(2px);transform:translateX(0) rotate(10deg)}
.twinkle{left:53.1%;top:33.3%;width:2.9%;height:2.33%;
  background:radial-gradient(circle,rgba(255,255,255,1) 0%,rgba(206,236,255,.7) 28%,
    rgba(150,205,255,0) 70%)}
.twinkle::before,.twinkle::after{content:"";position:absolute;filter:blur(.6px)}
.twinkle::before{left:-190%;right:-190%;top:43%;height:14%;
  background:linear-gradient(90deg,transparent,rgba(255,255,255,.98) 50%,transparent)}
.twinkle::after{top:-190%;bottom:-190%;left:43%;width:14%;
  background:linear-gradient(180deg,transparent,rgba(255,255,255,.98) 50%,transparent)}
.portrait.flare .lens{animation:lensglare 1020ms linear both}
.portrait.flare .lens::after{animation:lenswipe 1020ms cubic-bezier(.36,.06,.24,1) both}
.portrait.flare .lens-r,.portrait.flare .lens-r::after{animation-delay:115ms}
.portrait.flare .twinkle{animation:twinkle 880ms cubic-bezier(.25,.9,.3,1) both;
  animation-delay:330ms}
@keyframes lensglare{
  0%{opacity:0}
  10%{opacity:1}
  82%{opacity:1}
  100%{opacity:0}}
@keyframes lenswipe{
  0%{transform:translateX(0) rotate(10deg)}
  100%{transform:translateX(620%) rotate(10deg)}}
@keyframes twinkle{
  0%{opacity:0;transform:scale(.18) rotate(0deg)}
  26%{opacity:1;transform:scale(1.28) rotate(38deg)}
  56%{opacity:.9;transform:scale(.92) rotate(62deg)}
  100%{opacity:0;transform:scale(1.16) rotate(90deg)}}
@media(max-width:900px){
  .hero{grid-template-columns:minmax(0,1fr)}
  .hero>.eyebrow{grid-row:2}
  .hero>.name{grid-row:3}
  .hero>.thesis{grid-row:4}
  .hero>.sub{grid-row:5}
  .portrait{grid-column:1;grid-row:1;width:min(330px,66%);
    margin:0 0 clamp(16px,2.6vh,28px) auto}
  .name{font-size:clamp(2.2rem,11.2vw,4.4rem)}
}
.foot{position:relative;border-top:1px solid var(--hair);margin-top:44px;
  padding-block:46px calc(40px + env(safe-area-inset-bottom,0px));
  display:flex;flex-wrap:wrap;gap:22px;align-items:center;justify-content:space-between}
.foot::before{content:"";position:absolute;z-index:-1;pointer-events:none;
  top:0;bottom:0;left:50%;width:100vw;margin-left:-50vw;
  background:linear-gradient(180deg,rgba(3,12,24,0) 0%,rgba(3,12,24,.034) 8%,
    rgba(3,12,24,.09) 18%,rgba(3,12,24,.153) 32%,rgba(3,12,24,.198) 50%,
    rgba(3,12,24,.23) 75%,rgba(3,12,24,.248) 100%)}
.foot-n{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:1.15rem;letter-spacing:.04em;text-transform:uppercase;color:#fff}
.foot small{font-family:var(--mono);font-size:10.5px;color:var(--muted);
  letter-spacing:.06em;display:block;margin-top:8px;max-width:52ch;line-height:1.7}
.notice{width:100%;padding-top:26px;border-top:1px solid rgba(190,220,255,.09);
  font-size:11.6px;line-height:1.85;color:var(--muted)}
.foot-h{font-family:var(--disp);font-variation-settings:"wdth" 112,"wght" 800;
  font-size:1.15rem;letter-spacing:.04em;text-transform:uppercase;color:#fff;margin-bottom:15px}
.foot-h2{margin-top:30px}
.notice p{margin:0;max-width:108ch}
.refs{margin:22px 0;padding:19px 0;
  border-top:1px solid rgba(190,220,255,.07);border-bottom:1px solid rgba(190,220,255,.07)}
.refs-k{font-family:var(--mono);font-size:9.5px;letter-spacing:.14em;text-transform:uppercase;
  color:var(--faint);margin-bottom:15px}
.refs-l{list-style:none;margin:0;padding:0;display:flex;flex-wrap:wrap;gap:16px 34px;
  align-items:flex-end}
.refs-l li{display:flex;flex-direction:column;gap:9px;min-width:0}
.refs-l img{display:block;height:21px;width:auto;max-width:124px;object-fit:contain;
  object-position:left center;filter:brightness(0) invert(1);opacity:.42}
.refs-l b{font-family:var(--mono);font-size:8.8px;font-weight:400;letter-spacing:.1em;
  text-transform:uppercase;color:var(--faint)}
.credits{width:100%;font-family:var(--mono);font-size:9.5px;color:var(--faint);
  letter-spacing:.04em;line-height:1.75;padding-top:22px;border-top:1px solid rgba(190,220,255,.09)}
:focus-visible{outline:2px solid var(--cyan);outline-offset:3px;border-radius:5px}
@media (max-width:660px){
  .mark{font-size:10.5px;letter-spacing:.09em}
  .term{padding-top:0}
  .row{grid-template-columns:1fr 46px;gap:12px}
  .row-t{display:none}
  .logo{height:28px}
}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition-duration:.01ms!important}}
</style>

<div class="field" aria-hidden="true">
  <div class="glare"></div>
  <div class="flutes"></div>
  <div class="shade"></div>
  <div class="sheen"></div>
  <div class="edge"></div>
  <div class="grain"></div>
</div>
<div class="tube tube-l" aria-hidden="true"></div>
<div class="tube tube-r" aria-hidden="true"></div>

<nav class="nav">
  <div class="nav-in">
    <span class="mark">Shamar Robinson</span>
    <div class="nav-links">
      <a href="#work">Roles</a><a href="#builds">Deliverables</a>
      <a href="#stack">Tools</a><a href="#education">Education</a><a href="#projects">Projects</a><a href="#contact">Contact</a>
      <button class="nav-cv" id="cvopen" type="button" aria-haspopup="dialog">Resume</button>
      <span class="nav-div" aria-hidden="true"></span>
      <button class="nav-ic ic-gm nav-mail chip-glow" type="button" id="navmail" data-u="shamarrobinson31" data-d="gmail.com" aria-label="Show and copy my email address"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M2 5.6A2.6 2.6 0 0 1 4.6 3h14.8A2.6 2.6 0 0 1 22 5.6v12.8a2.6 2.6 0 0 1-2.6 2.6H4.6A2.6 2.6 0 0 1 2 18.4V5.6Zm2.5.4 8 5.9 8-5.9h-16ZM20 8.3l-7.4 5.5a1 1 0 0 1-1.2 0L4 8.3V18h16V8.3Z"/></svg></button>
      <span class="mailpop" id="mailpop" hidden><span class="mailpop-a" id="mailpopa"></span><span class="mailpop-n" id="mailpopn">Copied</span></span>
      <a class="nav-ic ic-li" href="https://linkedin.com/in/shamarrobinson" target="_blank" rel="noopener" aria-label="LinkedIn profile"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg></a><a class="nav-ic ic-gh" href="https://github.com/ShamarRobinson" target="_blank" rel="noopener" aria-label="GitHub profile"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 .3a12 12 0 0 0-3.8 23.4c.6.1.8-.3.8-.6v-2c-3.3.7-4-1.6-4-1.6-.6-1.4-1.4-1.8-1.4-1.8-1-.7.1-.7.1-.7 1.2.1 1.8 1.2 1.8 1.2 1 1.8 2.8 1.3 3.5 1 .1-.8.4-1.3.7-1.6-2.7-.3-5.5-1.3-5.5-6 0-1.2.5-2.3 1.3-3.1-.2-.3-.6-1.6.1-3.2 0 0 1-.3 3.3 1.2a11.5 11.5 0 0 1 6 0c2.3-1.5 3.3-1.2 3.3-1.2.7 1.6.2 2.9.1 3.2.8.8 1.3 1.9 1.3 3.2 0 4.6-2.8 5.6-5.5 5.9.4.4.8 1.1.8 2.2v3.3c0 .3.2.7.8.6A12 12 0 0 0 12 .3"/></svg></a>
    </div>
  </div>
</nav>

<div class="shell">
  <header class="hero">
    <figure class="portrait" tabindex="0" role="button" aria-label="Flash the lenses"><img src="__PORTRAIT__" alt="Shamar Robinson" decoding="async" fetchpriority="high"><span class="lens lens-l" aria-hidden="true"></span><span class="lens lens-r" aria-hidden="true"></span><span class="twinkle" aria-hidden="true"></span></figure>
    <div class="eyebrow">Portfolio</div>
    <h1 class="name" id="nm">Shamar<br>Robinson</h1>
    <p class="thesis">I make complicated information <b>accurate, clear and on time</b> &mdash; then put it in front of the people who decide.</p>
    <p class="sub">Seven years across entertainment, media and corporate operations &mdash; Warner Bros. Discovery, Legendary Entertainment, The Walt Disney Company, Cox and The Coca-Cola Company.</p>
  </header>

  <section aria-label="At a glance" style="padding-block:0 clamp(6px,1.2vh,42px)">
    <div class="ledger">
      <div class="led"><div class="led-n">3</div><div class="led-l">Fortune 500<br>employers</div></div>
      <div class="led"><div class="led-n">5</div><div class="led-l">Global<br>brands</div></div>
      <div class="led"><div class="led-n">100+</div><div class="led-l">Agreements<br>drafted</div></div>
      <div class="led"><div class="led-n">1,900+</div><div class="led-l">Agreements<br>analyzed</div></div>
    </div>
  </section>

  <section id="work">
    <button class="sechead" type="button" aria-expanded="false" aria-controls="dk-work" data-sec="work"><span class="sh-metal"></span><span class="sh-sheen"></span><span class="sh-idx">01</span><span class="sh-title">Roles</span><span class="cta"><span class="cta-t">Click Here</span><span class="cta-i"></span></span></button>
    <div class="deckwrap" id="dk-work" hidden><div class="deck">__DECK_WORK__</div></div>
  </section>

  <section id="builds">
    <button class="sechead" type="button" aria-expanded="false" aria-controls="dk-builds" data-sec="builds"><span class="sh-metal"></span><span class="sh-sheen"></span><span class="sh-idx">02</span><span class="sh-title">Deliverables &amp; Outcomes</span><span class="cta"><span class="cta-t">Click Here</span><span class="cta-i"></span></span></button>
    <div class="deckwrap" id="dk-builds" hidden><div class="deck">__DECK_BUILDS____DECK_STAKE__</div></div>
  </section>

  <section id="stack">
    <button class="sechead" type="button" aria-expanded="false" aria-controls="dk-tools" data-sec="tools"><span class="sh-metal"></span><span class="sh-sheen"></span><span class="sh-idx">03</span><span class="sh-title">Software &amp; Tools</span><span class="cta"><span class="cta-t">Click Here</span><span class="cta-i"></span></span></button>
    <div class="deckwrap" id="dk-tools" hidden><div class="deck">__DECK_TOOLS__</div></div>
  </section>

  <section id="education">
    <button class="sechead" type="button" aria-expanded="false" aria-controls="dk-edu" data-sec="edu"><span class="sh-metal"></span><span class="sh-sheen"></span><span class="sh-idx">04</span><span class="sh-title">Education &amp; Professional Certificates</span><span class="cta"><span class="cta-t">Click Here</span><span class="cta-i"></span></span></button>
    <div class="deckwrap" id="dk-edu" hidden><div class="deck">__DECK_EDU__</div></div>
  </section>

  <section id="projects">
    <button class="sechead" type="button" aria-expanded="false" aria-controls="dk-proj" data-sec="proj"><span class="sh-metal"></span><span class="sh-sheen"></span><span class="sh-idx">05</span><span class="sh-title">Projects</span><span class="cta"><span class="cta-t">Click Here</span><span class="cta-i"></span></span></button>
    <div class="deckwrap" id="dk-proj" hidden><div class="deck">__DECK_PROJECTS__</div></div>
  </section>

  <footer class="foot" id="contact">
    <div>
      <div class="foot-n">Contact</div>
      <div class="hero-meta" style="margin-top:15px">
      <button class="chip chip-rv chip-glow" type="button" id="mailrv"
        data-u="shamarrobinson31" data-d="gmail.com">Email</button>
      <a class="chip chip-glow" href="https://linkedin.com/in/shamarrobinson" target="_blank" rel="noopener">LinkedIn &#8599;</a>
      </div>
    </div>
    <div class="notice">
      <div class="foot-h">Disclaimer</div>
      <p>This portfolio is shared solely with prospective employers and recruiters to discuss my
        prior job responsibilities, professional experience, and the publicly available context of
        my roles. Any brief, silent third-party audiovisual excerpts are used only as limited
        context for my original narration, r&#233;sum&#233; information, and professional
        commentary; they are secondary to that discussion and are not offered for entertainment,
        promotion, or as a substitute for the original works. No endorsement, or sponsorship by any
        referenced organization is implied, and no confidential, proprietary, or nonpublic employer
        information is included.</p>
__REFS__
      <div class="foot-h foot-h2">Rights and Use</div>
      <p>Copyrights, trademarks, and other intellectual-property rights remain the property of
        their respective owners. To the extent any copyrighted material is included it is strictly
        a limited good-faith fair use under 17 U.S.C. &#167; 107, considering the purpose and
        character of the use, nature of the work, limited amount used, and lack of meaningful
        market substitution or harm. This notice does not claim ownership of third-party content or
        override the exclusive rights provided to copyright holders under 17 U.S.C. &#167; 106.</p>
    </div>
    <div class="credits">
      Location photography via Wikimedia Commons &mdash; Warner Bros. water tower by Chris Yarzab
      (CC BY 2.0) &middot; Disney gate by Coolcaesar (CC BY-SA 4.0) &middot; Team Disney building by
      Junkyardsparkle (CC0) &middot; Disney Legends Plaza and Las Vegas by King of Hearts
      (CC BY-SA 4.0).
    </div>
  </footer>
</div>

<div class="cvbox" id="cvbox" hidden role="dialog" aria-modal="true" aria-label="Resume">
  <div class="cvsheet" role="document">
    <div class="cvbar">
      <span class="cvttl">Shamar Robinson &mdash; Resume</span>
      <button class="cvdl" id="cvdl" type="button">Download <span aria-hidden="true">&darr;</span></button>
      <button class="cvx" id="cvx" type="button" aria-label="Close">&#215;</button>
    </div>
    <div class="cvview">
      <div class="cvpages">__RESUME_PAGES__
      </div>
    </div>
  </div>
</div>
<div class="lbox" id="lbox" hidden>
  <button class="lbox-x" id="lboxx" type="button" aria-label="Close">&#215;</button>
  <img id="lboximg" src="" alt="">
</div>
<div class="ovl" id="ovl" hidden></div>
<div class="sheetwrap" id="sheetwrap" hidden>
  <div class="sheet" id="sheet" role="dialog" aria-modal="true" aria-label="Detail">
    <button class="sheet-x" id="sheetx" type="button" aria-label="Close">&#215;</button>
    <span class="sweep" aria-hidden="true"></span>
    <div class="sheet-scroll" id="sheetscroll">
__PANES__
    </div>
  </div>
</div>

<script>
(function(){
  var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var px = 0, py = 0, tx = 0, ty = 0, raf = null;
  var layers = [].slice.call(document.querySelectorAll("[data-px]"));
  var nm = document.getElementById("nm");
  var t0 = performance.now();

  window.addEventListener("pointermove", function(e){
    tx = e.clientX / window.innerWidth - 0.5;
    ty = e.clientY / window.innerHeight - 0.5;
    if (nm && !reduce) nm.style.setProperty("--sheen", (18 + (tx + 0.5) * 64) + "%");
  }, {passive:true});

  function loop(){
    px += (tx - px) * 0.045;
    py += (ty - py) * 0.045;
    var t = (performance.now() - t0) / 1000;
    for (var i = 0; i < layers.length; i++){
      var el = layers[i];
      var k = parseFloat(el.getAttribute("data-px")) || 0;
      var dx = Math.sin(t * 0.05 + i * 1.6) * 18;
      var dy = Math.cos(t * 0.041 + i * 2.2) * 13;
      el.style.transform = "translate3d(" + (px * k + dx).toFixed(2) + "px," +
                           (py * k + dy).toFixed(2) + "px,0)";
    }
    raf = requestAnimationFrame(loop);
  }
  if (!reduce){
    loop();
    document.addEventListener("visibilitychange", function(){
      if (document.hidden){ cancelAnimationFrame(raf); raf = null; }
      else if (!raf){ raf = requestAnimationFrame(loop); }
    });
  }

  /* play a reel only while it is on screen; never when motion is unwelcome */
  /* deck videos: play only while the tile is on screen */
  if (reduce) {
    document.querySelectorAll("svg.dg").forEach(function(g){
      try { g.pauseAnimations(); } catch (e) {}
    });
  }

  var dvids = [].slice.call(document.querySelectorAll(".dt-video"));
  if (reduce) {
    dvids.forEach(function(v){ try{ v.pause(); v.removeAttribute("autoplay"); }catch(e){} });
  } else if (dvids.length && "IntersectionObserver" in window) {
    var vio = new IntersectionObserver(function(en){
      en.forEach(function(e){
        var v = e.target;
        if (e.isIntersecting) { var p = v.play(); if (p && p.catch) p.catch(function(){}); }
        else if (!v.closest(".pane")) { try { v.pause(); } catch(err) {} }
      });
    }, {threshold: 0.2});
    dvids.forEach(function(v){ vio.observe(v); });
  }

  /* percentage bars animate when their pane opens, not on page load */
  function runBars(root){
    if (reduce || !root) return;
    root.querySelectorAll(".row-f").forEach(function(f){
      var w = f.style.getPropertyValue("--w"); f.style.width = "0%";
      requestAnimationFrame(function(){ requestAnimationFrame(function(){ f.style.width = w; }); });
    });
    root.querySelectorAll(".seg").forEach(function(sg){
      var g = sg.style.flexGrow; sg.style.flexGrow = "0.001";
      requestAnimationFrame(function(){ requestAnimationFrame(function(){ sg.style.flexGrow = g; }); });
    });
  }

  /* tile -> pane modal */
  var ovl = document.getElementById("ovl"),
      wrap = document.getElementById("sheetwrap"),
      scroller = document.getElementById("sheetscroll"),
      xbtn = document.getElementById("sheetx"),
      openId = null, lastFocus = null, closeTimer = null;

  function moveMedia(id, intoPane){
    var btn = document.querySelector('.dtile[data-pane="' + id + '"]');
    if (!btn) return;
    var vid = btn.querySelector(".dt-video") ||
              document.querySelector("#" + id + " .pane-media .dt-video");
    if (!vid) return;
    var slot = intoPane ? document.querySelector("#" + id + " .pane-media")
                        : btn.querySelector(".dt-media");
    if (slot) slot.appendChild(vid);
    var p = vid.play(); if (p && p.catch) p.catch(function(){});
  }

  function openPane(id, btn){
    var pane = document.getElementById(id);
    if (!pane) return;
    if (closeTimer) { clearTimeout(closeTimer); closeTimer = null; }
    if (openId) finishClose(openId);
    lastFocus = btn || document.activeElement;
    pane.hidden = false;
    openId = id;
    moveMedia(id, true);
    ovl.hidden = false; wrap.hidden = false;
    document.body.classList.add("locked");
    var sheetEl = document.getElementById("sheet");
    requestAnimationFrame(function(){
      ovl.classList.add("on"); wrap.classList.add("on");
      scroller.scrollTop = 0;
      runBars(pane);
      if (sheetEl && !reduce) {
        sheetEl.classList.remove("sweeping");
        void sheetEl.offsetWidth;
        sheetEl.classList.add("sweeping");
        setTimeout(function(){ sheetEl.classList.remove("sweeping"); }, 1150);
      }
      xbtn.focus();
    });
  }

  function finishClose(id){
    var pane = document.getElementById(id);
    moveMedia(id, false);
    if (pane) pane.hidden = true;
  }

  function closePane(){
    if (!openId) return;
    var id = openId; openId = null;
    ovl.classList.remove("on"); wrap.classList.remove("on");
    closeTimer = setTimeout(function(){
      finishClose(id);
      ovl.hidden = true; wrap.hidden = true;
      document.body.classList.remove("locked");
      closeTimer = null;
      if (lastFocus && lastFocus.focus) lastFocus.focus();
    }, reduce ? 0 : 360);
  }

  /* sections collapse into their title bar; the button beats once, then moves */
  document.querySelectorAll(".sechead").forEach(function(head){
    head.addEventListener("click", function(){
      var wrapEl = document.getElementById(head.getAttribute("aria-controls"));
      if (!wrapEl) return;
      var cta = head.querySelector(".cta");
      var opening = wrapEl.hidden;
      if (cta && !reduce) {
        var beat = opening ? "blink" : "flash";
        cta.classList.remove("blink", "flash");
        void cta.offsetWidth;
        cta.classList.add(beat);
        setTimeout(function(){ cta.classList.remove(beat); }, 480);
      }
      setTimeout(function(){
        wrapEl.hidden = !opening;
        head.setAttribute("aria-expanded", opening ? "true" : "false");
        var t = head.querySelector(".cta-t");
        if (t) t.textContent = opening ? "Close" : "Click Here";
        if (opening) {
          wrapEl.querySelectorAll(".dt-video").forEach(function(v){
            var p = v.play(); if (p && p.catch) p.catch(function(){});
          });
        }
      }, reduce ? 0 : (opening ? 300 : 480));
    });
  });

  document.querySelectorAll(".dtile").forEach(function(b){
    b.addEventListener("click", function(){ openPane(b.getAttribute("data-pane"), b); });
  });
  if (xbtn) xbtn.addEventListener("click", closePane);
  if (ovl) ovl.addEventListener("click", closePane);
  if (wrap) wrap.addEventListener("click", function(e){ if (e.target === wrap) closePane(); });
  /* certificate lightbox -- layered above the pane sheet, so Escape closes it
     first and leaves the pane where it was */
  var lbox = document.getElementById("lbox"),
      lboxImg = document.getElementById("lboximg"),
      lboxX = document.getElementById("lboxx"),
      lboxTimer = null, lboxFrom = null;

  function openLbox(btn){
    var im = btn.querySelector(".cert");
    if (!im) return;
    if (lboxTimer) { clearTimeout(lboxTimer); lboxTimer = null; }
    lboxFrom = btn;
    lboxImg.src = im.currentSrc || im.src || im.getAttribute("data-src");
    lboxImg.alt = im.alt;
    lbox.hidden = false;
    /* rAF does not fire while a document is hidden, so a timer backs it up and
       the overlay can never be left sitting at zero opacity */
    var reveal = function(){ lbox.classList.add("on"); };
    requestAnimationFrame(reveal);
    setTimeout(reveal, 60);
    lboxX.focus();
  }
  function closeLbox(){
    if (lbox.hidden) return;
    lbox.classList.remove("on");
    var back = lboxFrom; lboxFrom = null;
    lboxTimer = setTimeout(function(){
      lbox.hidden = true; lboxImg.removeAttribute("src");
      if (back && document.contains(back)) back.focus();
    }, reduce ? 0 : 300);
  }
  document.querySelectorAll(".certbtn").forEach(function(b){
    b.addEventListener("click", function(){ openLbox(b); });
  });
  lbox.addEventListener("click", closeLbox);

  /* Resume screen. The PDF is only attached to the frame on first open, so the
     file is not fetched by anyone who never asks for it. */
  var cvbox = document.getElementById("cvbox"),
      cvopen = document.getElementById("cvopen"),
      cvx = document.getElementById("cvx"),
      cvdl = document.getElementById("cvdl"),
      cvTimer = null;

  function openCv(){
    if (cvTimer) { clearTimeout(cvTimer); cvTimer = null; }
    cvbox.hidden = false;
    document.body.classList.add("locked");
    var reveal = function(){ cvbox.classList.add("on"); };
    requestAnimationFrame(reveal);
    setTimeout(reveal, 60);
    cvx.focus();
  }
  function closeCv(){
    if (cvbox.hidden) return;
    cvbox.classList.remove("on");
    cvTimer = setTimeout(function(){
      cvbox.hidden = true;
      if (!lbox || lbox.hidden) document.body.classList.remove("locked");
      if (document.contains(cvopen)) cvopen.focus();
    }, reduce ? 0 : 300);
  }
  if (cvopen) cvopen.addEventListener("click", openCv);
  if (cvx) cvx.addEventListener("click", closeCv);

  /* A page on claude.ai cannot hand a file over through a plain link, so where
     the host offers a downloads capability the button routes through it. On an
     ordinary web host there is no capability and the anchor's own download
     attribute does the work untouched. */
  var cvSave = null;
  try {
    if (window.claude && typeof window.claude.use === "function"){
      window.claude.use("downloads").then(function(d){ cvSave = d || null; },
                                          function(){ cvSave = null; });
    }
  } catch (err) { cvSave = null; }

  /* The file rides along in the page, so the download builds it from bytes
     already here rather than fetching anything. */
  var CV_B64 = "__RESUME__";
  function cvBlob(){
    var bin = atob(CV_B64), n = bin.length, buf = new Uint8Array(n);
    for (var i = 0; i < n; i++) buf[i] = bin.charCodeAt(i);
    return new Blob([buf], {type: "application/pdf"});
  }
  if (cvdl) cvdl.addEventListener("click", function(){
    var blob;
    try { blob = cvBlob(); } catch (err) { return; }
    if (cvSave){
      cvSave.save({filename: "Shamar_Robinson_Resume.pdf", data: blob})
            .catch(function(){ /* declined, or refused: leave the view as is */ });
      return;
    }
    var url = URL.createObjectURL(blob);
    var a = document.createElement("a");
    a.href = url; a.download = "Shamar_Robinson_Resume.pdf";
    document.body.appendChild(a); a.click(); a.parentNode.removeChild(a);
    setTimeout(function(){ URL.revokeObjectURL(url); }, 4000);
  });
  /* the backdrop closes, the sheet itself does not */
  if (cvbox) cvbox.addEventListener("click", function(e){
    if (e.target === cvbox) closeCv();
  });

  document.addEventListener("keydown", function(e){
    if (e.key !== "Escape") return;
    if (cvbox && !cvbox.hidden) { closeCv(); return; }
    if (!lbox.hidden) { closeLbox(); return; }
    if (openId) closePane();
  });

  /* The hero counters rev rather than glide: a beat of ignition, a hard surge,
     then a decelerating settle onto the figure and a gold ring to lock it. */
  (function(){
    var leds = [].slice.call(document.querySelectorAll(".ledger .led"));
    if (!leds.length) return;
    var items = leds.map(function(el){
      var n = el.querySelector(".led-n");
      var raw = n.textContent.trim();
      var m = raw.match(/^([\d,]+)(.*)$/);
      return m ? {el:el, n:n, target:parseInt(m[1].replace(/,/g,""),10),
                  suffix:m[2]||"", raw:raw} : null;
    }).filter(Boolean);
    if (!items.length) return;

    if (reduce) { items.forEach(function(it){ it.el.classList.add("lit"); }); return; }

    items.forEach(function(it){ it.n.textContent = "0" + it.suffix; });

    /* the outline is sized from the card at fire time; pathLength normalises the
       dash units so the draw reads the same on every card width */
    var SVGNS = "http://www.w3.org/2000/svg";
    function drawLine(el){
      var svg = el.querySelector(".ledline");
      if (!svg){
        svg = document.createElementNS(SVGNS, "svg");
        svg.setAttribute("class", "ledline");
        svg.setAttribute("aria-hidden", "true");
        ["lz-glow", "lz-core", "lz-head"].forEach(function(c){
          var r = document.createElementNS(SVGNS, "rect");
          r.setAttribute("class", c);
          svg.appendChild(r);
        });
        el.appendChild(svg);
      }
      /* measure the svg itself, so the outline is in register with the edge it
         is tracing whatever the card's border and padding do */
      var sr = svg.getBoundingClientRect();
      var w = Math.max(8, sr.width), h = Math.max(8, sr.height);
      svg.setAttribute("viewBox", "0 0 " + w + " " + h);
      var ins = 1.25;
      [].forEach.call(svg.querySelectorAll("rect"), function(rc){
        rc.setAttribute("x", ins);
        rc.setAttribute("y", ins);
        rc.setAttribute("width", w - ins * 2);
        rc.setAttribute("height", h - ins * 2);
        rc.setAttribute("rx", 16 - ins);
        rc.setAttribute("pathLength", 100);
      });
      el.classList.remove("firing");
      void el.offsetWidth;
      el.classList.add("firing");
    }


    function group(v){ return v.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); }
    /* sparks thrown off an impact, scattered from the figure itself */
    /* the figure sits in a full-width block, so measure the digits themselves --
       otherwise anything positioned from it lands out in the empty space */
    function glyphRect(el){
      var host = el.querySelector(".led-n");
      try {
        var rg = document.createRange();
        rg.selectNodeContents(host);
        var r = rg.getBoundingClientRect();
        if (r && r.width) return r;
      } catch (e) {}
      return host.getBoundingClientRect();
    }

    function sparks(el, n, spread, ox){
      var hb = glyphRect(el), cb = el.getBoundingClientRect();
      var cx = hb.left - cb.left + hb.width * (ox === undefined ? 0.5 : ox);
      var cy = hb.top - cb.top + hb.height * 0.55;
      for (var i = 0; i < n; i++){
        var s = document.createElement("span");
        s.className = "spk";
        var a = Math.random() * Math.PI * 2;
        var d = spread * (0.45 + Math.random() * 0.8);
        s.style.left = cx + "px";
        s.style.top = cy + "px";
        s.style.setProperty("--dx", (Math.cos(a) * d).toFixed(1) + "px");
        s.style.setProperty("--dy", (Math.sin(a) * d).toFixed(1) + "px");
        s.style.animation = "spkfly " + (300 + Math.random()*280).toFixed(0) +
                            "ms cubic-bezier(.16,.7,.3,1) 1 forwards";
        el.appendChild(s);
        (function(node){ setTimeout(function(){ if (node.parentNode) node.parentNode.removeChild(node); }, 760); })(s);
      }
    }

    function boom(el){
      var hb = glyphRect(el), cb = el.getBoundingClientRect();
      var cx = hb.left - cb.left + hb.width * 0.5;
      var cy = hb.top - cb.top + hb.height * 0.55;
      var base = Math.max(46, hb.height * 2.6);
      function add(cls, size, dur, delay, anim){
        var d = document.createElement("span");
        d.className = cls;
        d.style.left = cx + "px";
        d.style.top = cy + "px";
        d.style.width = size + "px";
        d.style.height = size + "px";
        d.style.animation = anim + " " + dur + "ms cubic-bezier(.12,.72,.3,1) " +
                            delay + "ms 1 forwards";
        el.appendChild(d);
        setTimeout(function(){ if (d.parentNode) d.parentNode.removeChild(d); }, dur + delay + 90);
      }
      add("flash", base * 1.5, 340, 0,  "boomflash");
      add("boom",  base,       460, 0,  "boomring");
      add("boom",  base * 1.9, 620, 90, "boomring");
    }

    function pulse(node, cls, ms){
      node.classList.remove(cls);
      void node.offsetWidth;
      node.classList.add(cls);
      setTimeout(function(){ node.classList.remove(cls); }, ms);
    }

    /* a low figure counts up one at a time from 1, hitting on every step */
    function stepUp(it, done){
      var v = 0;
      function next(){
        v++;
        it.n.textContent = group(v) + it.suffix;
        pulse(it.n, "hit", 350);
        sparks(it.el, 4, 13, 0.5);
        if (v >= it.target) return done();
        setTimeout(next, 250 + 150 * (v / it.target));
      }
      setTimeout(next, 130);
    }

    /* a high figure ramps: slow off the mark, fastest near the top, jittering
       and glowing the whole way, then a hard landing */
    function rampUp(it, done){
      /* The biggest figure gets a true speed ramp: it crawls while the eye
         reads it, then whips through the bulk of the count into the landing.
         Smaller figures keep the gentler accelerating curve. */
      var ramped = it.target >= 1000;
      var DUR = (ramped ? 2600 : 2150) + Math.random()*220;
      var t0 = null, lastSpark = 0;
      function curve(p){
        if (!ramped) return Math.pow(p, 2.15);
        if (p < 0.38) return 0.055 * (p / 0.38);
        var q = (p - 0.38) / 0.62;
        return 0.055 + Math.pow(q, 2.6) * 0.945;
      }
      it.n.classList.add("climb");
      function frame(ts){
        if (t0 === null) t0 = ts;
        var p = (ts - t0) / DUR;
        if (p >= 1){
          it.n.classList.remove("climb");
          it.n.style.removeProperty("--jit");
          it.n.textContent = group(it.target) + it.suffix;
          pulse(it.n, "land", 540);
          sparks(it.el, 22, 62);
          if (ramped) boom(it.el);
          return done();
        }
        it.n.textContent = group(Math.max(1, Math.round(it.target * curve(p)))) + it.suffix;
        /* the shake tightens as it picks up speed */
        if (ramped) it.n.style.setProperty("--jit", (1 + 2.4 * Math.pow(p, 1.8)).toFixed(2) + "px");
        if (ts - lastSpark > 104){ lastSpark = ts; sparks(it.el, 1, 20 + 30 * p); }
        requestAnimationFrame(frame);
      }
      requestAnimationFrame(frame);
    }

    /* small figures tick, large ones ramp; the gold ring locks either in */
    function run(it, delay){
      setTimeout(function(){
        function finish(){
          it.el.classList.add("lit");
          drawLine(it.el);
          setTimeout(function(){ it.el.classList.remove("firing"); }, 1200);
        }
        if (it.target <= 12) stepUp(it, finish); else rampUp(it, finish);
      }, delay);
    }

    function settle(){
      items.forEach(function(it){
        it.n.textContent = group(it.target) + it.suffix;
        it.el.classList.add("lit");
      });
    }

    function start(){
      items.forEach(function(it,i){ run(it, i*135); });
      /* rAF does not tick in a hidden document; make sure a figure can never be
         left sitting at zero if the animation never gets to run */
      setTimeout(function(){
        if (items[items.length-1].n.textContent === "0" + items[items.length-1].suffix) settle();
      }, 3200);
    }

    /* the same rev-and-trace replays on demand; the card returns to its normal
       pop-out and blue glow as soon as the gold line has faded */
    items.forEach(function(it){
      it.el.setAttribute("role", "button");
      it.el.setAttribute("tabindex", "0");
      it.el.setAttribute("aria-label", "Replay the " + it.raw + " count");
      function replay(fromPointer){
        if (it.busy) return;
        it.busy = true;
        it.el.classList.remove("lit", "firing", "from-hover");
        it.n.classList.remove("climb", "hit", "land");
        it.n.style.removeProperty("--jit");
        if (fromPointer) it.el.classList.add("from-hover");
        it.n.textContent = "0" + it.suffix;
        run(it, 0);
        setTimeout(function(){
          it.el.classList.remove("from-hover");
          it.busy = false;
        }, 3800);
      }
      it.el.addEventListener("click", function(){ replay(true); });
      it.el.addEventListener("keydown", function(e){
        if (e.key === "Enter" || e.key === " " || e.key === "Spacebar"){
          e.preventDefault(); replay(false);
        }
      });
    });

    if ("IntersectionObserver" in window){
      var io = new IntersectionObserver(function(en){
        en.forEach(function(e){ if (e.isIntersecting){ io.disconnect(); start(); } });
      }, {threshold:.4});
      io.observe(document.querySelector(".ledger"));
      setTimeout(function(){ if (items[0].n.textContent === "0" + items[0].suffix){ io.disconnect(); start(); } }, 1400);
    } else { start(); }
  })();

  /* gallery carousel: clone one set so the leftward slide loops seamlessly.
     Cloning at runtime keeps the data URIs single-copy in the document. */
  document.querySelectorAll(".gal").forEach(function(g){
    var track = g.querySelector(".gal-track");
    if (!track) return;
    var items = Array.prototype.slice.call(track.children);
    if (reduce || items.length < 3) { g.classList.add("gal-static"); return; }
    g.style.setProperty("--n", items.length);
    items.forEach(function(el){
      var c = el.cloneNode(true);
      c.setAttribute("aria-hidden", "true");
      track.appendChild(c);
    });
    g.classList.add("gal-loop");
  });

  var ICON_COPY = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
    'stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
    '<rect x="9" y="9" width="12" height="12" rx="2.5"/>' +
    '<path d="M6 15H4.5A1.5 1.5 0 0 1 3 13.5v-9A1.5 1.5 0 0 1 4.5 3h9A1.5 1.5 0 0 1 15 4.5V6"/></svg>';
  var ICON_X = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
    'stroke-width="2.4" stroke-linecap="round" aria-hidden="true">' +
    '<path d="M6 6 18 18M18 6 6 18"/></svg>';
  var ICON_DONE = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
    'stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
    '<path d="M4 12.5 9.5 18 20 6.5"/></svg>';

  /* navigator.clipboard needs a secure context; fall back for anything else. */
  function copyText(text, done){
    if (navigator.clipboard && window.isSecureContext) {
      navigator.clipboard.writeText(text).then(function(){ done(true); },
                                              function(){ done(legacyCopy(text)); });
      return;
    }
    done(legacyCopy(text));
  }
  function legacyCopy(text){
    var ta = document.createElement("textarea");
    ta.value = text;
    ta.setAttribute("readonly", "");
    ta.style.cssText = "position:fixed;top:0;left:-9999px;opacity:0";
    document.body.appendChild(ta);
    ta.select();
    var ok = false;
    try { ok = document.execCommand("copy"); } catch (e) { ok = false; }
    document.body.removeChild(ta);
    return ok;
  }

  /* Reveal the address on click rather than shipping it in the markup.
     Plain text once shown -- selectable, but nothing for a harvester to follow. */
  /* The nav mark shows the address and puts it on the clipboard in one move,
     so nobody has to open a mail client to read it. */
  var navmail = document.getElementById("navmail"),
      mailpop = document.getElementById("mailpop"),
      mailpopa = document.getElementById("mailpopa"),
      mailpopn = document.getElementById("mailpopn"),
      mailpopTimer = null, mailpopHide = null;
  if (navmail && mailpop) {
    navmail.addEventListener("click", function(){
      var addr = navmail.dataset.u + String.fromCharCode(64) + navmail.dataset.d;
      clearTimeout(mailpopTimer); clearTimeout(mailpopHide);
      mailpopa.textContent = addr;
      mailpopn.textContent = "Copying\u2026";
      mailpop.classList.remove("copied");
      mailpop.hidden = false;
      var reveal = function(){ mailpop.classList.add("on"); };
      requestAnimationFrame(reveal);
      setTimeout(reveal, 60);
      copyText(addr, function(ok){
        mailpopn.textContent = ok ? "Copied" : "Select to copy";
        if (ok) mailpop.classList.add("copied");
      });
      mailpopTimer = setTimeout(function(){
        mailpop.classList.remove("on");
        mailpopHide = setTimeout(function(){ mailpop.hidden = true; }, reduce ? 0 : 280);
      }, 4200);
    });
    document.addEventListener("click", function(e){
      if (mailpop.hidden) return;
      if (e.target === navmail || navmail.contains(e.target) || mailpop.contains(e.target)) return;
      clearTimeout(mailpopTimer);
      mailpop.classList.remove("on");
      mailpopHide = setTimeout(function(){ mailpop.hidden = true; }, reduce ? 0 : 280);
    });
  }

  var mrv = document.getElementById("mailrv");
  if (mrv) {
    mrv.addEventListener("click", function(){
      var addr = mrv.dataset.u + String.fromCharCode(64) + mrv.dataset.d;
      var s = document.createElement("span");
      s.className = "chip chip-mail";
      s.appendChild(document.createTextNode(addr));

      var note = document.createElement("span");
      note.className = "copy-t";
      note.textContent = "Copied";

      var cp = document.createElement("button");
      cp.type = "button";
      cp.className = "copy";
      cp.setAttribute("aria-label", "Copy email address");
      cp.innerHTML = ICON_COPY;
      cp.addEventListener("click", function(){
        copyText(addr, function(ok){
          if (!ok) return;
          cp.innerHTML = ICON_DONE;
          cp.classList.add("done");
          note.classList.add("show");
          setTimeout(function(){
            cp.innerHTML = ICON_COPY;
            cp.classList.remove("done");
            note.classList.remove("show");
          }, 1800);
        });
      });

      /* putting the original button back rather than rebuilding it keeps its
         click handler intact, so the chip can be reopened any number of times */
      var xb = document.createElement("button");
      xb.type = "button";
      xb.className = "chip-x";
      xb.setAttribute("aria-label", "Hide email address");
      xb.innerHTML = ICON_X;
      xb.addEventListener("click", function(){
        s.replaceWith(mrv);
        mrv.focus();
      });

      s.appendChild(note);
      s.appendChild(xb);
      s.appendChild(cp);
      mrv.replaceWith(s);
    });
  }

  /* Clicking the portrait flares both lenses and twinkles the right eye. The
     class is stripped and re-added across a reflow so a second click replays
     the animation instead of being ignored. */
  (function(){
    var fig = document.querySelector(".portrait");
    if (!fig || reduce) return;
    var clear;
    function flare(){
      /* No in-flight guard: a click mid-flare restarts it, which is what the
         counter tiles do too. The timer is a backstop so the class never
         sticks if the end event is missed. */
      clearTimeout(clear);
      fig.classList.remove("flare");
      void fig.offsetWidth;
      fig.classList.add("flare");
      clear = setTimeout(function(){ fig.classList.remove("flare"); }, 1400);
    }
    fig.addEventListener("click", flare);
    fig.addEventListener("keydown", function(e){
      if (e.key === "Enter" || e.key === " ") { e.preventDefault(); flare(); }
    });
    fig.addEventListener("animationend", function(e){
      if (e.target !== fig.querySelector(".twinkle")) return;
      clearTimeout(clear);
      fig.classList.remove("flare");
    });
  })();

  /* A nav link travels to its section and toggles it: closed opens, open closes.
     Clicking the section head does the work, so the blink, the silver close beat
     and the reveal all behave exactly as they do on the bar itself. The scroll
     waits out that transition so it lands on the settled layout rather than
     chasing a deck that is still expanding or collapsing. */
  document.querySelectorAll('.nav a[href^="#"]').forEach(function(a){
    a.addEventListener("click", function(e){
      var t = document.querySelector(a.getAttribute("href"));
      if (!t) return; e.preventDefault();
      var head = t.querySelector(".sechead");
      if (head) head.click();
      setTimeout(function(){
        t.scrollIntoView({behavior: reduce ? "auto" : "smooth", block:"start"});
      }, head && !reduce ? 340 : 0);
    });
  });
})();
</script>
