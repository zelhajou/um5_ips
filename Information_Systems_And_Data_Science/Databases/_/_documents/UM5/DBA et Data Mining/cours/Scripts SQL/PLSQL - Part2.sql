set serveroutput on;

DECLARE
    emp1 Emp%ROWTYPE; 
    -- record basé sur la structure d'une ligne de la table Emp;
BEGIN
    SELECT * INTO emp1 FROM Emp WHERE EMPNO=7499;

    -- afficher les données du record
    dbms_output.put_line('Nom : '|| emp1.ENAME); 
    dbms_output.put_line('Salaire : '|| emp1.SAL);
    dbms_output.put_line('Age : '|| emp1.HIREDATE);
END;

declare 
    upper_name emp.ename%Type;
    max_salaire emp.sal%Type;
begin
    select upper(ename) into upper_name from emp where empno= 7499;
    select max(sal) into max_salaire from EMP;
    dbms_output.put_line('Nom : '|| upper_name); 
    dbms_output.put_line('Max Sal : '|| max_salaire);
end;



select * from emp;


declare
    empl_sal emp.sal%Type;
begin
    empl_sal := 8000;
    insert into emp values (2222, 'Francis', 'Manager',0 , '28-SEP-81', empl_sal, 0,20);
end;


declare
    empl_sal emp.sal%Type;
begin
    empl_sal := 9000;
    --insert into emp values (2222, 'Francis', 'Manager',0 , '28-SEP-81', empl_sal, 0,20);
    update emp set sal = empl_sal where empno= 2222; 
end;


declare
    Emp_Nbr number :=2222;
begin
    delete from emp where empno = emp_nbr;
    commit;
end;

select * from emp;



-- Extraction ------------------------------------------------------------------
DECLARE
    emp1 Emp%ROWTYPE; 
    empl_sal Emp.SAL%TYPE;
    -- record basé sur la structure d'une ligne de la table Emp;
BEGIN
    SELECT * INTO emp1 FROM Emp WHERE EMPNO=7499;
    SELECT SAL INTO empl_sal FROM Emp WHERE EMPNO=7499;
    dbms_output.put_line('Nom : '|| emp1.EName); 
    dbms_output.put_line('Sal : '|| empl_sal); 
END;

---- ORA-06512 ----------------------------------------------------------------- 
DECLARE
    emp1 Emp%ROWTYPE; 
    -- record basé sur la structure d'une ligne de la table Emp;
BEGIN
    SELECT * INTO emp1 FROM Emp;

    -- afficher les données du record
    dbms_output.put_line('Nom : '|| emp1.ENAME); 
END;

---- ORA-01403------------------------------------------------------------------

DECLARE
    emp1 Emp%ROWTYPE; 
    -- record basé sur la structure d'une ligne de la table Emp;
BEGIN
    SELECT * INTO emp1 FROM Emp WHERE EMPNO=749;

    -- afficher les données du record
    dbms_output.put_line('Nom : '|| emp1.ENAME); 
END;
---- Fonctions SQL -------------------------------------------------------------

DECLARE
    emp1_ename Emp.ename%TYPE; 
    max_Sal Emp.sal%TYPE;
BEGIN
    SELECT upper(ename) INTO emp1_ename FROM Emp WHERE EMPNO=7499;
    SELECT max(sal) INTO max_sal FROM Emp; 
    dbms_output.put_line('Upper Nom : '|| emp1_ename); 
    dbms_output.put_line('maxSal : '|| max_sal); 
END;

-- Insertion -------------------------------------------------------------------
DECLARE
    --emp1 Emp%ROWTYPE; 
    empl_name emp.ename%TYPE;
    empl_sal Emp.SAL%TYPE;
BEGIN
    insert INTO emp values (1111,'Sebastien','CLERK',7902,'17-DEC-90',800,0,20);
    empl_name := 'Francis';
    empl_sal := 4500;
    insert INTO emp values (2222,empl_name,'CLERK',7902,'1-DEC-99',empl_sal,0,20);
END;

-- Mise à jour -----------------------------------------------------------------

DECLARE
    empl_sal number := 1000;
BEGIN
    Update emp set sal = empl_sal where empno=2222;
    COMMIT;
END;

-- Suppression -----------------------------------------------------------------

DECLARE
    empl_NO number := 1111;
BEGIN
    DELETE FROM emp where empno = empL_no;
    COMMIT;
END;

DECLARE
    empl_NO number := 2222;
BEGIN
    DELETE FROM emp where empno = empL_no;
    COMMIT;
END;


-- Transactions ----------------------------------------------------------------
--Drop table transactions;

create table transactions(id_trans int, Desc_trans varchar2(30));

INSERT INTO transactions VALUES ( 1 , 'Pas de savepoint' ) ;

select * from transactions;
--1 ligne creee .
INSERT INTO transactions VALUES ( 2 , 'savepoint A' ) ;
-- 1 ligne creee .
SAVEPOINT A;
-- Savepoint .
INSERT INTO transactions VALUES ( 3 , 'Savepoint B' ) ;
-- 1 ligne creee .
SAVEPOINT B;
-- Savepoint cree .
INSERT INTO transactions VALUES ( 4 , 'Pas de savepoint' ) ;
-- 1 ligne creee .

--select * from transactions;

ROLLBACK TO SAVEPOINT B;
-- rollback effectuee .
SELECT * FROM transactions ;

ROLLBACK TO SAVEPOINT A;
-- rollback effectuee .

SELECT * FROM transactions ;
COMMIT;

-- Validation Efectuee

SELECT * FROM transactions ;


-- Curseurs implicites ---------------------------------------------------------

Select * from Emp;

DECLARE 
   nombre_ligne number(2); 
BEGIN
   UPDATE Emp 
   SET Sal = Sal + 300; 
   IF sql%notfound THEN
      dbms_output.put_line('aucun employé sélectionné'); 
   ELSIF sql%found THEN
      nombre_ligne := sql%rowcount;
      dbms_output.put_line( nombre_ligne || ' employés sélectionnés '); 
   END IF;  
END;

DECLARE 
   nombre_ligne number(2); 
BEGIN
   UPDATE Emp 
   SET Sal = Sal + 300 where ename = 'Jack'; 
   IF sql%notfound THEN
      dbms_output.put_line('aucun employé sélectionné'); 
   ELSIF sql%found THEN
      nombre_ligne := sql%rowcount;
      dbms_output.put_line( nombre_ligne || ' employés sélectionnés '); 
   END IF;  
END;

-- Curseurs Explicites ---------------------------------------------------------

SELECT * FROM Emp;


-- Recupere 1ere line d'un curseur
DECLARE 
   CURSOR list_emp IS SELECT * FROM Emp;
   record_emp Emp%rowtype;
BEGIN
   open list_emp;
   fetch list_emp into record_emp;
   -- manipuler record_emp
   -- récupere uniquement la première ligne
   dbms_output.put_line( '1st employee ' || record_emp.ename); 
END;


-- Travailler sur ttes les lignes du curseur
DECLARE 
   CURSOR liste_emp IS SELECT * FROM Emp;
   record_emp Emp%rowtype;
BEGIN
   OPEN liste_emp;
   LOOP
        FETCH liste_emp INTO record_emp; -- recuere ligne par ligne le resultat stocke dans le curseur
            EXIT WHEN liste_emp%notfound; -- sortir si le curseur ne pointe sur aucune ligne
            -- Traitements sur la ligne courante
            dbms_output.put_line('Nom :'|| record_emp.ename || ' - Professeion : '|| record_emp.job);
    END LOOP;  
     
    CLOSE liste_emp;    
END;



-- Utliser la boucle FOR
DECLARE 
   CURSOR liste_emp IS SELECT * FROM Emp;
   record_emp Emp%rowtype;
BEGIN
   FOR record_emp IN liste_emp LOOP
        -- Traitements sur la ligne courante
        dbms_output.put_line('Nom :'|| record_emp.ename || ' - Professeion : '|| record_emp.job);
   END LOOP;      
END;



-- Curseurs parametres ---------------------------------------------------------

Select * from emp;
DECLARE 
   CURSOR liste_emp(Salaire Number) IS SELECT * FROM Emp where Sal >= Salaire;
   record_emp liste_emp%rowtype;
BEGIN
   FOR record_emp IN liste_emp(4000) LOOP
        -- Traitements sur la ligne courante
        dbms_output.put_line('Nom :'|| record_emp.ename || ' - Professeion : '|| record_emp.job || ' - Salaire : '|| record_emp.sal);
   END LOOP;      
END;

-- Exceptions predefinies ------------------------------------------------------


DECLARE
	v_sal emp.sal%type;
BEGIN
	SELECT sal INTO v_sal from emp;
EXCEPTION
	WHEN TOO_MANY_ROWS then 
        dbms_output.put_line('Too many rows can''t be selected into a single record');
	-- gérer erreur trop de lignes	
	WHEN NO_DATA_FOUND then 
        dbms_output.put_line('No data found in EMP Table');
	-- gérer erreur pas de ligne
	WHEN OTHERS then 
        dbms_output.put_line('Other Exception raised');
	-- gérer toutes les autres erreurs
END ;

-- Exception non predefinie

DECLARE
	v_sal emp.sal%type;
    EMP_Too_Many_Rows Exception;
    PRAGMA EXCEPTION_INIT (EMP_Too_Many_Rows, -1422);
BEGIN
	SELECT sal INTO v_sal from emp;
EXCEPTION
	WHEN EMP_Too_Many_Rows then 
        dbms_output.put_line('Too many rows can''t be selected into a single record');
	-- gérer erreur trop de lignes	
	WHEN NO_DATA_FOUND then 
        dbms_output.put_line('No data found in EMP Table');
	-- gérer erreur pas de ligne
	WHEN OTHERS then 
        dbms_output.put_line('Other Exception raised');
	-- gérer toutes les autres erreurs
END ;


-- Exception Externes
select * from emp;

DECLARE
	v_sal emp.sal%type;
    Exep_sal_trop_bas EXCEPTION;
BEGIN
	SELECT sal INTO v_sal from emp where empno= 7499;
    dbms_output.put_line(' Le salire est : ' || v_sal);
    if v_sal < 2000 then
        Raise Exep_sal_trop_bas;
    END If; 
EXCEPTION
	WHEN TOO_MANY_ROWS then 
        dbms_output.put_line('Too many rows can''t be selected into a single record');
	-- gérer erreur trop de lignes	
    WHEN Exep_sal_trop_bas then
        dbms_output.put_line('Alerte : Salaire trop bas');
	WHEN OTHERS then 
        dbms_output.put_line('Other Exception raised');
	-- gérer toutes les autres erreurs
END ;

--

-- Exception Externes
select * from emp;

DECLARE
	v_sal emp.sal%type;
    Exep_sal_trop_bas EXCEPTION;
BEGIN
	SELECT sal INTO v_sal from emp where empno= 7499;
    dbms_output.put_line(' Le salire est : ' || v_sal);
    if v_sal < 2000 then
        Raise Exep_sal_trop_bas;
    END If; 
EXCEPTION
    WHEN Exep_sal_trop_bas then
        RAISE_APPLICATION_ERROR (-20222, 'Alerte 22222 : Salaire trop bas');
	WHEN OTHERS then 
        dbms_output.put_line('Other Exception raised');
	-- gérer toutes les autres erreurs
END ;
