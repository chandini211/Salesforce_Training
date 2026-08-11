# Day 11 — Student Profile
## Chapter 10 — Student Placement Portal

---

## 📌 Overview

Day 11 focuses on building and integrating a **Student Profile** Lightning Web Component into the Salesforce Student Placement Portal.

The component is added to the **Student Record Page** and allows student information to be displayed and updated directly from the record.

The implementation combines Salesforce record data, Lightning Web Components, Salesforce Record Forms, validation, and user feedback.

---

## 🎯 Objective

The main objective of this task is to create a reusable Student Profile component that allows a student to:

- View their profile information
- Edit profile information
- Update Salesforce record data
- Validate required fields
- Save changes
- Receive success feedback after updating the profile

---

## 👤 Student Profile

The Student Profile component contains the following information:

| Field | Purpose |
|---|---|
| Student Name | Displays the student's name |
| Phone | Student contact number |
| Email | Student email address |
| Branch | Student academic branch |
| CGPA | Current CGPA |
| Backlogs | Number of academic backlogs |
| Skills | Student technical/professional skills |
| Preferred Location | Preferred job location |

---

## 🧩 Salesforce Object

The component works with:

```text
Student__c


The fields used by the component include:

Name
Phone__c
Email__c
Branch__c
CGPA__c
Backlogs__c
Skills__c
Preferred_Location__c
⚡ Lightning Web Component

Component name:

studentProfile

Component structure:

studentProfile/
│
├── studentProfile.html
├── studentProfile.js
├── studentProfile.css
└── studentProfile.js-meta.xml
🏗️ Component Architecture
Student Record Page
        │
        ▼
Student Profile LWC
        │
        ├── Student Name
        ├── Phone
        ├── Email
        ├── Branch
        ├── CGPA
        ├── Backlogs
        ├── Skills
        └── Preferred Location
        │
        ▼
Salesforce Student__c Record
📝 Profile Update Flow
Open Student Record
        ↓
Student Profile Component
        ↓
Existing Student Data Loaded
        ↓
Edit Profile Information
        ↓
Validate Required Fields
        ↓
Save Profile
        ↓
Salesforce Record Updated
        ↓
Success Message
✅ Validation

The profile form validates required information before the record can be saved.

Required fields include:

Phone
Email
Branch
CGPA

If a required field is missing, Salesforce displays a validation message and prevents the profile from being saved.

🎉 Success Feedback

After a successful update, the component displays:

Profile updated successfully.

This provides immediate feedback to the user that the Salesforce record has been updated.

🖥️ Salesforce Record Page

The Student Profile component is integrated into the Salesforce Student Record Page.

The page contains other placement-related components along with the Student Profile.

Student Record
│
├── Eligible Jobs
│
├── My Applications
│
└── Student Profile
🛠️ Technologies Used
Salesforce
Lightning Web Components
HTML
JavaScript
CSS
Salesforce Lightning Base Components
lightning-record-edit-form
lightning-input-field
Salesforce Record Page
📂 Repository Structure
Day-11/
│
├── README.md
│
├── screenshots/
│   ├── student-profile.png
│   ├── profile-success.png
│   ├── profile-validation.png
│   └── student-record-page.png
│
└── force-app/
    └── main/
        └── default/
            └── lwc/
                └── studentProfile/
                    ├── studentProfile.html
                    ├── studentProfile.js
                    ├── studentProfile.css
                    └── studentProfile.js-meta.xml
📸 Practical Evidence

The screenshots folder contains evidence of the completed Student Profile implementation.

The screenshots demonstrate:

Student Record Page
Student Profile component
Profile information
Profile editing
Successful profile update
Required-field validation
Lightning App Builder configuration
🧠 Key Concepts Learned
Lightning Web Components

Built a Salesforce user interface using a reusable component-based architecture.

Salesforce Record Forms

Used Salesforce Lightning Record Form components to work directly with Salesforce records.

lightning-record-edit-form

Used to create a form for editing and updating a Salesforce record.

lightning-input-field

Used to display Salesforce fields and allow users to enter or modify field values.

Record Page Integration

Configured the LWC so that it can be used on a Salesforce Student__c Record Page.

Validation

Handled required fields and prevented incomplete profile information from being submitted.

User Feedback

Displayed a success message after the profile was successfully updated.

🚀 Final Outcome

The Student Placement Portal now contains a functional Student Profile component.

Students can access their profile from the Student Record Page, update their information, and receive confirmation after successfully saving their changes.

Student
   ↓
Student Record
   ↓
Student Profile
   ↓
Edit Information
   ↓
Validate
   ↓
Save
   ↓
Salesforce Record Updated
   ↓
Success Feedback
✅ Day 11 Completion
 Student Profile LWC created
 Student information displayed
 Profile editing implemented
 Required-field validation
 Profile update functionality
 Success feedback
 Student Record Page integration
 Component styling
 Salesforce deployment
 Practical screenshots captured
 Documentation completed
🌟 Final Reflection

This task provided practical experience in building a Salesforce Lightning Web Component that interacts directly with Salesforce record data.

The Student Profile component demonstrates how a Salesforce application can provide a clean user interface for viewing and updating student information while maintaining Salesforce's standard record and validation behaviour.

Day 11 — Completed ✅


