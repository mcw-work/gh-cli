# gh-cli SDK

This directory contains a regular `sdkcraft` SDK scaffold for packaging the
GitHub CLI for Workshop.

## What it does

- downloads the official GitHub CLI release archive during build
- exposes `gh` in Workshop shell sessions
- preserves `/home/workshop/.config/gh` across Workshop refreshes
- reports SDK health through `workshopctl set-health`

## Local workflow

1. Install `sdkcraft` and ensure LXD is available.
2. From this directory, run `sdkcraft try`.
3. In a Workshop definition, reference the SDK as `try-gh-cli`.

Example:

```yaml
name: dev
base: ubuntu@24.04
sdks:
  - name: try-gh-cli
```

## Local validation in this workspace

This workspace currently does not have `sdkcraft` installed, so the scaffold was
validated structurally with:

```bash
bash tests/validate-github-cli-sdk.sh
```
