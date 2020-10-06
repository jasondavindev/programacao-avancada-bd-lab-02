create or replace PROCEDURE alter_salary (
    id_dep       NUMBER,
    percentage   NUMBER
) IS

    modifier     FLOAT := 1 + ( percentage / 100 );
BEGIN

    UPDATE employees e
    SET
        e.salary = e.salary * modifier
    WHERE
        e.department_id = alter_salary.id_dep;

    COMMIT;
END;
