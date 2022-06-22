create or REPLACE procedure imprimir_pedido(p_idpedido in number, p_resumen_pedido out clob)
is
v_res_pedido clob;
br VARCHAR2(1) := chr(10);
sep VARCHAR2(35) := br||'---------------------------------'||br;
v_datos_cliente VARCHAR2(140);
v_direccion_cliente VARCHAR2(140);
v_precio_final number;

cursor pedidos_articulo(id_pedido number) is
select p.cantidad, a.nombre, a.precio
from pedidos_articulos p
inner join articulos a on p.idarticulo = a.idarticulo
WHERE p.idpedido=id_pedido;

BEGIN

SELECT c.apellido||', '||c.nombre||'. DOC: '||c.documento, d.calle||' '||d.numero||' - PISO: '||d.piso||' '||d.departamento
INTO v_datos_cliente, v_direccion_cliente
FROM pedidos p
INNER JOIN clientes c on p.idcliente=c.idcliente
INNER JOIN direcciones d on d.idcliente=p.iddireccion
WHERE p.idpedido=3;

v_res_pedido := v_res_pedido||sep;
v_res_pedido := v_res_pedido||'CLIENTE: '||v_datos_cliente||br||'DIRECCION: '||v_direccion_cliente||sep;
v_res_pedido := v_res_pedido||sep||'A R T I C U L O S'||sep;

FOR art in pedidos_articulo(p_idpedido) loop

    v_res_pedido := v_res_pedido||art.nombre||'(x'||art.cantidad||')........$'||art.precio||br;

end loop;

p_resumen_pedido := v_res_pedido;



END;