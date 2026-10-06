-- Compare the primary employee source with an alternate source.
SELECT
    a.employee_id,
    a.employee_name AS legacy_name,
    b.employee_name AS alternate_name,
    a.position_id AS legacy_position,
    b.position_id AS alternate_position,
    CASE
        WHEN b.employee_id IS NULL THEN 'Missing in alternate source'
        WHEN COALESCE(a.employee_name, '') <> COALESCE(b.employee_name, '')
          OR COALESCE(a.position_id, '') <> COALESCE(b.position_id, '')
          OR COALESCE(a.organisation_id, '') <> COALESCE(b.organisation_id, '')
          OR COALESCE(a.location_id, '') <> COALESCE(b.location_id, '')
        THEN 'Mismatch'
        ELSE 'Match'
    END AS reconciliation_status
FROM employees_legacy a
LEFT JOIN employee_alt_source b ON a.employee_id = b.employee_id;
