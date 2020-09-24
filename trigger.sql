CREATE OR REPLACE TRIGGER trigger_on_insert_employee BEFORE
    INSERT ON employees
    FOR EACH ROW
DECLARE
    rowcount NUMBER := 0;
BEGIN
    IF :new.department_id IS NOT NULL THEN
        SELECT
            COUNT(department_id)
        INTO rowcount
        FROM
            departments
        WHERE
            department_id = :new.department_id;

    END IF;

    IF rowcount = 0 THEN
        :new.department_id := 20;
    END IF;
END;

INSERT INTO employees VALUES (
    208,
    'Joques',
    'OConnell',
    'joquesmail',
    '650.507.9833',
    '21-JUN-07',
    'SH_CLERK',
    2600,
    NULL,
    124,
    NULL
);

INSERT INTO employees VALUES (
    209,
    'Jabinho',
    'OConnell',
    'jabinhomail',
    '650.507.9833',
    '21-JUN-07',
    'SH_CLERK',
    2600,
    NULL,
    124,
    221
);

SELECT
    *
FROM
    employees
ORDER BY
    employee_id DESC
FETCH NEXT 2 ROWS ONLY;
