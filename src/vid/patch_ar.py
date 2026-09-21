# -*- coding: utf-8 -*-
"""Replace the financial 'annual report' card in the Turbo LV montage with a
state annual report -- the filing that names the registered agent and the
owners. Fields are labelled and their values shown as redacted rules rather
than invented, matching the source video's own abstract style.
"""
from PIL import Image, ImageDraw, ImageFont, ImageFilter
import glob, os, sys

W, H = 1280, 720
CARD = (490, 227, 790, 517)          # x0,y0,x1,y1 at 720p
HEAD_H = 52
NAVY  = (27, 44, 78)
GOLD  = (230, 168, 32)
TEAL  = (26, 152, 140)
INK   = (42, 58, 82)
GREY  = (198, 208, 220)

B = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 17)
L = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 8)
Vt= ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf', 10)
S = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 9)
S7= ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 7)

ROWS = [('ENTITY NAME', 150), ('REGISTERED AGENT', 132),
        ('AGENT STREET ADDRESS', 168), ('MANAGING MEMBER', 120),
        ('MEMBER / OWNER', 138)]

def card_layer(p):
    """p = 0..1 progress through the scene."""
    x0, y0, x1, y1 = CARD
    w, h = x1 - x0, y1 - y0
    im = Image.new('RGBA', (w + 40, h + 46), (0, 0, 0, 0))
    d  = ImageDraw.Draw(im)
    ox, oy = 20, 14
    # drop shadow
    sh = Image.new('RGBA', im.size, (0, 0, 0, 0))
    ImageDraw.Draw(sh).rounded_rectangle([ox+3, oy+10, ox+w+3, oy+h+12], 10, fill=(40, 60, 90, 55))
    im.alpha_composite(sh.filter(ImageFilter.GaussianBlur(9)))
    # card
    d.rounded_rectangle([ox, oy, ox+w, oy+h], 9, fill=(255, 255, 255, 255))
    d.rounded_rectangle([ox, oy, ox+w, oy+HEAD_H], 9, fill=NAVY + (255,))
    d.rectangle([ox, oy+HEAD_H-10, ox+w, oy+HEAD_H], fill=NAVY + (255,))
    d.text((ox+19, oy+17), 'ANNUAL REPORT', font=B, fill=(255, 255, 255, 255))
    d.text((ox+19, oy+HEAD_H+13), 'FILED WITH THE SECRETARY OF STATE', font=L, fill=(122, 140, 166, 255))
    # fields fill in one after another
    ty = oy + HEAD_H + 32
    for i, (lab, vw) in enumerate(ROWS):
        rp = max(0.0, min(1.0, (p - 0.10 - i*0.105) / 0.17))
        d.text((ox+19, ty), lab, font=L, fill=(140, 156, 178, 255))
        d.rounded_rectangle([ox+19, ty+13, ox+19+vw, ty+21], 4, fill=(236, 240, 246, 255))
        if rp > 0:
            col = TEAL if i in (1, 2) else GOLD if i in (3, 4) else INK
            d.rounded_rectangle([ox+19, ty+13, ox+19+int(vw*rp), ty+21], 4, fill=col + (255,))
        ty += 40
    # ownership split, because the filing names who owns it
    if p > 0.62:
        a = min(1.0, (p - 0.62) / 0.16)
        d.text((ox+w-92, oy+HEAD_H+32), 'OWNERSHIP', font=L, fill=(140, 156, 178, 255))
        d.rounded_rectangle([ox+w-92, oy+HEAD_H+45, ox+w-22, oy+HEAD_H+53], 4, fill=(236, 240, 246, 255))
        d.rounded_rectangle([ox+w-92, oy+HEAD_H+45, ox+w-92+int(70*a), oy+HEAD_H+53], 4, fill=GOLD + (255,))
        d.text((ox+w-92, oy+HEAD_H+60), '100%  MEMBER', font=S, fill=(INK + (255,)))
    # filed stamp
    if p > 0.74:
        a = min(1.0, (p - 0.74) / 0.12)
        sx, sy = ox + w - 104, oy + h - 66
        st = Image.new('RGBA', (96, 52), (0, 0, 0, 0))
        sd = ImageDraw.Draw(st)
        sd.rounded_rectangle([0, 0, 95, 51], 7, outline=TEAL + (255,), width=3)
        sd.text((16, 11), 'FILED', font=B, fill=TEAL + (255,))
        sd.text((13, 34), 'GOOD STANDING', font=S7, fill=TEAL + (255,))
        st.putalpha(st.getchannel('A').point(lambda v: int(v * a)))
        im.alpha_composite(st, (sx, sy))
    return im, ox, oy

def patch(folder, first, last):
    x0, y0, x1, y1 = CARD
    pad = 26
    n = last - first + 1
    for i, idx in enumerate(range(first, last + 1)):
        f = os.path.join(folder, 'f%04d.jpg' % idx)
        if not os.path.exists(f): continue
        im = Image.open(f).convert('RGB'); px = im.load()
        # how visible was the original card on this frame?
        r, g, b = px[x0 + 14, y0 + 16]
        alpha = max(0.0, min(1.0, (250 - (r + g + b) / 3) / (250 - 49)))
        # erase the old card by extending the background gradient across it
        for y in range(y0 - pad, y1 + pad + 12):
            if 0 <= y < H:
                c = px[190, y]
                for x in range(x0 - pad, x1 + pad):
                    if 0 <= x < W: px[x, y] = c
        if alpha > 0.02:
            lay, ox, oy = card_layer(i / max(1, n - 1))
            lay.putalpha(lay.getchannel('A').point(lambda v: int(v * alpha)))
            base = im.convert('RGBA')
            base.alpha_composite(lay, (x0 - ox, y0 - oy))
            im = base.convert('RGB')
        im.save(f, quality=95)
    print('patched %d frames (%d-%d)' % (n, first, last))

if __name__ == '__main__':
    patch(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))
