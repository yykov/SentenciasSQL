-- CURSOR
-- Un cursor que muestre los veterinarios con todas las mascotas y fechas en las que fueron atendidas
do $$
declare
	c_veterinarios cursor for select * from veterinario, citas, mascota
	where citas.id_veterinario = veterinario.id_veterinario and mascota.id_mascota = citas.id_mascota 
	and citas.fecha_cita < '2021-11-18';
begin
	for registro in c_veterinarios 
	loop
		raise notice 'Veterinario: %, Fecha de cita: %, Mascota: %', 
		registro.nombre_vet, registro.fecha_cita, registro.nombre_masc;
	end loop;
end $$
language plpgsql;