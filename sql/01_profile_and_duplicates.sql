-- Duplicate employee keys and missing mandatory attributes
SELECT employee_id, COUNT(*) AS record_count
FROM employees_legacy
GROUP BY employee_id
HAVING COUNT(*) > 1;

SELECT *
FROM employees_legacy
WHERE employee_name IS NULL OR TRIM(employee_name) = '';
