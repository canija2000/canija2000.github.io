#!/usr/bin/env bash
# Crea el esqueleto de un post nuevo.
# Uso: ./nuevo-post.sh <carpeta> "Título del post" [categoria1,categoria2]
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Uso: $0 <carpeta> \"Título\" [cat1,cat2]" >&2
  exit 1
fi

slug="$1"
titulo="$2"
categorias="${3:-}"
dir="posts/$slug"

if [ -e "$dir" ]; then
  echo "Ya existe $dir" >&2
  exit 1
fi

mkdir -p "$dir"
cat > "$dir/index.qmd" <<EOF
---
title: "$titulo"
author: "Joaquín Bächler"
date: "$(date +%Y-%m-%d)"
title-block-banner: portada.jpg
image: portada.jpg
categories: [${categorias//,/, }]
draft: true
---

## Introducción

EOF

echo "Creado $dir/index.qmd (agregá portada.jpg en esa carpeta)"
