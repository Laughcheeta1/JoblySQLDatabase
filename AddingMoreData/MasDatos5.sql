
use DBProyectoBD

INSERT INTO Proveedor (cedula,nombre,contrasena,correo,telefono,fecha_nacimiento,ciudad)

VAlUES 
('79362836423','Santiago','nowue72v','santiago18263@gmail.com','3198263845','1987-05-28','Medellin'),
('10825487111','Monica','meu263vdaA','monica92@gmail.com','3172946728','2000-01-11','Cali'),
('62351964611','Carlos','N7avA1a6Q','carlos0192@gmail.com','3018275212','1992-10-15','Medellin');

INSERT INTO Certificados_de_proveedor (id_certificado,cedula_proveedor,fecha_adquisicion)
VALUES
(1564,'62351964611','2023-06-18'),
(12379,'10825487111','2024-01-29');

INSERT INTO Informacion_Extra (cedula_proveedor,id,nombre,descripcion)
VALUES
('79362836423',1,'Especialidad en python', 'Tengo un certificado de un curso de python que realice en mi colegio'),
('10825487111',1,'Master en comercio', 'Tengo un master en comercio que ssaque en la universidad EAFIT');

INSERT INTO Empleador (cedula,nombre,contrasena,correo,telefono)

VALUES
('98268222912', 'Nicolas','Mah0398Mqw', 'nicolas918@gmail.com','3227190463'),
('71538184234', 'Mateo','i8ansudbf21', 'mateoM1@gmail.com','3128749283'),
('10127314666', 'Lucas','898138nAIEB', 'lucas1384@gmail.com','3182373042');

INSERT INTO Servicio (nombre,descripcion,pago,fecha_publicacion,fecha_cierre_postulacion,fecha_estimada_inicio,fecha_estimada_finalizacion,ciudad,cedula_empleador)
VALUES
('Aseo de cocina','Persona que realice asea personal en la cocina de un restaurante (lavar platos, trapear, etc)', 200000, '2024-04-24', '2024-04-28', '2024-05-01', '2024-05-03','Medellin','98268222912'),
('Obrero','Persona que realice trabajos de construccion', 500000, '2024-03-15', '2024-03-18', '2024-03-20', '2024-03-25','Cali','71538184234'),
('Vigilante','Persona que realice vigilancia nocturna de una construccion', 300000, '2024-03-03', '2024-03-10', '2024-03-11', '2024-03-20','Cali','71538184234'),
('Pintor','Pintor necesitado para pintar una casa nueva', 450000, '2024-04-01', '2024-04-05', '2024-04-10', '2024-04-13','Huila','10127314666');

INSERT INTO Chat (cedula_proveedor, id_servicio)
VALUES 
('79362836423',10018),
('79362836423',10019),
('10825487111',10020),
('62351964611',10021);

INSERt INTO Mensaje (id_chat,fecha_envio,contenido,tipo_remitente)
VALUES
(21,'2024-04-24 10:05:35.5933323','buenos dias',0),
(21,'2024-04-24 10:15:35.5933333','Buenos dias como esta ?',1),
(21,'2024-04-24 10:17:35.5933333','Muy Bien y ud?',0),
(21,'2024-04-24 10:20:35.5933333','aca trabajando',1),
(22,'2024-04-24 18:30:35.5933333','Te estoy viendo muy relajado en el trabajo...',0),
(22,'2024-04-24 18:31:35.5933333','Como asi si estoy haciendo todo lo que me pide?',1),
(22,'2024-04-24 18:34:35.5933333','Pero lo esta haciendo todo mal, tiene que mejorar porque sino no le pago',0),
(22,'2024-04-24 19:05:35.5933333','Oigan a este',1),
(23,'2024-04-24 05:05:35.5933333','buenas ya termine la pagina que me estaba pidiendo',0),
(23,'2024-04-24 05:40:35.5933333','Me alegra escuchar eso ya ahora en la tarde la reviso y y te doy la retroalimentacion',1),
(23,'2024-04-24 06:00:35.5933333','me parece excelente',0),
(23,'2024-04-24 06:05:35.5933333','Listo ahora hablamos',1),
(24,'2024-04-24 16:20:35.5933333','Buenas tardes, cuando me van a pagar',0),
(24,'2024-04-24 16:40:35.5933333','Buenas tardes se supone que ya le hicieron la transferencia',1),
(24,'2024-04-24 16:41:35.5933333','Pero yo ya revise y no me ha llegado',0),
(24,'2024-04-24 18:09:35.5933333','Eso debe ser el sistema que esta como caido',1);

INSERT INTO Contrato (id_servicio,fecha_inicio,fecha_finalizacion)
VALUES
(10019,'2024-04-24','2024-04-30'),
(10021,'2024-03-15','2024-03-20');

INsert INTO Resena_Proveedor (empleador,proveedor,calificacion,comentarios)
VALUES
('98268222912','79362836423', 3 , 'Hizo bien el trabajo pero no trato bien a sus compañeros'),
('71538184234', '10825487111', 5, 'Trabajo excelente, siguio todo al pie de la letra'),
('10127314666', '62351964611', 2, 'Muy perezoso y sin ganas de mejorar');

INSERT INTO Tipo (nombre)
VALUES
('Cosntruccion'),
('Limpieza');

