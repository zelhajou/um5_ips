/* Exercice 01:

Ecrire un programme PL/SQL permettant de permuter le contenu de deux variables :
        - a = 9
        - b = 5  
*/

set serveroutput on;
Declare
    a number(4) := 9;
    b number(4) := 5;
    c number(4);
Begin
    DBMS_OUTPUT.PUT_LINE('a = ' || a );
    DBMS_OUTPUT.PUT_LINE('b = ' || b );
    
    c := a;
    a := b;
    b := c;
    
    DBMS_OUTPUT.PUT_LINE('a = ' || a );
    DBMS_OUTPUT.PUT_LINE('b = ' || b );
    
END;


/* Exercice 02

Ecrire un programme PL/SQL permettant de calculer la factorielle du contenu d’une variable :
    - a = 10
*/

Declare
    a number := 10;
    compteur number := 0;
    fact number := 1;
Begin
    for compteur in 1..a loop
        fact := fact * compteur;
    end loop;
    
    DBMS_OUTPUT.PUT_LINE('La factorielle de ' || a || ' est : ' || fact );
    
END;

Create or replace procedure Fact (a integer)
is
    compteur number := 0;
    fact number := 1;
Begin
    for compteur in 1..a loop
        fact := fact * compteur;
    end loop;
    
    DBMS_OUTPUT.PUT_LINE('La factorielle de ' || a || ' est : ' || fact );
    
END;

Begin 
    fact(10);
End;

/* Exercice 03

Ecrire un programme PL/SQL permettant de faire une rotation circulaire d’un tableau :
    - 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 => 10, 1, 2, 3, 4, 5, 6, 7, 8, 9
*/

set serveroutput on;
Declare 
    type tab is varray(10) of number; -- Declaration
    t tab; -- variable de type tab
    i number;
    tmp number;
Begin
    t := tab(1, 2, 3, 4, 5, 6, 7, 8, 9, 10); -- Initialisation utilisant le constructeur 
    tmp := t(10);
    
    for i in reverse 2..10 loop
        t(i) := t(i-1);
    end loop;
    
    t(1) := tmp;
    for i in 1..10 loop
        DBMS_OUTPUT.PUT(t(i) || ' ');
    end loop;
    DBMS_Output.new_line;
END;
        

/* Exercice 04

Ecrire un programme PL/SQL permettant d’inverser l’ordre des éléments d’un tableau
    - 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 => 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
*/

Declare 
    type tab is varray(30) of number; -- Declaration
    t tab; -- variable de type tab
    i number;
    tmp number;
    tcount number;
Begin
    t := tab(1, 2, 3, 4, 5, 6, 7, 8, 9, 10); -- Initialisation utilisant le constructeur
    
    tcount := t.count;
    for i in 1..Round(tcount/2) loop
        tmp := t(i);
        t(i) := t(tcount-i+1);
        t(tcount-i+1) := tmp;
    end loop;
    
    for i in 1..tcount loop
        DBMS_OUTPUT.PUT(t(i) || ' ');
    end loop;
    DBMS_Output.new_line;
END;