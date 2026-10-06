SELECT
    employee_id,
    employee_name,
    position_id,
    organisation_id,
    location_id,
    start_date,
    end_date,
    employment_status
FROM {{ ref('stg_employee') }}
QUALIFY ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY start_date DESC NULLS LAST) = 1
