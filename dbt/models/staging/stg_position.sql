SELECT
    CAST(position_id AS VARCHAR) AS position_id,
    position_title,
    employee_id,
    organisation_id,
    NULLIF(manager_employee_id, '') AS manager_employee_id,
    TRY_CAST(effective_start AS DATE) AS effective_start,
    TRY_CAST(NULLIF(effective_end, '') AS DATE) AS effective_end
FROM {{ source('legacy', 'positions_legacy') }}
