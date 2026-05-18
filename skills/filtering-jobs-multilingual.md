# Filtering Jobs Multilingual

## Purpose

Use this skill when an agent needs to screen jobs in English, Chinese, or Japanese using a local Job Mediator backend.

This skill is for:

- SEEK search
- doda search
- JD translation to Chinese
- resume-versus-JD scoring
- shortlist production

It is not for final resume rewriting. Use `tailoring-resume-to-jd.md` after a target job is chosen.

## Preconditions

The host agent should have at least one of:

- HTTP request capability
- shell access with `curl`, `Invoke-RestMethod`, or similar

Optional but useful:

- browser automation for live listing inspection

## Dynamic Backend URL

Resolve the backend URL in this order:

1. `BACKEND_URL`
2. `http://127.0.0.1:${BACKEND_PORT}`
3. `http://127.0.0.1:${PORT}`
4. `http://127.0.0.1:8001`

Never assume `8000`.

## Workflow

1. Check backend health.
2. Ensure the correct resume exists for the market language.
3. Set content language if the user wants output in `en`, `zh`, or `ja`.
4. Search:
   - use SEEK for English or Australia-facing searches
   - use doda for Japanese-market searches
5. For promising jobs, run fit scoring.
6. If needed, translate the JD to Chinese for explanation.
7. Return a shortlist with score, evidence, risks, and next action.

## Language Rules

- `en`: use for Australia and most international backend roles
- `zh`: use for Chinese explanations or Chinese-facing support text
- `ja`: prefer when operating on Japanese resumes or Japanese-market roles

Keep resume language and output language separate in your reasoning.

## Output Format

For each shortlisted role, include:

- role title
- company
- source
- location
- fit score
- why it matches
- main risk
- next step

## Browser Handoff

If the host agent supports browser automation, use it after ranking to:

- inspect the real listing page
- compare similar listings
- continue into application flows

If browser automation is unavailable, give the listing URL and summarize what the user should inspect manually.
