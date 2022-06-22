create or replace function get_data_pelicula(id_pelicula NUMBER)            -- Ejercicio Funciones y Procedimientos
return pelicula.titulo%type is

cursor t_pelicula is
SELECT p.titulo, op.puntuacion
FROM pelicula p
inner join opinion op on p.idpelicula=op.idpelicula
WHERE p.idpelicula=id_pelicula;

d_score opinion.opinion%type;
total_score NUMBER := 0;
titulo_pe pelicula.titulo%type;
message VARCHAR2(150);
id_pe pelicula.idpelicula%type;
contador_t_pelicula NUMBER := 0;
promedio_op NUMBER;

BEGIN
    
    FOR f in t_pelicula loop
        total_score := total_score + f.puntuacion;
        contador_t_pelicula := contador_t_pelicula + 1;
        promedio_op := (total_score / contador_t_pelicula);
        message := f.titulo||' - '||'Calificación promedio: '||d_score||' ('||promedio_op||') '||' //  Cantidad de calificaciones sobre la pel�cula: '||contador_t_pelicula;
    end loop;

    CASE
        WHEN promedio_op between 1 and 2 THEN
            d_score := 'Mala';
        WHEN promedio_op between 3 and 4 THEN
            d_score := 'Buena';
        WHEN promedio_op < 1 THEN
            d_score := 'Pésimo, no hiciste nada';
        else
            d_score := 'Excelente';
    END CASE;
    
    return message;

END;