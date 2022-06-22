DECLARE

contador number := 0;

BEGIN

LOOP
    contador := contador+1;
    
    if contador = 9 THEN
        exit;
    end if;
    
    dbms_output.put_line('El número del contador es '||contador);
    
    --exit WHEN contador=9;
end LOOP;

END;