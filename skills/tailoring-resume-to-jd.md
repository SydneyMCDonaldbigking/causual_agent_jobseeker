# Tailoring Resume To JD

## Purpose

Use this skill when an agent needs to turn a stored master resume into a JD-specific application package through the local Job Mediator backend.

This skill is for:

- uploading or selecting the working resume
- uploading a JD
- previewing tailored changes
- persisting a tailored resume
- generating cover letters, outreach, and PDFs

## Dynamic Backend URL

Resolve the backend URL in this order:

1. `BACKEND_URL`
2. `http://127.0.0.1:${BACKEND_PORT}`
3. `http://127.0.0.1:${PORT}`
4. `http://127.0.0.1:8001`

Never assume `8000`.

## Workflow

1. Check backend health.
2. Find or upload the right language-specific master resume.
3. Set content language for the output the user wants.
4. Upload the target JD.
5. Optionally run fit scoring before tailoring.
6. Choose mode:
   - preview before save
   - direct persist
7. If preview is used and accepted, confirm and persist it.
8. Optionally generate:
   - cover letter
   - outreach message
   - resume PDF
   - direct tailored PDF

## Decision Rule

Default to preview when the user says:

- review
- compare
- inspect
- tweak
- check first

Use direct persist when the user clearly wants a ready-to-use tailored resume immediately.

## Multilingual Policy

- `en`: strong default for Australian and international roles
- `zh`: use when the user wants Chinese-facing output or explanations
- `ja`: use when tailoring for Japanese-market roles

Keep these separate:

- resume language
- JD language
- requested output language

## Output Format

Include:

- active resume id
- job id
- preview or persisted status
- top tailoring priorities
- major changed areas
- generated artifacts available
- recommended next step

## Browser Handoff

If the host agent supports browser automation, use it after tailoring to:

- compare the tailored resume against the live job page
- inspect application forms
- continue into logged-in application flows

If browser support is missing, provide the next manual application steps clearly.
