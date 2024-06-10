
use DBProyectoBD;
GO

INSERT INTO Empleador
(cedula, nombre, contrasena, correo, telefono)
VALUES
('100369852', 'Plebe', 'ehslptyiowsk','DobleP@.com', '3046290058');
GO


INSERT INTO Proveedor
(cedula, nombre, contrasena, correo, telefono, fecha_nacimiento, ciudad)
VALUES
('1046782399', 'Emilio', 'ajkoednsbyoq','Emilio1@gmail.com', '30098976745','2004-07-31','Envigado'),
('1997680036','Antonia','aleisnrbei','antonia2@gmail.com','39985867432','1989-10-06','Sincelejo'),
('2001476239','Andrea','akeudnao','andrea7@gmail.com','3014429569','2003-08-18','Bogota');
GO


INSERT INTO Informacion_Extra
(cedula_proveedor, id, nombre, descripcion)
VALUES
('1046782399',4,'Experiencia laboral','Participe en diversas misiones como navy seal'),--Emilio
('1997680036',5,'Experiencia laboral','Trabaje 5 anos atendiendo pacientes en USA');--antonia
GO


INSERT INTO Certificados_de_proveedor
(cedula_proveedor, id_certificado, fecha_adquisicion)
VALUES
('1046782399',1564, '2024-03-04'),
('2001476239',1564, '2024-02-26');
GO


INSERT INTO Tipo
(nombre)
VALUES
('NAVY SEAL'),
('Medico'),
('Programador');
GO


INSERT INTO Servicio
(nombre, descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
VALUES
('Militar', 'Se requiere militar con experiencia internacional', 8000000, '2024-04-30', '2024-05-15','2024-06-01', '2024-06-02','Medellin','100369852'),
('Desarrollador', 'Necesitamos a alguien que haga el diseno de un Front', 2000000, '2024-04-01','2024-04-10', '2024-04-15', '2024-04-30','Envigado','100369852'),
('Desarrollador', 'Necesitamos organizar una base de datos muy extensa de una empresa', 6000000, '2024-04-10','2024-04-25', '2024-05-01', '2024-05-31','Cali','100369852'),
('Medico', 'Requerimos los servicios medicos de un especialista en el hospital PTU', 2000000, '2024-04-25','2024-05-10', '2024-06-01', '2024-06-15','Medellin','100369852');
GO


INSERT INTO Tipo_de_Servicio
(id_servicio, tipo)
VALUES
(10012,11),
(10013,13),
(10014,13),
(10015,12);
GO


INSERT INTO Postulaciones_Servicio
(id_servicio, cedula_proveedor, pago_sugerido, notas)
VALUES
(10012,'1046782399', 10000000, 'No encontraran mejor NAVY SEAL'),--
(10014,'1046782399', 2000000,  NULL),
(10013,'2001476239', 6000000, 'Soy desarrolladora de Front-End'),
(10014,'1997680036', 7000000, NULL),
(10015,'1997680036', 2000000, 'Soy medica hace 5 anos');
GO



INSERT INTO Contrato
(id_servicio, fecha_inicio, fecha_finalizacion)
VALUES
(10012, '2024-04-15', '2024-04-30'),
(10013, '2024-05-01', '2024-06-01'),
(10015, '2024-06-02', '2024-06-20');
GO



INSERT INTO Proveedores_en_contrato
(id_servicio, cedula_proveedor, pago)
VALUES
(10014,'2001476239', 2000000),
(10012,'1046782399', 6000000),
(10013,'2001476239', 2000000);
GO


INSERT INTO Chat
(cedula_proveedor, id_servicio)
VALUES
('1997680036', 10015),
('2001476239', 10013),
('1046782399', 10012),
('2001476239', 10014);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)--0 empleador, 1 empleado
VALUES (17,'Hola, buenos días?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (17,'Buenos días, como le va?', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (17,'Con cuantos anos de experiencia militar siendo NAVY SEAL en total cuenta?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (17,'Llevo 3, pero aún no tengo experiencia en combate', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (17,'lo lamento, necesitamos a alguien con mayor experiencia', 0);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (18,'Hola, muy buenos dias jefe', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (18,'Hola!', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (18,'Me gustaría agregarle este diseno especifico al frontend de la pagina', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (18,'No se puede, debido a las licencias', 0);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (15,'Hola como van', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (15,'Hola', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (15,'Como va el paciente?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (15,'Muy bien, va mejorando poco a poco', 1);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (16,'Hola como vas con el trabajo?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (16,'Hola jefe, todo muy bien!', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (16,'Podrias hacer la pagina en espanol e ingles?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (16,'Si, claro!', 1);
GO


INSERT INTO Resena_Proveedor
(empleador, proveedor, calificacion, comentarios)
VALUES
('100369852','2001476239', 90,'Hizo muy buen trabajo, pero casi no se acomoda al principio'),
('100369852','1046782399', 75,'Todo quedo muy bien, muchas gracias!');
GO


INSERT INTO Resena_Empleador
(empleador, proveedor, calificacion, comentarios)
VALUES
('100369852','2001476239', 70,'Este contrato fue pagado a tiempo, me fue bien. ');
GO
