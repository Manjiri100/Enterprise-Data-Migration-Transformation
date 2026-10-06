# Duplicate Employee Investigation

**Question:** Are any employee keys duplicated before migration?

**Control:** Group by `employee_id` and investigate counts greater than one.

**Expected action:** Hold duplicate keys from migration until the source owner confirms the survivorship rule.
