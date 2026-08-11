# Day 10 – Application Submission Workflow

## Salesforce Training Bootcamp

This section documents the Application Submission workflow completed during the Salesforce Training Bootcamp.

The workflow allows a student to view eligible jobs and submit an application for a selected job.

---

## 1. Eligible Jobs

The Eligible Jobs component displays jobs that satisfy the student's eligibility criteria.

A job is considered eligible when:

- Student CGPA is greater than or equal to the job's minimum CGPA.
- Student branch matches the eligible branch.
- Job deadline has not expired.

### Flow

```text
Student Record
      ↓
Get Student CGPA + Branch
      ↓
Get Jobs
      ↓
Check Minimum CGPA
      ↓
Check Branch
      ↓
Check Deadline
      ↓
Display Eligible Jobs


##Features
Display eligible jobs
Apply for a job
Validate job deadline
Prevent duplicate applications
Create Application record
View submitted applications
Send application email
Display success and error messages

##Components
Eligible Jobs
Displays jobs for which the student is eligible.

My Applications
Displays applications already submitted by the student.

Apex Controller
EligibleJobsController.cls

Methods:
getEligibleJobs()
applyForJob()
getMyApplications()

##Automation
Application Email Flow:

Application Created
        ↓
Set Application Date
        ↓
Send Application Email

##Result
The student can view eligible jobs, apply for a job, create an Application record, and view submitted applications.
