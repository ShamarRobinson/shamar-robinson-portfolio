# -*- coding: utf-8 -*-
"""The montage is zoomed in, which would clip the scene captions off the left
edge. Erase each caption and redraw it further in, at the opacity the original
had on that frame so the fades still read.
"""
from PIL import Image, ImageDraw, ImageFont
import sys, os

W, H = 1280, 720
BOX  = (0, 626, 470, 676)      # region the caption occupies
NEWX = 138                     # safely inside a 1.18 centre crop
TEAL = (16, 140, 128)
INK  = (26, 43, 71)
F = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 20)

SCENES = [(1, 91, 'Business Filings'), (92, 185, 'Annual Reports'),
          (186, 276, 'Copyright Registrations'), (277, 400, 'Trademark Filings')]

def caption_for(i):
    for a, b, t in SCENES:
        if a <= i <= b: return t
    return SCENES[-1][2]

def run(folder, first, last):
    for idx in range(first, last + 1):
        f = os.path.join(folder, 'f%04d.jpg' % idx)
        if not os.path.exists(f): continue
        im = Image.open(f).convert('RGB'); px = im.load()
        x0, y0, x1, y1 = BOX
        # how strongly was the caption drawn on this frame?
        dark = 255
        for y in range(y0 + 8, y1 - 8, 2):
            for x in range(60, 330, 2):
                v = sum(px[x, y]) / 3
                if v < dark: dark = v
        bgv = sum(px[600, y0 + 20]) / 3
        alpha = max(0.0, min(1.0, (bgv - dark) / max(1.0, bgv - 40)))
        # erase, extending the background across the strip
        for y in range(y0, y1):
            c = px[700, y]
            for x in range(x0, x1): px[x, y] = c
        if alpha > 0.03:
            lay = Image.new('RGBA', (W, H), (0, 0, 0, 0))
            d = ImageDraw.Draw(lay)
            d.rounded_rectangle([NEWX, y0 + 12, NEWX + 4, y0 + 34], 2, fill=TEAL + (255,))
            d.text((NEWX + 17, y0 + 10), caption_for(idx), font=F, fill=INK + (255,))
            lay.putalpha(lay.getchannel('A').point(lambda v: int(v * alpha)))
            base = im.convert('RGBA'); base.alpha_composite(lay); im = base.convert('RGB')
        im.save(f, quality=95)
    print('captions redrawn on %d frames' % (last - first + 1))

if __name__ == '__main__':
    run(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))
