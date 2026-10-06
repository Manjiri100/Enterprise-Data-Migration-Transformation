SELECT location_id, location_name, country
FROM {{ source('legacy', 'locations') }}
