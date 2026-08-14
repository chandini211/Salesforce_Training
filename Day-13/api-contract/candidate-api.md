# External Recruitment Candidate API Contract

## 1. Purpose

This API is used to send selected student candidate information from the Salesforce Placement Management System to an external recruitment platform.

The integration is triggered when an Application record becomes Selected.

---

## 2. Endpoint

### Method

POST

### Endpoint

/candidates

### Full Endpoint

The actual external API URL is configured through a Salesforce Named Credential.

---

## 3. Request Headers

```http
Content-Type: application/json
Accept: application/json