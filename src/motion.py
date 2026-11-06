# -*- coding: utf-8 -*-
"""Explainer-style animated flows for sections 02 and 03.

Each tile plays a short three-scene loop rather than a single state:

  A  a kinetic headline builds, the second line uncovered by a sweeping block
  B  a visual specific to that topic draws itself -- bars growing, a checklist
     ticking, documents fanning, sources merging, a split dividing
  C  the four-stage flow completes, a token running the rail stage to stage

These are inline SVG, so this is real CSS animation: sharp at any size, a few
KB each, and the words stay selectable text rather than pixels.
"""
W, H   = 320, 200
CYCLE  = 10.5
FONT   = "'Archivo','IBM Plex Sans',system-ui,sans-serif"
MONO   = "'IBM Plex Mono',ui-monospace,monospace"

# scene windows as percentages of the cycle
A0, A1 = 2, 30          # headline
B0, B1 = 32, 66         # topic visual
C0, C1 = 68, 97         # stage flow

def _kf(name, body):      return "@keyframes %s{%s}" % (name, body)
def _fade(u, tag, a, b):
    """A scene holds, then clears, so only one thing is on screen at a time."""
    return (f"#d{u} .{tag}{{opacity:0;animation:{tag}{u} {CYCLE}s linear infinite}}"
            + _kf(f"{tag}{u}", f"0%,{a-2}%{{opacity:0}}{a}%,{b-3}%{{opacity:1}}{b}%,100%{{opacity:0}}"))

def _base(u, accent):
    return "".join([
      f"#d{u} text{{font-family:{FONT};fill:#DCEAF8}}",
      f"#d{u} .kin{{font-weight:800;letter-spacing:-.015em}}",
      f"#d{u} .lbl{{font-family:{MONO};font-size:5.4px;letter-spacing:.13em;fill:#CFE4F7}}",
      f"#d{u} .cap{{font-family:{MONO};font-size:5px;letter-spacing:.17em;fill:#7FA6C8}}",
      f"#d{u} .big{{font-weight:800;font-size:26px;fill:#F2F8FF}}",
      f"#d{u} g,#d{u} rect,#d{u} path{{transform-box:fill-box;transform-origin:center}}",
      # slow drift across the whole frame gives it a camera
      f"#d{u} .stage{{animation:drift{u} {CYCLE}s ease-in-out infinite}}",
      _kf(f"drift{u}", "0%{transform:scale(1.015) translateY(1px)}"
                       "50%{transform:scale(1.0) translateY(0)}"
                       "100%{transform:scale(1.015) translateY(1px)}"),
      _fade(u,'sA',A0,A1), _fade(u,'sB',B0,B1), _fade(u,'sC',C0,C1),
      # headline reveal
      f"#d{u} .swipe{{transform-origin:left center;animation:sw{u} {CYCLE}s cubic-bezier(.2,.75,.2,1) infinite}}",
      _kf(f"sw{u}", f"0%,{A0+3}%{{transform:scaleX(0)}}{A0+11}%,{A1-4}%{{transform:scaleX(1)}}{A1}%,100%{{transform:scaleX(0)}}"),
      f"#d{u} .kup{{animation:kup{u} {CYCLE}s cubic-bezier(.2,.8,.2,1) infinite}}",
      _kf(f"kup{u}", f"0%,{A0}%{{transform:translateY(7px)}}{A0+8}%,100%{{transform:translateY(0)}}"),
      # rail token
      f"#d{u} .tok{{animation:tok{u} {CYCLE}s cubic-bezier(.5,0,.2,1) infinite;opacity:0}}",
      _kf(f"tok{u}", f"0%,{C0+2}%{{opacity:0;transform:translateX(0)}}"
                     f"{C0+6}%{{opacity:1}}{C1-6}%{{opacity:1;transform:translateX(var(--run))}}"
                     f"{C1-2}%,100%{{opacity:0;transform:translateX(var(--run))}}"),
      f"#d{u} .wire{{stroke:rgba(150,200,240,.26);stroke-width:1.1;fill:none}}",
      f"#d{u} .live{{stroke:{accent};stroke-width:1.5;fill:none;stroke-linecap:round;"
      f"stroke-dasharray:var(--len) var(--len);stroke-dashoffset:var(--len);"
      f"animation:lv{u} {CYCLE}s cubic-bezier(.5,0,.2,1) infinite}}",
      _kf(f"lv{u}", f"0%,{C0+4}%{{stroke-dashoffset:var(--len)}}{C1-6}%,{C1}%{{stroke-dashoffset:0}}"
                    f"{C1+1}%,100%{{stroke-dashoffset:var(--len)}}"),
    ])

def _chips(u, accent, stages):
    """The four-stage rail that closes every loop."""
    pad, gap = 18, 8
    n  = len(stages)
    cw = (W - pad*2 - gap*(n-1)) / n
    cy, ch = 128, 34
    mid = cy + ch/2
    css, body = [], []
    x0, x1 = pad + cw/2, pad + (n-1)*(cw+gap) + cw/2
    body.append(f'<line class="wire" x1="{x0}" y1="{mid}" x2="{x1}" y2="{mid}"/>')
    body.append(f'<line class="live" x1="{x0}" y1="{mid}" x2="{x1}" y2="{mid}" style="--len:{x1-x0:.0f}"/>')
    for i, t in enumerate(stages):
        x = pad + i*(cw+gap)
        d = C0 + 3 + i*((C1-C0-10)/n)
        css.append(f"#d{u} .c{i}{{opacity:.3;animation:c{u}{i} {CYCLE}s ease-out infinite}}")
        css.append(_kf(f"c{u}{i}", f"0%,{d}%{{opacity:.3}}{d+3}%,{C1-1}%{{opacity:1}}{C1}%,100%{{opacity:.3}}"))
        body.append(
          f'<g class="c{i}">'
          f'<rect x="{x}" y="{cy}" width="{cw}" height="{ch}" rx="4" fill="rgba(190,225,255,.08)" '
          f'stroke="{accent}" stroke-opacity=".5" stroke-width=".9"/>'
          f'<text x="{x+cw/2}" y="{cy+ch/2+2}" text-anchor="middle" class="lbl">{t}</text></g>')
    body.append(f'<circle class="tok" cx="{x0}" cy="{mid}" r="3.2" fill="{accent}" '
                f'style="--run:{x1-x0:.0f}px"/>')
    return "".join(css), "".join(body)

# ---- topic visuals (scene B) ---------------------------------------------
# Drawn large and centred: these carry the tile, so they fill the frame rather
# than floating in it. Geometry is tuned to the 320x200 panel with the caption
# on line 34 and the artwork sitting between y=44 and y=176.

def _bars(u, accent, vals, labels):
    """A chart building itself, with gridlines and a called-out peak."""
    css = [f"#d{u} .bar{{transform-origin:bottom;animation:bar{u} {CYCLE}s cubic-bezier(.2,.85,.25,1) infinite}}",
           _kf(f"bar{u}", f"0%,{B0+3}%{{transform:scaleY(0)}}{B0+18}%,{B1}%{{transform:scaleY(1)}}"
                          f"{B1+1}%,100%{{transform:scaleY(0)}}")]
    b, base, bw, left = [], 162, 30, 40
    top = base - max(vals) - 16
    for gy in range(4):
        y = base - gy*((base-top)/4)
        b.append(f'<line x1="{left-6}" y1="{y:.0f}" x2="286" y2="{y:.0f}" '
                 f'stroke="rgba(150,200,240,.13)" stroke-width=".7"/>')
    for i,(v,l) in enumerate(zip(vals,labels)):
        x = left + i*48
        css.append(f"#d{u} .bar{i}{{animation-delay:{i*0.18:.2f}s}}")
        b.append(f'<rect class="bar bar{i}" x="{x}" y="{base-v}" width="{bw}" height="{v}" rx="3" '
                 f'fill="{accent}" opacity=".92"/>')
        b.append(f'<text x="{x+bw/2}" y="{base+13}" text-anchor="middle" class="cap" font-size="6">{l}</text>')
    pk = vals.index(max(vals)); px = left + pk*48 + bw/2
    b.append(f'<line x1="{left-6}" y1="{base}" x2="286" y2="{base}" stroke="rgba(170,210,245,.45)" stroke-width="1.1"/>')
    b.append(f'<g class="bar bar{pk}"><rect x="{px-20}" y="{base-max(vals)-19}" width="40" height="14" rx="7" fill="{accent}"/>'
             f'<text x="{px}" y="{base-max(vals)-9}" text-anchor="middle" class="cap" font-size="6" fill="#07141F">PEAK</text></g>')
    return "".join(css), "".join(b)

def _checks(u, accent, items):
    """A checklist completing, with a progress bar that fills alongside it."""
    css, b = [], []
    for i,t in enumerate(items):
        y = 64 + i*27
        d = B0 + 4 + i*6
        css.append(f"#d{u} .ck{i}{{opacity:0;animation:ck{u}{i} {CYCLE}s cubic-bezier(.2,.8,.3,1) infinite}}")
        css.append(_kf(f"ck{u}{i}", f"0%,{d}%{{opacity:0;transform:translateX(-9px)}}"
                                    f"{d+4}%,{B1}%{{opacity:1;transform:none}}{B1+1}%,100%{{opacity:0}}"))
        b.append(f'<g class="ck{i}">'
                 f'<rect x="34" y="{y-13}" width="252" height="22" rx="4" fill="rgba(190,225,255,.06)" '
                 f'stroke="rgba(170,210,245,.22)" stroke-width=".7"/>'
                 f'<rect x="41" y="{y-9}" width="14" height="14" rx="3.5" fill="{accent}"/>'
                 f'<path d="M44.5 {y-2.2} l3 3 l5.2 -5.8" stroke="#07141F" stroke-width="1.9" fill="none" '
                 f'stroke-linecap="round" stroke-linejoin="round"/>'
                 f'<text x="64" y="{y+1.5}" class="lbl" font-size="7.4">{t}</text></g>')
    css.append(f"#d{u} .pg{{transform-origin:left center;animation:pg{u} {CYCLE}s cubic-bezier(.3,.7,.3,1) infinite}}")
    css.append(_kf(f"pg{u}", f"0%,{B0+3}%{{transform:scaleX(0)}}{B0+26}%,{B1}%{{transform:scaleX(1)}}"
                             f"{B1+1}%,100%{{transform:scaleX(0)}}"))
    b.append(f'<rect x="34" y="172" width="252" height="4" rx="2" fill="rgba(170,210,245,.16)"/>')
    b.append(f'<rect class="pg" x="34" y="172" width="252" height="4" rx="2" fill="{accent}"/>')
    return "".join(css), "".join(b)

def _merge(u, accent, srcs):
    """Three systems of record collapsing into a single report sheet."""
    css, b = [], []
    for i,s in enumerate(srcs):
        y = 58 + i*38
        d = B0 + 3 + i*5
        css.append(f"#d{u} .sr{i}{{opacity:0;animation:sr{u}{i} {CYCLE}s cubic-bezier(.3,.7,.3,1) infinite}}")
        css.append(_kf(f"sr{u}{i}", f"0%,{d}%{{opacity:0;transform:translateX(-14px)}}"
                                    f"{d+5}%,{B1-13}%{{opacity:1;transform:none}}"
                                    f"{B1-6}%{{opacity:.15;transform:translate(104px,{(96-y):.0f}px) scale(.55)}}"
                                    f"{B1}%,100%{{opacity:0;transform:translate(104px,{(96-y):.0f}px) scale(.55)}}"))
        b.append(f'<g class="sr{i}"><rect x="28" y="{y-14}" width="96" height="30" rx="5" '
                 f'fill="rgba(190,225,255,.09)" stroke="{accent}" stroke-opacity=".45" stroke-width="1"/>'
                 f'<rect x="36" y="{y-7}" width="13" height="13" rx="3" fill="{accent}" opacity=".8"/>'
                 f'<text x="58" y="{y+2}" class="lbl" font-size="6.6">{s}</text></g>')
        b.append(f'<path d="M126 {y} q22 {(96-y)*0.5:.0f} 44 {(96-y):.0f}" stroke="rgba(150,200,240,.28)" '
                 f'stroke-width="1" fill="none" stroke-dasharray="3 4"/>')
    css.append(f"#d{u} .sheet{{opacity:0;animation:sh{u} {CYCLE}s cubic-bezier(.2,.8,.3,1) infinite}}")
    css.append(_kf(f"sh{u}", f"0%,{B1-12}%{{opacity:0;transform:scale(.86)}}"
                             f"{B1-6}%,{B1}%{{opacity:1;transform:none}}{B1+1}%,100%{{opacity:0}}"))
    b.append(f'<g class="sheet"><rect x="180" y="56" width="104" height="80" rx="6" fill="{accent}" opacity=".14" '
             f'stroke="{accent}" stroke-width="1.2"/>'
             f'<rect x="192" y="66" width="52" height="5" rx="2.5" fill="{accent}" opacity=".95"/>'
             + "".join(f'<rect x="192" y="{80+k*11}" width="{80-k*13}" height="4.4" rx="2.2" fill="{accent}" opacity=".6"/>' for k in range(4))
             + f'<text x="232" y="150" text-anchor="middle" class="cap" font-size="6" fill="{accent}">ONE REPORT</text></g>')
    return "".join(css), "".join(b)

def _split(u, accent, parts):
    """One bar dividing into participant shares, each named and numbered."""
    css, b = [], []
    x, total = 30, sum(v for _,v in parts)
    for i,(name,v) in enumerate(parts):
        wseg = 260 * v/total
        d = B0 + 4 + i*7
        css.append(f"#d{u} .sp{i}{{transform-origin:left center;transform:scaleX(0);"
                   f"animation:sp{u}{i} {CYCLE}s cubic-bezier(.2,.85,.25,1) infinite}}")
        css.append(_kf(f"sp{u}{i}", f"0%,{d}%{{transform:scaleX(0)}}{d+7}%,{B1}%{{transform:scaleX(1)}}"
                                    f"{B1+1}%,100%{{transform:scaleX(0)}}"))
        op = .95 - i*0.26
        b.append(f'<rect class="sp{i}" x="{x}" y="74" width="{wseg-3}" height="38" rx="5" fill="{accent}" opacity="{op:.2f}"/>')
        b.append(f'<text x="{x+wseg/2-1.5}" y="{98}" text-anchor="middle" class="kin" font-size="13" fill="#07141F">{v}%</text>')
        b.append(f'<text x="{x+wseg/2-1.5}" y="{128}" text-anchor="middle" class="cap" font-size="6">{name}</text>')
        x += wseg
    b.append(f'<line x1="30" y1="62" x2="290" y2="62" stroke="rgba(170,210,245,.3)" stroke-width="1"/>')
    b.append(f'<text x="30" y="56" class="cap" font-size="5.4">RIGHTS RECORD</text>')
    b.append(f'<text x="290" y="56" text-anchor="end" class="cap" font-size="5.4">100%</text>')
    return "".join(css), "".join(b)

def _fan(u, accent, docs):
    """Agreement types fanning across the frame, each a legible document."""
    css, b = [], []
    for i,t in enumerate(docs):
        d = B0 + 3 + i*5
        rot = -14 + i*9
        x = 36 + i*64
        css.append(f"#d{u} .fn{i}{{opacity:0;animation:fn{u}{i} {CYCLE}s cubic-bezier(.2,.85,.3,1) infinite}}")
        css.append(_kf(f"fn{u}{i}", f"0%,{d}%{{opacity:0;transform:translateY(24px) rotate(0deg) scale(.9)}}"
                                    f"{d+6}%,{B1}%{{opacity:1;transform:rotate({rot}deg)}}"
                                    f"{B1+1}%,100%{{opacity:0}}"))
        b.append(f'<g class="fn{i}"><rect x="{x}" y="56" width="56" height="76" rx="5" '
                 f'fill="#0C1E31" stroke="{accent}" stroke-opacity=".55" stroke-width="1.1"/>'
                 f'<rect x="{x+8}" y="64" width="26" height="5" rx="2.5" fill="{accent}" opacity=".95"/>'
                 + "".join(f'<rect x="{x+8}" y="{78+k*9}" width="{40-k*7}" height="3.4" rx="1.7" '
                           f'fill="{accent}" opacity=".45"/>' for k in range(4))
                 + f'<text x="{x+28}" y="{126}" text-anchor="middle" class="cap" font-size="5">{t}</text></g>')
    return "".join(css), "".join(b)

def _calendar(u, accent, quarters):
    """A year of dates with the quarter-end obligations lighting up."""
    css, b = [], []
    b.append(f'<rect x="30" y="50" width="260" height="92" rx="6" fill="rgba(190,225,255,.05)" '
             f'stroke="rgba(170,210,245,.22)" stroke-width=".8"/>')
    for c in range(12):
        for r in range(4):
            cx, cy = 42 + c*21, 68 + r*18
            on = (c % 3 == 2 and r == 3)
            if on: continue
            b.append(f'<circle cx="{cx}" cy="{cy}" r="3.1" fill="rgba(170,210,245,.17)"/>')
    for i,q in enumerate(quarters):
        d = B0 + 3 + i*7
        cx = 42 + (i*3+2)*21
        css.append(f"#d{u} .q{i}{{opacity:0;animation:q{u}{i} {CYCLE}s cubic-bezier(.2,.85,.3,1) infinite}}")
        css.append(_kf(f"q{u}{i}", f"0%,{d}%{{opacity:0;transform:scale(.4)}}"
                                   f"{d+4}%,{B1}%{{opacity:1;transform:none}}{B1+1}%,100%{{opacity:0}}"))
        b.append(f'<g class="q{i}"><circle cx="{cx}" cy="{68+3*18}" r="7.5" fill="{accent}"/>'
                 f'<text x="{cx}" y="{68+3*18+2.6}" text-anchor="middle" class="cap" font-size="5.4" '
                 f'fill="#07141F">{q}</text></g>')
    css.append(f"#d{u} .loop{{opacity:0;animation:lp{u} {CYCLE}s ease-out infinite}}")
    css.append(_kf(f"lp{u}", f"0%,{B1-10}%{{opacity:0}}{B1-5}%,{B1}%{{opacity:1}}{B1+1}%,100%{{opacity:0}}"))
    b.append(f'<path class="loop" d="M44 152 q116 26 232 0" stroke="{accent}" stroke-width="1.5" fill="none" stroke-dasharray="4 5"/>')
    b.append(f'<path class="loop" d="M270 148 l10 4 l-9 5" stroke="{accent}" stroke-width="1.5" fill="none" stroke-linecap="round"/>')
    b.append(f'<text class="loop" x="160" y="174" text-anchor="middle" class="cap" font-size="5.6">REPEATS EVERY QUARTER</text>')
    return "".join(css), "".join(b)

def _schema(u, accent, rows):
    """A table assembling itself field by field, then switching to live."""
    css, b = [], []
    b.append(f'<rect x="30" y="48" width="260" height="22" rx="4" fill="{accent}" opacity=".2"/>')
    b.append(f'<text x="40" y="62.5" class="lbl" font-size="6.6" fill="{accent}">RIGHTS RECORD</text>')
    for i,r in enumerate(rows):
        d = B0 + 3 + i*5
        y = 74 + i*19
        css.append(f"#d{u} .rw{i}{{opacity:0;animation:rw{u}{i} {CYCLE}s cubic-bezier(.2,.85,.3,1) infinite}}")
        css.append(_kf(f"rw{u}{i}", f"0%,{d}%{{opacity:0;transform:translateX(16px)}}"
                                    f"{d+4}%,{B1}%{{opacity:1;transform:none}}{B1+1}%,100%{{opacity:0}}"))
        b.append(f'<g class="rw{i}"><rect x="30" y="{y}" width="260" height="16" rx="3.5" '
                 f'fill="rgba(190,225,255,.07)" stroke="rgba(170,210,245,.2)" stroke-width=".7"/>'
                 f'<rect x="37" y="{y+5.5}" width="5" height="5" rx="1.4" fill="{accent}"/>'
                 f'<text x="50" y="{y+11}" class="lbl" font-size="6.4">{r}</text>'
                 f'<rect x="212" y="{y+5}" width="{64-i*7}" height="6" rx="3" fill="{accent}" opacity=".3"/></g>')
    css.append(f"#d{u} .lvp{{opacity:0;animation:lvp{u} {CYCLE}s cubic-bezier(.2,.8,.3,1) infinite}}")
    css.append(_kf(f"lvp{u}", f"0%,{B1-9}%{{opacity:0;transform:scale(.7)}}{B1-4}%,{B1}%{{opacity:1;transform:none}}"
                              f"{B1+1}%,100%{{opacity:0}}"))
    b.append(f'<g class="lvp"><rect x="236" y="48" width="48" height="22" rx="11" fill="{accent}"/>'
             f'<text x="260" y="62.5" text-anchor="middle" class="cap" font-size="6.4" fill="#07141F">LIVE</text></g>')
    return "".join(css), "".join(b)

def _route(u, accent, stations):
    """A document carried through four stations and stamped at the end."""
    css, b = [], []
    b.append(f'<line x1="40" y1="96" x2="284" y2="96" stroke="rgba(150,200,240,.22)" stroke-width="1.2" stroke-dasharray="4 5"/>')
    for i,s in enumerate(stations):
        x = 46 + i*78
        d = B0 + 3 + i*7
        css.append(f"#d{u} .st{i}{{opacity:.28;animation:st{u}{i} {CYCLE}s cubic-bezier(.2,.8,.3,1) infinite}}")
        css.append(_kf(f"st{u}{i}", f"0%,{d}%{{opacity:.28;transform:scale(.9)}}"
                                    f"{d+4}%,{B1}%{{opacity:1;transform:none}}{B1+1}%,100%{{opacity:.28}}"))
        b.append(f'<g class="st{i}"><circle cx="{x}" cy="96" r="15" fill="{accent}" opacity=".16" '
                 f'stroke="{accent}" stroke-width="1.3"/>'
                 f'<circle cx="{x}" cy="96" r="4.4" fill="{accent}"/>'
                 f'<text x="{x}" y="128" text-anchor="middle" class="cap" font-size="6">{s}</text></g>')
    css.append(f"#d{u} .doc{{opacity:0;animation:doc{u} {CYCLE}s cubic-bezier(.45,0,.25,1) infinite}}")
    css.append(_kf(f"doc{u}", f"0%,{B0+2}%{{opacity:0;transform:translateX(0)}}"
                              f"{B0+6}%{{opacity:1;transform:translateX(0)}}"
                              f"{B1-7}%{{opacity:1;transform:translateX(234px)}}"
                              f"{B1}%,100%{{opacity:0;transform:translateX(234px)}}"))
    b.append(f'<g class="doc"><rect x="36" y="56" width="22" height="28" rx="3" fill="#F2F8FF" opacity=".95"/>'
             + "".join(f'<rect x="41" y="{62+k*6}" width="12" height="2.4" rx="1.2" fill="#1A3A5C"/>' for k in range(3))
             + '</g>')
    css.append(f"#d{u} .stamp{{opacity:0;animation:stm{u} {CYCLE}s cubic-bezier(.2,.9,.3,1) infinite}}")
    css.append(_kf(f"stm{u}", f"0%,{B1-8}%{{opacity:0;transform:scale(1.9) rotate(-18deg)}}"
                              f"{B1-4}%,{B1}%{{opacity:1;transform:rotate(-13deg)}}{B1+1}%,100%{{opacity:0}}"))
    b.append(f'<g class="stamp"><rect x="246" y="48" width="48" height="20" rx="4" fill="none" '
             f'stroke="{accent}" stroke-width="1.8"/>'
             f'<text x="270" y="61.5" text-anchor="middle" class="cap" font-size="6.4" fill="{accent}">FILED</text></g>')
    return "".join(css), "".join(b)

# ---- assembly -------------------------------------------------------------
def build(u, accent, label, k1, k2, stages, caption, payload):
    pcss, pbody = payload(u, accent)
    ccss, cbody = _chips(u, accent, stages)
    # Proportional type cannot be measured from Python, and guessing per-character
    # left the block narrower than the words. textLength pins the headline to an
    # exact width (lengthAdjust="spacing" alters tracking only, never glyph
    # shapes), so the block can match it instead of approximating it.
    k2w = min(max(len(k2) * 15.0, 62), 232)
    tw  = k2w + 20
    s  = (f'<svg id="d{u}" class="dg" viewBox="0 0 {W} {H}" preserveAspectRatio="none" '
          f'xmlns="http://www.w3.org/2000/svg" role="img" aria-label="{label}">')
    s += ('<defs>'
          f'<linearGradient id="bg{u}" x1="0" y1="0" x2=".35" y2="1">'
          f'<stop offset="0" stop-color="#0B1B2C"/><stop offset=".55" stop-color="#0F2639"/>'
          f'<stop offset="1" stop-color="#07131F"/></linearGradient>'
          f'<linearGradient id="sh{u}" x1="0" y1="0" x2="1" y2="1">'
          f'<stop offset="0" stop-color="#FFF" stop-opacity=".09"/>'
          f'<stop offset=".55" stop-color="#FFF" stop-opacity="0"/></linearGradient></defs>')
    s += "<style>" + _base(u, accent) + pcss + ccss + "</style>"
    s += f'<rect width="{W}" height="{H}" fill="url(#bg{u})"/>'
    for gx in range(0, W, 20):
        s += f'<line x1="{gx}" y1="0" x2="{gx}" y2="{H}" stroke="rgba(150,200,240,.04)" stroke-width=".5"/>'
    for gy in range(0, H, 20):
        s += f'<line x1="0" y1="{gy}" x2="{W}" y2="{gy}" stroke="rgba(150,200,240,.04)" stroke-width=".5"/>'
    s += '<g class="stage">'
    # scene A
    s += (f'<g class="sA"><g class="kup"><text x="20" y="78" class="kin big">{k1}</text></g>'
          f'<rect class="swipe" x="17" y="88" width="{tw}" height="30" rx="3" fill="{accent}"/>'
          f'<text x="27" y="110" class="kin big" fill="#07141F" textLength="{k2w:.0f}" '
          f'lengthAdjust="spacing">{k2}</text>'
          f'<text x="20" y="136" class="cap">{caption}</text></g>')
    # scene B
    s += f'<g class="sB"><text x="20" y="34" class="cap">{caption}</text>{pbody}</g>'
    # scene C
    s += f'<g class="sC"><text x="20" y="34" class="cap">{caption}</text>{cbody}</g>'
    s += '</g>'
    s += f'<rect width="{W}" height="{H}" fill="url(#sh{u})" opacity=".55"/>'
    s += '</svg>'
    return s

WBD, LGD, DBT, DTVA, TLV = '#5EE6D6', '#F7C760', '#7FC4FF', '#C4A6FF', '#58F0B0'

DIAGRAMS = {
 'deadlines': ('Dates set by contract, tracked and cleared every quarter', DBT,
   'EVERY', 'QUARTER', ['CONTRACT','CALENDAR','NOTICE','CLEARED'], 'RECURRING DEADLINES',
   lambda u,a: _calendar(u,a,['Q1','Q2','Q3','Q4'])),
 'platform':  ('Structure defined, records built, then loaded and live', WBD,
   'BUILD', 'THE SYSTEM', ['SCHEMA','RECORDS','LOAD','LIVE'], 'RIGHTS MANAGEMENT PLATFORM',
   lambda u,a: _schema(u,a,['Agreement','Participant','Territory','Term','Royalty'])),
 'sops':      ('A written procedure, a checklist, and sign-off before release', LGD,
   'WRITTEN', 'DOWN', ['PROCEDURE','CHECKLIST','SIGN-OFF','RELEASE'], 'WORKFLOW &amp; SOPS',
   lambda u,a: _checks(u,a,['Procedure written','Checklist run','Second review','Signed off'])),
 'agreements':('The document types that came across the desk', DTVA,
   'WHAT', 'CAME IN', ['TALENT','PRODUCTION','LICENSING','MUSIC'], 'AGREEMENT TYPES',
   lambda u,a: _fan(u,a,['TALENT','PROD','LICENSE','MUSIC'])),
 'analysis':  ('Data pulled, queried, modelled and shown', DBT,
   'EXTRACT', 'TO INSIGHT', ['EXTRACT','QUERY','MODEL','SHOW'], 'ANALYSIS &amp; MODELLING',
   lambda u,a: _bars(u,a,[26,44,34,58,48],['SQL','PY','XL','TAB','BI'])),
 'enterprise':('Systems of record consolidated into one report', WBD,
   'MANY', 'ONE REPORT', ['SAP','SALESFORCE','QUICKBASE','REPORT'], 'ENTERPRISE SYSTEMS',
   lambda u,a: _merge(u,a,['SAP','SALESFORCE','QUICKBASE'])),
 'rights':    ('Agreement abstracted to a rights record, then split', LGD,
   'AGREEMENT', 'TO SPLIT', ['AGREEMENT','ABSTRACT','RIGHTS','SPLIT'], 'CONTRACT &amp; RIGHTS',
   lambda u,a: _split(u,a,[('WRITER',40),('PUBLISHER',35),('LABEL',25)])),
 'workflow':  ('A document routed from ticket to review to signature to file', TLV,
   'TICKET', 'TO FILE', ['TICKET','REVIEW','SIGN','FILE'], 'WORKFLOW &amp; DOCUMENTS',
   lambda u,a: _route(u,a,['TICKET','REVIEW','SIGN','FILE'])),
}

def render_all(prefix='x'):
    return {k: build('%s%d'%(prefix,i), a, l, k1, k2, st, cap, pay)
            for i,(k,(l,a,k1,k2,st,cap,pay)) in enumerate(DIAGRAMS.items())}

if __name__ == '__main__':
    for k,v in render_all().items():
        print('%-12s %6d bytes' % (k, len(v)))
