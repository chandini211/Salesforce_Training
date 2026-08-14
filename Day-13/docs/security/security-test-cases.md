# Security Test Cases

| # | Scenario | Expected Result |
|---|---|---|
| 1 | Student views own Application | Allowed |
| 2 | Student views another student's Application | Denied |
| 3 | Student changes Selection Status | Denied |
| 4 | Student changes Interview Result | Denied |
| 5 | Student changes Offer Status | Denied |
| 6 | Student edits Recruiter Notes | Denied |
| 7 | Student modifies another student's profile | Denied |
| 8 | Placement Officer reviews Application | Allowed |
| 9 | Recruiter views authorised candidate | Allowed |
| 10 | Recruiter views unrelated confidential information | Denied |
| 11 | User changes Application record Id to another student's record | Denied |
| 12 | User attempts to call restricted Apex directly | Denied |
| 13 | User attempts to access confidential fields | Denied |
| 14 | Unauthorised integration attempts to access data | Denied |

## Security Testing Questions

For every major feature ask:

1. Can the intended user perform the action?
2. Can an unintended user perform the action?
3. Can the user see too much?
4. Can the user modify too much?
5. Can the user bypass the UI?

## Attack-Oriented Tests

Attempt to:

- Change record Ids
- Call Apex directly
- Modify request parameters
- Access protected fields
- Access another user's record
- Use a different UI
- Invoke an API directly

## Evidence

Record:

- Attempt
- Expected Result
- Actual Result
- Risk
- Fix