use DBProyectoBD;
GO

INSERT INTO Empleador
(cedula, nombre, contrasena, correo, telefono)
VALUES
('1038262298', 'David', 'd4v1dP4ssw0r','davidB@gmail.com', '3046290058');
GO


INSERT INTO Proveedor
(cedula, nombre, contrasena, correo, telefono, fecha_nacimiento, ciudad)
VALUES
('1038262298', 'David', 'd4v1dP4ssw0r','davidB@gmail.com', '3046290058','2004-07-31','Envigado'),
('1038262297','Gregorio','Gr3g0r10','gregori@gmail.com','3046295858','1989-10-06','Bucaramanga'),
('1278394965','Angel','4nG3l','angel@gmail.com','3046296238','2003-08-18','Cartagena');
GO


INSERT INTO Informacion_Extra
(cedula_proveedor, id, nombre, descripcion)
VALUES
('1038262298',1,'Experiencia laboral','Hice parte del equipo de creacion del nuevo sistema de bancolombia'),
('1038262297',1,'Experiencia laboral','Estuve en misiones durante 3 años en Rusia durante la guerra contra Ukrania');
GO


INSERT INTO Certificados_de_proveedor
(cedula_proveedor, id_certificado, fecha_adquisicion)
VALUES
('1038262298',9821, '2020-08-04'),
('1278394965',1564, '2022-06-26');
GO


INSERT INTO Tipo
(nombre)
VALUES
('Militar'),
('Publicista'),
('Diseñador');
GO


INSERT INTO Servicio
(nombre, descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
VALUES
('Seguridad privada', 'Se requiere guarda espaldas para politico de izquierda', 8000000, '2024-04-30', '2024-05-15','2024-06-01', '2024-06-02','Medellin','8024818464'),
('Diseñador Web', 'Se busca alguien que haga el diseño para la futura pagina web de la Universidad EIA', 2000000, '2024-04-01','2024-04-10', '2024-04-15', '2024-04-30','Envigado','9920304877'),
('Desarrollador Web', 'Con un diseño que entreguemos, se requiere alguien que haga una aplicacion web funcional para la Universidad EIA', 6000000, '2024-04-10','2024-04-25', '2024-05-01', '2024-05-31','Envigado','9920304877'),
('Publicista', 'Queremos que se promocione la nueva pagina de la Universidad EIA', 2000000, '2024-04-25','2024-05-10', '2024-06-01', '2024-06-15','Envigado','9920304877');
GO


INSERT INTO Tipo_de_Servicio
(id_servicio, tipo)
VALUES
(10003,4),
(10004,6),
(10005,2),
(10006,5);
GO


INSERT INTO Postulaciones_Servicio
(id_servicio, cedula_proveedor, pago_sugerido, notas)
VALUES
(10003,'1038262297', 10000000, 'No encontraran mejor guarda espaldas'),
(10004,'1278394965', 2000000,  NULL),
(10005,'1038262298', 6000000, 'Soy desarrollador Full Stack'),
(10005,'1011783419', 7000000, NULL),
(10006,'1278394965', 2000000, 'Yo misma hice el diseño y soy buena para la publicidad');
GO


INSERT INTO Contrato
(id_servicio, fecha_inicio, fecha_finalizacion)
VALUES
(10004, '2024-04-15', '2024-04-30'),
(10005, '2024-05-01', '2024-06-01'),
(10006, '2024-06-02', '2024-06-20');
GO


INSERT INTO Proveedores_en_contrato
(id_servicio, cedula_proveedor, pago)
VALUES
(10004,'1278394965', 2000000),
(10005,'1038262298', 6000000),
(10006,'1278394965', 2000000);
GO


INSERT INTO Chat
(cedula_proveedor, id_servicio)
VALUES
('1038262297', 10003),
('1278394965', 10004),
('1038262298', 10005),
('1278394965', 10006);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (7,'Hola, como esta?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (7,'Bien y usted?', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (7,'Con cuantos años de experiencia militar en total cuenta', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (7,'En total 5', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (7,'Pareces ser bueno, pero buscamos alguien con mayor experiencia, lo lamentamos', 0);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (8,'Hola', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (8,'Hola', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (8,'Podria cambiar el color principal del logo, es que no me gusta', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (8,'OBVIAMETE NO!!!', 0);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (9,'Buenas', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (9,'Buenas', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (9,'Ya casi llega la fecha limite, va todo bien?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (9,'Si, ya esta casi listo', 1);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (10,'Hola', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (10,'Hola', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (10,'Les gustaria que haga la publicidad en español e ingles?', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (10,'Seria muy bueno', 1);
GO


INSERT INTO Resena_Proveedor
(empleador, proveedor, calificacion, comentarios)
VALUES
('9920304877','1278394965', 40,'Hizo buen trabajo, pero queria cometer un error de muy principiante'),
('9920304877','1038262298', 50,'Todo quedo perfecto');
GO


INSERT INTO Resena_Empleador
(empleador, proveedor, calificacion, comentarios)
VALUES
('9920304877','1278394965', 50,'Paga a tiempo');
GO