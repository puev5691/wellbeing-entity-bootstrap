from __future__ import annotations
import argparse
import json
from pathlib import Path

from .classify_files import classify_package_files
from .config import load_config
from .context_manifest import build_context_manifest, render_context_manifest
from .copy_map import parse_copy_map
from .copy_map_append_patch import build_copy_map_append_patch, render_append_patch
from .copy_map_candidate import build_copy_map_candidate, render_copy_map_candidate
from .copy_map_coverage import build_copy_map_coverage_report
from .copy_map_recommendations import build_copy_map_recommendations, render_copy_map_recommendations
from .db import Database
from .draft_copy_map import collect_draft_copy_map_entries, render_draft_copy_map
from .indexer import Indexer
from .logging_setup import setup_logging
from .package_status_report import build_package_status_report
from .repo_manifest import build_repo_manifest, render_repo_manifest, default_repo_manifest_output_path
from .repo_profile import build_repo_profile, render_repo_profile, default_repo_profile_output_path
from .repo_start_context import build_repo_start_context, render_repo_start_context, default_repo_start_context_output_path
from .service_layer import build_service_query_payload
from .bootstrap_packages import (
    DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
    collect_bootstrap_package_summary,
    list_bootstrap_packages,
    render_bootstrap_package_summary,
    render_bootstrap_packages_list,
)
from .path_abstraction import (
    build_path_roots,
    build_path_roots_detailed,
    parse_root_overrides,
    render_path_roots,
    render_resolved_path,
    render_split_path,
    resolve_logical_path,
    split_absolute_path,
)
from .entities_registry import (
    ensure_entities_table,
    get_entity_state,
    list_entities,
    register_entity,
    render_entities_list,
    render_entity_state,
    render_entity_summary,
)
from .steps_registry import (
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


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="archivist",
        description="MVP CLI for wellbeing project archivist",
    )
    parser.add_argument(
        "--config",
        dest="config_path",
        default=None,
        help="Path to JSON config file",
    )

    subparsers = parser.add_subparsers(dest="command", required=True)

    subparsers.add_parser("init-db", help="Create SQLite database and schema")
    subparsers.add_parser("stats", help="Show basic database statistics")
    subparsers.add_parser("index", help="Run full indexing")
    subparsers.add_parser("reindex", help="Run full reindexing")

    search_name = subparsers.add_parser("search-name", help="Search files by name")
    search_name.add_argument("query", help="Search query")
    search_name.add_argument("--limit", type=int, default=50)

    search_text = subparsers.add_parser("search-text", help="Search files by text")
    search_text.add_argument("query", help="Search query")
    search_text.add_argument("--limit", type=int, default=50)

    show_file = subparsers.add_parser("show-file", help="Show file card by ID")
    show_file.add_argument("file_id", type=int)

    show_chat_package = subparsers.add_parser(
        "show-chat-package",
        help="Show chat package card by ID",
    )
    show_chat_package.add_argument("package_id", type=int)

    show_copy_map = subparsers.add_parser(
        "show-copy-map",
        help="Show parsed .wb-copy-map.tsv for a chat package by package ID",
    )
    show_copy_map.add_argument("package_id", type=int)

    generate_copy_map_draft = subparsers.add_parser(
        "generate-copy-map-draft",
        help="Generate draft .wb-copy-map for a chat package by package ID",
    )
    generate_copy_map_draft.add_argument("package_id", type=int)
    generate_copy_map_draft.add_argument(
        "--write",
        action="store_true",
        help="Write draft to .wb-copy-map.generated.tsv inside the package",
    )

    classify_package = subparsers.add_parser(
        "classify-package-files",
        help="Classify files inside a chat package by package ID",
    )
    classify_package.add_argument("package_id", type=int)

    package_status = subparsers.add_parser(
        "package-status-report",
        help="Show report by file statuses for a chat package",
    )
    package_status.add_argument("package_id", type=int)

    build_context_manifest_cmd = subparsers.add_parser(
        "build-context-manifest",
        help="Build context manifest for a new entity or handoff",
    )
    build_context_manifest_cmd.add_argument("package_id", type=int)

    build_repo_manifest_cmd = subparsers.add_parser(
        "build-repo-manifest",
        help="Build repository manifest for code-oriented entity",
    )
    build_repo_manifest_cmd.add_argument("repo_path", help="Path to repository directory")
    build_repo_manifest_cmd.add_argument(
        "--write",
        action="store_true",
        help="Write repository manifest into _ARCHIVIST/repo_manifests",
    )

    build_repo_profile_cmd = subparsers.add_parser(
        "build-repo-profile",
        help="Build repository profile for code-oriented entity",
    )
    build_repo_profile_cmd.add_argument("repo_path", help="Path to repository directory")
    build_repo_profile_cmd.add_argument(
        "--write",
        action="store_true",
        help="Write repository profile into _ARCHIVIST/repo_reports",
    )

    build_repo_start_context_cmd = subparsers.add_parser(
        "build-repo-start-context",
        help="Build startup reading context for code-oriented entity",
    )
    build_repo_start_context_cmd.add_argument("repo_path", help="Path to repository directory")
    build_repo_start_context_cmd.add_argument(
        "--write",
        action="store_true",
        help="Write startup context into _ARCHIVIST/repo_reports",
    )

    check_copy_map_coverage = subparsers.add_parser(
        "check-copy-map-coverage",
        help="Check how well .wb-copy-map.tsv covers the files of a chat package",
    )
    check_copy_map_coverage.add_argument("package_id", type=int)

    recommend_copy_map = subparsers.add_parser(
        "recommend-copy-map-additions",
        help="Recommend new lines to add into .wb-copy-map.tsv for uncovered files",
    )
    recommend_copy_map.add_argument("package_id", type=int)

    build_copy_map_candidate_cmd = subparsers.add_parser(
        "build-copy-map-candidate",
        help="Build merged candidate copy map from existing map and recommendations",
    )
    build_copy_map_candidate_cmd.add_argument("package_id", type=int)
    build_copy_map_candidate_cmd.add_argument(
        "--write",
        action="store_true",
        help="Write merged candidate to .wb-copy-map.candidate.tsv inside the package",
    )

    build_copy_map_append_patch_cmd = subparsers.add_parser(
        "build-copy-map-append-patch",
        help="Build append-ready patch from recommendations with non-empty targets",
    )
    build_copy_map_append_patch_cmd.add_argument("package_id", type=int)
    register_entity_cmd = subparsers.add_parser(
        "register-entity",
        help="Register or update entity in the entities registry",
    )
    register_entity_cmd.add_argument("callsign", help="Entity callsign")
    register_entity_cmd.add_argument("--contour", required=True, help="Entity contour")
    register_entity_cmd.add_argument("--role", required=True, help="Entity role")
    register_entity_cmd.add_argument("--package-path", required=True, help="Entity package path")
    register_entity_cmd.add_argument("--status", default="active", help="Entity status")
    register_entity_cmd.add_argument("--current-phase", default="bootstrap", help="Current phase")
    register_entity_cmd.add_argument("--current-step-title", default="", help="Current step title")
    register_entity_cmd.add_argument("--next-allowed-action", default="", help="Next allowed action")
    register_entity_cmd.add_argument("--notes", default="", help="Entity notes")

    subparsers.add_parser("list-entities", help="List registered entities")

    show_entity_state_cmd = subparsers.add_parser(
        "show-entity-state",
        help="Show entity state by callsign or id",
    )
    show_group = show_entity_state_cmd.add_mutually_exclusive_group(required=True)
    show_group.add_argument("--callsign", help="Entity callsign")
    show_group.add_argument("--id", dest="entity_id", type=int, help="Entity id")

    issue_step_cmd = subparsers.add_parser(
        "issue-step",
        help="Create step in the steps registry with state script_issued",
    )
    issue_step_cmd.add_argument("--callsign", required=True, help="Entity callsign")
    issue_step_cmd.add_argument("--title", required=True, help="Step title")
    issue_step_cmd.add_argument("--phase", required=True, help="Step phase")
    issue_step_cmd.add_argument("--operation-type", required=True, help="Operation type")
    issue_step_cmd.add_argument("--target-path", required=True, help="Target file path")
    issue_step_cmd.add_argument("--notes", default="", help="Step notes")

    mark_step_executed_cmd = subparsers.add_parser(
        "mark-step-executed",
        help="Mark step as script_executed",
    )
    mark_step_executed_cmd.add_argument("step_id", type=int, help="Step id")
    mark_step_executed_cmd.add_argument("--notes", default="", help="Execution notes")

    confirm_step_artifact_cmd = subparsers.add_parser(
        "confirm-step-artifact",
        help="Mark step as artifact_confirmed",
    )
    confirm_step_artifact_cmd.add_argument("step_id", type=int, help="Step id")
    confirm_step_artifact_cmd.add_argument(
        "--success-evidence",
        required=True,
        help="Evidence string proving artifact confirmation",
    )
    confirm_step_artifact_cmd.add_argument("--notes", default="", help="Confirmation notes")

    list_steps_cmd = subparsers.add_parser(
        "list-steps",
        help="List steps, optionally filtered by entity",
    )
    list_steps_cmd.add_argument("--callsign", help="Entity callsign")
    list_steps_cmd.add_argument("--entity-id", type=int, help="Entity id")
    list_steps_cmd.add_argument(
        "--only-active",
        action="store_true",
        help="Show only steps not yet in artifact_confirmed state",
    )

    show_active_step_cmd = subparsers.add_parser(
        "show-active-step",
        help="Show active step by callsign or entity id",
    )
    show_active_group = show_active_step_cmd.add_mutually_exclusive_group(required=True)
    show_active_group.add_argument("--callsign", help="Entity callsign")
    show_active_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    show_entity_summary_cmd = subparsers.add_parser(
        "show-entity-summary",
        help="Show compact entity summary with active step information",
    )
    show_entity_summary_group = show_entity_summary_cmd.add_mutually_exclusive_group(required=True)
    show_entity_summary_group.add_argument("--callsign", help="Entity callsign")
    show_entity_summary_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    list_confirmed_steps_cmd = subparsers.add_parser(
        "list-confirmed-steps",
        help="List confirmed steps by entity or for all entities",
    )
    list_confirmed_steps_cmd.add_argument("--callsign", help="Entity callsign")
    list_confirmed_steps_cmd.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    list_recent_artifacts_cmd = subparsers.add_parser(
        "list-recent-artifacts",
        help="List recent confirmed artifact-like results by entity or for all entities",
    )
    list_recent_artifacts_cmd.add_argument("--callsign", help="Entity callsign")
    list_recent_artifacts_cmd.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")
    list_recent_artifacts_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results")

    service_query_cmd = subparsers.add_parser(
        "service-query",
        help="Return machine-readable JSON for selected archivist query type",
    )
    service_query_cmd.add_argument(
        "query_type",
        choices=["active-step", "entity-summary", "recent-artifacts"],
        help="Type of structured query",
    )
    service_query_group = service_query_cmd.add_mutually_exclusive_group(required=True)
    service_query_group.add_argument("--callsign", help="Entity callsign")
    service_query_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")
    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")

    show_path_roots_cmd = subparsers.add_parser(
        "show-path-roots",
        help="Show configured and resolved logical path roots",
    )
    show_path_roots_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    resolve_logical_path_cmd = subparsers.add_parser(
        "resolve-logical-path",
        help="Resolve root key and relative path into absolute path",
    )
    resolve_logical_path_cmd.add_argument("root_key", help="Logical root key")
    resolve_logical_path_cmd.add_argument("relative_path", help="Relative path inside the root")
    resolve_logical_path_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    split_absolute_path_cmd = subparsers.add_parser(
        "split-absolute-path",
        help="Split absolute path into root key and relative path",
    )
    split_absolute_path_cmd.add_argument("absolute_path", help="Absolute path to split")
    split_absolute_path_cmd.add_argument(
        "--root",
        action="append",
        default=[],
        help="Override root in KEY=VALUE form; may be repeated",
    )

    list_bootstrap_packages_cmd = subparsers.add_parser(
        "list-bootstrap-packages",
        help="List bootstrap packages from a packages root",
    )
    list_bootstrap_packages_cmd.add_argument(
        "packages_root",
        nargs="?",
        default=DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
        help="Root directory with bootstrap packages",
    )

    show_bootstrap_package_summary_cmd = subparsers.add_parser(
        "show-bootstrap-package-summary",
        help="Show summary for a bootstrap package directory",
    )
    show_bootstrap_package_summary_cmd.add_argument(
        "package_dir",
        help="Bootstrap package directory",
    )

    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()

    if args.command == "init-db":
        return cmd_init_db(args)
    if args.command == "stats":
        return cmd_stats(args)
    if args.command == "index":
        return cmd_index(args)
    if args.command == "reindex":
        return cmd_reindex(args)
    if args.command == "search-name":
        return cmd_search_name(args)
    if args.command == "search-text":
        return cmd_search_text(args)
    if args.command == "show-file":
        return cmd_show_file(args)
    if args.command == "show-chat-package":
        return cmd_show_chat_package(args)
    if args.command == "show-copy-map":
        return cmd_show_copy_map(args)
    if args.command == "generate-copy-map-draft":
        return cmd_generate_copy_map_draft(args)
    if args.command == "classify-package-files":
        return cmd_classify_package_files(args)
    if args.command == "package-status-report":
        return cmd_package_status_report(args)
    if args.command == "build-context-manifest":
        return cmd_build_context_manifest(args)
    if args.command == "build-repo-manifest":
        return cmd_build_repo_manifest(args)
    if args.command == "build-repo-profile":
        return cmd_build_repo_profile(args)
    if args.command == "build-repo-start-context":
        return cmd_build_repo_start_context(args)
    if args.command == "check-copy-map-coverage":
        return cmd_check_copy_map_coverage(args)
    if args.command == "recommend-copy-map-additions":
        return cmd_recommend_copy_map_additions(args)
    if args.command == "build-copy-map-candidate":
        return cmd_build_copy_map_candidate(args)
    if args.command == "build-copy-map-append-patch":
        return cmd_build_copy_map_append_patch(args)
    if args.command == "register-entity":
        return cmd_register_entity(args)
    if args.command == "list-entities":
        return cmd_list_entities(args)
    if args.command == "show-entity-state":
        return cmd_show_entity_state(args)
    if args.command == "issue-step":
        return cmd_issue_step(args)
    if args.command == "mark-step-executed":
        return cmd_mark_step_executed(args)
    if args.command == "confirm-step-artifact":
        return cmd_confirm_step_artifact(args)
    if args.command == "list-steps":
        return cmd_list_steps(args)
    if args.command == "show-active-step":
        return cmd_show_active_step(args)
    if args.command == "show-entity-summary":
        return cmd_show_entity_summary(args)
    if args.command == "list-confirmed-steps":
        return cmd_list_confirmed_steps(args)
    if args.command == "list-recent-artifacts":
        return cmd_list_recent_artifacts(args)
    if args.command == "service-query":
        return cmd_service_query(args)
    if args.command == "show-path-roots":
        return cmd_show_path_roots(args)
    if args.command == "resolve-logical-path":
        return cmd_resolve_logical_path(args)
    if args.command == "split-absolute-path":
        return cmd_split_absolute_path(args)
    if args.command == "list-bootstrap-packages":
        return cmd_list_bootstrap_packages(args)
    if args.command == "show-bootstrap-package-summary":
        return cmd_show_bootstrap_package_summary(args)

    parser.error(f"Unknown command: {args.command}")
    return 2



def cmd_register_entity(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    entity_id = register_entity(
        db,
        callsign=args.callsign,
        contour=args.contour,
        role=args.role,
        package_path=args.package_path,
        status=args.status,
        current_phase=args.current_phase,
        current_step_title=args.current_step_title,
        next_allowed_action=args.next_allowed_action,
        notes=args.notes,
    )
    print(f"Entity registered: {args.callsign} (id={entity_id})")
    return 0


def cmd_list_entities(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    items = list_entities(db)
    print(render_entities_list(items), end="")
    return 0


def cmd_show_entity_state(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    item = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if item is None:
        print("Entity not found.")
        return 1
    print(render_entity_state(item), end="")
    return 0


def cmd_issue_step(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    step_id = issue_step(
        db,
        callsign=args.callsign,
        title=args.title,
        phase=args.phase,
        operation_type=args.operation_type,
        target_path=args.target_path,
        notes=args.notes,
    )
    print(f"Step issued: id={step_id}")
    return 0


def cmd_mark_step_executed(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    mark_step_executed(db, step_id=args.step_id, notes=args.notes)
    print(f"Step marked as executed: id={args.step_id}")
    return 0


def cmd_confirm_step_artifact(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    confirm_step_artifact(
        db,
        step_id=args.step_id,
        success_evidence=args.success_evidence,
        notes=args.notes,
    )
    print(f"Step confirmed: id={args.step_id}")
    return 0


def cmd_list_steps(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    items = list_steps(
        db,
        callsign=args.callsign,
        entity_id=args.entity_id,
        only_active=args.only_active,
    )
    print(render_steps_list(items), end="")
    return 0


def cmd_show_active_step(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if entity is None:
        print("Entity not found.")
        return 1

    item = get_active_step(
        db,
        entity_id=int(entity["id"]),
    )
    print(
        render_active_step(
            item,
            callsign=entity.get("callsign"),
            entity_id=entity.get("id"),
        ),
        end="",
    )
    return 0


def cmd_show_entity_summary(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if entity is None:
        print("Entity not found.")
        return 1

    active_step = get_active_step(
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


def cmd_list_confirmed_steps(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    items = list_confirmed_steps(
        db,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
    )
    print(render_confirmed_steps_list(items), end="")
    return 0


def cmd_list_recent_artifacts(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    items = list_recent_artifacts(
        db,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
        limit=getattr(args, "limit", 10),
    )
    print(render_recent_artifacts_list(items), end="")
    return 0


def cmd_service_query(args) -> int:
    db = _db_from_args(args)
    payload, exit_code = build_service_query_payload(
        db,
        query_type=args.query_type,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
        limit=getattr(args, "limit", 10),
    )
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return exit_code


def _build_path_roots_from_args(args) -> dict[str, str]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )


def _build_path_roots_detailed_from_args(args) -> dict[str, dict[str, str]]:
    overrides = parse_root_overrides(getattr(args, "root", []))
    return build_path_roots_detailed(
        config_path=getattr(args, "config_path", None),
        overrides=overrides,
    )


def cmd_show_path_roots(args) -> int:
    details = _build_path_roots_detailed_from_args(args)
    print(render_path_roots(details), end="")
    return 0


def cmd_resolve_logical_path(args) -> int:
    roots = _build_path_roots_from_args(args)
    item = resolve_logical_path(
        roots,
        root_key=args.root_key,
        relative_path=args.relative_path,
    )
    print(render_resolved_path(item), end="")
    return 0


def cmd_split_absolute_path(args) -> int:
    roots = _build_path_roots_from_args(args)
    item = split_absolute_path(
        roots,
        absolute_path=args.absolute_path,
    )
    print(render_split_path(item), end="")
    return 0


def cmd_list_bootstrap_packages(args) -> int:
    items = list_bootstrap_packages(args.packages_root)
    print(render_bootstrap_packages_list(items), end="")
    return 0


def cmd_show_bootstrap_package_summary(args) -> int:
    item = collect_bootstrap_package_summary(args.package_dir)
    print(render_bootstrap_package_summary(item), end="")
    return 0


def _db_from_args(args) -> Database:
    config = load_config(args.config_path)
    return Database(config.database_path)


def cmd_init_db(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    db.set_setting("schema_version", "1")
    print(f"Database initialized: {Path(db.database_path)}")
    return 0


def cmd_stats(args) -> int:
    db = _db_from_args(args)
    stats = db.get_stats()
    print("Archivist database stats")
    print(f"  total_files: {stats.total_files}")
    print(f"  text_files: {stats.text_files}")
    print(f"  chat_packages: {stats.chat_packages}")
    print(f"  last_index_finished_at: {stats.last_index_finished_at}")
    return 0


def cmd_index(args) -> int:
    config = load_config(args.config_path)
    db = Database(config.database_path)
    db.init_schema()
    logger = setup_logging(config.log_level)
    indexer = Indexer(config=config, db=db, logger=logger)
    summary = indexer.run_full_index()
    print("Index completed")
    for key, value in summary.items():
        print(f"  {key}: {value}")
    return 0


def cmd_reindex(args) -> int:
    config = load_config(args.config_path)
    db = Database(config.database_path)
    db.init_schema()
    logger = setup_logging(config.log_level)
    indexer = Indexer(config=config, db=db, logger=logger)
    summary = indexer.run_reindex()
    print("Reindex completed")
    for key, value in summary.items():
        print(f"  {key}: {value}")
    return 0


def cmd_search_name(args) -> int:
    db = _db_from_args(args)
    results = db.search_files_by_name(args.query, limit=args.limit)
    if not results:
        print("No files found.")
        return 0

    for item in results:
        print(f"[{item.file_id}] {item.name}")
        print(f"  path: {item.full_path}")
        print(f"  contour: {item.project_contour}")
        print(f"  chat_package: {item.chat_package_path}")
    return 0


def cmd_search_text(args) -> int:
    db = _db_from_args(args)
    results = db.search_files_by_text(args.query, limit=args.limit)
    if not results:
        print("No files found.")
        return 0

    for item in results:
        print(f"[{item.file_id}] {item.name}")
        print(f"  path: {item.full_path}")
        print(f"  contour: {item.project_contour}")
        print(f"  chat_package: {item.chat_package_path}")
        print(f"  snippet: {item.snippet}")
    return 0


def cmd_show_file(args) -> int:
    db = _db_from_args(args)
    data = db.get_file_by_id(args.file_id)
    if data is None:
        print("File not found.")
        return 1

    for key, value in data.items():
        print(f"{key}: {value}")
    return 0


def cmd_show_chat_package(args) -> int:
    db = _db_from_args(args)
    data = db.get_chat_package_by_id(args.package_id)
    if data is None:
        print("Chat package not found.")
        return 1

    for key, value in data.items():
        print(f"{key}: {value}")
    return 0


def cmd_show_copy_map(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    copy_map_path = package.get("copy_map_file_path")
    if not copy_map_path:
        print("Copy map is not set for this chat package.")
        return 1

    entries = parse_copy_map(copy_map_path)
    if not entries:
        print("Copy map is empty.")
        return 0

    print(f"Copy map for package: {package.get('package_name')}")
    print(f"  package_path: {package.get('package_path')}")
    print(f"  copy_map_file_path: {copy_map_path}")
    print()

    for idx, entry in enumerate(entries, start=1):
        print(f"[{idx}] {entry.source_filename}")
        print(f"  target_relative_directory: {entry.target_relative_directory}")

    return 0


def cmd_generate_copy_map_draft(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    if not package_path:
        print("Package path is not set.")
        return 1

    entries = collect_draft_copy_map_entries(package_path)
    draft_text = render_draft_copy_map(entries)

    print(f"Draft copy map for package: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print()

    if args.write:
        output_path = Path(package_path) / ".wb-copy-map.generated.tsv"
        output_path.write_text(draft_text, encoding="utf-8")
        print(f"Draft written to: {output_path}")
        print()

    print(draft_text, end="")
    return 0


def cmd_classify_package_files(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    if not package_path:
        print("Package path is not set.")
        return 1

    classified = classify_package_files(package_path)

    print(f"Package file classification: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print()

    for idx, item in enumerate(classified, start=1):
        print(f"[{idx}] {item.filename}")
        print(f"  file_type: {item.file_type}")
        print(f"  reason: {item.reason}")

    return 0


def cmd_package_status_report(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    if not package_path:
        print("Package path is not set.")
        return 1

    report = build_package_status_report(package_path)

    print(f"Package status report: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print(f"  total_files: {report.total_files}")
    print()

    for status_name, count in report.counts.items():
        print(f"  {status_name}: {count}")
    print()

    for status_name in sorted(report.files_by_type.keys()):
        print(f"{status_name}:")
        for filename in report.files_by_type[status_name]:
            print(f"  - {filename}")
        print()

    return 0


def cmd_build_context_manifest(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    package_name = package.get("package_name")

    if not package_path:
        print("Package path is not set.")
        return 1

    manifest = build_context_manifest(package_path)
    text = render_context_manifest(manifest, package_name or "unknown-package")
    print(text, end="")
    return 0


def cmd_build_repo_manifest(args) -> int:
    manifest = build_repo_manifest(args.repo_path)
    text = render_repo_manifest(manifest)

    if args.write:
        output_path = Path(default_repo_manifest_output_path(args.repo_path))
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(text, encoding="utf-8")
        print(f"Repository manifest written to: {output_path}")
        print()

    print(text, end="")
    return 0


def cmd_build_repo_profile(args) -> int:
    profile = build_repo_profile(args.repo_path)
    text = render_repo_profile(profile)

    if args.write:
        output_path = Path(default_repo_profile_output_path(args.repo_path))
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(text, encoding="utf-8")
        print(f"Repository profile written to: {output_path}")
        print()

    print(text, end="")
    return 0


def cmd_build_repo_start_context(args) -> int:
    context = build_repo_start_context(args.repo_path)
    text = render_repo_start_context(context)

    if args.write:
        output_path = Path(default_repo_start_context_output_path(args.repo_path))
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(text, encoding="utf-8")
        print(f"Repository start context written to: {output_path}")
        print()

    print(text, end="")
    return 0


def cmd_check_copy_map_coverage(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    copy_map_path = package.get("copy_map_file_path")

    if not package_path:
        print("Package path is not set.")
        return 1

    if not copy_map_path:
        print("Copy map is not set for this chat package.")
        return 1

    report = build_copy_map_coverage_report(package_path, copy_map_path)

    print(f"Copy map coverage for package: {package.get('package_name')}")
    print(f"  package_path: {report.package_path}")
    print(f"  copy_map_path: {report.copy_map_path}")
    print()
    print(f"  covered_files: {len(report.covered_files)}")
    print(f"  uncovered_files: {len(report.uncovered_files)}")
    print(f"  missing_from_package: {len(report.missing_from_package)}")
    print(f"  ignored_files: {len(report.ignored_files)}")
    print()

    if report.covered_files:
        print("Covered files:")
        for name in report.covered_files:
            print(f"  - {name}")
        print()

    if report.uncovered_files:
        print("Uncovered files:")
        for name in report.uncovered_files:
            print(f"  - {name}")
        print()

    if report.missing_from_package:
        print("Missing from package but referenced by copy map:")
        for name in report.missing_from_package:
            print(f"  - {name}")
        print()

    if report.ignored_files:
        print("Ignored files:")
        for name in report.ignored_files:
            print(f"  - {name}")
        print()

    return 0


def cmd_recommend_copy_map_additions(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    copy_map_path = package.get("copy_map_file_path")

    if not package_path:
        print("Package path is not set.")
        return 1

    if not copy_map_path:
        print("Copy map is not set for this chat package.")
        return 1

    recommendations = build_copy_map_recommendations(package_path, copy_map_path)

    print(f"Recommended copy map additions for package: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print(f"  copy_map_path: {copy_map_path}")
    print()

    if not recommendations:
        print("No uncovered files to recommend.")
        return 0

    for idx, item in enumerate(recommendations, start=1):
        print(f"[{idx}] {item.source_filename}")
        print(f"  file_type: {item.file_type}")
        print(f"  suggested_target_relative_directory: {item.suggested_target_relative_directory}")
        print(f"  reason: {item.reason}")
        print()

    print("Suggested lines to append:")
    print(render_copy_map_recommendations(recommendations), end="")
    return 0


def cmd_build_copy_map_candidate(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    copy_map_path = package.get("copy_map_file_path")

    if not package_path:
        print("Package path is not set.")
        return 1

    if not copy_map_path:
        print("Copy map is not set for this chat package.")
        return 1

    candidate_entries = build_copy_map_candidate(package_path, copy_map_path)
    candidate_text = render_copy_map_candidate(candidate_entries)

    print(f"Copy map candidate for package: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print(f"  source_copy_map_path: {copy_map_path}")
    print()

    if args.write:
        output_path = Path(package_path) / ".wb-copy-map.candidate.tsv"
        output_path.write_text(candidate_text, encoding="utf-8")
        print(f"Candidate written to: {output_path}")
        print()

    print(candidate_text, end="")
    return 0


def cmd_build_copy_map_append_patch(args) -> int:
    db = _db_from_args(args)
    package = db.get_chat_package_by_id(args.package_id)
    if package is None:
        print("Chat package not found.")
        return 1

    package_path = package.get("package_path")
    copy_map_path = package.get("copy_map_file_path")

    if not package_path:
        print("Package path is not set.")
        return 1

    if not copy_map_path:
        print("Copy map is not set for this chat package.")
        return 1

    report = build_copy_map_append_patch(package_path, copy_map_path)
    patch_text = render_append_patch(report.append_entries)

    print(f"Copy map append patch for package: {package.get('package_name')}")
    print(f"  package_path: {package_path}")
    print(f"  source_copy_map_path: {copy_map_path}")
    print()
    print(f"  append_entries: {len(report.append_entries)}")
    print(f"  skipped_entries: {len(report.skipped_entries)}")
    print()

    if report.skipped_entries:
        print("Skipped entries requiring manual decision:")
        for item in report.skipped_entries:
            print(f"  - {item.source_filename}")
            print(f"    file_type: {item.file_type}")
            print(f"    reason: {item.reason}")
        print()

    if args.write:
        output_path = Path(package_path) / ".wb-copy-map.append.tsv"
        output_path.write_text(patch_text, encoding="utf-8")
        print(f"Append patch written to: {output_path}")
        print()

    print("Append-ready lines:")
    print(patch_text, end="")
    return 0
