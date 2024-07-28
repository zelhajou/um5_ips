-- Procedures

Set serveroutput on;

-- Procédure avec Paramètre Donné IN
-- Procédure qui calcule le Carré d'un nombre
create or replace procedure carre (a in number)
is
begin
     dbms_output.put_line('Carré = '||a*a);
end;

exec carre(5);
execute carre(5);

-- Procédure avec Paramètre Resultat OUT
-- Procédure qui calcule le maximum de deux nombres et le renvoie en résultat


create or replace procedure max (a in number, b in number, x out number)
   is
begin
       if a>b then x := a;
         else x:=b;
       end if;
       dbms_output.put_line('max = '||x);
end;



declare
   m number;
begin
    max(2,5,m);
    --dbms_output.put_line('max = '||m);
end;


-- Procédure avec Paramètres IN OUT
-- Procédure qui permute deux nombres

create or replace procedure 
  permute (a in out number, b in out number) is
     w number;
   begin
     w := a;
     a := b;
     b := w;
   end;

declare
  x number := 1;
  y number := 2;
begin
  permute (x,y);
  dbms_output.put_line(x ||' '||y);
end;


-- Augmentation de salaire d'un employé donné avec un taux donné

select * from EMP;

--je veux afficher un prompt a l'utilisateur final lui permettant de saisir un salaire min
--pour tt employe ayant un salire < salaire min , je veux augmenter le salaire d'un taux ( taux )

create or replace procedure augmenterSalaire(
    pEmpno in emp.empno%type,
    taux in number
) is
begin
   -- Mise à jour salaire employé
   update emp
      set sal = sal + sal * taux / 100
      where empno = pEmpno;
end;


declare
    cursor empCursor is select * from EMP;
    minSal emp.SAl%TYPE := &minsalprompt; -- Vous pouvez utiliser le caractère & pour inviter un utilisateur à saisir une valeur.
begin
      for employeeRec in empCursor loop
           if  employeeRec.sal < minSal then
                  augmenterSalaire (employeeRec.empno, 10) ;
           end if;
      end loop;
end;

select * from emp;

declare
    minSal emp.SAl%TYPE := &minsalprompt; -- Vous pouvez utiliser le caractère & pour inviter un utilisateur à saisir une valeur.
begin
    update emp set sal = sal * (1 + 0.3) where sal< minsal;
end;





select * from EMP;


-- Fonctions
-- Convertisseur EUR en MAD

create or replace function EURtoMAD(montant in number) return number
 is
begin
   return  montant * 10.65;
   dbms_output.put_line(montant * 10.65);
end;

select EURtoMAD(sal) from emp;

select EURtoMAD(98) from dual;


-- Packages
create or replace package gest_emp is
    -- sal emp.sal%TYPE; -- Variable globale
    -- Fonction qui retourne le salaire augmentè d'un employe
    FUNCTION AugmenterSal (EmpNumber in emp.empno%TYPE, Taux in number) Return Number; 
    -- Procedure qui met à jour une table EMP = Augmenter lesalaire d'un employe d'un employe
    Procedure Test_AugmenterSal (EmpNumber in emp.empno%TYPE, Taux in number, SalAug out number); 
END;

create or replace package body gest_emp is
    empRecord emp%rowtype; 
    
    FUNCTION AugmenterSal (EmpNumber in emp.empno%TYPE, Taux in number) Return Number is
        funcSal emp.sal%TYPE;
        BEGIN
            Select sal into funcsal from emp where empno = EmpNumber;
            funcsal := funcsal * (Taux +1);
            --sal := funcsal;
            return funcsal;
        END;
        
    PROCEDURE AfficheSal is
        CURSOR empcursor is select * from emp;
        BEGIN
            FOR emprecord IN empcursor LOOP
                dbms_output.put_line(' L''employe ' || emprecord.empno || ' a un salaire de '|| emprecord.sal);
            END LOOP;
        END;
    
    Procedure Test_AugmenterSal (EmpNumber in emp.empno%TYPE, Taux in number, SalAug out number) is
        procsal emp.sal%TYPE;
        BEGIN
            update emp set sal = sal* (Taux +1);
            AfficheSal;
        END;
END;

-- Tester le package
        
Select * from emp; -- 7654 


Declare
    SalAug emp.sal%Type;
Begin
    --gest_emp.test_augmenterSal(7369, 0.2, SalAug);
    --salAug := gest_emp.augmentersal(7369, 0.2);
    dbms_output.put_line(gest_emp.augmentersal(7369, 0.2));
END;



Declare
    SalAug emp.sal%TYPE;
BEGIN 
   SalAug := gest_emp.AugmenterSal(7654, 0.2); 
   dbms_output.put_line(salaug);
   gest_emp.Test_AugmenterSal (7654, 0.2, SalAug);
END;


-- Triggers

create or replace trigger displayEvent
before insert or update or delete on emp
begin
    if inserting then 
        dbms_output.put_line('Inserting');
    elsif updating then
        dbms_output.put_line('Updating');
    else 
        dbms_output.put_line('Deleting');
    end if;
end;
Select * from emp;


insert into emp(empno) values (1122);
update emp set sal = 6000 where empno = 1122;
delete from emp where empno = 1122;

-- Trigger apres mise a jour de salaire
create or replace trigger UpdateSal
 after  
    update of sal on emp
 begin 
    dbms_output.put_line('Updated salary');
 end;

insert into emp(empno) values (1122);
update emp set sal = 1300 where empno = 1122;

-- Trigger avant mise a jour de salaire de chaque ligne
create or replace trigger UpdateDeptNO
after update of deptno on emp
for each row
begin
   dbms_output.put_line('Updated DeptNO For each row');
end;

update emp set DeptNo = 10 where empno in (1122,7369);

-- Specifier une condition
create or replace trigger UpdateSalOldNew
after update of sal on emp
for each row
when (old.sal < 1500)
begin
   dbms_output.put_line('Nouveau sal: ' || :new.sal);
   dbms_output.put_line('Ancien sal: ' || :old.sal);
end;

select * from emp;


update emp set sal = 1500 where empno in (1122,7369);



select * from user_triggers;
describe user_triggers;

ALTER TRIGGER DISPLAYEVENT ENABLE;
ALTER TRIGGER DISPLAYEVENT DISABLE;

ALTER TABLE EMP DISABLE ALL TRIGGERS;
ALTER TABLE EMP ENABLE ALL TRIGGERS;