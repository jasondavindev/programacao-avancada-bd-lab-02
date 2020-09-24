CREATE OR REPLACE PROCEDURE alter_salary (
    id_dep         NUMBER,
    n_percentage   NUMBER
) IS

    var_modifier FLOAT := 1 + ( n_percentage / 100 );
    CURSOR cur_employees IS
    SELECT
        last_name
    FROM
        employees
    WHERE
        department_id = id_dep;

BEGIN
    UPDATE employees
    SET
        salary = salary * var_modifier
    WHERE
        department_id = id_dep;

    COMMIT;
END;
