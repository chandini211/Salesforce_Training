# 🗄️ Day-6: Making Software Talk to Data with SOQL and DML

## 📌 Objective
Learned how Apex interacts with Salesforce data using **SOQL** and **DML** operations while building business transactions for the **Placement Management System**.

---

## 🛠️ What I Built
* Created Apex classes demonstrating SOQL and DML operations.
* Fetched **Student** records using SOQL queries.
* Updated **Student** records using DML operations.
* Upgraded the **`ApplicationService`** class to:
  * Query Student details using SOQL.
  * Check and prevent duplicate applications.
  * Validate student CGPA eligibility.
  * Create and insert new **Application** records.
  * Update Application Status using DML.
* Executed and tested Apex logic via **Execute Anonymous**.
* Verified execution results using **Debug Logs** and Salesforce records.

---

## 💡 Core Concepts

### 1️⃣ SOQL (Salesforce Object Query Language)
Used to retrieve existing records from Salesforce objects before executing business logic.

### 2️⃣ DML (Data Manipulation Language)
Used to insert, update, upsert, and delete records in the Salesforce database.

---

## 🎓 What I Learned
- [x] Fetching Salesforce database records using SOQL.
- [x] Inserting and updating records safely using DML.
- [x] Combining SOQL and DML inside Apex classes.
- [x] Testing Apex scripts quickly using Execute Anonymous.
- [x] Understanding why business validations must happen before running DML.
- [x] Verifying results and tracking errors using Debug Logs.

---

## 📂 Files Included
- `ApplicationService.cls`
- `SOQLExamples.cls`
- `DMLExamples.cls`
- `Screenshots/`
- `Notes.md`
- `Reflection.md`
