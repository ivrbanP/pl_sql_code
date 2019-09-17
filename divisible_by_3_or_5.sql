drop table run_results;
create table run_results (iterator number(20,0), mod_3 char(1), mod_5 char(5),  agg number(20,4));

declare
    suma number := 0;
    mod_bool_3 char(1):='F';
    mod_bool_5 char(1):='F';
begin
    for i in 1..1000 loop
        if (i mod 3) = 0 or (i mod 5) = 0 
        then 
            suma:=suma+i;
            if (i mod 3)=0 then 
                mod_bool_3:='T'; 
                if (i mod 5)=0 then 
                    mod_bool_5:='T';
                end if;
            elsif (i mod 5)=0 then
                mod_bool_5:='T';
                if (i mod 3)=0 then 
                    mod_bool_3:='T';
                end if;
            else 
                mod_bool_3:='F'; mod_bool_5:='F';
            end if;
        else 
            suma:=suma+0; 
        end if;
        insert into run_results values (i, mod_bool_3, mod_bool_5, suma);
        mod_bool_3:='F'; mod_bool_5:='F';
    end loop;
    
    commit;
end;

/

select * from 
run_results order by agg ;


select * from 
run_results 
where mod_3='T' and mod_5='T'
order by agg desc;




