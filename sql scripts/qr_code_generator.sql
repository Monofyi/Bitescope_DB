CREATE TABLE IF NOT EXISTS QR_BASE
(
    QR_ID    VARCHAR(60)
        CONSTRAINT QR_BASE_QR_ID_KEY
            UNIQUE,
    TIME_LOG TIMESTAMP,
    STATUS   BOOLEAN DEFAULT FALSE
);


CREATE TABLE IF NOT EXISTS QR_MAP
(
    Qr_id          varchar(60) REFERENCES qr_base (qr_id),
    Product_id     varchar REFERENCES products (product_id),
    Retailer_id    varchar REFERENCES retailers (retailer_id),
    Distributor_id varchar REFERENCES distributors (distributor_id) default null,
    Consumer_id    varchar REFERENCES consumers (consumer_id) default null,
    Location_1 varchar default null,
    Location_2 varchar default null,
    Location_3 varchar default null,
    Last_Updated   timestamp                                  default now()
);


CREATE OR REPLACE FUNCTION qrcode_generator(count integer)
    returns integer
    LANGUAGE 'plpgsql'
as
$body$
declare
BEGIN
    FOR i IN 1..count
        LOOP
            insert into qr_base (QR_ID, qr_timelog, qr_status)
            values (substr(md5(random()::text), 0, 60), CURRENT_TIMESTAMP, True)
            LIMIT 15000;
        END LOOP;
    return (select count(*) from qr_base);
end;
$body$;



CREATE OR REPLACE FUNCTION public.qrcode_generator(count integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
BEGIN
    FOR i IN 1..count
        LOOP
            insert into qr_base (QR_ID, qr_timelog, qr_status)
            values ('btrs1'||(substr(md5(random()::text), 0, 60)||'iuy89'), CURRENT_TIMESTAMP, True)
            LIMIT 15000;
        END LOOP;
    return (select count(*) from qr_base);
end;
$function$
;



/* select qrcode_generator(10000);
   select * from qr_base;
 */


CREATE OR REPLACE FUNCTION qr_valid(qr_code varchar) RETURNS text AS $$
begin
    return(select exists(select qr_id from qr_base where qr_id = qr_code));
end
$$
LANGUAGE 'plpgsql';


drop function qr_valid;


/*
 drop function qr_valid;


select qr_valid('8e905a1c2cc3a0feffea55be723edf8');

                         
select exists(select count(*) from qr_base where qr_id = '2e1cbd4fc0da01d7cf29079696bccaa6');
 */
