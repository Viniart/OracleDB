DESC DEPARTMENTS;

SELECT MAX(DEPARTMENT_ID)
FROM DEPARTMENTS;

CREATE SEQUENCE department_sequence
MINVALUE 280
START WITH 280
INCREMENT BY 10;

SET AUTOPRINT ON;
ACCEPT P_DEPT_NAME PROMPT 'INFORME O NOME DO DEPARTMENTO';
DECLARE     
    v_department_name DEPARTMENTS.DEPARTMENT_NAME%TPE := INITCAP('&P_DEPT_NAME');
BEGIN 
    INSERT INTO DEPARTMENTS
    VALUES(department_sequence.NEXTVAL, v_department_name, null, null);
    
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT|| ' LINHA INSERIDA');
    COMMIT;
END;

set serveroutput on;
DECLARE    
    v_emp_id    employees.employee_id%TYPE := &p_emp_id;
    v_ln        employees.last_name%type;
    v_sal       employees.salary%type;
    v_estrelas  VARCHAR2(50);
BEGIN 
    SELECT last_name, salary/1000
    INTO v_ln, v_sal
    FROM employees
    WHERE employee_id = v_emp_id;
    FOR i IN 1..v_sal LOOP
        v_estrelas := v_estrelas || '*';
    END LOOP;    
    DBMS_OUTPUT.PUT_LINE(v_ln || ' ' || v_estrelas);
END;