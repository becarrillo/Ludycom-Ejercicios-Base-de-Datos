DECLARE                                         -- EJERCICIO VARIABLES Y SQL

field_y pelicula.año%type;
field_dscp pelicula.descripcion%type;
fila pelicula%rowtype;

BEGIN

SELECT p.*
INTO fila
FROM pelicula p
WHERE p.idpelicula=4;

field_y := fila.año;
field_dscp := fila.descripcion;

dbms_output.put_line('('||field_y||')'||' - '||field_dscp);

END;