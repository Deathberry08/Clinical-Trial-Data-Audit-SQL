# Clinical Trial Data Integrity Audit (SQL)

## 📌 Project Overview
This project simulates a real-world data audit for a Phase II clinical trial evaluating a novel oncology treatment compound. As a Bio-Data Analyst, I constructed targeted SQL queries to audit structural trial records for data entry compliance, regulatory framework alignment, and patient tracking protocol violations.

## 🧪 The Dataset Structure
The analytical environment utilizes a relational database consisting of two primary tables:
* **`Patients`**: Tracks demographic information, patient age, assigned IDs, and trial cohorts (Active vs. Placebo).
* **`Lab_Results`**: Monitors quantitative safety endpoints including cholesterol levels, adverse events, and specific testing timelines.

## 🔍 Key Insights & Queries Developed

### 1. High-Dosage Safety Violations
Identified critical protocol outliers where participants were mistakenly administered dosages exceeding maximum baseline protocols (>150mg).
```sql
SELECT patient_id, name, dosage_amount 
FROM patients
WHERE dosage_amount > 150;
```

### 2. Missing Regulatory Logs (Data Attrition)
Located critical operational gaps where patients dropped out of the trial but clinical staff left the exit justification parameters blank (`NULL`).
```sql
SELECT patient_id, enrollment_date 
FROM clinical_registry
WHERE lab_test_date IS NULL;
```

### 3. Patient Cohort Categorization
Leveraged conditional processing logic to bin continuous demographic metrics into strict corporate age brackets for multi-variable stratified analysis.
```sql
SELECT name, age,
CASE WHEN age >= 60 THEN 'Geriatric'
     WHEN age >= 30 THEN 'Adult'
     ELSE 'Youth' END AS demographic_tier
FROM patients;
```

## 🛠️ Tech Stack Employed
* **Language:** Structured Query Language (SQL)
* **Framework Focus:** Data Query Language (DQL), Relational Joins, Aggregation Operations.
* **Domain Context:** Clinical Trial Monitoring, ICH-GCP Compliance Checks.
