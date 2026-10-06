SELECT employee_id, 'MISSING_MANDATORY_ATTRIBUTE' AS exception_type, 'Medium' AS priority
FROM {{ ref('stg_employee') }}
WHERE employee_name IS NULL

UNION ALL

SELECT e.employee_id, 'ORPHAN_ORGANISATION' AS exception_type, 'High' AS priority
FROM {{ ref('stg_employee') }} e
LEFT JOIN {{ ref('stg_organisation') }} o ON e.organisation_id = o.organisation_id
WHERE o.organisation_id IS NULL

UNION ALL

SELECT e.employee_id, 'INVALID_DATE' AS exception_type, 'High' AS priority
FROM {{ ref('stg_employee') }} e
WHERE e.end_date IS NOT NULL AND e.end_date < e.start_date
