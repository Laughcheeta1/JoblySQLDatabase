USE DBProyectoBD;

-- FUNCIONES
-- Proveedores postulados en servicio
CREATE FUNCTION dbo.cantProveedoresEnServicio(
	@servicio int
)
RETURNS INT
AS
BEGIN
	DECLARE @result int;
	SELECT 
		@result = COUNT(*)
	FROM
		Postulaciones_Servicio
	WHERE
		id_servicio = @servicio
	;

	RETURN @result;
END
;


-- Proveedores en contrato
CREATE FUNCTION dbo.cantProveedoresEnContrato(
	@servicio int
)
RETURNS INT
AS
BEGIN
	DECLARE @result int;
	SELECT 
		@result = COUNT(*)
	FROM
		Proveedores_en_contrato
	WHERE
		id_servicio = @servicio
	;

	RETURN @result;
END
;


-- Cantidad de servicios en los que ha estado una proveedor
CREATE FUNCTION dbo.cantServiPostuladProv(
	@cedulaProveedor VARCHAR(12)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT 
				COUNT(*)
			FROM
				Postulaciones_Servicio
			WHERE
				cedula_proveedor = @cedulaProveedor
			)
END
;


-- Cantidad de contratos en los que ha participado un proveedor
CREATE FUNCTION dbo.cantContratPartiProv(
	@cedulaProveedor VARCHAR(12)
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT 
				COUNT(*)
			FROM
				Proveedores_en_contrato
			WHERE
				cedula_proveedor = @cedulaProveedor
			)
END
;


-- Cantidad Servicios proveedor
CREATE FUNCTION dbo.cantSertifProveed(
	@cedulaProveedor VARCHAR(12)
)
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT
			COUNT(*)
		FROM
			Certificados_de_proveedor
		WHERE
			cedula_proveedor = @cedulaProveedor
	)
END
;


-- SELECT STATEMENTS
-- El promedio del porcentaje de personas que se meten a un servicio y son contactadas
SELECT 
	SUM(
		CAST(dbo.cantProveedoresEnContrato(Servicio.id) AS FLOAT) * 100 / dbo.cantProveedoresEnServicio(Servicio.id)
		) / COUNT(*) AS 'Porcentaje promedio de proveedores que son contratados' 
FROM
	Servicio
WHERE
	dbo.cantProveedoresEnServicio(Servicio.id) != 0 -- Avoid dividing by zero
;


-- La proporcion servicios que publican los empleadores registrados con una empresa, 
--	con respecto a los empleadores independientes.
DECLARE @ServicesByCompanys INT;
DECLARE @ServicesByIndependents INT;

SELECT
	@ServicesByCompanys = COUNT(*)
FROM
	Empleador_en_empresa
	INNER JOIN Servicio ON Empleador_en_empresa.cedula_empleador = Servicio.cedula_empleador
;

SET @ServicesByIndependents = (SELECT
									COUNT(*)
								FROM
									Servicio) - @ServicesByCompanys
;

SELECT 
	@ServicesByCompanys AS 'ServiciosPorCompañias',
	@ServicesByIndependents AS 'ServiciosPorIndependientes',
	CAST(@ServicesByCompanys AS FLOAT) / @ServicesByIndependents AS 'ProporcionEmpresa-Independientes'
	-- Last column reads as Companys make X times the amount of services as independent contractors
;


-- La relacion entre informacion extra que tiene un proveedor y la cantidad de chats que los proveedors empiezan conn el 
--	(Basicamente, cuanta atencion le prestan).
SELECT 
	T.ExtraInfoNumber,
	ROUND(CAST(SUM(dbo.cantContratPartiProv(T.cedula)) AS FLOAT) * 100 / SUM(dbo.cantServiPostuladProv(T.cedula)), 2) AS 'Contract Percentage'
FROM
	(
	SELECT
		Proveedor.cedula,
		COUNT(Informacion_Extra.id) AS 'ExtraInfoNumber'
	FROM
		Proveedor
		LEFT JOIN Informacion_Extra ON Proveedor.cedula = Informacion_Extra.cedula_proveedor
	GROUP BY
		Proveedor.cedula
	) AS T
GROUP BY
	T.ExtraInfoNumber
;