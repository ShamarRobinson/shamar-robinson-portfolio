# Portfolio

A single-page portfolio, built as one static page with no framework and no
runtime dependencies beyond a webfont.

## Layout

    site/    the deployable static site - this is what GitHub Pages serves
    src/     the template, generator and source media it is built from

## Building

`src/build_tpl.sh` assembles `src/page3.tpl` and the deck fragments into one
self-contained HTML file. `src/publish_site.py` then splits the inlined base64
assets back out into real files under `site/assets/`, so the browser fetches
them on demand instead of waiting for one enormous document.

Two things that pass is responsible for, both measured rather than assumed:

- **Images load only when shown.** `loading="lazy"` does nothing for an image
  inside a collapsed section - with no layout box it never intersects, and the
  browser fetches it anyway. On this page that left 106 of 107 such images
  downloading on first paint. Their sources are withheld instead and filled in
  when the section opens, which took first paint from 113 images to 1.
- **Reels load the same way**, so none of the video is fetched until its tile
  nears the viewport.

## History

This project was built before it was put under version control. The commit
history was reconstructed on import from the files' own modification times, so
each file is committed on the day it was last worked on. The dates are real;
the per-commit snapshots are not a true record of what the whole project looked
like on that day.
