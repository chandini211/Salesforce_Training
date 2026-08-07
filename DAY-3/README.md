# ⚡ Day 03: Automation & Data Validation (Placement Management System)

## 📌 Objective
Automated key business processes and enforced data integrity for the **Placement Management System** using Salesforce Flow Builder and Validation Rules.

---

## ⚙️ Solution Architecture Breakdown

### 1️⃣ Declarative Automation (Salesforce Flows)
Used **Record-Triggered Flows** to handle no-code background actions:
* **Auto-Populate Fields:** Automatically sets the `Application Date` upon creation of a new application record.
* **Email Alerts:** Triggers an automated notification email when an application is successfully submitted.
* **Record Generation:** Automatically generates a child `Offer Letter` record as soon as an application status changes to **"Selected"**.

### 2️⃣ Data Integrity (Validation Rules)
Enforced declarative business restrictions before records are committed to the database:
* **CGPA Eligibility Check:** Blocks application submissions from students whose CGPA falls below the required threshold.
* **Deadline Enforcement:** Restricts new applications submitted after the job posting's official closing date.

### 3️⃣ Custom Code Requirements (Apex Integration)
Identified complex edge cases requiring **Apex** programmatic logic:
* **Duplicate Prevention:** Checking and blocking duplicate applications for the exact same student and job posting.
* **Multi-Factor Qualification:** Running dynamic, deep-level eligibility checks prior to saving the record.
* **Scalable Business Architecture:** Preparing for enterprise logic that exceeds declarative Flow limits.

---

## 🛠 Design Rationale: Why These Tools?

| Requirement Type | Selected Tool | Justification |
| :--- | :--- | :--- |
| **No-Code Automation** | **Salesforce Flow** | Fast implementation, declarative maintenance, and native event tracking without Apex overhead. |
| **Data Quality Enforcement** | **Validation Rules** | Immediate user-facing error feedback at the UI level to block bad data entry. |
| **Complex Logic & Checks** | **Apex Code** | Imperative programming power for multi-object cross-checking and custom algorithm handling. |

---

## 🧰 Tech Stack
- **Declarative Automation:** Salesforce Flow Builder (Record-Triggered)
- **Data Governance:** Formula Validation Rules
- **Platform Base:** Lightning Platform & Custom Objects

---

## 🎓 Core Takeaways
* Built functional **Record-Triggered Flows** for automated notifications and record provisioning.
* Configured declarative **Validation Rules** to maintain data quality.
* Developed an architectural framework for deciding when to use **Flows vs. Validation Rules vs. Apex**.
