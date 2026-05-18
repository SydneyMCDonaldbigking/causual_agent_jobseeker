# Backend API Workflows

Default API prefix:

```text
/api/v1
```

Resolve backend URL dynamically:

1. `BACKEND_URL`
2. `http://127.0.0.1:${BACKEND_PORT}`
3. `http://127.0.0.1:${PORT}`
4. `http://127.0.0.1:8001`

## Health

```http
GET /api/v1/health
```

## Language Config

```http
GET /api/v1/config/language
PUT /api/v1/config/language
```

## Upload Resume

```http
POST /api/v1/resumes/upload
Content-Type: multipart/form-data
```

Fields:

- `file`
- `resume_language`

## List Resumes

```http
GET /api/v1/resumes/list
```

## Upload Job Description

```http
POST /api/v1/jobs/upload
Content-Type: application/json
```

## Search SEEK

```http
POST /api/v1/jobs/search/seek
Content-Type: application/json
```

## Search doda

```http
POST /api/v1/jobs/search/doda
Content-Type: application/json
```

## Evaluate Resume vs JD

```http
POST /api/v1/evaluate-job
Content-Type: application/json
```

## Translate JD to Chinese

```http
POST /api/v1/translate-job-description
Content-Type: application/json
```

## Tailor Resume Preview

```http
POST /api/v1/resumes/improve/preview
Content-Type: application/json
```

## Tailor Resume Persist

```http
POST /api/v1/resumes/improve
Content-Type: application/json
```

## Confirm Preview

```http
POST /api/v1/resumes/improve/confirm
Content-Type: application/json
```

## Generate Cover Letter

```http
POST /api/v1/resumes/{resume_id}/generate-cover-letter
```

## Generate Outreach Message

```http
POST /api/v1/resumes/{resume_id}/generate-outreach
```

## Download Resume PDF

```http
GET /api/v1/resumes/{resume_id}/pdf
```
