-- =====================================================================
-- PROJECT: PHASE II ONCOLOGY CLINICAL TRIAL DATA INTEGRITY AUDIT
-- ROLE: BIOMEDICAL DATA ANALYST
-- =====================================================================

-- ---------------------------------------------------------------------
-- AUDIT 1: DOSAGE VIOLATION DETECTION
-- Protocol safety guidelines state the absolute maximum single dose 
-- allowed for safety is 150mg. 
-- This query identifies patients mistakenly administered unsafe thresholds.
-- ---------------------------------------------------------------------
SELECT 
    patient_id, 
    name, 
    dosage_amount,
    treatment_group
FROM 
    patients
WHERE 
    dosage_amount > 150
ORDER BY 
    dosage_amount DESC;


-- ---------------------------------------------------------------------
-- AUDIT 2: REGULATORY LOG GAP ANALYSIS (ATTRITION CHECKS)
-- For compliance audits, if a patient is registered but has a missing 
-- lab testing confirmation log, it represents an FDA compliance issue.
-- This query captures all tracking anomalies.
-- ---------------------------------------------------------------------
SELECT 
    p.patient_id, 
    p.name, 
    p.enrollment_date,
    l.test_date,
    l.cholesterol_level
FROM 
    patients AS p
LEFT JOIN 
    lab_results AS l ON p.patient_id = l.patient_id
WHERE 
    l.test_date IS NULL OR l.cholesterol_level IS NULL;


-- ---------------------------------------------------------------------
-- AUDIT 3: MULTI-VARIABLE DEMOGRAPHIC STRATIFICATION
-- To track adverse events properly, we must bucket patient age groups.
-- This query uses conditional logic to categorize populations cleanly.
-- ---------------------------------------------------------------------
SELECT 
    name, 
    age,
    treatment_group,
    CASE 
        WHEN age >= 65 THEN 'Geriatric Cohort (High Risk)'
        WHEN age BETWEEN 35 AND 64 THEN 'Adult Cohort'
        ELSE 'Youth Cohort'
    END AS stratified_demographic_tier
FROM 
    patients
ORDER BY 
    age ASC;
