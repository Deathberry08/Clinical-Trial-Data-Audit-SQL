-- CLINICAL TRIAL DATA INTEGRITY AUDIT
-- Author: Your Name
-- Objective: Identify protocol violations in Phase II Oncology Trials

-- QUERY 1: Find patients with critical dosage violations (> 150mg)
SELECT 
    patient_id, 
    name, 
    dosage_amount 
FROM 
    patients
WHERE 
    dosage_amount > 150;

-- QUERY 2: Find enrolled patients missing critical lab dates
SELECT 
    patient_id, 
    enrollment_date 
FROM 
    clinical_registry
WHERE 
    lab_test_date IS NULL;
