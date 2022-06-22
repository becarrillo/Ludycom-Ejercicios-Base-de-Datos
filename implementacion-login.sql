DECLARE
v_email usuario.email%type;
v_id_usuario usuario.idusuario%type;
v_apodo usuario.apodo%type;
v_mensaje VARCHAR2(18 BYTE);
BEGIN

my_login('topo', '135t', v_mensaje, v_apodo, v_id_usuario, v_email);
dbms_output.put_line(v_mensaje||' : '||'ID USUARIO '||v_id_usuario||' CON CORREO '||v_email||' USUARIO '||v_apodo);

END;
--UPDATE usuario SET password = standard_hash('toneo7', 'MD5')
--where idusuario = 29;