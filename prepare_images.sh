#!/bin/bash
# Temizlenmiş PNG'leri JPEG'e çevirip site/projects klasörüne kopyalar.
# macOS'un yerleşik `sips` aracını kullanır.
set -e

SRC="/Users/juss/Desktop/kaytan/temizlenmis"
DST="/Users/juss/Desktop/kaytan/site/projects"

if [ ! -d "$SRC" ]; then
  echo "❌ Kaynak klasör yok: $SRC"
  echo "   Önce ~/Library/.../outputs/download_results.sh çalıştırılmalı."
  exit 1
fi

mkdir -p "$DST"
echo "📦 19 görsel optimize ediliyor → $DST"

for f in "$SRC"/proje_*.png; do
  [ -f "$f" ] || continue
  name="$(basename "$f" .png).jpg"
  sips -s format jpeg -s formatOptions 85 -Z 1800 "$f" --out "$DST/$name" >/dev/null 2>&1
  printf "  ✓ %s\n" "$name"
done

echo ""
echo "✅ Bitti. Şimdi site/index.html dosyasını çift tıklayarak tarayıcıda aç."
