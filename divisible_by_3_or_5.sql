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
            mod_bool_3 := decode (i mod 3, 0,'T','F');
        else 
            suma:=suma+0; 
            mod_bool_5 := decode (i mod 5, 0,'T','F');
        end if;
        insert into run_results values (i, mod_bool_3, mod_bool, suma);
    end loop;
    
    commit;
end;

/

select * from 
run_results;
