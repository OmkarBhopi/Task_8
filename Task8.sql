-- For creating procedure for salary increament
CREATE OR REPLACE PROCEDURE 
inc_salary(IN empid VARCHAR(10),IN inc_percentage INT)
LANGUAGE plpgsql
AS $$
BEGIN 
UPDATE emp 
SET salary = salary + (salary * inc_percentage/100)
WHERE emp_id = empid;
RAISE NOTICE 'Salary updated for Employee ID %', empid;
END;
$$;

-- For calling procedure
CALL inc_salary('1',5);

SELECT * FROM emp;

-- For creating function for displaying employees of particular department id
CREATE OR REPLACE FUNCTION get_employees_by_department(did INT)
RETURNS TABLE (
    empid VARCHAR,
    emp_name VARCHAR,
    e_salary REAL
)
AS $$
BEGIN
    RETURN QUERY
    SELECT emp_id, e_name, salary
    FROM emp
    WHERE d_id = did;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_employees_by_department(1);