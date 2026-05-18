# Curl Examples

Assume:

```bash
export BACKEND_URL="${BACKEND_URL:-http://127.0.0.1:${BACKEND_PORT:-${PORT:-8001}}}"
```

## Health

```bash
curl "$BACKEND_URL/api/v1/health"
```

## Set Language

```bash
curl -X PUT "$BACKEND_URL/api/v1/config/language" \
  -H "Content-Type: application/json" \
  -d '{"ui_language":"en","content_language":"zh"}'
```

## Upload JD

```bash
curl -X POST "$BACKEND_URL/api/v1/jobs/upload" \
  -H "Content-Type: application/json" \
  -d '{"resume_id":"resume-id","job_descriptions":["Responsibilities: build APIs\nRequirements: Python and FastAPI"]}'
```

## SEEK Search

```bash
curl -X POST "$BACKEND_URL/api/v1/jobs/search/seek" \
  -H "Content-Type: application/json" \
  -d '{"resume_id":"resume-id","location":"Sydney NSW"}'
```

## Evaluate JD Fit

```bash
curl -X POST "$BACKEND_URL/api/evaluate-job" \
  -H "Content-Type: application/json" \
  -d '{"resume":{"summary":"Senior backend engineer"},"job_description":"Responsibilities: build APIs"}'
```

## Tailor Resume Preview

```bash
curl -X POST "$BACKEND_URL/api/v1/resumes/improve/preview" \
  -H "Content-Type: application/json" \
  -d '{"resume_id":"resume-id","job_id":"job-id","prompt_id":"default"}'
```
