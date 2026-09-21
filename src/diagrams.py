# -*- coding: utf-8 -*-
"""Inline SVG process diagrams for the Software & Tools deck.

Each one is drawn as a light application window sitting on a physical monitor:
graphite bezel, inset white panel, chin below. Inline rather than a data URI so
the animation is guaranteed and the whole set costs a few KB.

The deck's identity colours are pastels tuned for a dark panel, so each diagram
carries an explicit darker accent of the same hue that holds up on white.
"""

INK   = '#123A5E'
INK2  = 'rgba(18,58,94,.62)'
INK3  = 'rgba(18,58,94,.42)'
LINE  = 'rgba(18,58,94,.30)'
SOFT  = 'rgba(18,58,94,.12)'
CARD  = '#EFF5FB'

def HEAD(label, uid, title, accent):
    """Just the panel: the tile itself supplies the bezel and the chin."""
    return (
      '<svg class="dg" viewBox="0 0 320 200" preserveAspectRatio="none" '
      'xmlns="http://www.w3.org/2000/svg" role="img" aria-label="%s">'
      '<defs>'
      '<linearGradient id="sc%s" x1="0" y1="0" x2="0" y2="1">'
      '<stop offset="0" stop-color="#FFFFFF"/><stop offset="1" stop-color="#EBF2F9"/></linearGradient>'
      '<linearGradient id="gl%s" x1="0" y1="0" x2="1" y2="1">'
      '<stop offset="0" stop-color="#FFFFFF" stop-opacity=".9"/>'
      '<stop offset=".45" stop-color="#CBDFF2" stop-opacity=".12"/>'
      '<stop offset="1" stop-color="#9FC4E6" stop-opacity="0"/></linearGradient>'
      '</defs>'
      '<rect width="320" height="200" fill="url(#sc%s)"/>'
      '<rect width="320" height="21" fill="#E3EBF4"/>'
      '<line x1="0" y1="21" x2="320" y2="21" stroke="rgba(18,58,94,.22)" stroke-width="1"/>'
      '<circle cx="14" cy="10.5" r="2.6" fill="#E2685B"/><circle cx="24" cy="10.5" r="2.6" fill="#DDA53C"/>'
      '<circle cx="34" cy="10.5" r="2.6" fill="#4FB37C"/>'
      '<text x="48" y="14" font-family="monospace" font-size="8" letter-spacing="1.4" '
      'fill="rgba(18,58,94,.74)">%s</text>'
      '<svg x="0" y="21" width="320" height="179" viewBox="18 32 286 132" '
      'preserveAspectRatio="xMidYMid meet">'
      ) % (label, uid, uid, uid, title)

def FOOT(uid):
    return ('</svg>'
            '<path d="M0 200 L96 0 L140 0 L34 200 Z" fill="url(#gl%s)" opacity=".42"/>'
            '</svg>') % uid

def _cell(x, y, w, h, fill, op=1.0, rx=2):
    return ('<rect x="%s" y="%s" width="%s" height="%s" rx="%s" fill="%s" opacity="%s"/>'
            % (x, y, w, h, rx, fill, op))

DOT = ('<circle r="3" fill="%s">'
       '<animateMotion dur="%ss" begin="%ss" repeatCount="indefinite" path="%s"/>'
       '<animate attributeName="opacity" values="0;1;1;0" dur="%ss" begin="%ss" '
       'repeatCount="indefinite"/></circle>')

# ---------------------------------------------------------------- 1. analysis
def analysis():
    A = '#0D6F66'
    s = HEAD('Data pulled, queried, modelled and visualised', 'A',
             'EXTRACT &#8594; QUERY &#8594; MODEL &#8594; SHOW', A)
    for r in range(5):
        for c in range(4):
            lit = (r + c) % 3 == 0
            s += _cell(24 + c*15, 46 + r*14, 12, 10, A if lit else SOFT, .9 if lit else 1)
    s += '<text x="24" y="134" font-family="monospace" font-size="7.6" fill="%s">SOURCE ROWS</text>' % INK3
    s += ('<path d="M100 54 L144 54 L126 90 L126 116 L118 122 L118 90 Z" fill="none" '
          'stroke="%s" stroke-width="1.6"/>') % LINE
    s += '<text x="102" y="134" font-family="monospace" font-size="7.6" fill="%s">FILTER</text>' % INK3
    path = 'M88 88 C108 88 112 94 122 102 C136 110 150 106 172 98'
    s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (path, LINE)
    for i in range(3):
        s += DOT % (A, 3.4, i*1.13, path, 3.4, i*1.13)
    for i, h in [(0, 30), (1, 46), (2, 38), (3, 62), (4, 78)]:
        x = 188 + i*23
        s += ('<rect x="%d" y="%d" width="14" height="%d" rx="2.5" fill="%s" opacity=".88">'
              '<animate attributeName="height" values="4;%d;%d" dur="4.6s" begin="%ss" '
              'repeatCount="indefinite" calcMode="spline" keyTimes="0;.45;1" keySplines=".3 0 .2 1;0 0 1 1"/>'
              '<animate attributeName="y" values="%d;%d;%d" dur="4.6s" begin="%ss" '
              'repeatCount="indefinite" calcMode="spline" keyTimes="0;.45;1" keySplines=".3 0 .2 1;0 0 1 1"/>'
              '</rect>') % (x, 122-h, h, A, h, h, i*0.16, 118, 122-h, 122-h, i*0.16)
    s += '<line x1="184" y1="124" x2="300" y2="124" stroke="%s" stroke-width="1.2"/>' % LINE
    s += ('<polyline points="195,94 218,80 241,86 264,64 287,48" fill="none" stroke="%s" '
          'stroke-width="1.8" stroke-linecap="round" stroke-dasharray="150" stroke-dashoffset="150">'
          '<animate attributeName="stroke-dashoffset" values="150;0;0" dur="4.6s" '
          'keyTimes="0;.55;1" repeatCount="indefinite"/></polyline>') % INK
    s += '<text x="188" y="138" font-family="monospace" font-size="7.6" fill="%s">DASHBOARD</text>' % INK3
    return s + FOOT('A')

# -------------------------------------------------------------- 2. enterprise
def enterprise():
    A = '#1B5C9E'
    s = HEAD('Systems of record consolidated into one report', 'B',
             'SYSTEMS OF RECORD &#8594; ONE REPORT', A)
    for y in (54, 92, 130):
        s += ('<ellipse cx="52" cy="%d" rx="26" ry="7" fill="%s" opacity=".85"/>'
              '<rect x="26" y="%d" width="52" height="19" fill="%s" opacity=".42"/>'
              '<ellipse cx="52" cy="%d" rx="26" ry="7" fill="%s" opacity=".62"/>') % (
              y-9, A, y-9, A, y+10, A)
    s += '<text x="26" y="160" font-family="monospace" font-size="7.6" fill="%s">FOUR PLATFORMS</text>' % INK3
    for i, p in enumerate(['M80 54 C124 54 132 82 160 96',
                           'M80 92 C118 92 130 94 160 96',
                           'M80 130 C124 130 132 110 160 96']):
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p, LINE)
        s += DOT % (A, 3.0, i*0.55, p, 3.0, i*0.55)
    s += ('<circle cx="166" cy="96" r="12" fill="none" stroke="%s" stroke-width="1.6"/>'
          '<circle cx="166" cy="96" r="4.6" fill="%s">'
          '<animate attributeName="r" values="3.6;6;3.6" dur="3.2s" repeatCount="indefinite"/></circle>'
          '<circle cx="166" cy="96" r="12" fill="none" stroke="%s" stroke-width="1.3">'
          '<animate attributeName="r" values="12;24" dur="3.2s" repeatCount="indefinite"/>'
          '<animate attributeName="opacity" values=".5;0" dur="3.2s" repeatCount="indefinite"/></circle>'
          ) % (INK, A, A)
    s += '<rect x="214" y="46" width="78" height="96" rx="4" fill="%s" stroke="%s" stroke-width="1.1"/>' % (CARD, LINE)
    for i in range(7):
        w = [52, 42, 58, 36, 54, 28, 46][i]
        s += _cell(226, 62 + i*11, w, 3.2, INK, .30 if i else .55, 1.6)
    s += ('<rect x="226" y="62" width="52" height="3.2" rx="1.6" fill="%s">'
          '<animate attributeName="width" values="6;52" dur="3.2s" repeatCount="indefinite"/></rect>') % A
    s += '<text x="214" y="158" font-family="monospace" font-size="7.6" fill="%s">QUARTERLY PACKAGE</text>' % INK3
    return s + FOOT('B')

# ------------------------------------------------------------------ 3. rights
def rights():
    A = '#9A6B12'
    s = HEAD('Agreement abstracted to a rights record, then split to participants', 'C',
             'AGREEMENT &#8594; RIGHTS &#8594; SPLIT', A)
    s += '<rect x="24" y="46" width="60" height="80" rx="4" fill="%s" stroke="%s" stroke-width="1.1"/>' % (CARD, LINE)
    for i in range(6):
        s += _cell(33, 57 + i*11, [40, 32, 42, 26, 38, 20][i], 3, INK, .38, 1.5)
    s += ('<circle cx="68" cy="114" r="8.5" fill="none" stroke="%s" stroke-width="2"/>'
          '<circle cx="68" cy="114" r="3.2" fill="%s"/>') % (A, A)
    s += '<text x="24" y="142" font-family="monospace" font-size="7.6" fill="%s">SIGNED DEAL</text>' % INK3
    s += '<rect x="114" y="50" width="74" height="70" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.3"/>' % LINE
    for i in range(4):
        y = 62 + i*15
        s += _cell(124, y, 38, 3.2, INK, .34, 1.6)
        s += ('<rect x="168" y="%s" width="12" height="3.2" rx="1.6" fill="%s">'
              '<animate attributeName="opacity" values=".2;1;.2" dur="3.6s" begin="%ss" '
              'repeatCount="indefinite"/></rect>') % (y, A, i*0.4)
    s += '<text x="114" y="136" font-family="monospace" font-size="7.6" fill="%s">ABSTRACT</text>' % INK3
    p1 = 'M86 86 L112 86'
    s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p1, LINE)
    s += DOT % (A, 2.6, 0, p1, 2.6, 0)
    for i, p in enumerate(['M190 86 C214 86 218 58 242 58', 'M190 86 L242 86',
                           'M190 86 C214 86 218 114 242 114']):
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p, LINE)
        s += DOT % (A, 3.0, 0.9 + i*0.45, p, 3.0, 0.9 + i*0.45)
    for cy, pct in [(58, '50%'), (86, '30%'), (114, '20%')]:
        s += ('<circle cx="256" cy="%d" r="11" fill="#FFFFFF" stroke="%s" stroke-width="1.7"/>'
              '<text x="256" y="%d" text-anchor="middle" font-family="monospace" font-size="8" '
              'font-weight="700" fill="%s">%s</text>') % (cy, A, cy+3, INK, pct)
    s += '<text x="228" y="142" font-family="monospace" font-size="7.6" fill="%s">PARTICIPANTS</text>' % INK3
    return s + FOOT('C')

# ---------------------------------------------------------------- 4. workflow
def workflow():
    A = '#5F44A8'
    s = HEAD('A document routed from ticket to review to signature to file', 'D',
             'TICKET &#8594; REVIEW &#8594; SIGN &#8594; FILE', A)
    xs = [50, 120, 190, 260]
    s += '<line x1="50" y1="86" x2="260" y2="86" stroke="%s" stroke-width="1.3" stroke-dasharray="3 4"/>' % LINE
    for i, x in enumerate(xs):
        s += ('<rect x="%d" y="64" width="44" height="44" rx="9" fill="#FFFFFF" '
              'stroke="%s" stroke-width="1.3" transform="translate(-22,0)"/>') % (x, LINE)
        s += ('<rect x="%d" y="64" width="44" height="44" rx="9" fill="none" stroke="%s" '
              'stroke-width="2" transform="translate(-22,0)" opacity="0">'
              '<animate attributeName="opacity" values="0;1;1;0;0" dur="6s" begin="%ss" '
              'keyTimes="0;.06;.2;.3;1" repeatCount="indefinite"/></rect>') % (x, A, i*1.5)
    s += (_cell(42, 76, 16, 3, INK, .6, 1.5) + _cell(42, 83, 11, 3, INK, .38, 1.5)
          + _cell(42, 90, 14, 3, INK, .38, 1.5))
    s += ('<circle cx="119" cy="84" r="8.5" fill="none" stroke="%s" stroke-width="1.8"/>'
          '<path d="M125 90 L131 96" stroke="%s" stroke-width="2" stroke-linecap="round"/>') % (INK2, INK2)
    s += ('<path d="M178 94 C184 84 188 96 194 86 C198 80 201 84 204 82" fill="none" '
          'stroke="%s" stroke-width="2" stroke-linecap="round" stroke-dasharray="46" stroke-dashoffset="46">'
          '<animate attributeName="stroke-dashoffset" values="46;46;0;0;46" dur="6s" begin="3s" '
          'keyTimes="0;.05;.25;.8;1" repeatCount="indefinite"/></path>') % A
    s += ('<path d="M250 76 h20 v20 h-20 z" fill="none" stroke="%s" stroke-width="1.5"/>'
          '<path d="M254 86 l4.5 5 L267 80" fill="none" stroke="%s" stroke-width="2.4" '
          'stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="22" stroke-dashoffset="22">'
          '<animate attributeName="stroke-dashoffset" values="22;22;0;0;22" dur="6s" begin="4.5s" '
          'keyTimes="0;.04;.16;.9;1" repeatCount="indefinite"/></path>') % (INK3, A)
    s += ('<g><rect x="-6" y="-8" width="12" height="16" rx="2" fill="#FFFFFF" stroke="%s" stroke-width="1"/>'
          '<rect x="-3.5" y="-4.5" width="7" height="1.6" fill="%s" opacity=".5"/>'
          '<rect x="-3.5" y="-1" width="7" height="1.6" fill="%s" opacity=".5"/>'
          '<rect x="-3.5" y="2.5" width="5" height="1.6" fill="%s" opacity=".5"/>'
          '<animateMotion dur="6s" repeatCount="indefinite" path="M50 86 L120 86 L190 86 L260 86" '
          'keyPoints="0;0;.333;.333;.667;.667;1;1" keyTimes="0;.08;.22;.42;.56;.75;.88;1" calcMode="linear"/>'
          '</g>') % (A, INK, INK, INK)
    for i, lab in enumerate(['JIRA', 'REVIEW', 'SIGN', 'FILED']):
        s += ('<text x="%d" y="126" text-anchor="middle" font-family="monospace" font-size="7.4" '
              'fill="%s">%s</text>') % (xs[i], INK3, lab)
    return s + FOOT('D')

DIAGRAMS = {'analysis': analysis(), 'enterprise': enterprise(),
            'rights': rights(), 'workflow': workflow()}


# ==================================================================
# Section 02 - Deliverables & Outcomes
# ==================================================================

TEAL, GOLD, GREEN, BLUE = '#0D6F66', '#9A6B12', '#10775A', '#1B5C9E'

def deadlines():
    A = TEAL
    s = HEAD('A calendar of dates set by contract, repeating every quarter', 'E',
             'DATES SET BY CONTRACT', A)
    s += '<rect x="24" y="44" width="150" height="96" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.2"/>' % LINE
    s += '<rect x="24" y="44" width="150" height="14" rx="4" fill="%s" opacity=".10"/>' % INK
    for c in range(6):
        s += '<text x="%d" y="54" text-anchor="middle" font-family="monospace" font-size="6" fill="%s">%s</text>' % (
             36 + c*24, INK3, ['M','T','W','T','F','S'][c])
    flags = {(0,4):1, (1,2):0, (2,4):1, (3,0):0, (3,4):1, (4,3):2}
    for r in range(5):
        for c in range(6):
            x, y = 28 + c*24, 62 + r*15
            k = flags.get((r,c))
            if k is None:
                s += _cell(x, y, 18, 11, INK, .07, 2)
            else:
                dur, beg = 3.6, (r*6+c)*0.12
                s += ('<rect x="%d" y="%d" width="18" height="11" rx="2" fill="%s" opacity=".9"/>'
                      '<rect x="%d" y="%d" width="18" height="11" rx="2" fill="none" stroke="%s" '
                      'stroke-width="1.4" opacity="0"><animate attributeName="opacity" '
                      'values="0;1;0" dur="%ss" begin="%ss" repeatCount="indefinite"/></rect>') % (
                      x, y, A if k else INK2, x, y, A, dur, beg)
    s += '<text x="24" y="152" font-family="monospace" font-size="7.4" fill="%s">WEEKLY &#183; QUARTERLY</text>' % INK3
    # the cycle
    s += ('<path d="M214 60 A34 34 0 1 1 212 60" fill="none" stroke="%s" stroke-width="1.4" '
          'stroke-dasharray="4 5"/>') % LINE
    s += ('<circle r="4" fill="%s"><animateMotion dur="6s" repeatCount="indefinite" '
          'path="M214 60 A34 34 0 1 1 212 60"/></circle>') % A
    s += '<polygon points="209,56 219,60 209,64" fill="%s"/>' % A
    for i, lab in enumerate(['45', '60', '90']):
        s += ('<rect x="%d" y="122" width="22" height="13" rx="3" fill="%s" opacity=".13"/>'
              '<text x="%d" y="131" text-anchor="middle" font-family="monospace" font-size="7.4" '
              'font-weight="700" fill="%s">%s</text>') % (182 + i*26, A, 193 + i*26, INK, lab)
    s += ('<text x="213" y="94" text-anchor="middle" font-family="monospace" font-size="9" '
          'font-weight="700" fill="%s">DAYS</text>'
          '<text x="213" y="105" text-anchor="middle" font-family="monospace" font-size="6.6" '
          'fill="%s">AFTER CLOSE</text>') % (INK, INK3)
    s += '<text x="180" y="152" font-family="monospace" font-size="7.4" fill="%s">NON-NEGOTIABLE</text>' % INK3
    return s + FOOT('E')

def platform():
    A = GOLD
    s = HEAD('Contract and contact structure defined, then built and loaded', 'F',
             'DEFINE &#8594; BUILD &#8594; MIGRATE &#8594; RUN', A)
    fields = ['TITLE', 'PARTY', 'TERM', 'TERRITORY', 'RIGHT']
    for i, f in enumerate(fields):
        y = 44 + i*19
        s += '<rect x="24" y="%d" width="86" height="15" rx="3" fill="#FFFFFF" stroke="%s" stroke-width="1.1"/>' % (y, LINE)
        s += '<text x="31" y="%d" font-family="monospace" font-size="6.8" fill="%s">%s</text>' % (y+10, INK2, f)
        s += ('<rect x="92" y="%d" width="12" height="7" rx="1.6" fill="%s" opacity=".25">'
              '<animate attributeName="opacity" values=".18;.95;.18" dur="4.4s" begin="%ss" '
              'repeatCount="indefinite"/></rect>') % (y+4, A, i*0.5)
    s += '<text x="24" y="152" font-family="monospace" font-size="7.4" fill="%s">RECORD STRUCTURE</text>' % INK3
    p = 'M112 90 C136 90 140 90 158 90'
    s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p, LINE)
    for i in range(3):
        s += DOT % (A, 3.2, i*1.1, p, 3.2, i*1.1)
    # the platform
    s += '<rect x="162" y="48" width="130" height="86" rx="5" fill="#FFFFFF" stroke="%s" stroke-width="1.3"/>' % LINE
    s += '<rect x="162" y="48" width="130" height="16" rx="5" fill="%s" opacity=".10"/>' % INK
    s += '<text x="170" y="59" font-family="monospace" font-size="6.8" fill="%s">RIGHTS PLATFORM</text>' % INK2
    for r in range(4):
        y = 72 + r*15
        s += _cell(170, y, 40, 3.4, INK, .3, 1.7)
        s += _cell(216, y, 28, 3.4, INK, .22, 1.7)
        s += ('<rect x="250" y="%d" width="34" height="3.4" rx="1.7" fill="%s" opacity=".2">'
              '<animate attributeName="opacity" values=".15;.9;.15" dur="4.4s" begin="%ss" '
              'repeatCount="indefinite"/></rect>') % (y, A, 1.2 + r*0.35)
    s += '<text x="162" y="152" font-family="monospace" font-size="7.4" fill="%s">LIVE ENTRY AS DEALS CLOSE</text>' % INK3
    return s + FOOT('F')

def sops():
    A = GREEN
    s = HEAD('A written procedure, a checklist, and sign-offs before it leaves', 'G',
             'STEP &#8594; CHECK &#8594; SIGN-OFF', A)
    s += '<rect x="24" y="42" width="120" height="100" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.2"/>' % LINE
    for i in range(6):
        y = 54 + i*15
        s += ('<rect x="34" y="%d" width="9" height="9" rx="2" fill="none" stroke="%s" stroke-width="1.3"/>'
              '<path d="M36 %d l2.6 2.8 L43 %d" fill="none" stroke="%s" stroke-width="1.8" '
              'stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="12" stroke-dashoffset="12">'
              '<animate attributeName="stroke-dashoffset" values="12;12;0;0;12" dur="7s" '
              'begin="%ss" keyTimes="0;.04;.12;.9;1" repeatCount="indefinite"/></path>') % (
              y, LINE, y+4, y+0.5, A, i*0.55)
        s += _cell(50, y+3, [72, 58, 66, 48, 70, 54][i], 3.2, INK, .3, 1.6)
    s += '<text x="24" y="152" font-family="monospace" font-size="7.4" fill="%s">17-POINT CHECKLIST</text>' % INK3
    p = 'M146 92 L172 92'
    s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p, LINE)
    s += DOT % (A, 3.0, 0, p, 3.0, 0)
    roles = [('PREPARER', 52), ('REVIEWER', 84), ('APPROVER', 116)]
    for i, (lab, y) in enumerate(roles):
        s += ('<rect x="180" y="%d" width="112" height="24" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.1"/>'
              '<text x="190" y="%d" font-family="monospace" font-size="7" fill="%s">%s</text>') % (
              y, LINE, y+15, INK2, lab)
        s += ('<circle cx="274" cy="%d" r="7" fill="none" stroke="%s" stroke-width="1.5"/>'
              '<path d="M270 %d l3 3.2 L279 %d" fill="none" stroke="%s" stroke-width="2" '
              'stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="14" stroke-dashoffset="14">'
              '<animate attributeName="stroke-dashoffset" values="14;14;0;0;14" dur="7s" '
              'begin="%ss" keyTimes="0;.42;.5;.94;1" repeatCount="indefinite"/></path>') % (
              y+12, LINE, y+12, y+8, A, 3.4 + i*0.6)
    s += '<text x="180" y="152" font-family="monospace" font-size="7.4" fill="%s">SEGREGATION OF DUTIES</text>' % INK3
    return s + FOOT('G')

def agreements():
    A = BLUE
    s = HEAD('The document types that came across the desk', 'H',
             '1,900+ AGREEMENTS &#183; FOUR STUDIOS', A)
    kinds = ['SERIES REGULAR', 'DIRECTOR MEMO', 'SCRIPT', 'MUSIC LICENCE',
             'DISTRIBUTION', 'AMENDMENT', 'OPTION']
    for i in range(5):
        x, y = 26 + i*7, 44 + i*4
        s += ('<rect x="%d" y="%d" width="108" height="74" rx="4" fill="#FFFFFF" stroke="%s" '
              'stroke-width="1.1" opacity="%s"/>') % (x, y, LINE, 0.35 + i*0.16)
    for i in range(5):
        s += _cell(70, 76 + i*10, [74, 58, 80, 50, 66][i], 3.2, INK, .3, 1.6)
    s += ('<rect x="70" y="63" width="50" height="5" rx="2.5" fill="%s" opacity=".9"/>') % A
    s += '<text x="26" y="152" font-family="monospace" font-size="7.4" fill="%s">TALENT &#183; RIGHTS &#183; CORPORATE</text>' % INK3
    for i, k in enumerate(kinds):
        y = 44 + i*13
        s += ('<g opacity="0"><rect x="180" y="%d" width="112" height="11" rx="3" fill="%s" opacity=".13"/>'
              '<text x="188" y="%d" font-family="monospace" font-size="6.6" fill="%s">%s</text>'
              '<animate attributeName="opacity" values="0;1;1;0" dur="7s" begin="%ss" '
              'keyTimes="0;.06;.16;.22" repeatCount="indefinite"/></g>') % (
              y, A, y+8, INK, k, i*1.0)
    s += '<text x="180" y="152" font-family="monospace" font-size="7.4" fill="%s">EVERY TYPE, ONE METHOD</text>' % INK3
    return s + FOOT('H')

def abstract():
    A = TEAL
    s = HEAD('Clauses read out of the contract and written as payment settings', 'I',
             'READ &#8594; EXTRACT &#8594; SETTINGS', A)
    s += '<rect x="24" y="42" width="98" height="100" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.2"/>' % LINE
    hl = {2, 5, 8}
    for i in range(10):
        y = 52 + i*9.5
        w = [70, 58, 64, 50, 68, 54, 72, 46, 60, 52][i]
        if i in hl:
            s += ('<rect x="30" y="%.1f" width="%d" height="6" rx="1.6" fill="%s" opacity=".2">'
                  '<animate attributeName="opacity" values=".12;.8;.12" dur="5s" begin="%ss" '
                  'repeatCount="indefinite"/></rect>') % (y-1.6, w+6, A, list(hl).index(i)*0.7)
        s += _cell(32, y, w, 3.1, INK, .34 if i in hl else .22, 1.6)
    s += '<text x="24" y="152" font-family="monospace" font-size="7.4" fill="%s">SIGNED CONTRACT SET</text>' % INK3
    for i in range(3):
        p = 'M124 %d C142 %d 146 %d 162 %d' % (62 + i*28, 62 + i*28, 74 + i*14, 74 + i*14)
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.1" stroke-dasharray="3 4"/>' % (p, LINE)
        s += DOT % (A, 3.4, i*0.7, p, 3.4, i*0.7)
    s += '<rect x="166" y="46" width="126" height="92" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.3"/>' % LINE
    s += '<rect x="166" y="46" width="126" height="15" rx="4" fill="%s" opacity=".10"/>' % INK
    s += '<text x="174" y="57" font-family="monospace" font-size="6.8" fill="%s">MASTER SETTINGS</text>' % INK2
    rows = [('DEFINITION', 'MAGR'), ('SHARE', '5.0%'), ('BREAKPOINT', 'CB'), ('PRIORITY', '2 OF 4')]
    for i, (k, v) in enumerate(rows):
        y = 74 + i*16
        s += '<text x="174" y="%d" font-family="monospace" font-size="6.6" fill="%s">%s</text>' % (y, INK3, k)
        s += ('<text x="284" y="%d" text-anchor="end" font-family="monospace" font-size="7.4" '
              'font-weight="700" fill="%s">%s</text>') % (y, INK, v)
        s += '<line x1="174" y1="%d" x2="284" y2="%d" stroke="%s" stroke-width=".8"/>' % (y+4, y+4, SOFT)
    s += ('<rect x="174" y="%d" width="110" height="3" rx="1.5" fill="%s">'
          '<animate attributeName="width" values="8;110" dur="5s" repeatCount="indefinite"/></rect>') % (128, A)
    s += '<text x="166" y="152" font-family="monospace" font-size="7.4" fill="%s">WHAT THE SYSTEM PAYS FROM</text>' % INK3
    return s + FOOT('I')

def stakeholders():
    A = BLUE
    s = HEAD('Inputs pulled in, work handed off, review above', 'J',
             'PULLED FROM &#8594; ME &#8594; HANDED TO', A)
    ins = ['PRODUCTION FINANCE', 'LEGAL', 'TAX INCENTIVES', 'RIGHTS']
    for i, lab in enumerate(ins):
        y = 48 + i*24
        s += ('<rect x="20" y="%d" width="86" height="16" rx="3" fill="#FFFFFF" stroke="%s" stroke-width="1"/>'
              '<text x="26" y="%d" font-family="monospace" font-size="5.9" fill="%s">%s</text>') % (
              y, LINE, y+11, INK2, lab)
        p = 'M108 %d C132 %d 140 92 150 92' % (y+8, y+8)
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1" stroke-dasharray="3 4"/>' % (p, LINE)
        s += DOT % (A, 3.2, i*0.42, p, 3.2, i*0.42)
    s += '<text x="20" y="152" font-family="monospace" font-size="7.4" fill="%s">TWELVE DEPARTMENTS</text>' % INK3
    s += ('<circle cx="160" cy="92" r="15" fill="#FFFFFF" stroke="%s" stroke-width="2"/>'
          '<circle cx="160" cy="92" r="15" fill="none" stroke="%s" stroke-width="1.4">'
          '<animate attributeName="r" values="15;27" dur="3.4s" repeatCount="indefinite"/>'
          '<animate attributeName="opacity" values=".45;0" dur="3.4s" repeatCount="indefinite"/></circle>'
          '<text x="160" y="95" text-anchor="middle" font-family="monospace" font-size="7" '
          'font-weight="700" fill="%s">SR</text>') % (A, A, INK)
    outs = ['SETUP', 'STATEMENTS', 'CASH FORECAST', 'AUDIT']
    for i, lab in enumerate(outs):
        y = 48 + i*24
        p = 'M172 92 C186 92 192 %d 212 %d' % (y+8, y+8)
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1" stroke-dasharray="3 4"/>' % (p, LINE)
        s += DOT % (A, 3.2, 1.7 + i*0.42, p, 3.2, 1.7 + i*0.42)
        s += ('<rect x="214" y="%d" width="78" height="16" rx="3" fill="#FFFFFF" stroke="%s" stroke-width="1"/>'
              '<text x="220" y="%d" font-family="monospace" font-size="5.9" fill="%s">%s</text>') % (
              y, LINE, y+11, INK2, lab)
    s += '<text x="214" y="152" font-family="monospace" font-size="7.4" fill="%s">WAITING ON ME</text>' % INK3
    return s + FOOT('J')

def filings():
    A = GREEN
    s = HEAD('Forms filed with an outside body, then on the record', 'K',
             'FILE &#8594; AGENCY &#8594; ON RECORD', A)
    s += '<rect x="24" y="48" width="74" height="92" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.2"/>' % LINE
    for i in range(7):
        s += _cell(33, 60 + i*11, [52, 40, 56, 34, 48, 28, 44][i], 3.1, INK, .3, 1.6)
    s += '<text x="24" y="152" font-family="monospace" font-size="7.4" fill="%s">FILING</text>' % INK3
    p = 'M100 94 L128 94'
    s += '<path d="%s" fill="none" stroke="%s" stroke-width="1.2" stroke-dasharray="3 4"/>' % (p, LINE)
    s += DOT % (A, 2.8, 0, p, 2.8, 0)
    agencies = [('SOS', 56), ('USPTO', 94), ('COPYRIGHT', 132)]
    for i, (lab, y) in enumerate(agencies):
        s += ('<rect x="132" y="%d" width="76" height="24" rx="4" fill="#FFFFFF" stroke="%s" stroke-width="1.1"/>'
              '<text x="140" y="%d" font-family="monospace" font-size="6.6" fill="%s">%s</text>') % (
              y-12, LINE, y+2, INK2, lab)
        s += ('<circle cx="196" cy="%d" r="6" fill="%s" opacity=".18">'
              '<animate attributeName="opacity" values=".12;.85;.12" dur="5.4s" begin="%ss" '
              'repeatCount="indefinite"/></circle>') % (y, A, i*0.6)
        p2 = 'M210 %d C226 %d 232 94 244 94' % (y, y)
        s += '<path d="%s" fill="none" stroke="%s" stroke-width="1" stroke-dasharray="3 4"/>' % (p2, LINE)
        s += DOT % (A, 3.2, 1.0 + i*0.6, p2, 3.2, 1.0 + i*0.6)
    s += '<text x="132" y="152" font-family="monospace" font-size="7.4" fill="%s">OUTSIDE BODY</text>' % INK3
    # the stamp
    s += ('<circle cx="268" cy="94" r="22" fill="none" stroke="%s" stroke-width="2.2" opacity="0">'
          '<animate attributeName="opacity" values="0;0;1;1;0" dur="5.4s" '
          'keyTimes="0;.42;.5;.9;1" repeatCount="indefinite"/>'
          '<animate attributeName="r" values="30;30;22;22;22" dur="5.4s" '
          'keyTimes="0;.42;.5;.9;1" repeatCount="indefinite"/></circle>') % A
    s += ('<text x="268" y="91" text-anchor="middle" font-family="monospace" font-size="7" '
          'font-weight="700" fill="%s" opacity="0">ON<animate attributeName="opacity" '
          'values="0;0;1;1;0" dur="5.4s" keyTimes="0;.42;.5;.9;1" repeatCount="indefinite"/></text>'
          '<text x="268" y="101" text-anchor="middle" font-family="monospace" font-size="7" '
          'font-weight="700" fill="%s" opacity="0">RECORD<animate attributeName="opacity" '
          'values="0;0;1;1;0" dur="5.4s" keyTimes="0;.42;.5;.9;1" repeatCount="indefinite"/></text>') % (A, A)
    s += '<text x="240" y="152" font-family="monospace" font-size="7.4" fill="%s">GOOD STANDING</text>' % INK3
    return s + FOOT('K')

DIAGRAMS.update({'deadlines': deadlines(), 'platform': platform(), 'sops': sops(),
                 'agreements': agreements(), 'abstract': abstract(),
                 'stakeholders': stakeholders(), 'filings': filings()})
