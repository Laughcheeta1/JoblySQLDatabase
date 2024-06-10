use DBProyectoBD;
GO


--querys de llenado

INSERT INTO Empleador
(cedula, nombre, contrasena, correo, telefono)
VALUES
('18366475823', 'Arturo', 'contraseña','arturolomejor@yahoo.com', '3043726473');
GO


INSERT INTO Proveedor
(cedula, nombre, contrasena, correo, telefono, fecha_nacimiento, ciudad)
VALUES
('16281182937', 'Juan', 'kxlckmdws','gatosalvaje@gmail.com', '3389477592','1970-02-11','Envigado'),
('1923657839','Susana','xijsnsow','susy22@gmail.com','3778578932','1991-11-14','Caldas'),
('201238943','Carlos','nias2382','carlitos777@gmail.com','3018765839','2012-03-14','Bossa');
GO


INSERT INTO Informacion_Extra
(cedula_proveedor, id, nombre, descripcion)
VALUES
('16281182937',1,'Dato Curioso','Me gusta ver fotos de gatos con poca ropa'),
('201238943',1,'Experiencia laboral','Trabaje cuidadno niños en una guardería');
GO


INSERT INTO Certificados_de_proveedor
(cedula_proveedor, id_certificado, fecha_adquisicion)
VALUES
('201238943',9821, '2022-03-14'),
('1923657839',81252, '2024-11-26');
GO


INSERT INTO Tipo
(nombre)
VALUES
('Fisioterapia'),
('Servicio Al Cliente'),
('Enfermería');
GO


INSERT INTO Servicio
(nombre, descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
VALUES
('Asesor', 'Se requiere asesor de servicio al cliente de medio tiempo', 900000, '2024-04-29', '2024-06-15','2024-06-01', '2024-06-25','Medellin','18366475823'),
('Programador', 'Necesitamos a un analista de datos para hacer modelos PERT', 20000000, '2024-03-01','2024-04-10', '2025-04-15', '2024-04-20','Remoto','18366475823');
GO


INSERT INTO Tipo_de_Servicio
(id_servicio, tipo)
VALUES
(10016,15),
(10017,13)
GO


INSERT INTO Postulaciones_Servicio
(id_servicio, cedula_proveedor, pago_sugerido, notas)
VALUES
(10016,'1923657839', 10000000, NULL),--
(10016,'16281182937', 9000000,  NULL),
(10017,'201238943', 800000, NULL),
(10017,'1923657839', 21000000, NULL),
(10017,'1011783419', 18000000, NULL);
GO


INSERT INTO Contrato
(id_servicio, fecha_inicio, fecha_finalizacion)
VALUES
(10016, '2024-04-15', '2024-04-30'),
(10017, '2024-05-01', '2024-06-01');
GO


INSERT INTO Proveedores_en_contrato
(id_servicio, cedula_proveedor, pago)
VALUES
(10016,'16281182937', 900000),
(10017,'1923657839', 18000000);
GO


INSERT INTO Chat
(cedula_proveedor, id_servicio)
VALUES
('1923657839', 10017),
('16281182937', 10016);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)--0 empleador, 1 empleado
VALUES (19,'Buenas Tardes', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (19,'Como esta ñero', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (19,'Le pido que me trate con respeto, le estoy pagando', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (19,'Es verdad, que pena con usted señor frances. En que le puedo servir', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (19,'Necesito que se apresure con la etapa de bugfixing porque el producto es para entregagrlo ayer.', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (19,'Sus deseos son ordenes mi capitán', 1);
GO


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (20,'Saludos, vi que me contrataron como asesor de servicio al cliente... en que les puedo ayudar', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (20,'Hola!', 0);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (20,'Hola', 1);
GO
INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES (20,'Estas trabajando muy poquito', 0);
GO


--Aca voy
--contrato 10025
INSERT INTO Resena_Proveedor
(empleador, proveedor, calificacion, comentarios)
VALUES
('18366475823','16281182937', 85,'Mala educacion pero buen trabajador');
GO


--Contrato 10026
INSERT INTO Resena_Empleador
(empleador, proveedor, calificacion, comentarios)
VALUES
('18366475823','1923657839', 70,'No sabíia tanto cunado llego pero salio habiendo aprendido mucho');
GO


