# Permission Matrix

## User Personas

| Object / Capability | Student | Placement Officer | Recruiter | Administrator |
|---|---|---|---|---|
| Student Profile | Own | Read | — | CRUD |
| Job | Read | CRUD | Read | CRUD |
| Application | Own | Read/Update | Relevant | CRUD |
| Interview | Own | CRUD | Relevant | CRUD |
| Offer | Own | CRUD | Relevant | CRUD |

## Student Restrictions

Students must not:

- Modify another student's profile
- Modify another student's Application
- Change Selection Status
- Change Interview Result
- Change Offer Status
- Modify Recruiter Notes
- Access confidential recruiter information

## Sensitive Fields

The following fields require special consideration:

- Selection_Status__c
- Interview_Result__c
- Offer_Status__c
- Recruiter_Notes__c
- Internal_Recommendation__c

## Security Layers

Object permission:
- Determines whether the user can access the object.

Field-Level Security:
- Determines whether the user can access individual fields.

Record-Level Security:
- Determines whether the user can access a particular record.