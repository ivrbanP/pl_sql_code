/* Results in DBMS Output (View tab in SQL Developer): Choose who will present in a next Diatoms DEMO*/

 

DECLARE

    num_random number := 0;

    who varchar2(40) := '';

BEGIN

select round(dbms_random.value, 15) into num_random from dual;

SELECT

            CASE

                WHEN num_random BETWEEN 0 AND 0.111111111111111 THEN 'Martina'

                WHEN num_random BETWEEN 0.111111111111112 AND 0.222222222222222 THEN 'Ivo'

                WHEN num_random BETWEEN 0.222222222222223 AND 0.333333333333333 THEN 'Laurenz'

                WHEN num_random BETWEEN 0.333333333333334 AND 0.444444444444444 THEN 'Karolina'

                WHEN num_random BETWEEN 0.444444444444445 AND 0.555555555555556 THEN 'Alex'

                WHEN num_random BETWEEN 0.555555555555557 AND 0.666666666666667 THEN 'David'

                WHEN num_random BETWEEN 0.666666666666668 AND 0.777777777777778 THEN 'Flori'

                WHEN num_random BETWEEN 0.777777777777779 AND 0.888888888888889 THEN 'Zoltan'

                WHEN num_random BETWEEN 0.888888888888890 AND 1  THEN 'Wolfgang'

            END  into who

        FROM

        dual;  

dbms_output.put_line (who);

 

 

end;

 

 

 

 

 

 

 

/*************************************************************************************************************************************************/

 

/*test the query from above*/

 

create table random_presenters (who varchar2(40));

 

/

DECLARE

    num_random number := 0;

BEGIN

execute immediate ('truncate table ocr.random_presenters');

FOR i IN 1..10000000

LOOP

    select round(dbms_random.value, 15) into num_random from dual;

    INSERT

        INTO random_presenters ( who )

   

    ( SELECT

            CASE

                WHEN num_random BETWEEN 0 AND 0.111111111111111 THEN 'Martina'

                WHEN num_random BETWEEN 0.111111111111112 AND 0.222222222222222 THEN 'Ivo'

                WHEN num_random BETWEEN 0.222222222222223 AND 0.333333333333333 THEN 'Laurenz'

                WHEN num_random BETWEEN 0.333333333333334 AND 0.444444444444444 THEN 'Karolina'

                WHEN num_random BETWEEN 0.444444444444445 AND 0.555555555555556 THEN 'Alex'

                WHEN num_random BETWEEN 0.555555555555557 AND 0.666666666666667 THEN 'David'

                WHEN num_random BETWEEN 0.666666666666668 AND 0.777777777777778 THEN 'Flori'

                WHEN num_random BETWEEN 0.777777777777779 AND 0.888888888888889 THEN 'Zoltan'

                WHEN num_random BETWEEN 0.888888888888890 AND 1  THEN 'Wolfgang'

            END

        FROM

        dual

       );

END LOOP;

commit;

END;

/

 

 

 

select who, to_char(count(*), '9,999,999')

from

ocr.RANDOM_PRESENTERS

group by who;
