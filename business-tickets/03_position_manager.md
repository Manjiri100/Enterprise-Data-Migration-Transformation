# Position / Manager Integrity

**Question:** Does every manager reference resolve to a valid employee?

**Control:** Join `manager_employee_id` to the employee master.

**Expected action:** Prioritise unresolved managers because they can break hierarchy reporting.
