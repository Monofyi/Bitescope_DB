CREATE OR REPLACE FUNCTION qrcode_generator(count integer)
returns integer
LANGUAGE 'plpgsql'
as $body$
declare
BEGIN
   FOR i IN 1..count LOOP
    insert into qr_base (qr_id, time_log) values (substr(md5(random()::text), 0, 60) , CURRENT_TIMESTAMP)
      LIMIT  15000;
   END LOOP;
return (select count(*) from qr_base);
    end;
    $body$;


/* select qrcode_generator(10000);
   select * from qr_base;
 */


CREATE OR REPLACE FUNCTION qr_valid(qr_code varchar)
returns bool as $qr_base$
    declare
    qr_base varchar;
    begin
    select into qr_base(exists(select count(*) from qr_base where qr_id = qr_code));
    return qr_base;
    end;
    $qr_base$ LANGUAGE 'plpgsql';


/*
 drop function qr_valid;


select qr_valid('2e1cbd4fc0da01d7cf29079696bccaa6');


select exists(select count(*) from qr_base where qr_id = '2e1cbd4fc0da01d7cf29079696bccaa6');
 */