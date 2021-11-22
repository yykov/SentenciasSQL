--Inserciones tabla cliente
insert into cliente values (101,'1316670338','Leiver','Bravo','Masculino','Terra Nostra','0967497555','2020-03-03',1,'2021-06-06',2),
(102,'1316670337','Juana','Zambrano','Femenino','Altagracia','0967497554','2019-03-04',2,'2021-05-06',1),
(103,'1316670336','Pedro','Moreira','Masculino','Costa Azul','0967497553','2020-03-05',1,'2021-04-06',2),
(104,'1316670335','Luisa','Mero','Femenino','Manta 2000','0967497552','2019-03-06',2,'2021-03-06',1),
(105,'1316670334','Jaime','Valencia','Masculino','Los Esteros','0967497551','2020-03-07',1,'2021-02-06',1);

--Inserciones tabla tipo_animal
insert into tipo_animal values (301,'Perro'),
(302,'Gato'),
(303,'Loro'),
(304,'Conejo'),
(305,'Pez');

--Inserciones tabla mascota
insert into mascota values (201,101,302,'Mark','2018-11-30','Macho','Gris','Si'),
(202,101,301,'Chance','2015-11-30','Macho','Negro','Si'),
(203,102,302,'Michu','2017-11-30','Hembra','Blanco','No'),
(204,103,303,'Pepito','2017-10-30','Macho','Verde','No'),
(205,103,304,'Rabitt','2016-11-30','Macho','Blanco','No'),
(206,104,302,'Yoyo','2015-10-30','Hembra','Blanco','No'),
(207,105,302,'Kitt','2018-09-30','Hembra','Gris','Si');

--Inserciones tabla tipo_vacuna
insert into tipo_vacuna values (401,'AntiRabia'),
(402,'AntiParasito');

--Inserciones tabla proveedor
insert into proveedor values (501,'MedMascot','0909090909'),
(502,'PetMED','0909090808');

--Inserciones tabla veterinario
insert into veterinario values (601,'1314151617','Marcos','Arteaga','0999999999'),
(602,'1314151618','Maria','Arteaga','0999999998'),
(603,'1314151619','Alonzo','Alava','0999999997'),
(604,'1314151620','Mercedes','Quiroz','0999999996'),
(605,'1314151621','Camilo','Perez','0999999995');

--Inserciones tabla habitos
insert into habitos values (701,'DormirMucho','Duerme horas de más'),
(702,'JugarMucho','Juega con casi todo');

--Inserciones tabla productos
insert into productos values (801,501,101,'Asuntol','2021-06-06',3.20),
(802,502,103,'ShampooPet','2021-04-06',4.10),
(803,501,103,'Desparasitante3000','2021-04-06',2.50),
(804,502,105,'AntiCaida11','2021-02-06',3.80),
(805,501,104,'TalcoPetty','2021-03-06',5.10);

--Inserciones tabla productos
insert into relationship_4 values (701,203),
(701,207),
(702,202);

--Inserciones tabla detalle_vacuna
insert into detalle_vacuna values (901,604,201,402,'2021-06-06',1.15,'Prescripción Médica'),
(902,604,202,401,'2021-06-06',1.50,'Prescripción Médica'),
(903,605,203,402,'2021-05-06',1.15,'Compra Externa'),
(904,605,206,402,'2021-03-06',1.15,'Prescripción Médica'),
(905,604,207,402,'2021-02-06',1.15,'Compra Externa');

--Inserciones tabla citas
insert into citas values (1001,207,604,'2021-02-06'),
(1002,206,605,'2021-03-06'),
(1003,205,601,'2021-04-06'),
(1004,203,605,'2021-05-06'),
(1005,201,604,'2021-06-06'),
(1006,202,604,'2021-06-06'),
(1007,203,602,'2022-01-06'),
(1008,201,604,'2022-01-07'),
(1009,202,603,'2022-01-08');

-- Consultas

-- Consulta 1
select count(*) as cantidad, cliente.nombre_cl from citas 
inner join mascota on citas.id_mascota = mascota.id_mascota
inner join cliente on cliente.id_cliente = mascota.id_cliente
where citas.fecha_cita < '2021-11-16'
group by cliente.nombre_cl

-- Consulta 2
select count(*) as cantidad, cliente.nombre_cl as dueño, mascota.nombre_masc from detalle_vacuna 
inner join mascota on detalle_vacuna.id_mascota = mascota.id_mascota
inner join cliente on cliente.id_cliente = mascota.id_cliente
where detalle_vacuna.fecha_aplicacion < '2021-11-16'
group by cliente.nombre_cl, mascota.nombre_masc

-- Consulta 3
select count(*) as cantidad_de_vacunas_aplicadas, veterinario.nombre_vet as veterinario from detalle_vacuna 
inner join mascota on detalle_vacuna.id_mascota = mascota.id_mascota
inner join veterinario ON veterinario.id_veterinario = detalle_vacuna.id_veterinario
where detalle_vacuna.fecha_aplicacion < '2021-11-16'
group by veterinario.nombre_vet

-- Consulta 4
select detalle_vacuna.fecha_aplicacion, tipo_animal.nombre_tipo as tipo_de_animal, count(*) as total from detalle_vacuna 
inner join mascota on detalle_vacuna.id_mascota = mascota.id_mascota
inner join tipo_animal on tipo_animal.id_tipo = mascota.id_tipo
where detalle_vacuna.fecha_aplicacion < '2021-11-16'
group by detalle_vacuna.fecha_aplicacion, tipo_animal.nombre_tipo

