#!/usr/bin/env bash
set -euo pipefail

CMS_ROOT="$(dirname "$0")"
cd "$CMS_ROOT"

MODE=${1:-draft}
PAGE=${2:-home}

call_fmaap() {
  component_id="prefrontal-${PAGE}-$(date +%s)"
  intent_payload=$(cat <<JSON
{
  "component_id": "${component_id}",
  "intent": "Update ${PAGE}",
  "coherence_claim": "Resident page update",
  "created_by": "prefrontal-cms"
}
JSON
)
  curl -sS -X POST http://localhost:8845/intent \
    -H 'Content-Type: application/json' \
    -d "${intent_payload}" >/dev/null

  production_payload=$(cat <<JSON
{
  "component_id": "${component_id}",
  "code": "Page ${PAGE} content",
  "produced_by": "prefrontal-cms"
}
JSON
)
  curl -sS -X POST http://localhost:8845/production \
    -H 'Content-Type: application/json' \
    -d "${production_payload}" >/dev/null
}

site_url() {
  python3 - <<PY
import json, pathlib
root=pathlib.Path('config/site.json')
data=json.loads(root.read_text())
print(data.get('siteUrl', 'https://mumega.com/pref'))
PY
}

generate_seo_files() {
  local base_url today page path
  base_url="$(site_url)"
  base_url="${base_url%/}"
  today="$(date -u +%Y-%m-%d)"

  {
    echo '<?xml version="1.0" encoding="UTF-8"?>'
    echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
    for file in content/*.mdx; do
      page="$(basename "$file" .mdx)"
      if [[ "$page" == "home" ]]; then
        path=""
      else
        path="/${page}"
      fi
      printf '  <url><loc>%s%s</loc><lastmod>%s</lastmod></url>\n' "$base_url" "$path" "$today"
    done
    echo '</urlset>'
  } >"dist/sitemap.xml"

  cat >"dist/robots.txt" <<EOF
User-agent: *
Allow: /

Sitemap: ${base_url}/sitemap.xml
EOF

  if [[ -f "llms.txt" ]]; then
    cp "llms.txt" "dist/llms.txt"
  fi
}

build_dist() {
  echo "[build] building dist for ${PAGE}"
  mkdir -p dist
  cp "content/${PAGE}.mdx" "dist/${PAGE}.mdx"
  printf "<html><body><h1>%s</h1><pre>See MDX in dist/%s.mdx</pre></body></html>" "${PAGE^}" "${PAGE}" >"dist/${PAGE}.html"
  generate_seo_files
}

deploy() {
  deploy_path=$(python3 - <<PY
import json, pathlib
root=pathlib.Path('config/site.json')
data=json.loads(root.read_text())
print(data.get('deployPath', '/var/www/mumega.com/pref'))
PY
)
  sudo mkdir -p "$deploy_path"
  rsync -a dist/ "$deploy_path/"
  echo "[deploy] synced to $deploy_path"
}

case "$MODE" in
  draft)
    echo "[draft] staging ${PAGE}"
    call_fmaap
    build_dist
    ;;
  publish)
    echo "[publish] running draft + publish"
    call_fmaap
    build_dist
    deploy
    ;;
  *)
    echo "Usage: $0 {draft|publish} [page]" >&2
    exit 1
    ;;
esac
