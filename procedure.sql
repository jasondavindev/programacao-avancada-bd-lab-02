create or replace procedure alter_salary(id_dep number, n_percentage number)
is 
    var_modifier float := 1 + (n_percentage /  100);
    cursor cur_employees is select last_name from employees where department_id = id_dep;
begin
    update employees
        set salary = salary * var_modifier
        where department_id = id_dep;
    commit;
end;
