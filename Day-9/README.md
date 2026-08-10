# 🏆 Day 9 – Lightning Web Components in Salesforce

## 🎓 Student Placement Management System

> **Building a component-driven Salesforce placement experience using Lightning Web Components, Apex, Custom Objects, Salesforce Flow and Lightning App Builder.**

---

## 📌 Sprint Overview

Day 9 focuses on **Lightning Web Components (LWC)** and their integration with Salesforce's backend and automation capabilities.

As part of this sprint, I developed a **Student Placement Management System** that allows students to view eligible placement opportunities, apply for jobs, track submitted applications, and receive automated application notifications.

The implementation combines:

- ⚡ Lightning Web Components
- ☁️ Salesforce Apex
- 🗄️ Custom Salesforce Objects
- 🔗 LWC–Apex Integration
- 📡 `@wire`
- 🚀 Imperative Apex
- 🔑 `@api`
- 🧩 Parent–Child Component Architecture
- 🔄 Custom Events
- 🛡️ Business Validation
- ⚙️ Record-Triggered Flow
- 📧 Automated Email Notification
- 🎨 Lightning App Builder
- 🧪 Jest Testing
- 🚀 Salesforce Metadata Deployment

---

# 🎯 Sprint Objectives

The main objective of this sprint was to understand how modern Salesforce applications are built using reusable frontend components connected to Apex services and Salesforce automation.

### Learning Objectives

- ✅ Understand Lightning Web Component architecture
- ✅ Build reusable and modular components
- ✅ Understand component lifecycle and state
- ✅ Use `@api` for component properties
- ✅ Retrieve Salesforce data using `@wire`
- ✅ Execute Apex imperatively from LWC
- ✅ Pass record IDs between Salesforce and LWC
- ✅ Handle user interactions and events
- ✅ Implement conditional rendering
- ✅ Render Salesforce records dynamically
- ✅ Implement business validation using Apex
- ✅ Create and manage Salesforce custom objects
- ✅ Build an application submission workflow
- ✅ Prevent duplicate applications
- ✅ Validate application deadlines
- ✅ Implement Salesforce Flow automation
- ✅ Trigger automated application emails
- ✅ Display submitted applications
- ✅ Deploy LWC and Salesforce metadata
- ✅ Test the complete application workflow

---

# 💡 Business Problem

Traditional placement management can require students to manually search through job opportunities, verify eligibility, submit applications and track their application status.

This project addresses that workflow by bringing the complete process into Salesforce.

### The system helps students:

```text
View Placement Opportunities
          ↓
Check Eligibility
          ↓
View Job Details
          ↓
Apply for Job
          ↓
Validate Application
          ↓
Create Application
          ↓
Receive Email Notification
          ↓
Track Application
