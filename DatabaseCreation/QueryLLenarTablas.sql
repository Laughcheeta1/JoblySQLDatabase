use DBProyectoBD

INSERT INTO Proveedor
(cedula, nombre, contrasena, correo, telefono, fecha_nacimiento, ciudad)
VALUES
('1011783419','Nicolas','NicoGamer','nicolas@gmail.com','3298451025','1996-06-11','Cali'),
('1010795492','Marcelo','mArC3L0190','marcelo@gmail.com','3017829845','1969-12-08','Bogotá'),
('1278394722','Sofía','Sofi092','sofia2@gmail.com','3117204835','2000-04-28','Medellin');


INSERT INTO Empleador
(cedula, nombre, contrasena, correo, telefono)
VALUES
('3094785234', 'Martina', 'm4rt1nA09','martina@gmail.com', '89798214'),
('8024818464', 'Juan', 'D0nJuan69','Juan@gmail.com', '1223132015'),
('9920304877', 'Camila', 'c4M1lA33','camila@gmail.com', '56631856');


INSERT INTO Servicio
(nombre, descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
VALUES
('Mesero', 'Mesero Nocturno', 50000, '2024-02-11','2024-02-16', '2024-02-28', '2024-03-1','Medellin','3094785234'),
('Cocinero', 'Chef restaurante', 1000000, '2024-01-05','2024-01-26', '2024-02-16', '2024-02-28','Medellin','8024818464'),
('Diseñador web', 'Crear front Java', 200000, '2024-02-01','2024-02-10', '2024-02-15', '2024-02-28','Ibague','9920304877');


INSERT INTO Empresa
(nit, nombre)
VALUES
('AE89239453','EPM'),
('09840283MN', 'Microsoft'),
('82873BJA72','Colanta');


INSERT INTO Empleador_en_empresa
(cedula_empleador, nit_empresa)
VALUES
('3094785234','AE89239453'),
('8024818464','09840283MN'),
('9920304877','82873BJA72');


INSERT INTO Chat
(cedula_proveedor, id_servicio)
VALUES
('1011783419', 10000),
('1010795492', 10001),
('1278394722', 10002);


INSERT INTO Mensaje
(id_chat, contenido, tipo_remitente)
VALUES
(1,'Pagame pues', 1),
(2,'Buenos dias, como esta?', 0),
(3,'Muchas gracias', 1);


INSERT INTO Resena_Empleador
(empleador, proveedor, calificacion, comentarios)
VALUES
('3094785234','1011783419', 35,'Servicio aceptable'),
('8024818464','1010795492', 50,'Muy buen servicio'),
('9920304877','1278394722', 10,'Muy mal servicio');


INSERT INTO Resena_Proveedor
(empleador, proveedor, calificacion, comentarios)
VALUES
('3094785234','1011783419', 10,'Trabajador muy perezoso'),
('8024818464','1010795492', 50,'Muy buen trabajador'),
('9920304877','1278394722', 30,'Trabajador promedio, se demoro mucho en adaptarse al trabajo');


INSERT INTO Contrato
(id_servicio, fecha_inicio, fecha_finalizacion)
VALUES
(10000, '2024-03-1', '2024-03-4'),
(10001, '2024-02-16', '2024-02-28'),
(10002, '2024-02-20', '2024-02-28');


INSERT INTO Postulaciones_Servicio
(id_servicio, cedula_proveedor, pago_sugerido, notas)
VALUES
(10000,'1011783419', 546456, 'Contratame'),
(10001,'1010795492', 78987,  NULL),
(10002,'1278394722', 87988, 'Te hago las 3B, bueno, bonito y barato');


INSERT INTO Tipo
(nombre)
VALUES
('Idiomas'),
('Desarrollo Web'),
('Seguridad Informática');


INSERT INTO Tipo_de_Servicio
(id_servicio, tipo)
VALUES
(10000,1),
(10001,2),
(10002,3);


INSERT INTO Proveedores_en_contrato
(id_servicio, cedula_proveedor, pago)
VALUES
(10000,'1011783419', 45000),
(10001,'1010795492', 50000),
(10002,'1278394722', 80000);


INSERT INTO Especializaciones_proveedor
(cedula_proveedor, tipo)
VALUES
('1011783419',1),
('1010795492',2),
('1278394722',3);


INSERT INTO Certificados
(id, nombre, entidad_que_certifica, tipo)
VALUES
(1564,'Ingles','TOEIC',1 ),
(9821,'JavaScript','Codecademy',2 ),
(81252,'Encriptacion AES','EAFIT',3 );


INSERT INTO Certificados_de_proveedor
(cedula_proveedor, id_certificado, fecha_adquisicion)
VALUES
('1011783419',1564, '2004-12-02'),
('1010795492',9821, '2004-11-11'),
('1278394722',81252, '2004-05-18');


INSERT INTO Informacion_Extra
(cedula_proveedor, id, nombre, descripcion)
VALUES
('1011783419',1,'Experiencia laboral','Trabaje durante 10 años en el front-end de los proyectos de Microsoft'),
('1010795492',1,'Especialidad cocina','Estudie cocina en la india por lo que la comida indu es mi especialidad'),
('1278394722',1,'Habiliadades suaves','He trabajado en entornos donde me toco relacionarme con mucha gente por lo que mis hablidades suaves estan muy desarrolladas');