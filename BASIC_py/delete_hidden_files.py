#!/usr/bin/env python3
"""
delete_hidden_mac_files.py

Deletes:
  - files starting with "._"
  - files starting with ".__"
  - files starting with "."
Optionally recursive.

Examples:
  python delete_hidden_mac_files.py --dry-run
  python delete_hidden_mac_files.py
  python delete_hidden_mac_files.py --recursive
"""

from __future__ import annotations

import argparse
import os
from pathlib import Path


def should_delete(path: Path) -> bool:
    name = path.name
    return name.startswith("._") or name.startswith(".__") or name.startswith(".")


def iter_paths(root: Path, recursive: bool):
    if recursive:
        # rglob("*") returns files and dirs; we only delete files/links.
        yield from root.rglob("*")
    else:
        yield from root.iterdir()


def delete_paths(root: Path, recursive: bool, dry_run: bool) -> int:
    deleted = 0
    for p in iter_paths(root, recursive):
        # Only delete files/symlinks; don't remove directories like ".git"
        try:
            is_file_or_link = p.is_file() or p.is_symlink()
        except OSError:
            # Broken symlink or permission issue while stat-ing
            is_file_or_link = p.is_symlink()

        if not is_file_or_link:
            continue

        if should_delete(p):
            if dry_run:
                print(f"[DRY-RUN] would delete: {p}")
            else:
                try:
                    p.unlink()
                    print(f"deleted: {p}")
                    deleted += 1
                except PermissionError:
                    print(f"SKIP (permission): {p}")
                except FileNotFoundError:
                    pass
                except OSError as e:
                    print(f"SKIP (error {e}): {p}")
    return deleted


def main():
    parser = argparse.ArgumentParser(description="Delete macOS hidden/junk files in the current directory.")
    parser.add_argument(
        "--recursive",
        action="store_true",
        help="Also search and delete in subdirectories.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print what would be deleted without deleting anything.",
    )
    args = parser.parse_args()

    root = Path.cwd()
    print(f"Working directory: {root}")
    if args.dry_run:
        print("Dry run enabled (no files will be deleted).")

    count = delete_paths(root, recursive=args.recursive, dry_run=args.dry_run)
    if args.dry_run:
        print("Dry run complete.")
    else:
        print(f"Done. Deleted {count} file(s).")


if __name__ == "__main__":
    main()
