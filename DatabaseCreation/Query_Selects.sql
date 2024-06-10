USE DBProyectoBD;

-- SELECTS

SELECT * FROM Empleador;
SELECT * FROM Empresa;
SELECT * FROM Proveedor;

SELECT 
	Proveedor.nombre AS 'Proveedor', 
	Empleador.nombre AS 'Empleador', 
	Servicio.nombre AS 'Servicio', 
	Servicio.pago AS 'Pago sugerido',
	Proveedores_en_Contrato.pago AS 'Pago final'
FROM 
	Servicio
	INNER JOIN Empleador ON Servicio.cedula_empleador = Empleador.cedula
	INNER JOIN Postulaciones_Servicio ON Servicio.id = Postulaciones_Servicio.id_servicio
	INNER JOIN Proveedor ON Postulaciones_Servicio.cedula_proveedor = Proveedor.cedula
	INNER JOIN Proveedores_en_Contrato ON Proveedores_en_Contrato.cedula_proveedor = Proveedor.cedula
;

SELECT * FROM Proveedores_en_Contrato

SELECT * FROM Empleador_en_Empresa


-- INSERTS

INSERT INTO Empleador
	(cedula, nombre, contrasena, correo, telefono)
VALUES
	('1851654', 'Santiago', 'YepsPeps.com','yepspeps@gmail.com', '+57 3122705388')
;

INSERT INTO Empleador
	(cedula, nombre, contrasena, correo, telefono)
VALUES
	('89461', 'Daniela', '12312asd','asdasd@isla.com', '+57 84512161')
;

INSERT INTO Empresa
	(nit, nombre)
VALUES
	('5641685', 'La Isla Girls Club')
;


INSERT INTO Empleador_En_Empresa
	(cedula_empleador, nit_empresa)
VALUES
	('89461', '5641685')
;

-- UPDATE

UPDATE Empleador
SET 
	contrasena = 'HelloWorld', telefono = '+57 3103808366'
WHERE 
	nombre = 'Santiago'
;

SELECT 
	*
FROM 
	Empleador
WHERE
	nombre = 'Santiago'
;


-- DELETE 
DELETE FROM Empleador_En_Empresa
WHERE
	cedula_empleador = '89461'
;



DELETE FROM Empleador
WHERE
	nombre = 'Santiago'
	OR nombre = 'Daniela'
;


DELETE FROM Empresa
WHERE
	nit = '5641685'
;
