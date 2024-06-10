USE DBProyectoBD;

-- Meter otra empresa
INSERT INTO Empresa
	(nit, nombre)
VALUES
	('45687625546', 'Raptur City')
;

-- A empleador
INSERT INTO Empleador 
	(cedula, nombre, contrasena, correo, telefono)
VALUES
	('4708924637', 'Albert', '190019301932', 'popGoesTheWeasel@gmail.com', '3088946521'),
	('9223622520', 'Jonah', 'DrlJonHil78', 'jonahHill@holliwood.com', '5441574352'),
	('1240212695', 'Andrew', 'jzIPXsV1yfYR', 'ryanIndustries@raptur.inc', '2065186751')
;

-- Meter a Andrew a Raptur
INSERT INTO Empleador_en_empresa
	(cedula_empleador, nit_empresa)
VALUES
	('1240212695', '45687625546')
;


-- A proveedores
INSERT INTO Proveedor
	(cedula, nombre, contrasena, correo, telefono, fecha_nacimiento, ciudad)
VALUES
	('7638332415', 'Sasha', 'IPcrw0PUkQJ2', 'sashaBlouss2023@scoutregiment.com', '3895801401', '1998-07-26', 'Dauper'),
	('3084510555', 'Keny', '4xWXdBaGORaj', 'ackermanKeny78@inners.com', '4804764757', '1975-02-04', 'Mitras'),
	('8243990236', 'Cody', '2nRgkoMcq2tS', 'WhistlinDiesel@rockingdiesel.com', '8120177316', '1998-07-18', 'Indianapolis'),
	('6788647854', 'Abel', 'X92yFhtd5qjf', 'weeknd@xorecords.com', '1874568197', '1990-02-16', 'Los Angeles'),
	('4180314872', 'Benito', 'vUSY4QXkzmqC', 'badbunny@hearthismusic.com', '5368831318', '1994-04-10', 'Miami')
;


-- A info extra para los proveedores
INSERT INTO Informacion_Extra
	(cedula_proveedor, id, nombre, descripcion)
VALUES
	('8243990236', 1, 'Grew up in farm', 'has grown up in a farm utilizing heavy machine equipment'),
	('7638332415', 1, 'In top of his class', 'When graduating from the military academy, I ranked in the top 10 of my generation'),
	('7638332415', 2, 'Avid eater', 'I love eating all types of food and have a very good sense of taste')
;

-- A Tipos
INSERT INTO Tipo
	(nombre)
VALUES
	--('Musical'),
	('Cocina'),
	('Bajos Requerimientos'),
	('Maquillaje')
;

-- A Certificados
INSERT INTO Certificados
	(id, nombre, entidad_que_certifica, tipo)
VALUES
	(78954, 'Artista Certificado', 'GrammyAwards', 4),
	(12379, 'Best Latin Singer', 'Youtube', 4)
;

-- A personas con certificado
INSERT INTO Certificados_de_proveedor
	(cedula_proveedor, id_certificado, fecha_adquisicion)
VALUES
	(6788647854, 78954, '2019'),
	(6788647854, 12379, '2022'),
	(4180314872, 78954, '2015')
;


-- A servicios
INSERT INTO Servicio
	(nombre, descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, 
		fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
VALUES
	('Raptur fest singer', 'We need a singer for the main event of the raptur anniversary fest. Whatever type of singer accepted', 
		3000000, '2024-04-09', '2024-05-01', 
		'2024-06-30', '2024-06-30', 'Raptur', '1240212695'),

	('Raptur fest chef', 'We need a helper for the chef of the Raptur anniversary fest, its a work of one day helping the chef with whatever it needs', 
		8000000, '2024-04-09', '2024-05-01', 
		'2024-06-30', '2024-06-30', 'Raptur', '1240212695'),

	('Garbage collector', 'We need a person that goes all over the fest collecting all the garbage that is thrown, and putting it into the corresponding garbage bins', 
		500000, '2024-04-09', '2024-05-01', 
		'2024-06-30', '2024-06-30', 'Raptur', '1240212695'),

	('Tunnel Digger', 'I need help making a tunnel here in san francisto, it has to be underwater from the bay are discovery museum to Angel Island State park (But more south)', 85000000, '2024-04-13', 
		'2025-01-01', '2025-01-10', '2025-07-05', 'San Francisco', '4708924637'),

	('Makeup artist', 'A makeup artist specialized in zombies is needed for an upcoming movie, the payment is monthly, and the same as stated in the service', 3000000, '2024-04-13', 
		'2024-05-01', '2024-05-13', '2027-04-25', 'Los Angeles', '9223622520')
;



-- Meterle Tipo De Servicio
INSERT INTO Tipo_de_Servicio
	(id_servicio, tipo)
VALUES
	(10009, 9),
	(10007, 7),
	(10008, 8),
	(10011, 10)
;


-- Meterle postulantes a los servicios
INSERT INTO Postulaciones_Servicio
	(id_servicio, cedula_proveedor, pago_sugerido, notas)
VALUES
	(10000, 1038262298, 520000, 'Me encanta cocinar'),
	(10007, 6788647854, 3500000, 'Im the Best latin singer'),
	(10007, 4180314872, 4000000, 'I mean, Im the weeknd'),
	(10010, 7638332415, 85000000, ''),
	(10010, 8243990236, 85000000, ''),
	(10010, 3084510555, 85000000, ''),
	(10008, 8243990236, 8010000, 'Let me cook!'),
	(10005, 7638332415, 6000000, ''),
	(10005, 4180314872, 6000000, ''),
	(10005, 1038262297, 6000000, '')
;


-- The chats
INSERT INTO Chat
	(cedula_proveedor, id_servicio)
VALUES
	(6788647854, 10007),
	(4180314872, 10007),
	(3084510555, 10010),
	(8243990236, 10008) 


SELECT 
	Empleador.nombre AS NombreEmpleador,
	Proveedor.nombre AS NombreProveedor,
	Servicio.nombre AS NombreServicio,
	Chat.numero AS NumeroChat
FROM 
	Chat
	INNER JOIN Servicio ON Chat.id_servicio = Servicio.id
	INNER JOIN Empleador ON Servicio.cedula_empleador = Empleador.cedula
	INNER JOIN Proveedor ON Chat.cedula_proveedor = Proveedor.cedula


-- Mensajes para chats
-- Toca ir comentando mensaje por mensaje, no se puede correr todo a la vez
INSERT INTO Mensaje
	(id_chat, contenido, tipo_remitente)
VALUES
	--(11, 'Hello Abel', 0),
	--(11, 'Can you do lower price? Ill contract you garanteed if you do', 0),
	--(11, 'Hello Mr Andrew, Im sorry, but I will not', 1),
	(11, 'Hmmmm Ill look into it then', 0)
;


INSERT INTO Mensaje
	(id_chat, contenido, tipo_remitente)
VALUES
	--(12, 'Hello Benito, what songs would you be singing?', 0),
	--(12, 'Mr Andrew, I could sing whatever you like', 1),
	--(12, 'But what do you suggest?', 1),
	(12, 'I will be suggesting something like Where She Goes, No Me Quiero Casar and Moscow Mule. Those would be a super hit!', 0)
;


INSERT INTO Mensaje
	(id_chat, contenido, tipo_remitente)
VALUES
	--(13, 'Keny, have you been to a prison before?', 0),
	--(13, 'Yes', 1),
	--(13, 'Perfect, then you are a perfect fit. Ready to start?', 0),
	(13, 'Indeed', 1)
;


INSERT INTO Mensaje
	(id_chat, contenido, tipo_remitente)
VALUES
	--(14, 'What type of food you cook?', 0),
	--(14, 'My specialty is fish', 1),
	--(14, 'Well let me think', 0),
	(14, 'You know what Cody, we already have to much fish cooks, but thanks for the interest', 0)
;



-- Crear Contratos
INSERT INTO Contrato
	(id_servicio, fecha_inicio, fecha_finalizacion)
VALUES
	(10010, '2024-04-15', NULL),
	(10007, '2024-06-30', '2024-06-30')
;



-- Meterle personas al contrato
INSERT INTO Proveedores_en_contrato
	(id_servicio, cedula_proveedor, pago)
VALUES
	(10010, 3084510555, 85000000),
	(10010, 7638332415, 85000000),
	(10007, 4180314872, 4000000)
;

-- Meterle Reseñas al Proveedor
INSERT INTO Resena_Proveedor
	(empleador, proveedor, calificacion, comentarios)
VALUES
	('1240212695', '4180314872', 5, 'He definitely the goat')
;


INSERT INTO Resena_Empleador
	(empleador, proveedor, calificacion, comentarios)
VALUES
	('1240212695', '4180314872', 5, 'He lives up to the image he has as a respectable business magnate. Pays in full cash. Will look forward to work again with him.')
;