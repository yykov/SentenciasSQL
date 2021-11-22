-- TRIGGER
-- Trigger que actualice el número de mascotas que un cliente ha llevado
CREATE OR REPLACE FUNCTION tg_actualiza() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE cliente
	set cant_mascota = cant_mascota + 1
	where id_cliente = new.id_cliente;
	Raise notice 'Se actualizó la cantidad de mascotas llevadas por el cliente relacionado';
	return new;
END
$$
LANGUAGE plpgsql;

create trigger tg_update after insert on mascota
for each row
execute procedure tg_actualiza()



-- INSERCION DE 2 REGISTROS PARA COMPROBACIÓN DE FUNCIONAMIENTO DEL TRIGGER
insert into mascota values (208,101,301,'Pepe','2018-04-20','Macho','Gris','No'),
(209,105,301,'Pepa','2019-04-20','Hembra','Café','No')

