# SETUP

This file explains what is being installed and how the skill package connects to the backend.

## Mental Model

There are three layers:

1. backend service  
   The real implementation. It stores resumes, runs search, evaluates fit, tailors resumes, and generates downstream artifacts.

2. skill package  
   This repository. It tells an ordinary agent which backend endpoints to call and in what order.

3. host agent  
   Hermes or another general agent. It reads the Markdown skills and performs the HTTP requests.

So the skills do not replace the backend. They orchestrate it.

## What the Install Script Does

The install scripts copy:

- `skills/`
- `examples/`

into a local destination directory.

Default locations:

- Windows: `%USERPROFILE%\.hermes-jobseeker-skills`
- Mac/Linux: `$HOME/.hermes-jobseeker-skills`

The scripts do not install the backend and do not install Python dependencies for the backend. That is a separate step.

## Dynamic Port Contract

These skills assume the backend resolves its port using:

1. `BACKEND_PORT`
2. `PORT`
3. default `8001`

The client side follows the same rule:

1. `BACKEND_URL`
2. `http://127.0.0.1:${BACKEND_PORT}`
3. `http://127.0.0.1:${PORT}`
4. `http://127.0.0.1:8001`

This matters because Windows may reject binding or connecting on `8000` in some local environments. Do not hardcode `8000`.

## What an Agent Actually Does

Example job-screening path:

1. read `skills/filtering-jobs-multilingual.md`
2. resolve backend URL from env
3. call `GET /api/v1/health`
4. call `GET /api/v1/resumes/list`
5. call `POST /api/v1/jobs/search/seek` or `POST /api/v1/jobs/search/doda`
6. optionally call `POST /api/v1/evaluate-job`
7. return a shortlist

Example resume-tailoring path:

1. read `skills/tailoring-resume-to-jd.md`
2. resolve backend URL from env
3. call `POST /api/v1/jobs/upload`
4. call `POST /api/v1/resumes/improve/preview` or `POST /api/v1/resumes/improve`
5. optionally call `POST /api/v1/resumes/improve/confirm`
6. optionally call cover-letter or PDF endpoints

## If the Host Agent Has No Browser Automation

That is fine.

The agent can still:

- screen jobs
- score fit
- tailor resumes
- generate textual outputs

Browser automation only helps with:

- opening live job listings
- comparing real page content
- stepping through application forms

Without browser support, the agent should return links and next steps instead.
