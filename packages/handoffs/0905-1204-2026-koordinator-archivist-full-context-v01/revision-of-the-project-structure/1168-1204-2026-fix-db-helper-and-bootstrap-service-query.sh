#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

if [ ! -f "$CLI_FILE" ]; then
  echo "Required file not found: $CLI_FILE" >&2
  exit 1
fi

LATEST_BAK="$(ls -1t "$BACKUP_DIR"/cli.py.*.bak 2>/dev/null | head -n 1 || true)"
if [ -z "${LATEST_BAK:-}" ]; then
  echo "No cli.py backup found in $BACKUP_DIR" >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.before-fix.bak"

python3 - "$CLI_FILE" "$LATEST_BAK" <<'PY_EOF'
from pathlib import Path
import re
import sys

cli_path = Path(sys.argv[1])
bak_path = Path(sys.argv[2])

cli_text = cli_path.read_text(encoding="utf-8")
bak_text = bak_path.read_text(encoding="utf-8")

# 1) restore _db_from_args from backup if missing
if "def _db_from_args(args) -> Database:" not in cli_text:
    m = re.search(
        r"def _db_from_args\(args\) -> Database:\n(?:    .*\n)+?(?=\ndef |\Z)",
        bak_text,
        flags=re.S,
    )
    if not m:
        raise SystemExit("_db_from_args not found in backup")
    helper_block = m.group(0).rstrip() + "\n\n"

    anchor = "def cmd_init_db(args) -> int:\n"
    if anchor not in cli_text:
        raise SystemExit("cmd_init_db anchor not found in current cli.py")
    cli_text = cli_text.replace(anchor, helper_block + anchor, 1)

# 2) replace cmd_service_query with version that skips DB for bootstrap queries
m = re.search(
    r"def cmd_service_query\(args\) -> int:\n(?:    .*\n)+?(?=\ndef |\Z)",
    cli_text,
    flags=re.S,
)
if not m:
    raise SystemExit("cmd_service_query block not found in cli.py")

replacement = '''def cmd_service_query(args) -> int:
    entity_queries = {"active-step", "entity-summary", "recent-artifacts"}

    if args.query_type in entity_queries:
        if not getattr(args, "callsign", None) and getattr(args, "entity_id", None) is None:
            payload = {
                "ok": False,
                "query_type": args.query_type,
                "error": "callsign_or_entity_id_required",
            }
            print(json.dumps(payload, ensure_ascii=False, indent=2))
            return 2

        db = _db_from_args(args)
        payload, status = build_service_query_payload(
            db,
            query_type=args.query_type,
            callsign=getattr(args, "callsign", None),
            entity_id=getattr(args, "entity_id", None),
            limit=getattr(args, "limit", 10),
            packages_root=getattr(args, "packages_root", None),
            package_dir=getattr(args, "package_dir", None),
        )
    else:
        payload, status = build_service_query_payload(
            None,
            query_type=args.query_type,
            callsign=getattr(args, "callsign", None),
            entity_id=getattr(args, "entity_id", None),
            limit=getattr(args, "limit", 10),
            packages_root=getattr(args, "packages_root", None),
            package_dir=getattr(args, "package_dir", None),
        )

    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return status
'''
cli_text = cli_text[:m.start()] + replacement + "\n\n" + cli_text[m.end():]

cli_path.write_text(cli_text, encoding="utf-8")
print(f"patched: {cli_path}")
print(f"used backup: {bak_path}")
PY_EOF

echo "Backup of current broken cli.py:"
echo "  $BACKUP_DIR/cli.py.$STAMP.before-fix.bak"
echo "Source backup used for helper restore:"
echo "  $LATEST_BAK"
