USE DBProyectoBD;

CREATE or alter PROCEDURE [AnadirServicioAEmpleador]
	@cedulaEmpleador VARCHAR(12),
	@nombre VARCHAR(20),
    @DescripcionServicio VARCHAR(200),
    @Pago INT,
    @FechaPublicacion DATETIME,
    @FechaCierrePostulacion DATETIME,
    @FechaEstimadaInicio DATETIME,
    @FechaEstimadaFinalizacion DATETIME,
    @Ciudad VARCHAR(15)
AS 
BEGIN

    BEGIN TRY --para tratar excepciones, verifica si el cedulaEmpleadorID existe
            IF NOT EXISTS (SELECT 1 FROM Empleador
                            WHERE cedula = @cedulaEmpleador)
            BEGIN 
                RAISERROR('El Empleador con cedula  %d no existe',
                        16,1,@cedulaEmpleador);
                RETURN;
            END

	SET NOCOUNT ON;

	INSERT INTO Servicio
		(nombre,descripcion, pago, fecha_publicacion, fecha_cierre_postulacion, fecha_estimada_inicio, fecha_estimada_finalizacion, ciudad, cedula_empleador)
	VALUES
		(@nombre, @DescripcionServicio, @Pago, @FechaPublicacion, @FechaCierrePostulacion, 
		@FechaEstimadaInicio, @FechaEstimadaFinalizacion, @Ciudad, @cedulaEmpleador);
   
    --Mensaje de exito
		PRINT ('Al empleador con cedula ' + @cedulaEmpleador
			+ ' se le anadió el servicio ' + @nombre +' correctamente');
    
    END TRY
	BEGIN CATCH
		--Manejo de error en caso de fallo en las operaciones SQL
		PRINT ERROR_MESSAGE();
	END CATCH

END
GO
