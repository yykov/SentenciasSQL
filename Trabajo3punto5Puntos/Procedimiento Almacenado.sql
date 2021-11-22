-- Un procedimiento almacenado que retorne las fechas programadas de citas futuras de las mascotas
-- Se define un tipo estructurado.
create type citas_futuras as (
	fecha_cita date,
	id_mascota integer,
	nombre_masc varchar
)

-- PROCEDIMIENTO ALMACENADO O FUNCION SOLICITADA
create or replace function citasProg (date) returns setof citas_futuras
as
$$
	select citas.fecha_cita, citas.id_mascota, mascota.nombre_masc from citas
	inner join mascota ON mascota.id_mascota = citas.id_mascota
	where fecha_cita > $1
	group by citas.fecha_cita, citas.id_mascota, mascota.nombre_masc
$$
language SQL;

-- Se realiza la consulta solicitada
select * from citasProg('2021-11-18')