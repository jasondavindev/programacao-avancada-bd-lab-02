CREATE OR REPLACE FUNCTION count_employees (
    input_department_name VARCHAR2
) RETURN NUMBER IS
    count_number NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO count_number
    FROM
        employees
    WHERE
        department_id = (
            SELECT
                department_id
            FROM
                departments
            WHERE
                department_name = input_department_name
        );

    RETURN count_number;
END;

SELECT
    count_employees('Marketing')
FROM
    dual;