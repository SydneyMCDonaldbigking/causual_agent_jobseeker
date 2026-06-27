# QUICKSTART

This is the fastest path for a friend who wants to actually use these skills.

## What You Need

You need two things:

1. the backend code  
   [ai-job-mediator-no-api](https://github.com/SydneyMCDonaldbigking/ai-job-mediator-no-api)

2. this skills repository  
   [causual_agent_jobseeker](https://github.com/SydneyMCDonaldbigking/causual_agent_jobseeker)

This repository alone is not enough. It teaches an agent how to call the backend, but it does not contain the backend implementation itself.

## Fastest Local Setup

### Step 1: Clone and run the backend

```bash
git clone https://github.com/SydneyMCDonaldbigking/ai-job-mediator-no-api.git
cd ai-job-mediator-no-api
git checkout main
```

Then start the backend on the default dynamic port:

```bash
BACKEND_PORT=8001
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8001
```

If your environment prefers `PORT`, that works too:

```bash
PORT=8001
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8001
```

### Step 2: Clone this repository

```bash
git clone https://github.com/SydneyMCDonaldbigking/causual_agent_jobseeker.git
cd causual_agent_jobseeker
```

### Step 3: Install the skills

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

Mac or Linux:

```bash
bash ./scripts/install.sh
```

### Step 4: Point the agent at the backend

Best option:

```bash
BACKEND_URL=http://127.0.0.1:8001
```

Or let the client build the URL dynamically:

```bash
BACKEND_PORT=8001
```

### Step 5: Use the skills

Now the agent can:

- shortlist SEEK jobs
- shortlist doda jobs
- translate JDs into Chinese
- score resume-vs-JD fit
- preview tailored resume changes
- persist tailored resumes
- generate cover letters and PDF outputs
- read SEEK recommendation emails and apply with a saved/native resume when browser automation is available

For Gmail-driven SEEK applications without resume tailoring, read:

```text
skills/seek-gmail-native-apply.md
```

## If You Already Have a Hosted Backend

You do not need to clone the backend code if somebody already deployed it.

Just install this repository and set:

```bash
BACKEND_URL=https://your-backend.example.com
```

Then the agent can use the same flows remotely.
