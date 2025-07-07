# 🌍 Domains - DEAS-LA System

This folder contains all the business domains of the **DEAS-LA (Distributed Emergency Alert System for Latin America)** project. Each domain focuses on a specific part of the system and contains services that work together to handle alerts, notifications, users, reports, and external integrations.

---

## 📦 What Are Domains?

A **domain** is a group of services that share a common purpose. This helps keep the system organized, easy to understand, and scalable.

---

## 🧭 Domains Overview

### 1. **Core**
Takes care of everything related to users:
- Creating accounts
- Logging in
- Managing profiles, roles, and language preferences

### 2. **Alert Management**
Handles the creation and validation of emergency alerts:
- Creating alert messages
- Defining where and when they go out
- Using templates and rules to keep alerts consistent

### 3. **Notification**
Decides how to send out alerts:
- Choosing the best communication channel (like push or WebSocket)
- Formatting the alert
- Handling retries if something goes wrong

### 4. **Delivery & Logging**
Takes care of actually sending messages and keeping a history:
- Sends SMS, email, and push notifications
- Logs every delivery and system activity for tracking

### 5. **External**
Connects our system to outside services:
- Government alert systems
- Mapping and weather providers
- Accepts or sends info via different APIs

### 6. **Report**
Creates reports and collects feedback:
- Shows analytics and alert statistics
- Tracks system activity and gathers user opinions

---

## 📁 Folder Structure

```plaintext
domains/
├── core/
├── alert-management/
├── notification/
├── delivery-logging-services/
├── external/
├── report/


Each folder contains services that belong to that domain.

---

## 🧩 How It All Works Together

All domains work together to:
1. Let users log in and manage their profiles
2. Create emergency alerts
3. Send those alerts to people through different channels
4. Keep track of what was sent and what happened
5. Connect with other systems and collect feedback

---

## 📚 Want to Learn More?

Each domain folder includes its own `README.md` with a short explanation of what the services do.

If you're new to the project, start here — this is the big picture.

