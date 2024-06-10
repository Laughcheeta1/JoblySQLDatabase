USE DBProyectoBD;


-- TRIGGERS TABLA
-- A�adimos la nueva columna
ALTER TABLE Servicio 
ADD activo BIT NOT NULL DEFAULT 1;

-- Conseguir los Servicios que tienen un contrato y ponerlos como no activos
UPDATE Servicio
SET	activo = 0
WHERE Servicio.id IN (
		SELECT
			Servicio.id
		FROM 
			Servicio
			INNER JOIN Contrato
				ON Servicio.id = Contrato.id_servicio
	)
;

-- Crear el trigger como tal
CREATE OR ALTER TRIGGER TR_Desactivar_Servicio ON Contrato
FOR INSERT
AS
BEGIN
	UPDATE Servicio
	SET activo = 0
	WHERE Servicio.id = (SELECT id_servicio FROM inserted);
END
;

SELECT * FROM Servicio

INSERT INTO Contrato
VALUES
	('10003', '2024-06-01 00:00:00.000', '2024-06-02 00:00:00.000')

SELECT * FROM Servicio


---------------------------
---------------------------
---------------------------
-- TRIGGERS BASE DATOS
CREATE OR ALTER FUNCTION dbo.CortarATercerEspacio (@InputString VARCHAR(MAX))
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @SpaceCount INT = 0;
	DECLARE @Position INT = 0;
	DECLARE @Result VARCHAR(30) = '';

	WHILE @SpaceCount < 3 AND @Position < LEN(@InputString) AND @Position < 31
	BEGIN
		SET @Position = @Position + 1;

		IF SUBSTRING(@InputString, @Position, 1) = ' '
			BEGIN
				SET @SpaceCount = @SpaceCount + 1;
				IF @SpaceCount < 3
					BEGIN
						SET @Result = CONCAT(@Result, SUBSTRING(@InputString, @Position, 1));
					END;
			END;
		ELSE
			SET @Result = CONCAT(@Result, SUBSTRING(@InputString, @Position, 1));
	END;

  RETURN @Result;
END
;


CREATE TABLE Mantenimiento (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(400) NOT NULL,
	inicio DATETIME NOT NULL,
	finalizacion DATETIME
);

CREATE TABLE Acciones_Mantenimiento (
	id_mantenimiento INT,
	numero_accion INT,
	accion VARCHAR(40),
	PRIMARY KEY (id_mantenimiento, numero_accion),
	FOREIGN KEY (id_mantenimiento) REFERENCES Mantenimiento (id)
);

CREATE PROCEDURE AnadirMantenimiento (
	@idMantenimiento INT,
	@accion VARCHAR(40)
)
AS
BEGIN
	DECLARE @id INT;
	SELECT @id = COUNT(*) FROM Acciones_Mantenimiento WHERE id_mantenimiento = @idMantenimiento;

	INSERT INTO Acciones_Mantenimiento
	VALUES
		(@idMantenimiento, @id, @accion);
END
;

CREATE TABLE Mantenimiento_Activo (
	id_mantenimiento INT PRIMARY KEY,
	FOREIGN KEY (id_mantenimiento) REFERENCES Mantenimiento (id)
);

CREATE OR ALTER PROCEDURE empezarMantenimiento (
	@nombre VARCHAR(50),
	@descripcion VARCHAR(400)
)
AS
BEGIN
	IF (SELECT COUNT(*) FROM Mantenimiento_Activo) > 0
		BEGIN
			RAISERROR ('Hay un mantenimiento actualmente en curso', 10, -1);
			RETURN;
		END
	;

	INSERT INTO Mantenimiento
		(nombre, descripcion, inicio)
	VALUES
		(@nombre, @descripcion, GETDATE())
	;

	DECLARE @idMantenimiento INT;

	SELECT @idMantenimiento = MAX(id) FROM Mantenimiento;

	INSERT INTO Mantenimiento_Activo VALUES (@idMantenimiento);
END
;

CREATE OR ALTER PROCEDURE terminarMantenimiento
AS
BEGIN
	UPDATE Mantenimiento
	SET 
		finalizacion = GETDATE()
	WHERE
		id = (SELECT TOP(1) id_mantenimiento FROM Mantenimiento_Activo)
	;

	DELETE FROM Mantenimiento_Activo;
END
;



-- Ahora si, por fin, el trigger
CREATE TRIGGER Insertar_En_Mantenimiento
ON DATABASE
FOR 
	DROP_TABLE,
	ALTER_TABLE,
	CREATE_TABLE,
	CREATE_VIEW,
	ALTER_VIEW,
	DROP_VIEW,
	CREATE_TRIGGER,
	ALTER_TRIGGER,
	DROP_TRIGGER,
	CREATE_INDEX,
	ALTER_INDEX,
	DROP_INDEX,
	CREATE_FUNCTION,
	ALTER_FUNCTION,
	DROP_FUNCTION,
	CREATE_PROCEDURE,
	ALTER_PROCEDURE,
	DROP_PROCEDURE
AS
BEGIN
	IF (SELECT COUNT(*) FROM Mantenimiento_Activo) = 0
		RETURN;
	
	DECLARE @idMantenimiento INT;
	SELECT TOP(1) @idMantenimiento = id_mantenimiento FROM Mantenimiento_Activo;

	DECLARE @accion VARCHAR(40);
	SET @accion = dbo.CortarATercerEspacio(EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)'));

	EXEC AnadirMantenimiento @idMantenimiento, @accion;	
END
;


EXEC empezarMantenimiento 'Test', 'Testosterona';

CREATE TABLE Test1 (p INT);
DROP TABLE Test1;

EXEC terminarMantenimiento;

SELECT * FROM Mantenimiento;
SELECT * FROM Acciones_Mantenimiento;



---------------------------
---------------------------
---------------------------
-- INDEXES
-- Cluster Index por fecha_estimada_inicio

-- Primero, desactivar todos los foreign keys que referencian la PK
ALTER TABLE Tipo_De_Servicio
DROP CONSTRAINT fk_id_servicio_tipo_servicio;

ALTER TABLE Postulaciones_Servicio
DROP CONSTRAINT fk_id_servicio_postulaciones;

ALTER TABLE Chat
DROP CONSTRAINT fk_id_servicio;

ALTER TABLE Contrato
DROP CONSTRAINT fk_id_servicio_contrato;

ALTER TABLE Proveedores_en_contrato
DROP CONSTRAINT fk_id_servicio_proveedores_en_contrato;


-- Segundo borrar el cluster de primary key
ALTER TABLE Servicio
DROP CONSTRAINT PK_Servicio;


SELECT * FROM Servicio;

-- Tercer Paso, crear el Clustered Index
CREATE CLUSTERED INDEX idx_ejecucion_contrato
ON Servicio (fecha_estimada_inicio ASC, fecha_estimada_finalizacion ASC);


SELECT * FROM Servicio; -- Comprobar


-- Cuarto Paso, volver a crear Primary Key
ALTER TABLE Servicio
ADD CONSTRAINT PK_id PRIMARY KEY (id);

-- Quinto Paso, volver a a�adir las foreign key
ALTER TABLE Tipo_De_Servicio
ADD CONSTRAINT fk_id_servicio_tipo_servicio FOREIGN KEY (id_servicio) REFERENCES Servicio (id);

ALTER TABLE Postulaciones_Servicio
ADD CONSTRAINT fk_id_servicio_postulaciones FOREIGN KEY (id_servicio) REFERENCES Servicio (id);

ALTER TABLE Chat
ADD CONSTRAINT fk_id_servicio FOREIGN KEY (id_servicio) REFERENCES Servicio (id);

ALTER TABLE Contrato
ADD CONSTRAINT fk_id_servicio_contrato FOREIGN KEY (id_servicio) REFERENCES Servicio (id);

ALTER TABLE Proveedores_en_contrato
ADD CONSTRAINT fk_id_servicio_proveedores_en_contrato FOREIGN KEY (id_servicio) REFERENCES Servicio (id);


CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; 
GO
DBCC FREEPROCCACHE;
GO

SET STATISTICS TIME ON;
SELECT * FROM Servicio WHERE id = 10017;
SET STATISTICS TIME OFF;

-- Adicionalmente, Non Clustered index para el Id del servicio
CREATE NONCLUSTERED INDEX idx_id 
ON Servicio (id);

CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; 
GO
DBCC FREEPROCCACHE;
GO

SET STATISTICS TIME ON;
SELECT * FROM Servicio WHERE id = 10017;
SET STATISTICS TIME OFF;


---------------------------
---------------------------
---------------------------
-- PROCEDIMIENTOS CON CURSORES
-- Mostrar en pantalla, la cedula de los postulantes que son cualificados (Al menos tienen un certificado)
CREATE FUNCTION dbo.numeroCertificadosProveedor (
	@cedulaProveedor VARCHAR(12)
)
RETURNS int
BEGIN
	RETURN (SELECT count(*) FROM Certificados_de_proveedor WHERE cedula_proveedor = @cedulaProveedor);
END
;


CREATE OR ALTER PROCEDURE Postulantes_Cualificados 
	(
		@idServicio int
	)
AS
BEGIN
	DECLARE @cedulaProveedor VARCHAR(12);

	DECLARE cursorPostulantes CURSOR FOR (
		SELECT cedula_proveedor
		FROM Postulaciones_Servicio
		WHERE id_servicio = @idServicio
	);

	OPEN cursorPostulantes;

	FETCH NEXT FROM cursorPostulantes INTO @cedulaProveedor;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF dbo.numeroCertificadosProveedor(@cedulaProveedor) > 0
			PRINT @cedulaProveedor;

		FETCH NEXT FROM cursorPostulantes INTO @cedulaProveedor;
	END
	;
	
	CLOSE cursorPostulantes;
	DEALLOCATE cursorPostulantes;
END
;

SELECT * FROM Servicio

EXEC Postulantes_Cualificados 10002;

-- La forma de hacerlo sin cursores seria
DECLARE @idServicio INT = 10002;

SELECT
	DISTINCT A.cedula_proveedor  -- Tambien podriamos agrupar por cedulaProveedor y seleccionar cedulaProveedor, pero es lo mismo
FROM
	(
		SELECT
			cedula_proveedor
		FROM
			Postulaciones_Servicio
		WHERE
			id_servicio = @idServicio
	) AS A
	INNER JOIN Informacion_Extra
		ON Informacion_Extra.cedula_proveedor = A.cedula_proveedor
;
------------------------------
------------------------------