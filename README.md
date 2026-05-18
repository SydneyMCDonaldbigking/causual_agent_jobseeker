# Causual Agent Jobseeker

Portable, host-agnostic job-seeking skills for ordinary agents such as Hermes.

This repository packages:

- multilingual job screening workflows
- JD-to-resume tailoring workflows
- backend API call examples
- dynamic port examples
- install scripts that do not depend on Codex-only features

## What This Is

These files are designed for agents that can:

- read Markdown instructions
- make HTTP requests
- optionally use shell access
- optionally use browser automation

They do **not** require Codex plugin APIs, Chrome-specific hooks, or private skill discovery.

## Start Here

If you are using this package for the first time, read these in order:

1. `QUICKSTART.md`
2. `SETUP.md`
3. `RUN_BACKEND.md`

## Folder Layout

- `skills/`
  - `filtering-jobs-multilingual.md`
  - `tailoring-resume-to-jd.md`
- `examples/`
  - `.env.example`
  - `backend-api-workflows.md`
  - `curl-examples.md`
- `scripts/`
  - `install.ps1`
  - `install.sh`

## Dynamic Port Rule

This package assumes the backend uses dynamic port resolution with this priority:

1. `BACKEND_PORT`
2. `PORT`
3. default `8001`

Client-side examples follow the same rule:

1. use `BACKEND_URL` if present
2. else build `http://127.0.0.1:<BACKEND_PORT>`
3. else build `http://127.0.0.1:<PORT>`
4. else default to `http://127.0.0.1:8001`

Do not hardcode `8000`.

## Install

### PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### Bash

```bash
bash ./scripts/install.sh
```

Both scripts copy the package into a local destination directory for your host agent. By default they install into:

- Windows: `%USERPROFILE%\.hermes-jobseeker-skills`
- Unix: `$HOME/.hermes-jobseeker-skills`

## Backend Pairing

These skills are intended to pair with the backend in:

[ai-job-mediator-no-api](https://github.com/SydneyMCDonaldbigking/ai-job-mediator-no-api)

Recommended backend branch for current behavior:

- `main`

That backend now supports dynamic port configuration and defaults to `8001`.

Important: this repository is only the skill package. It does not contain the full backend implementation. To get real job screening and resume-tailoring behavior, you must either:

- run the backend from `ai-job-mediator-no-api`, or
- point these skills at an already deployed backend service

## Browser Guidance

If your host agent supports browser automation, use it for:

- reading live job listings
- comparing shortlisted postings
- continuing into authenticated application flows

If your host agent does not support browser automation, use the HTTP flows and summarize the next manual step for the user.
