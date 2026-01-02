#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "pygit2",
#     "typer",
#     "tqdm",
#     "types-tqdm"
# ]
# ///

# type check with:
# uvx --with-requirements bin/git-patches.py mypy bin/git-patches.py

"""Generate one patch file per changed file between a tag and HEAD."""

import sys
from pathlib import Path
from typing import Annotated

import pygit2
import typer
from tqdm import tqdm


def main(
    base_ref: Annotated[
        str, typer.Argument(help="Base reference (tag, branch, or commit)")
    ] = "HEAD^",
    target: Annotated[str, typer.Argument(help="Target reference")] = "HEAD",
    output: Annotated[
        Path,
        typer.Option(
            "-o",
            help="Output directory",
            file_okay=False,
            dir_okay=True,
            writable=True,
        ),
    ] = Path("patches"),
    ext: Annotated[str, typer.Option("-e", help="Patch file extension")] = ".patch",
):
    # Create output directory if it doesn't exist
    output.mkdir(parents=True, exist_ok=True)

    repo = pygit2.Repository(pygit2.discover_repository("."))

    try:
        base = repo.revparse_single(base_ref)
        target_ref = repo.revparse_single(target)
    except KeyError as e:
        sys.exit(f"Error: Could not find ref {e}")

    # Cast to Commit objects for diff
    base_commit = base.peel(pygit2.Commit)
    target_commit = target_ref.peel(pygit2.Commit)

    diff = repo.diff(base_commit, target_commit)

    print(f"Generating patches for {len(diff)} files...")

    for patch in tqdm(diff, desc="Writing patches"):
        if patch is None:
            continue

        filename = patch.delta.new_file.path or patch.delta.old_file.path
        safe_name = filename.replace("/", "_") + ext
        output_path = output / safe_name

        patch_text = patch.text
        if patch_text is not None:
            output_path.write_text(patch_text)

    print(f"\nDone. Patches written to {output}/")


if __name__ == "__main__":
    typer.run(main)
