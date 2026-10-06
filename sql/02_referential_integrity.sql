-- Orphan organisation and manager references
SELECT e.employee_id, e.organisation_id
FROM employees_legacy e
LEFT JOIN organisations o ON e.organisation_id = o.organisation_id
WHERE o.organisation_id IS NULL;

SELECT p.position_id, p.manager_employee_id
FROM positions_legacy p
LEFT JOIN employees_legacy e ON p.manager_employee_id = e.employee_id
WHERE p.manager_employee_id IS NOT NULL
  AND e.employee_id IS NULL;
