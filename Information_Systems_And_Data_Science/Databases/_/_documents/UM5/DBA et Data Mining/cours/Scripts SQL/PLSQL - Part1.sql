-- Blocs Anonymes -----------------------------------------------------------------
set serveroutput on;
Declare 
    -- The declaration section defines all variables, cursors, subprograms, and other elements to be used in the code.
    msg varchar2(40) := 'Cours PL/SQL - Master IPS';
BEGIN
    -- The procedural section contains the main body of the routine.
    dbms_output.put(msg);
    dbms_output.put_line(msg);
END;


-- Procédures PL/SQL -----------------------------------------------------------

create or replace procedure p_nom_cours
is
    msg varchar2(40) := 'Cours PL/SQL - Master IPS';
begin
    dbms_output.put_line(msg);
end;

----- Executer la proc ---------------------------------------------------------
BEGIN
p_nom_cours;
END;


-- Procédures PL/SQL - Paramètres ----------------------------------------------

Create or replace procedure p_nom_cours_param (nom_cours varchar2)
is
    msg varchar2(40) := 'Cours ' ||nom_cours||' - Master IPS';
begin
    dbms_output.put_line(msg);
end;

-- Executer la`proc ------------------------------------------------------------
BEGIN
p_nom_cours_param('BI');
END;


-- Variables PL/SQL ------------------------------------------------------------
/* 
declare
    variable_name [constant] DATATYPE 
               [DEFAULT value |DEFAULT NULL];
begin
*/

/*
declare

    v_sal_nr NUMBER;
    v_name_tx VARCHAR2(10) DEFAULT 'KING';
    v_start_dt DATE := SYSDATE; -- same as DEFAULT SYSDATE
begin
    ...
*/

-- Declaration de vars par reference -------------------------------------------
/*
declare

    variable_name  table.column%TYPE; -- La variable a le meme type que la colonne
    variable_name2 variable_name%TYPE; -- la variable a le meme type que la variable_name
    variable_row   table%ROWTYPE; /* La variable va stocker les valeurs de ttes les 
    colonnes d'un enregistrement de la table 
begin */

/*declare
    v_empno1 emp.empNo%TYPE;
    v_empno2 v_empno1%TYPE;
    v_dept_rec dept%ROWTYPE;
begin
    ... 
*/

-- Record basé sur une table|vue------------------------------------------------
select * from emp;

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


-- Record defini par l'utilisateur ---------------------------------------------

set serveroutput on;
DECLARE
    -- autres déclarations
    TYPE Personne IS RECORD ( 
        Id NUMBER NOT NULL := 0,
        Nom  VARCHAR(30), 
        Age NUMBER,
        Departement VARCHAR(30)
    );
    
    p1 Personne;
     
BEGIN
    p1.Id :=1;
    p1.Nom :='Ismail';
    p1.Age :=27;
    p1.Departement :='Informatique';
    dbms_output.put_line('ID : '|| p1.Id); 
    dbms_output.put_line('Nom : '|| p1.Nom); 
    dbms_output.put_line('Age : '|| p1.Age); 
    dbms_output.put_line('Departement : '|| p1.Departement); 
END;


-- Varray ----------------------------------------------------------------------

DECLARE
    Type tabnotes IS VARRAY(10) OF INTEGER;
    Type tabnoms IS VARRAY(10) OF VARCHAR2(20);
    n1 tabnotes; -- Declaration
    c1 tabnoms; -- Declaration
    total integer; 
 
BEGIN
    n1:= tabnotes();
    n1.extend(4);
    --n1:= tabnotes(12,15,17,18); -- Initialisation
    c1:= tabnoms('Sara', 'Ismail','Alex','Adam');-- Initialisatisation
    total := c1.count; 
    dbms_output.put_line('au total '|| total || ' etudiants'); 
    c1.extend; -- 
    n1.extend;
    c1(total +1):= 'Khawla';
    n1(1) := 12;  n1(2) := 15; n1(3) := 17;  n1(4) := 18;
    n1(total +1) := 16;
    total := c1.count;
    dbms_output.put_line('au total '|| total || ' etudiants'); 
    FOR i in 1 .. total LOOP 
      dbms_output.put_line('Etudiant: ' || c1(i) || ' Note: ' || n1(i));  
   END LOOP; 
END;


-- varray / Record ----------------------------------------------------------------------
set serveroutput on;
declare
    type tablemul is record ( par8 number, par9 number);
    type tabledentiers is varray(50) of tablemul;
    ti tabledentiers;
    i number;
begin
    ti := tabledentiers();
    Ti.extend(10);
    for i in 1..10 loop
        ti(i).par9 := i*9 ;
        ti(i).par8:= i*8;
        dbms_output.put_line (i||'*8='||ti(i).par8||' '||i||'*9='||ti(i).par9 );
    end loop;
end;


-- Affectation d'une valeur à une variable -------------------------------------

declare
    v_length_nr NUMBER DEFAULT 5; -- Affectation d'une valeur utilisant DEFAULT
    v_height_nr NUMBER := 4; -- Affectation d'une valeur utilisant :=
    v_width_nr NUMBER:= 3; -- Affectation d'une valeur numerique
    v_volume_nr NUMBER:= v_length_nr*v_width_nr*v_height_nr; -- Affectation du resultat d'une operation
    v_min_nr NUMBER; -- Declaration du type uniquement
begin
    
    v_min_nr := least(v_length_nr,v_width_nr,v_height_nr); /* Affectation du resultat de l'application de 
    la fct predefinie LEAST aux variables */
    dbms_output.put_line(v_min_nr);
end;


-- RowType ---------------------------------------------------------------------

Select * from EMP;

declare
   employeeRec emp%ROWTYPE;
begin 
    select empno, sal into  employeeRec.empno, employeeRec.Sal
    from emp
    where  empno = '7499';
    DBMS_OUTPUT.PUT_LINE(employeeRec.empno||' '||employeeRec.Sal);
end;


-- If else ---------------------------------------------------------------------

select * from emp;

-- Augmenter les salaires de 25% pour les employes dont le salaire est inferieur ou egale à 800
Declare
    v_employe EMP%ROWTYPE; 
Begin
    Select * into v_employe From Emp Where EMPNO = 7369;	/*doit retourner 1 tuple seulement */ 
    IF v_employe.sal <= 800
    THEN Begin
        v_employe.sal := v_employe.sal * 1.25; 
        DBMS_OUTPUT.put_line ('Le nouveau salaire est' || '	' || v_employe.sal);
    End; 
    ELSE
        DBMS_OUTPUT.put_line ('Le salaire est' || '	' || v_employe.sal); 
    END IF;
End;


-- case when else ---------------------------------------------------------------------

select * from emp;

-- Augmenter les salaires de 25% pour les employes dont le salaire est egale à 800
Declare
    v_employe EMP%ROWTYPE; 
Begin
    Select * into v_employe From Emp Where EMPNO = 7369;	/*doit retourner 1 tuple seulement */ 
    case  v_employe.sal
        when 800 THEN 
            Begin
                v_employe.sal := v_employe.sal * 1.25; 
                DBMS_OUTPUT.put_line ('Le nouveau salaire est' || '	' || v_employe.sal);
            End; 
    ELSE
        DBMS_OUTPUT.put_line ('Le salaire est' || '	' || v_employe.sal); 
    END Case;
End;

-- Loop ------------------------------------------------------------------------

--Retourner les chiffres de 1 à 6
Declare
    v_compteur1 number (6,0) := 0; 
Begin
    LOOP
        v_compteur1 := v_compteur1 +1; DBMS_OUTPUT.put_line ( v_compteur1);
    EXIT WHEN v_compteur1 > 5; 
    End Loop;
End;

-- While Loop ------------------------------------------------------------------

--Retourner les chiffres de 1 à 6
Declare
    v_compteur1 number (6,0) := 0; 
Begin
    <<B1>> WHILE v_compteur1 <= 5 Loop 
        v_compteur1 := v_compteur1 +1; 
        DBMS_OUTPUT.put_line ( v_compteur1); 
    End Loop B1;
End;


-- For Loop --------------------------------------------------------------------

--Calculer la somme des entiers de 1 à 5
DECLARE
    Somme int :=0; 
Begin
    FOR J IN 1..5 LOOP
        Somme := Somme + J; 
    END LOOP;
    DBMS_OUTPUT.put_line ('La somme des indices : ' || Somme); 
END;

