# Salesforce Security Model

## 1. Security Objective

The Placement Management System follows a layered Salesforce security model.

The main objective is to ensure that users can access only the data and operations required for their responsibilities.

## 2. User Personas

The application has four major user personas:

- Student
- Placement Officer
- Recruiter
- Administrator

## 3. Student

Students should be able to:

- View their own profile
- View eligible jobs
- Apply for jobs
- View their own applications
- Update permitted profile information

Students should not be able to:

- View another student's application
- Modify another student's profile
- Change Selection Status
- Change Interview Result
- Change Offer Status
- View Recruiter Notes

## 4. Placement Officer

Placement Officers should be able to:

- Create jobs
- Review applications
- Update interview results
- Manage placement information
- View student placement records
- Manage appropriate placement workflows

## 5. Recruiter

Recruiters should be able to:

- View candidates relevant to their assigned jobs
- Update authorised interview information
- View selected candidate information

Recruiters should not receive unrelated confidential information.

## 6. Administrator

Administrators may have broader administrative access.

However, administrative privileges should still follow the principle of least privilege.

## 7. Three Security Levels

Salesforce security is considered at three levels:

### Object-Level Security

Determines whether the user can access an object.

Example:

Application__c

### Field-Level Security

Determines whether the user can access a particular field.

Example:

- Selection_Status__c
- Recruiter_Notes__c
- Internal_Recommendation__c

### Record-Level Security

Determines whether the user can access a particular record.

Example:

A student should access their own Application record but not another student's Application record.

## 8. Profiles

Profiles provide baseline permissions and settings.

They can control:

- Object permissions
- Field permissions
- System permissions
- Application access
- Login settings

## 9. Permission Sets

Permission Sets provide additional capabilities without creating many specialised Profiles.

Example:

Placement Officer Profile
+
Interview Management Permission Set
+
Offer Management Permission Set

## 10. Roles

Roles primarily participate in the record access hierarchy and reporting structure.

Example:

Placement Director
↓
Placement Manager
↓
Placement Officer
↓
Coordinator

## 11. Organization-Wide Defaults

OWD provides the baseline record-sharing model.

For sensitive objects such as Application__c, a restrictive baseline such as Private can be considered.

## 12. Sharing Rules

Sharing Rules can extend record access when business requirements require additional visibility.

## 13. Apex Security

Apex sharing behaviour must be deliberately reviewed.

The application should explicitly consider:

- with sharing
- without sharing
- inherited sharing
- CRUD
- FLS
- user context
- system context

## 14. Least Privilege

Users and integrations should receive only the permissions required for their legitimate responsibilities.

## 15. Security Principle

UI restrictions are not a security boundary.

Important permissions must be enforced at the server and data layers.

## 16. Security Architecture

User
↓
Authentication
↓
Object / Field Access + Record Access
↓
Profile / Permission Sets + OWD / Roles / Sharing
↓
Secure Apex
↓
Business Services
↓
Salesforce Database / External Systems