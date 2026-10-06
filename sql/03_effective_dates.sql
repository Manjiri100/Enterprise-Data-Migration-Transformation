-- Effective-date controls: an end date cannot precede the start date.
SELECT employee_id, start_date, end_date
FROM employees_legacy
WHERE end_date IS NOT NULL
  AND CAST(end_date AS DATE) < CAST(start_date AS DATE);

SELECT position_id, effective_start, effective_end
FROM positions_legacy
WHERE effective_end IS NOT NULL
  AND CAST(effective_end AS DATE) < CAST(effective_start AS DATE);
