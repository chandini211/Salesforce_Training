# 🎨 Day 04: UI Development with Lightning Web Components (LWC)

[![LWC](https://img.shields.io/badge/Framework-Lightning_Web_Components-00A1E0?style=for-the-badge&logo=lightning&logoColor=white)](https://developer.salesforce.com/docs/component-library/overview/components)
[![UI Tech](https://img.shields.io/badge/Stack-HTML5%20%7C%20JS%20%7C%20CSS3-yellow?style=for-the-badge)](https://developer.mozilla.org/)
[![Status](https://img.shields.io/badge/Sprint_Status-Completed-brightgreen?style=for-the-badge)](#-key-deliverables--artifacts)

---

## 📌 Objective
Designed and deployed the first interactive client-side user interface for the **Placement Management System** using Salesforce's modern **Lightning Web Components (LWC)** framework.

---

## 💡 Technical Concepts Explained

### 1️⃣ What is LWC?
**Lightning Web Components (LWC)** is Salesforce's lightweight, W3C Web Standards-based UI framework built on modern HTML, ES6+ JavaScript, and CSS. It offers high rendering performance, seamless integration with platform data, and reusable component-driven architecture.

---

## 🛠 What Was Built? (`placementHome`)

Developed a custom frontend component named **Placement Home** featuring:
* **Branded Interface:** Interactive welcome banner featuring the official institute logo.
* **Student Info Card:** Displays dynamic profile details including *Student Name*, *Roll Number*, and *Department*.
* **Real-time Metadata:** Displays the current calendar date.
* **Dashboard Summary Cards:** Overview metrics for *Companies*, *Open Jobs*, *Submitted Applications*, and *Current Status*.
* **Interactive Actions:** 
  * `"Show Welcome"` button triggering dynamic greeting dialogs.
  * `"Apply Now"` button with dynamic JavaScript state updates changing user status from **Not Applied** ➔ **Applied**.

---

## 📂 Component Bundle Architecture

```text
placementHome/
│
├── 📄 placementHome.html       # UI Layout, Templates, Buttons, and SLDS Styling Elements
├── 📜 placementHome.js         # Reactive Data Properties, Event Handlers, and Button Actions
├── 🎨 placementHome.css        # Custom CSS Styling Rules (Overlays & Custom Branding)
└── ⚙️ placementHome.js-meta.xml # Target Exposure Metadata (Lightning App Builder Config)
