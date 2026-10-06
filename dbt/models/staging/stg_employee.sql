SELECT
    CAST(employee_id AS VARCHAR) AS employee_id,
    NULLIF(TRIM(employee_name), '') AS employee_name,
    CAST(position_id AS VARCHAR) AS position_id,
    CAST(organisation_id AS VARCHAR) AS organisation_id,
    CAST(location_id AS VARCHAR) AS location_id,
    TRY_CAST(start_date AS DATE) AS start_date,
    TRY_CAST(NULLIF(end_date, '') AS DATE) AS end_date,
    employment_status
FROM {{ source('legacy', 'employees_legacy') }}
