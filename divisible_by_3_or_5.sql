drop table run_results;
create table run_results (iterator number(20,0), mod_3 char(1), mod_5 char(5),  agg number(20,4));

declare
    suma number := 0;
    mod_bool_3 char(1);
    mod_bool_5 char(1);
begin
    for i in 1..1000 loop
        if (i mod 3) = 0 or (i mod 5) = 0 
        then 
            suma:=suma+i;
            case 
                when (i mod 3)=0 then 
                    mod_bool_3:='T'; mod_bool_5:='F';
                when (i mod 5)=0 then 
                    mod_bool_3:='F'; mod_bool_5:='T';
            end case;
        else 
            suma:=suma+0; 
        end if;
        insert into run_results values (i, mod_bool_3, mod_bool_5, suma);
    end loop;
    
    commit;
end;

/

select * from 
run_results;


select decode ( (1=1),0,'T','F' )  from dual;


