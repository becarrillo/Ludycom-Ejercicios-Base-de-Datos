DECLARE                     -- Ejercicio "Cursores Implícitos y Cursores Explícitos" (A)

cursor op is
SELECT f.*
FROM opinion f
WHERE f.idpelicula=5;

id_op opinion.idopinion%type;
id_film opinion.idpelicula%type;
id_user opinion.opinion%type;
fetched_op opinion.opinion%type;
puntuacion opinion.puntuacion%type;
fecha opinion.fecha%type;

BEGIN

OPEN op;

loop
    FETCH op INTO id_op, id_film, id_user, fetched_op, puntuacion, fecha;

    dbms_output.put_line('La opinión con id '||id_op||' de la película con id '||id_film||' entre todas las películas, fue: '||fetched_op||'.  Fecha: '||fecha);
    
    exit WHEN op%notfound;
end loop;

CLOSE op;
  
END;



                        -- Ejercicio "Cursores Implícitos y Cursores Explícitos" (B)
                        
 
DECLARE

cursor op(user_id opinion.idusuario%type) is
SELECT opinion.*
FROM opinion
WHERE opinion.idusuario=user_id;

id_usuario NUMBER;
film pelicula.titulo%type;
fmid opinion.idpelicula%type;

BEGIN

id_usuario := &usuario;

FOR x in op(id_usuario) loop
    fmid := x.idpelicula;
    
    SELECT f.titulo
    INTO film
    FROM pelicula f
    WHERE f.idpelicula=fmid;
    
    dbms_output.put_line('Película: '||upper(film)||'   //   '||'Opinión:  '||x.opinion);
    exit WHEN op%notfound;
end loop;


END;







