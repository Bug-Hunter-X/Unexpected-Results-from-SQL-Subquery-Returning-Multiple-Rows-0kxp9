The corrected query uses a `LIMIT 1` clause to ensure that the subquery returns only one row. This prevents the unexpected behavior caused by the original query.  It's also important to ensure that the subquery's `WHERE` clause is appropriately constrained to uniquely identify a single record.  If there is potential for multiple records to match, consider adding an `ORDER BY` clause to ensure that a specific record is selected. 

```sql
SELECT * FROM employees WHERE id = (SELECT employee_id FROM departments WHERE department_name = 'Sales' LIMIT 1);
```
Alternatively, a JOIN statement might be more efficient and readable:
```sql
SELECT e.* 
FROM employees e
JOIN departments d ON e.employee_id = d.employee_id
WHERE d.department_name = 'Sales' 
LIMIT 1; 
```