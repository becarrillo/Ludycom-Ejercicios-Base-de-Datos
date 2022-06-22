DECLARE

v_id_pedido number;
v_resumen clob;

BEGIN
    v_id_pedido := 3;

    imprimir_pedido(1, v_resumen);

    dbms_output.put_line(v_resumen);

END;