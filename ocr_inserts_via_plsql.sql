-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-09-17 09:32:00.726

-- foreign keys
ALTER TABLE Accounts
    DROP CONSTRAINT Accounts_Collaterals;

ALTER TABLE Accounts
    DROP CONSTRAINT Accounts_Customer;

ALTER TABLE Accounts
    DROP CONSTRAINT Accounts_Int_Ratings;

ALTER TABLE Accounts
    DROP CONSTRAINT Accounts_Products;

ALTER TABLE Accounts
    DROP CONSTRAINT Accounts_Provisions;

-- tables
DROP TABLE Accounts;

DROP TABLE Collaterals;

DROP TABLE Customers;

DROP TABLE Fx_Rates;

DROP TABLE Int_Ratings;

DROP TABLE Products;

DROP TABLE Provisions;

-- sequences
DROP SEQUENCE seq_account_rk;

DROP SEQUENCE seq_collateral_rk;

DROP SEQUENCE seq_customer_rk;

DROP SEQUENCE seq_fx_rate_rk;

DROP SEQUENCE seq_int_rating_rk;

DROP SEQUENCE seq_product_rk;

DROP SEQUENCE seq_provision_rk;

-- End of file.



CREATE TABLE Accounts ( 
    account_rk number(20,0)  NOT NULL, 
    account_id varchar2(32)  NOT NULL, 
    in_default char(1)  NOT NULL, 
    maturity_date date  NOT NULL, 
    inception_date date  NOT NULL, 
    currency char(3)  NOT NULL, 
    balance_amt number(20,2)  NOT NULL, 
    interest_amt number(20,2)  NOT NULL, 
    int_rating_rk number(20,0)  NOT NULL, 
    customer_rk number(20,0)  NOT NULL, 
    product_rk number(20,0)  NOT NULL, 
    provision_rk number(20,0)  NOT NULL, 
    collateral_rk number(20,0)  NOT NULL, 
    CONSTRAINT check_if_T_or_F CHECK (in_default in ('T','F')), 
    CONSTRAINT Accounts_pk PRIMARY KEY (account_rk) 
) 
;

CREATE TABLE Collaterals ( 
    collateral_rk number(20,0)  NOT NULL, 
    collateral_id varchar2(32)  NOT NULL, 
    collateral_type varchar2(20)  NOT NULL, 
    expiration_date date  NOT NULL, 
    effective_date date  NOT NULL, 
    collateral_amt number(20,2)  NOT NULL, 
    collateral_currency char(3)  NOT NULL, 
    CONSTRAINT Collaterals_pk PRIMARY KEY (collateral_rk) 
) 
;

CREATE TABLE Customers ( 
    customer_rk number(20,0)  NOT NULL, 
    customer_id varchar2(32)  NOT NULL, 
    customer_name varchar2(30)  NOT NULL, 
    customer_country char(3)  NOT NULL, 
    CONSTRAINT Customers_pk PRIMARY KEY (customer_rk) 
) 
;

CREATE TABLE Fx_Rates ( 
    fx_rate_rk number(20,0)  NOT NULL, 
    currency_from char(3)  NOT NULL, 
    currency_to char(3)  NOT NULL, 
    rate number(20,4)  NOT NULL, 
    fx_rate_date date  NOT NULL, 
    CONSTRAINT Fx_Rates_pk PRIMARY KEY (fx_rate_rk) 
) 
;

CREATE TABLE Int_Ratings ( 
    int_rating_rk number(20,0)  NOT NULL, 
    int_rating_id varchar2(20)  NOT NULL, 
    rating_grade char(3)  NOT NULL, 
    pd number(20,4)  NOT NULL, 
    description varchar2(150)  NOT NULL, 
    CONSTRAINT Int_Ratings_pk PRIMARY KEY (int_rating_rk) 
) 
;

CREATE TABLE Products ( 
    product_rk number(20,0)  NOT NULL, 
    gpc char(6)  NOT NULL, 
    description varchar2(150)  NOT NULL, 
    valid_from date  NOT NULL, 
    valid_to date  NOT NULL, 
    CONSTRAINT Products_pk PRIMARY KEY (product_rk) 
) 
;

CREATE TABLE Provisions ( 
    provision_rk number(20,0)  NOT NULL, 
    provision_id varchar2(32)  NOT NULL, 
    provision_currency char(3)  NOT NULL, 
    provision_type varchar2(15)  NOT NULL, 
    provision_amt number(20,2)  NOT NULL, 
    CONSTRAINT Provisions_pk PRIMARY KEY (provision_rk) 
) 
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_Collaterals 
    FOREIGN KEY (collateral_rk) 
    REFERENCES Collaterals (collateral_rk)
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_Customer 
    FOREIGN KEY (customer_rk) 
    REFERENCES Customers (customer_rk)
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_Int_Ratings 
    FOREIGN KEY (int_rating_rk) 
    REFERENCES Int_Ratings (int_rating_rk)
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_Products 
    FOREIGN KEY (product_rk) 
    REFERENCES Products (product_rk)
;

ALTER TABLE Accounts ADD CONSTRAINT Accounts_Provisions 
    FOREIGN KEY (provision_rk) 
    REFERENCES Provisions (provision_rk)
;

CREATE SEQUENCE seq_account_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_collateral_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_customer_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_fx_rate_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_int_rating_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_product_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

CREATE SEQUENCE seq_provision_rk 
      INCREMENT BY 1 
      NOMINVALUE 
      NOMAXVALUE 
      START WITH 1 
      NOCACHE 
      NOCYCLE
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'12a232s3','0.5',0.6582,'STD_POORS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'212a2s3','1.0',0.03282,'STD_POORS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'453a2s3','1.5',0.6282,'STD_POORS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'968a2s3','2.0',0.0282,'FITCH')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'3212a2s3','2.5',0.02382,'MOODYS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'9622a2s3','1.5',0.006282,'FITCH')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'21s22a2s3','1.0',0.02182,'MOODYS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'212a2s3','1.5',0.6282,'STD_POORS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'2322a2s3','2.0',0.036282,'STD_POORS')
;

insert into int_ratings (int_rating_rk, int_rating_id,rating_grade,pd,description) 
values 
(seq_int_rating_rk.nextval,'3622a2s3','2.5',0.6282,'FITCH')
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'CA0100','LOAN',to_date('19-09-2009','dd-mm-yyyy'),to_date('19-09-2019','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'DG0100','MORTGAGE',to_date('21-08-2009','dd-mm-yyyy'),to_date('23-09-2020','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'DC0200','LEASING',to_date('09-09-2009','dd-mm-yyyy'),to_date('19-09-2029','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'FE0200','CORE_BANKING_ACCOUNT',to_date('19-05-2002','dd-mm-yyyy'),to_date('19-03-2021','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'FL1000','LOAN',to_date('24-04-2009','dd-mm-yyyy'),to_date('19-03-2023','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'PA0400','MORTGAGE',to_date('10-08-2009','dd-mm-yyyy'),to_date('13-09-2020','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'TG0200','LEASING',to_date('13-08-2009','dd-mm-yyyy'),to_date('19-09-2023','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'TM0500','SAVING_ACCOUNT',to_date('29-03-2009','dd-mm-yyyy'),to_date('19-09-2026','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'FN0107','LOAN',to_date('04-02-2009','dd-mm-yyyy'),to_date('10-09-2029','dd-mm-yyyy'))
;

insert into products (product_rk,gpc,description,valid_from,valid_to) 
values 
(seq_product_rk.nextval,'DG0400','MORTGAGE',to_date('19-03-2009','dd-mm-yyyy'),to_date('19-05-2029','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'CHF','EUR','0.8676',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'GBP','EUR','1.14051',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'HRK','EUR','0.13537',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'HUF','EUR','0.0376',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'USD','EUR','0.85476',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'RUB','EUR','0.05476',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'RON','EUR','0.95476',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'BAM','EUR','2.95476',to_date('19-09-2019','dd-mm-yyyy'))
;

insert into fx_rates (fx_rate_rk,currency_from,currency_to,rate,fx_rate_date) 
values 
(seq_fx_rate_rk.nextval,'RSD','EUR','0.75476',to_date('19-09-2019','dd-mm-yyyy'))
;

select * from fx_rates
;

insert into provisions (provision_rk,provision_id,provision_currency,provision_type,provision_amt) 
values 
(seq_provision_rk.nextval,'123614','EUR','PLL',32.021)
;

insert into collaterals (collateral_rk,collateral_id,collateral_type,expiration_date,effective_date,collateral_amt,collateral_currency) 
values 
(seq_collateral_rk.nextval,'12361gf4','CRM_CASH',to_date('10-09-2029','dd-mm-yyyy'),to_date('29-09-2019','dd-mm-yyyy'),'21.52','EUR')
;

insert into customers (customer_rk,customer_id,customer_name,customer_country) 
values 
(seq_customer_rk.nextval,'M453KJ89','IVO VRBAN','HR')
;

/*insert into accounts (account_rk,account_id,in_default,maturity_date,inception_date,currency,balance_amt,interest_amt) 
values 
(seq_account_rk.nextval,'32AM453KJ89','F',to_date('29-12-2019','dd-mm-yyyy'),to_date('29-07-2009','dd-mm-yyyy'),'HRK','22500','20')
;*/


drop table hlp_country_list;
create table hlp_country_list as  
select 'AE' as country_name from dual union  
select 'AL' as country_name from dual union  
select 'AT' as country_name from dual union  
select 'AU' as country_name from dual union  
select 'AW' as country_name from dual union  
select 'BA' as country_name from dual union  
select 'BB' as country_name from dual union  
select 'BE' as country_name from dual union  
select 'BG' as country_name from dual union  
select 'BM' as country_name from dual union  
select 'BS' as country_name from dual union  
select 'BY' as country_name from dual union  
select 'BZ' as country_name from dual union  
select 'CA' as country_name from dual union  
select 'CH' as country_name from dual union  
select 'CN' as country_name from dual union  
select 'CY' as country_name from dual union  
select 'CZ' as country_name from dual union  
select 'DE' as country_name from dual union  
select 'DK' as country_name from dual union  
select 'DM' as country_name from dual union  
select 'DO' as country_name from dual union  
select 'EE' as country_name from dual union  
select 'ES' as country_name from dual union  
select 'FI' as country_name from dual union  
select 'FR' as country_name from dual union  
select 'GB' as country_name from dual union  
select 'GG' as country_name from dual union  
select 'GI' as country_name from dual union  
select 'GR' as country_name from dual union  
select 'HK' as country_name from dual union  
select 'HR' as country_name from dual union  
select 'HU' as country_name from dual union  
select 'IE' as country_name from dual union  
select 'IL' as country_name from dual union  
select 'IM' as country_name from dual union  
select 'IN' as country_name from dual union  
select 'IO' as country_name from dual union  
select 'IS' as country_name from dual union  
select 'IT' as country_name from dual union  
select 'JE' as country_name from dual union  
select 'JO' as country_name from dual union  
select 'JP' as country_name from dual union  
select 'KN' as country_name from dual union  
select 'KR' as country_name from dual union  
select 'KW' as country_name from dual union  
select 'KY' as country_name from dual union  
select 'LB' as country_name from dual union  
select 'LI' as country_name from dual union  
select 'LT' as country_name from dual union  
select 'LU' as country_name from dual union  
select 'LV' as country_name from dual union  
select 'LY' as country_name from dual union  
select 'MC' as country_name from dual union  
select 'ME' as country_name from dual union  
select 'MH' as country_name from dual union  
select 'MK' as country_name from dual union  
select 'MT' as country_name from dual union  
select 'MU' as country_name from dual union  
select 'MY' as country_name from dual union  
select 'NL' as country_name from dual union  
select 'NO' as country_name from dual union  
select 'PA' as country_name from dual union  
select 'PL' as country_name from dual union  
select 'PR' as country_name from dual union  
select 'PT' as country_name from dual union  
select 'RO' as country_name from dual union  
select 'RS' as country_name from dual union  
select 'RU' as country_name from dual union  
select 'SC' as country_name from dual union  
select 'SE' as country_name from dual union  
select 'SG' as country_name from dual union  
select 'SI' as country_name from dual union  
select 'SK' as country_name from dual union  
select 'SL' as country_name from dual union  
select 'SZ' as country_name from dual union  
select 'TC' as country_name from dual union  
select 'TN' as country_name from dual union  
select 'TR' as country_name from dual union  
select 'TW' as country_name from dual union  
select 'UA' as country_name from dual union  
select 'UM' as country_name from dual union  
select 'US' as country_name from dual union  
select 'VC' as country_name from dual union  
select 'VG' as country_name from dual  
;

select * from hlp_country_list
;


SELECT * 
    FROM hlp_country_list 
    ORDER BY DBMS_RANDOM.VALUE 
    FETCH NEXT 1 ROWS ONLY 
;


drop table hlp_name_list;
create table hlp_name_list as  
select 'John' as first_name, 'Gates' as last_name from dual union  
select 'Steve' as first_name, 'Johnson' as last_name from dual union  
select 'Robert' as first_name, 'Ellison' as last_name from dual union  
select 'Paul' as first_name, 'Jackson' as last_name from dual union  
select 'George' as first_name, 'Donovan' as last_name from dual union  
select 'Julia' as first_name, 'Lesnar' as last_name from dual union  
select 'Diane' as first_name, 'Miller' as last_name from dual union  
select 'Whitney' as first_name, 'Hendricks' as last_name from dual 
;

select * from hlp_name_list
;

-- customers table
truncate table customers;
declare  
    v_first_name varchar2(15); 
    v_last_name varchar2(15); 
    v_country_name char(3); 
begin 
    FOR i IN 1..1000 
    LOOP 
       SELECT first_name into v_first_name FROM hlp_name_list ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
       SELECT last_name into v_last_name FROM hlp_name_list ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
       SELECT COUNTRY_NAME into v_country_name FROM hlp_country_list ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        
       insert into customers (customer_rk,customer_id,customer_name,customer_country) 
        values 
        (seq_customer_rk.nextval, 
        substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,3) || '-' || to_char(round(dbms_random.value*100000,0)) || '-' || substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,5), 
        v_first_name || ' ' || v_last_name, 
        v_country_name); 
    END LOOP; 
    commit; 
end;

/

select * from 
( 
    select * from customers 
) 
where rownum<200 
;


/

-- provisions table
truncate table provisions;
begin 
    FOR i IN 1..10000 
    LOOP 
        insert into provisions (provision_rk,provision_id,provision_currency,provision_type,provision_amt) 
        values 
        (seq_provision_rk.nextval, 
        substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,5) || '*' || to_char(round(dbms_random.value*100000,0)) || '*' || substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,10), 
        case 
            when dbms_random.value between .01 and .14 then 'HRK' 
            when dbms_random.value between .15 and .28 then 'EUR'
            when dbms_random.value between .29 and .43 then 'BAM'
            when dbms_random.value between .44 and .58 then 'RSD'
            when dbms_random.value between .59 and .73 then 'RUB'
            when dbms_random.value between .74 and .88 then 'PLN'
            else 'RON' 
        end, --currency
        case 
            when dbms_random.value between .01 and .19 then 'CRM_CASH' 
            when dbms_random.value between .2 and .39 then 'CRM_GUARANTEE'
            when dbms_random.value between .4 and .59 then 'CRM_INSURANCE'
            when dbms_random.value between .6 and .79 then 'CRM_INSTRUMENT'
            else 'CRM_PHYSICAL' 
        end, --type
        round(dbms_random.value*100000,2)
        ); 
    END LOOP; 
    commit; 
end;

/

select * from 
( 
    select * from provisions 
) 
where rownum<200 
;



/

select 
    case 
        when dbms_random.value between .01 and .19 then 'CRM_CASH' 
        when dbms_random.value between .2 and .39 then 'CRM_GUARANTEE'
        when dbms_random.value between .4 and .59 then 'CRM_INSURANCE'
        when dbms_random.value between .6 and .79 then 'CRM_INSTRUMENT'
        else 'CRM_PHYSICAL' 
    end as prov_type
from dual;


select 
    dbms_random.value
from 
    dual;
    
    

/


-- accounts table
truncate table accounts;
declare
    v_int_rating_rk number;
    v_customer_rk number;
    v_product_rk number;
    v_provision_rk number;
    v_collateral_rk number;
begin 
    FOR i IN 1..1500 
    LOOP 
        SELECT int_rating_rk into v_int_rating_rk FROM int_ratings ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        SELECT customer_rk   into v_customer_rk   FROM customers   ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        SELECT product_rk    into v_product_rk    FROM products    ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        SELECT provision_rk  into v_provision_rk  FROM provisions  ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        SELECT collateral_rk into v_collateral_rk FROM collaterals ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 1 ROWS ONLY; 
        
        insert into accounts (account_rk,account_id,in_default,maturity_date,inception_date,currency,balance_amt,interest_amt,int_rating_rk,customer_rk,product_rk,provision_rk,collateral_rk) 
        values 
        (seq_account_rk.nextval, 
        substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,5) || '*' || to_char(round(dbms_random.value*10000,0)) || '#' || substr(standard_hash(to_char(round(dbms_random.value*100000,0)), 'MD5'),1,15), 
        case 
            when dbms_random.value between .01 and .8 then 'F' 
            else 'T' 
        end, --in_default
        sysdate + round(dbms_random.value*10000,0), --maturity_date
        sysdate - round(dbms_random.value*1000,0), --inception_date
        case 
            when dbms_random.value between .01 and .14 then 'HRK' 
            when dbms_random.value between .15 and .28 then 'EUR'
            when dbms_random.value between .29 and .43 then 'BAM'
            when dbms_random.value between .44 and .58 then 'RSD'
            when dbms_random.value between .59 and .73 then 'RUB'
            when dbms_random.value between .74 and .88 then 'PLN'
            else 'RON' 
        end, --currency
        round(dbms_random.value*100000,2), --balance_amt
        round(dbms_random.value*1000,2), --interest_amt
        v_int_rating_rk,
        v_customer_rk,
        v_product_rk,
        v_provision_rk,
        v_collateral_rk
        ); 
    END LOOP; 
    commit; 
end;

/

select * from 
( 
    select * from accounts 
) 
where rownum<200 
;



/



select sysdate,sysdate-10, sysdate + round(dbms_random.value*10000,0),
sysdate - round(dbms_random.value*1000,0)
from dual;


select in_default, count(*)
from 
accounts
group by in_default
;

select currency, count(*)
from 
accounts
group by currency
;



select provision_type, count(*)
from 
provisions
group by provision_type
;




       

