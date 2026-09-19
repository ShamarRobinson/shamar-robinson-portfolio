set -e
cd /tmp/brand/vid
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/131.0 Safari/537.36"
echo "=== re-download originals ==="
for u in "2026/04/SF-website.mp4" "2026/07/digger-website-cutdown-v2.mp4" "2026/07/Dune-3-website-cutdown.mp4"; do
  n=$(basename "$u"); curl -sS -A "$UA" -H "Referer: https://www.legendary.com/" -L -o "o_$n" "https://www.legendary.com/wp-content/uploads/$u"
  echo "  o_$n $(wc -c < o_$n)"
done
yt-dlp -f "bv*[height<=1080]+ba/b" -o "o_dtva.%(ext)s" --no-playlist --quiet "https://www.youtube.com/watch?v=tZLfT67KGC8"
yt-dlp -f "bv*[height<=1080]+ba/b" -o "o_wbd.%(ext)s"  --no-playlist --quiet "https://www.youtube.com/watch?v=MLpbsD6Asks"
ls -la o_dtva.* o_wbd.* | awk '{print "  "$5" "$9}'

echo "=== encode 1280x720 from originals ==="
X264="aq-mode=3:psy-rd=1.0,0.15:deblock=-1,-1:ref=6:bf=5"
enc(){ ffmpeg -v error -y ${2:+-ss $2} ${3:+-t $3} -i "$1" -an \
  -vf "scale=1280:720:force_original_aspect_ratio=increase:flags=lanczos,crop=1280:720,fps=24" \
  -c:v libx264 -preset veryslow -tune film -crf 34 -x264-params "$X264" \
  -pix_fmt yuv420p -movflags +faststart "$4"; echo "  $4 $(wc -c < $4)"; }
enc o_SF-website.mp4 2 5 s1.mp4
enc o_digger-website-cutdown-v2.mp4 5 5 s2.mp4
enc o_Dune-3-website-cutdown.mp4 4 5 s3.mp4
printf "file 's1.mp4'\nfile 's2.mp4'\nfile 's3.mp4'\n" > l2.txt
ffmpeg -v error -y -f concat -safe 0 -i l2.txt -c copy reel.mp4
echo "  reel.mp4 $(wc -c < reel.mp4)"
enc "$(ls o_dtva.*|head -1)" "" 15 dtva_reel.mp4
enc "$(ls o_wbd.*|head -1)" 219 15 wbd_reel.mp4

echo "=== posters @1280 ==="
ffmpeg -v error -y -ss 1.5 -i reel.mp4      -frames:v 1 -vf scale=1280:-1 -q:v 3 poster.jpg
ffmpeg -v error -y -ss 2   -i dtva_reel.mp4 -frames:v 1 -vf scale=1280:-1 -q:v 3 dtva_poster.jpg
ffmpeg -v error -y -ss 2   -i wbd_reel.mp4  -frames:v 1 -vf scale=1280:-1 -q:v 3 wbd_poster.jpg
for f in poster dtva_poster wbd_poster; do echo "  $f.jpg $(wc -c < $f.jpg)"; done
echo "=== totals ==="
echo "  video $(cat reel.mp4 dtva_reel.mp4 wbd_reel.mp4 | wc -c)"
rm -f o_*.mp4 o_*.webm o_*.mkv test_*.mp4 t_Preset*.m4v t_hevc.m4v tile_s.m4v dune_s.m4v
echo "DONE"
