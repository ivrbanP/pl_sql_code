drop table hlp_counterparty_indicator;
create table hlp_counterparty_indicator as  
select 'L' as indicator, 'Loan' as description, 1 as weight from dual union  
select 'LIM' as indicator, 'Limit' as description, 2 as weight from dual union  
select 'M' as indicator, 'Money Market' as description, 7 as weight from dual union  
select 'A' as indicator, 'Account' as description, 1 as weight from dual union  
select 'G' as indicator, 'Guarantee' as description, 6 as weight from dual union  
select 'CC' as indicator, 'Credit Card' as description, 4 as weight from dual union  
select 'NA' as indicator, 'Negotiable Asset' as description, 8 as weight from dual union  
select 'LC' as indicator, 'Letter of Credit' as description, 7 as weight from dual ;


-- create table test_indicator (ind varchar2(3));

truncate table test_indicator;
declare
    v_ind varchar2(3);
begin

    FOR i IN 1..10000 
    LOOP 
        SELECT indicator into v_ind
        FROM 
            hlp_counterparty_indicator 
        ORDER BY DBMS_RANDOM.VALUE*weight FETCH NEXT 1 ROWS ONLY;
        
        insert into test_indicator (ind) values
        (v_ind);
    END LOOP;
    commit;
end;

/


select ind, count(*)
from 
test_indicator
group by ind
order by 2 desc
;





