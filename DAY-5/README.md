# 💻 Day 05: Server-Side Business Logic with Apex

[![Apex](https://img.shields.io/badge/Language-Apex_OOP-blue?style=for-the-badge&logo=salesforce&logoColor=white)](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
[![Database](https://img.shields.io/badge/Data-SOQL_%7C_DML-00A1E0?style=for-the-badge)](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/)
[![Status](https://img.shields.io/badge/Sprint_Status-Completed-brightgreen?style=for-the-badge)](#-key-deliverables--artifacts)

---

## 📌 Objective
Engineered robust server-side business logic for the **Placement Management System** using object-oriented Apex. Implemented an Apex Service layer to enforce strict data validations and rule processing prior to committing student application records to the database.

---

## ⚙️ What Was Built? (`ApplicationService`)

Developed the **`ApplicationService`** Apex class containing the core **`submitApplication()`** business method:
* **Duplicate Prevention:** Scans the database to block students from applying for the same job posting multiple times.
* **CGPA Qualification Check:** Validates academic eligibility criteria before record processing.
* **Database Persistence:** Inserts valid application records using Data Manipulation Language (DML).
* **Feedback Messaging:** Returns structured response messages (Success / Error states) back to the caller.

---

## 🛑 Implemented Business Rules

| Rule | Description | Enforced Via |
| :--- | :--- | :--- |
| **Unique Submission** | A student cannot submit multiple applications for a single job opening. | SOQL Query Check |
| **Academic Cutoff** | Students with a CGPA below **6.0** are flagged as ineligible. | Conditional `if` Logic |
| **Transactional Commit** | Only records passing all validation checks are written to the database. | DML `insert` Statement |

---

## 🛠 Core Apex Concepts Applied

- **Apex Object-Oriented Programming:** Defining custom classes, public methods, parameter passing, and return types.
- **SOQL Querying:** Fetching student profiles and querying existing `Application__c` records.
- **DML Insert Operations:** Executing transactional database commits for valid record insertions.
- **Control Flow Logic:** Utilizing conditional `if/else` structures for rule evaluation.
- **Anonymous Execution:** Performing runtime unit execution tests via Developer Console.

---

## 🧪 Testing & Execution Results

Tested the service methods in Developer Console via **Execute Anonymous Window**. Verified scenarios:
1. **Valid Submission:** Application record created successfully.
2. **Duplicate Block:** Duplicate application attempt caught and rejected.
3. **Ineligible Student:** Low CGPA submission caught and rejected with an appropriate error message.

---

## 🎓 Key Learning Outcomes

- [x] Understood the role of service classes in enterprise software architecture.
- [x] Designed reusable, parameterized Apex methods.
- [x] Querying Salesforce objects programmatically using SOQL.
- [x] Modifying database states safely using DML operations.
- [x] Testing code logic dynamically using Developer Console.

---

## 🧰 Tech Stack
- **Language:** Apex (Object-Oriented Programming)
- **Database Tools:** SOQL, DML Operations
- **Testing Environment:** Developer Console (Execute Anonymous Window)

---

## 📦 Key Deliverables & Artifacts
- [x] Apex Class Source Code (`ApplicationService.cls`)
- [x] Execute Anonymous Testing Screenshots & Logs
- [x] GitHub Repository Commit
- [x] Module Documentation (`README.md`)
