DECLARE                     -- ejercicio Exceptions

dont_have_arroba EXCEPTION;
l_found BOOLEAN := true;
id_user usuario.idusuario%type;
nick usuario.apodo%type;
email usuario.email%type;

BEGIN

SELECT ur.idusuario, ur.apodo, ur.email
INTO id_user, nick, email
FROM usuario ur
WHERE ur.email='mendez_pe*mailejemplo.com';

IF substr(email, length(email)-16+1, 1) <> '@' THEN
    raise dont_have_arroba;
END IF;

dbms_output.put_line('ID '||id_user||'   '||'APODO '||nick);

EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('ELEMENTO NO FUE ENCONTRADO');

WHEN TOO_MANY_ROWS THEN
dbms_output.put_line('Existe más de un usuario con ese email');

WHEN dont_have_arroba THEN
dbms_output.put_line('La entrada email no contiene un email válido (le falta "@")');

END;