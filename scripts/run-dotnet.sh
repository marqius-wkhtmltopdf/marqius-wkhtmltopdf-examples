#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
project_dir="$repo_dir/examples/rotativa-aspnetcore"
mkdir -p "$repo_dir/output" "$project_dir/wwwroot/Rotativa"
cp "$(readlink -f "$(command -v wkhtmltopdf)")" "$project_dir/wwwroot/Rotativa/wkhtmltopdf"
chmod +x "$project_dir/wwwroot/Rotativa/wkhtmltopdf"
dotnet build "$project_dir" --configuration Release
ASPNETCORE_URLS=http://127.0.0.1:5043 dotnet run --project "$project_dir" --no-build --configuration Release > "$repo_dir/output/dotnet-server.log" 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT
for attempt in $(seq 1 40); do
  if curl --silent --fail http://127.0.0.1:5043/invoice -o "$repo_dir/output/rotativa-aspnetcore.pdf"; then break; fi
  sleep 1
done
python3 "$repo_dir/scripts/check_pdf.py" "$repo_dir/output/rotativa-aspnetcore.pdf"
