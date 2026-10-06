# Source-to-Target Mapping Specification

| Legacy field | Target field | Rule |
|---|---|---|
| employee_id | employee_id | Preserve stable business key |
| employee_name | employee_name | Trim whitespace; mandatory |
| position_id | position_id | Resolve against position reference |
| organisation_id | organisation_id | Resolve against approved hierarchy |
| location_id | location_id | Resolve against location reference |
| start_date | start_date | Cast to date |
| end_date | end_date | Cast to date; must not precede start |
| employment_status | employment_status | Preserve controlled value |
