-- Example risk-based prioritisation logic.
SELECT
    exception_type,
    employee_id,
    CASE
        WHEN exception_type IN ('DUPLICATE_EMPLOYEE','ORPHAN_ORGANISATION','ORPHAN_MANAGER','INVALID_DATE') THEN 'High'
        WHEN exception_type IN ('MISSING_MANDATORY_ATTRIBUTE','RECONCILIATION_MISMATCH') THEN 'Medium'
        ELSE 'Low'
    END AS priority
FROM migration_exceptions;
