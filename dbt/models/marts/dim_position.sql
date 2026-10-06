SELECT *
FROM {{ ref('stg_position') }}
QUALIFY ROW_NUMBER() OVER (PARTITION BY position_id ORDER BY effective_start DESC NULLS LAST) = 1
