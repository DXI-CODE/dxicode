#!/bin/bash

# Directorio de entrada (por defecto el actual)
DIR="${1:-.}"

# Carpeta de salida
OUTPUT="$DIR/webp"
mkdir -p "$OUTPUT"

# Buscar imágenes jpg/jpeg/png y convertir
find "$DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while IFS= read -r img; do
    filename=$(basename "$img")
    name="${filename%.*}"
    cwebp -q 85 "$img" -o "$OUTPUT/$name.webp"
    echo "✅ Convertido: $img → $OUTPUT/$name.webp"
done

echo "🎉 Conversión completada. Archivos guardados en: $OUTPUT"
