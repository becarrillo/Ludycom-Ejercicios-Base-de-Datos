create or replace procedure my_login(p_apodo in VARCHAR2, p_password in VARCHAR, p_mensaje out VARCHAR2, out_apodo out VARCHAR2, v_id_usuario out NUMBER, v_email out VARCHAR2)
is

apodo usuario.apodo%type;
id_usuario usuario.idusuario%type;
email usuario.email%type;
v_password_hasheado usuario.password%type;

BEGIN

    SELECT standard_hash(p_password, 'MD5')
    INTO v_password_hasheado
    FROM dual;
    
    SELECT u.idusuario, u.apodo, u.email
    into id_usuario, apodo, email
    FROM usuario u
    WHERE u.apodo = p_apodo and u.password = v_password_hasheado;
    
    p_mensaje := 'Login correcto';
    out_apodo := apodo;
    v_id_usuario := id_usuario;
    v_email := email;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      p_mensaje := 'Datos erróneos';
      out_apodo := 'NULL';
      v_id_usuario := 0;
      v_email := 'NULL';
    
END;


