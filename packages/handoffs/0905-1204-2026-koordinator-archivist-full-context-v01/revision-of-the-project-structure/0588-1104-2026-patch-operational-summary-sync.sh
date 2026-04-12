#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
ENTITIES_FILE="$REPO/src/archivist/entities_registry.py"
STEPS_FILE="$REPO/src/archivist/steps_registry.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

for f in "$CLI_FILE" "$ENTITIES_FILE" "$STEPS_FILE"; do
  if [ ! -f "$f" ]; then
    echo "Required file not found: $f" >&2
    exit 1
  fi
done

PYBIN=""
if command -v python3 >/dev/null 2>&1; then
  PYBIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYBIN="python"
else
  echo "Neither python3 nor python is available." >&2
  exit 127
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"
cp "$ENTITIES_FILE" "$BACKUP_DIR/entities_registry.py.$STAMP.bak"
cp "$STEPS_FILE" "$BACKUP_DIR/steps_registry.py.$STAMP.bak"

"$PYBIN" - "$STEPS_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "def get_last_confirmed_step(" not in text:
    addition = """

def get_last_confirmed_step(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
) -> dict[str, Any] | None:
    where_clauses: list[str] = ["s.state = ?"]
    params: list[Any] = [STEP_STATE_CONFIRMED]

    if callsign is not None:
        where_clauses.append("e.callsign = ?")
        params.append(callsign)
    if entity_id is not None:
        where_clauses.append("s.entity_id = ?")
        params.append(entity_id)

    where_sql = "WHERE " + " AND ".join(where_clauses)

    sql = f\"\"\"
        SELECT
            s.id,
            s.entity_id,
            e.callsign,
            s.title,
            s.phase,
            s.operation_type,
            s.target_path,
            s.state,
            s.issued_at,
            s.executed_at,
            s.confirmed_at,
            s.success_evidence,
            s.notes
        FROM steps s
        JOIN entities e ON e.id = s.entity_id
        {where_sql}
        ORDER BY
            CASE WHEN s.confirmed_at IS NULL THEN 1 ELSE 0 END,
            s.confirmed_at DESC,
            s.id DESC
        LIMIT 1
    \"\"\"

    with db.connect() as conn:
        row = conn.execute(sql, tuple(params)).fetchone()
    return None if row is None else dict(row)
"""
    text = text.rstrip() + addition + "\n"

path.write_text(text, encoding="utf-8")
PY_EOF

"$PYBIN" - "$ENTITIES_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

old_block = """def render_entity_summary(
    entity: dict[str, Any] | None,
    *,
    active_step: dict[str, Any] | None = None,
) -> str:
    lines: list[str] = []
    lines.append("Entity summary")

    if entity is None:
        lines.append("  state: entity not found")
        return "\\n".join(lines) + "\\n"

    lines.append(f"  id: {entity.get('id')}")
    lines.append(f"  callsign: {entity.get('callsign') or ''}")
    lines.append(f"  contour: {entity.get('contour') or ''}")
    lines.append(f"  role: {entity.get('role') or ''}")
    lines.append(f"  package_path: {entity.get('package_path') or ''}")
    lines.append(f"  status: {entity.get('status') or ''}")
    lines.append(f"  current_phase: {entity.get('current_phase') or ''}")
    lines.append(f"  current_step_title: {entity.get('current_step_title') or ''}")
    lines.append(f"  next_allowed_action: {entity.get('next_allowed_action') or ''}")

    if entity.get("notes"):
        lines.append(f"  notes: {entity['notes']}")

    if active_step is None:
        lines.append("  active_step: none")
    else:
        lines.append("  active_step:")
        lines.append(f"    id: {active_step.get('id')}")
        lines.append(f"    title: {active_step.get('title') or ''}")
        lines.append(f"    phase: {active_step.get('phase') or ''}")
        lines.append(f"    operation_type: {active_step.get('operation_type') or ''}")
        lines.append(f"    target_path: {active_step.get('target_path') or ''}")
        lines.append(f"    state: {active_step.get('state') or ''}")

    lines.append(f"  created_at: {entity.get('created_at') or ''}")
    lines.append(f"  updated_at: {entity.get('updated_at') or ''}")
    return "\\n".join(lines) + "\\n"
"""

new_block = """def render_entity_summary(
    entity: dict[str, Any] | None,
    *,
    active_step: dict[str, Any] | None = None,
    last_confirmed_step: dict[str, Any] | None = None,
) -> str:
    lines: list[str] = []
    lines.append("Entity summary")

    if entity is None:
        lines.append("  state: entity not found")
        return "\\n".join(lines) + "\\n"

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    lines.append("  registration:")
    lines.append(f"    id: {entity.get('id')}")
    lines.append(f"    callsign: {entity.get('callsign') or ''}")
    lines.append(f"    contour: {entity.get('contour') or ''}")
    lines.append(f"    role: {entity.get('role') or ''}")
    lines.append(f"    package_path: {entity.get('package_path') or ''}")
    lines.append(f"    status: {entity.get('status') or ''}")
    lines.append(f"    current_phase: {entity.get('current_phase') or ''}")
    lines.append(f"    current_step_title: {entity.get('current_step_title') or ''}")
    lines.append(f"    next_allowed_action: {entity.get('next_allowed_action') or ''}")
    if entity.get("notes"):
        lines.append(f"    notes: {entity['notes']}")
    lines.append(f"    created_at: {entity.get('created_at') or ''}")
    lines.append(f"    updated_at: {entity.get('updated_at') or ''}")

    lines.append("  operational:")
    lines.append(f"    operational_state_text: {operational_state_text}")

    if active_step is None:
        lines.append("    active_step: none")
    else:
        lines.append("    active_step:")
        lines.append(f"      id: {active_step.get('id')}")
        lines.append(f"      title: {active_step.get('title') or ''}")
        lines.append(f"      phase: {active_step.get('phase') or ''}")
        lines.append(f"      operation_type: {active_step.get('operation_type') or ''}")
        lines.append(f"      target_path: {active_step.get('target_path') or ''}")
        lines.append(f"      state: {active_step.get('state') or ''}")

    if last_confirmed_step is None:
        lines.append("    last_confirmed_step: none")
    else:
        lines.append("    last_confirmed_step:")
        lines.append(f"      id: {last_confirmed_step.get('id')}")
        lines.append(f"      title: {last_confirmed_step.get('title') or ''}")
        lines.append(f"      phase: {last_confirmed_step.get('phase') or ''}")
        lines.append(f"      operation_type: {last_confirmed_step.get('operation_type') or ''}")
        lines.append(f"      target_path: {last_confirmed_step.get('target_path') or ''}")
        lines.append(f"      confirmed_at: {last_confirmed_step.get('confirmed_at') or ''}")

    return "\\n".join(lines) + "\\n"
"""

if old_block not in text:
    raise SystemExit("Old render_entity_summary block not found")
text = text.replace(old_block, new_block, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

old_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    get_active_step,
    issue_step,
    list_confirmed_steps,
    list_recent_artifacts,
    list_steps,
    mark_step_executed,
    render_active_step,
    render_confirmed_steps_list,
    render_recent_artifacts_list,
    render_steps_list,
)
"""
new_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    get_active_step,
    get_last_confirmed_step,
    issue_step,
    list_confirmed_steps,
    list_recent_artifacts,
    list_steps,
    mark_step_executed,
    render_active_step,
    render_confirmed_steps_list,
    render_recent_artifacts_list,
    render_steps_list,
)
"""
if "get_last_confirmed_step" not in text:
    if old_import not in text:
        raise SystemExit("Steps import block not found in cli.py")
    text = text.replace(old_import, new_import, 1)

old_fragment = """    active_step = get_active_step(
        db,
        entity_id=int(entity["id"]),
    )
    print(render_entity_summary(entity, active_step=active_step), end="")
    return 0
"""
new_fragment = """    active_step = get_active_step(
        db,
        entity_id=int(entity["id"]),
    )
    last_confirmed_step = get_last_confirmed_step(
        db,
        entity_id=int(entity["id"]),
    )
    print(
        render_entity_summary(
            entity,
            active_step=active_step,
            last_confirmed_step=last_confirmed_step,
        ),
        end="",
    )
    return 0
"""
if old_fragment not in text:
    raise SystemExit("cmd_show_entity_summary fragment not found in cli.py")
text = text.replace(old_fragment, new_fragment, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "  $ENTITIES_FILE"
echo "  $STEPS_FILE"
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/entities_registry.py.$STAMP.bak"
echo "  $BACKUP_DIR/steps_registry.py.$STAMP.bak"
