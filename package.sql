CREATE OR REPLACE PACKAGE lab2 AS
    PROCEDURE alter_salary (
        id_dep         NUMBER,
        n_percentage   NUMBER
    );

    FUNCTION count_employees (
        department_name VARCHAR2
    ) RETURN NUMBER;

END lab2;
