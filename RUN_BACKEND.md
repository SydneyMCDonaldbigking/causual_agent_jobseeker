# RUN_BACKEND

This file is for friends who need to run the actual backend locally.

## Source Repository

Clone:

```bash
git clone https://github.com/SydneyMCDonaldbigking/ai-job-mediator-no-api.git
cd ai-job-mediator-no-api
git checkout main
```

## Recommended Port

The backend now supports dynamic port configuration:

1. `BACKEND_PORT`
2. `PORT`
3. default `8001`

Recommended local default:

```bash
BACKEND_PORT=8001
```

## Minimal Run Command

If the environment already has project dependencies installed:

```bash
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8001
```

If you want to keep the port dynamic and explicit:

```bash
BACKEND_PORT=8001
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port "$BACKEND_PORT"
```

Windows PowerShell example:

```powershell
$env:BACKEND_PORT="8001"
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8001
```

## Health Check

Once it is running, verify:

```bash
curl http://127.0.0.1:8001/api/v1/health
```

Or if using a different dynamic port:

```bash
curl "$BACKEND_URL/api/v1/health"
```

## Pair It With the Skills

After the backend is up, install the skills repository and set one of:

Best:

```bash
BACKEND_URL=http://127.0.0.1:8001
```

Or:

```bash
BACKEND_PORT=8001
```

## Common Failure Modes

### 1. The agent has the skills but no backend

Symptoms:

- health check fails
- all job-screening and tailoring calls fail

Fix:

- run the backend locally, or
- point the skills at a deployed backend with `BACKEND_URL`

### 2. Backend is on the wrong port

Symptoms:

- requests still try `8000`
- connection refused

Fix:

- set `BACKEND_URL`
- or set `BACKEND_PORT`
- do not rely on `8000`

### 3. Browser-dependent steps are unavailable

Symptoms:

- the agent can rank jobs but cannot inspect live listings

Fix:

- use a host agent with browser automation, or
- have the agent return URLs and manual next steps
