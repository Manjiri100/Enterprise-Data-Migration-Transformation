SELECT organisation_id, organisation_name, NULLIF(parent_organisation_id, '') AS parent_organisation_id, department_code
FROM {{ source('legacy', 'organisations') }}
