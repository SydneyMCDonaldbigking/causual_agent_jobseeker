# SEEK Gmail Native Apply

## Purpose

Use this skill when an agent needs to turn SEEK recommendation emails into live applications using an already prepared resume, without calling the resume-tailoring backend.

This skill is for:

- reading SEEK recommendation emails from Gmail
- screening recommended jobs
- applying through SEEK with the saved/native resume
- writing inline cover letters
- avoiding duplicate applications
- recording submitted jobs

It is not for rewriting the resume. Use `tailoring-resume-to-jd.md` only when the user explicitly wants a tailored resume or generated PDF.

## Preconditions

The host agent should have:

- Gmail or mailbox search/read access
- browser automation for authenticated SEEK pages
- a known active SEEK account and matching mailbox
- an already prepared resume selected or available in SEEK
- user authorization to submit applications directly

Optional but useful:

- a local applied-jobs log
- a structured application profile or answer memory
- access to SEEK success emails for confirmation

## Native Resume Mode

When the user says to use the original, native, current, uploaded, or saved resume:

1. Do not call resume-tailoring endpoints.
2. Do not generate a new PDF.
3. Prefer the saved SEEK resume whose filename matches the current resume.
4. If the saved resume is missing, upload the current resume only if the user has already identified it.
5. On the review page, verify the displayed resume filename before submitting.

## Account Check

Before applying, verify the active mailbox and SEEK account.

- Gmail profile should match the mailbox the user requested.
- SEEK review page should show the expected account email and phone/contact details.
- If the mailbox and SEEK account are mismatched, stop before submitting.
- If the user has already told the agent not to ask and the account pairing is visible and consistent, proceed.

## Gmail Search

Use Gmail search syntax or equivalent mailbox filters:

```text
from:(noreply@s.seek.com.au) (SEEK OR seek) newer_than:2d -in:spam -in:trash
```

For a specific day, use absolute dates:

```text
from:(noreply@s.seek.com.au) (SEEK OR seek) after:YYYY/MM/DD -in:spam -in:trash
```

Read only relevant recommendation emails and SEEK submission confirmations. Do not inspect unrelated mail.

## Extract Jobs

From each recommendation email, extract:

- role title
- company
- location
- salary if visible
- recommendation badges such as strong applicant
- tracking URL

Resolve tracking URLs through the browser when possible. Use the final SEEK URL and job id for deduplication.

## Duplicate Checks

Before applying:

1. Check local application records if available.
2. Check the SEEK page for already-applied text.
3. Check recent SEEK success emails.
4. Treat matching job ids as duplicates even if titles differ slightly.

Skip duplicates silently unless the user asks for a detailed report.

## Screening Rules

Prefer jobs that match early-career software, AI, automation, data, full-stack, intern, graduate, junior, associate, or assistant roles.

Good signals:

- junior, graduate, intern, entry-level, associate
- AI tools, LLM, RAG, automation, workflow, chatbot, Python
- no fixed years requirement
- student-compatible part-time or internship work
- SEEK quick apply
- employer questions are answerable from confirmed profile memory

Skip or hold when:

- the page says the role is closed
- the role has hard citizen, permanent resident, or clearance requirements the profile does not satisfy
- the role asks for senior, lead, principal, or 3+ years when the profile is junior
- the role requires a third-party account signup the user has not authorized
- the form asks for unknown sensitive facts
- the form asks for CAPTCHA, identity verification, payment, bank, tax, passport, or password data
- the application leaves SEEK and requires a full external ATS profile with unknown address or legal details

For borderline roles, apply only when the hard requirements are absent and the skills overlap is meaningful.

## Cover Letter

Write a fresh inline cover letter for each application.

Keep it:

- truthful to confirmed profile memory
- targeted to the role
- concise, usually 3 to 5 short paragraphs
- focused on projects, coursework, product experience, and learning ability

If the job advertisement asks specific cover-letter questions, answer them directly in the letter.

Do not claim unconfirmed tools, certifications, citizenship, permanent residency, professional years, clearance, degrees, or licenses.

## Employer Questions

Use only confirmed answers from local profile memory or prior user instructions.

Safe patterns:

- work rights: answer exactly from confirmed visa/work-rights memory
- expected salary: use the confirmed target if available
- notice period: use the confirmed notice period if available
- years of experience: answer conservatively
- programming languages: select only confirmed languages

Stop and ask the user when a question involves:

- legal identity or background checks
- work rights not covered by confirmed wording
- sponsorship if not already confirmed
- driver license
- security clearance
- demographic or diversity information
- health, disability, criminal history, or other protected attributes
- exact street address if not already known

## Submit Flow

For each selected job:

1. Open the SEEK job page.
2. Confirm it is still open and not already applied.
3. Start quick apply.
4. Confirm the saved/native resume is selected.
5. Replace any stale cover letter with a fresh one.
6. Complete employer questions using confirmed answers.
7. Continue through profile review without adding unverified profile items.
8. On review, verify:
   - resume filename
   - cover letter exists
   - employer questions complete
   - account contact details
9. Do not opt into strong interest, SEEK Pass, identity verification, or extra promotional features unless the user explicitly asks.
10. Submit.
11. Confirm the success page says the application was sent.
12. Optionally confirm via Gmail success email.

## Recording Results

After each confirmed submission, append a record with:

- date
- source
- company
- role
- job id
- URL
- resume filename
- cover letter summary
- account email if safe to store locally
- status
- employer question count
- confirmation text

Keep public repositories sanitized. Do not commit personal details, resumes, raw application logs, account emails, phone numbers, addresses, visa details, or salary answers.

## Output Format

Summarize the run with:

- submitted jobs
- skipped duplicates
- skipped hard mismatches
- external-account blockers
- validation or confirmation method

Example:

```text
Submitted:
- Company - Role - job id

Skipped:
- Company - reason

Confirmed by:
- SEEK success page
- Gmail success email
```

## Common Mistakes

- Reusing the previous cover letter textarea without replacing it
- Applying with a tailored or stale resume when the user asked for native resume
- Trusting email recommendations without opening the live SEEK page
- Submitting after an account mismatch
- Answering years, citizenship, clearance, or license questions optimistically
- Clicking strong interest or SEEK Pass prompts after submission
