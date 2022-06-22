create or replace trigger handler_apodo                                 -- Ejercicio TRIGGERS
before insert on USUARIO
for each row

DECLARE

repeated_value EXCEPTION;
test_apodo NUMBER;
apodo_it usuario.apodo%type;

BEGIN
    apodo_it := :new.apodo;
    
    SELECT count(apodo)
    INTO test_apodo
    FROM usuario u
    WHERE u.apodo = apodo_it;
    
    IF test_apodo > 0 THEN
      raise repeated_value;
    END IF;
    
    EXCEPTION
    WHEN repeated_value THEN
      raise_application_error(-20127, 'Has intentado una inserción en el campo apodo que contiene el mismo valor, �sto no es permitido en �ste ejercicio.');

END;