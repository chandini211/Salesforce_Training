# Record Sharing Model

## 1. Organization-Wide Defaults

Application__c should use a restrictive record-sharing baseline.

Proposed model:

Application__c = Private

This prevents all users from automatically seeing every Application record.

## 2. Record Ownership

Application records should be associated with the appropriate Student/Application ownership model.

Students should be able to access their own application records.

## 3. Role Hierarchy

The role hierarchy can be designed around placement responsibilities.

Example:

Placement Director
↓
Placement Manager
↓
Placement Officer
↓
Coordinator

## 4. Sharing Rules

Sharing Rules should be considered when Placement Officers need access to Applications owned by students.

Sharing Rules extend record visibility based on defined business requirements.

## 5. Student Access

Student:

Allowed:
- Own Application

Denied:
- Another student's Application

## 6. Placement Officer Access

Placement Officers should receive the required access to review and manage Applications.

## 7. Recruiter Access

Recruiters should receive only the candidate information relevant to their authorised recruitment activities.

## 8. Security Principle

Object access and record access are separate security layers.

Having Read permission on Application__c does not automatically mean that the user should see every Application record.