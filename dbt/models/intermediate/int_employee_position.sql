SELECT
    e.employee_id,
    e.employee_name,
    e.position_id,
    p.position_title,
    p.manager_employee_id,
    e.organisation_id,
    e.location_id,
    e.start_date,
    e.end_date,
    e.employment_status
FROM {{ ref('stg_employee') }} e
LEFT JOIN {{ ref('stg_position') }} p ON e.position_id = p.position_id
