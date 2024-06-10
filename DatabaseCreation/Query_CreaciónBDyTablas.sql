USE DBProyectoBD;


CREATE TABLE [dbo].[Proveedor] (
    [cedula]              VARCHAR (12) NOT NULL,
    [nombre]              VARCHAR (20) NOT NULL,
    [contrasena]          VARCHAR (12) NOT NULL,
    [correo]              VARCHAR (50) NOT NULL,
    [telefono]            VARCHAR (16) NOT NULL,
    [fecha_nacimiento]    DATE         NOT NULL,
    [ciudad]              VARCHAR (12) NOT NULL,
    CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED ([cedula] ASC)
);

CREATE TABLE [dbo].[Empleador] (
    [cedula]     VARCHAR (12) NOT NULL,
    [nombre]     VARCHAR (12) NOT NULL,
    [contrasena] VARCHAR (12) NOT NULL,
    [correo]     VARCHAR (50) NOT NULL,
	[telefono]   VARCHAR (16) NOT NULL,
    CONSTRAINT [PK_Empleador] PRIMARY KEY CLUSTERED ([cedula] ASC)
);

CREATE TABLE [dbo].[Servicio] (
    [id]                INT          NOT NULL IDENTITY(10000, 1),
    [nombre]            VARCHAR (20) NOT NULL,
    [descripcion]       VARCHAR (200) NOT NULL,
    [pago]              INT          NOT NULL,
    [fecha_publicacion] DATETIME     NOT NULL,
    [fecha_cierre_postulacion]      DATETIME     NOT NULL,
	[fecha_estimada_inicio] DATETIME NOT NULL,
	[fecha_estimada_finalizacion] DATETIME NOT NULL,
    [ciudad]            VARCHAR (15) NOT NULL,
    [cedula_empleador]  VARCHAR (12) NOT NULL,
    CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [fk_cedula_empleador] FOREIGN KEY ([cedula_empleador]) REFERENCES [dbo].[Empleador] ([cedula])
);


CREATE TABLE [dbo].[Informacion_Extra] (
    [cedula_proveedor] VARCHAR (12)  NOT NULL,
	[id]               SMALLINT NOT NULL,
    [nombre]           VARCHAR (25)  NOT NULL,
    [descripcion]      VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Informacion_Extra] PRIMARY KEY CLUSTERED ([cedula_proveedor] ASC, [id] ASC),
    CONSTRAINT [fk_cedula_proveedor] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE [dbo].[Chat] (
    [cedula_proveedor] VARCHAR (12) NOT NULL,
    [id_servicio]      INT          NOT NULL,
    [numero]      INT          NOT NULL IDENTITY(1, 1) UNIQUE,
    CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED ([cedula_proveedor] ASC, [id_servicio] ASC),
    CONSTRAINT [fk_cedula_proveedor_Chat] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_id_servicio] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[Servicio] ([id])
);


CREATE TABLE [dbo].[Mensaje] (
    [id_chat] INT           NOT NULL,
    [fecha_envio] DATETIME2      NOT NULL DEFAULT(GETDATE()) ,
    [contenido]     VARCHAR (200) NOT NULL,
	[tipo_remitente] BIT NOT NULL,
    CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED ([id_chat] ASC, [fecha_envio] ASC),
    CONSTRAINT [fk_numero_chat] FOREIGN KEY ([id_chat]) REFERENCES [dbo].[Chat] ([numero]) ON DELETE CASCADE
);


CREATE TABLE [dbo].[Contrato] (
    [id_servicio] INT      NOT NULL,
	[fecha_inicio] DATETIME NOT NULL,
	[fecha_finalizacion] DATETIME NOT NULL,
    CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED ([id_servicio] ASC),
    CONSTRAINT [fk_id_servicio_contrato] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[Servicio] ([id])
);

CREATE TABLE [dbo].[Proveedores_en_contrato] (--Lo charro es que esta está practicamente igual y si dejo. 
    [id_servicio] INT          NOT NULL,
    [cedula_proveedor]   VARCHAR (12) NOT NULL,
	[pago] int NOT NULL,
    CONSTRAINT [PK_Proveedores_en_contrato] PRIMARY KEY CLUSTERED ([id_servicio] ASC, [cedula_proveedor] ASC),
    CONSTRAINT [fk_cedula_proveedores_en_contrato] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]),
    CONSTRAINT [fk_id_servicio_proveedores_en_contrato] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[Servicio] ([id])
);

CREATE TABLE [dbo].[Postulaciones_Servicio] (--Aca hay un error, no se bien q es. 
    [id_servicio]      INT          NOT NULL,
    [cedula_proveedor] VARCHAR (12) NOT NULL,
	[pago_sugerido] INT NOT NULL,
	[notas] VARCHAR(100),
    CONSTRAINT [PK_Postulaciones_Servicio] PRIMARY KEY CLUSTERED ([id_servicio] ASC, [cedula_proveedor] ASC),
    CONSTRAINT [fk_cedula_proveedor_postulaciones] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]),
    CONSTRAINT [fk_id_servicio_postulaciones] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[Servicio] ([id])
);


CREATE TABLE [dbo].[Tipo] (
	[id] INT NOT NULL IDENTITY(1,1),
    [nombre] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Especializaciones_proveedor] (
    [cedula_proveedor] VARCHAR (12) NOT NULL,
    [tipo]      INT NOT NULL,
    CONSTRAINT [PK_Especializaciones_proveedor] PRIMARY KEY CLUSTERED ([cedula_proveedor] ASC, [tipo] ASC),
    CONSTRAINT [fk_cedula_proveedor_especializaciones] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_nombre_tipo_especializaciones] FOREIGN KEY ([tipo]) REFERENCES [dbo].[Tipo] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Certificados] (
	[id]		INT NOT NULL,
    [nombre]      VARCHAR (25) NOT NULL,
	[entidad_que_certifica] VARCHAR(15),
	[tipo] INT NOT NULL,
    CONSTRAINT [PK_Certificados] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [fk_nombre_tipo_certificado] FOREIGN KEY ([tipo]) REFERENCES [dbo].[Tipo] ([id]) ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Certificados_de_proveedor] (--Aca hay un error, no se bien q es. 
    [id_certificado]      INT  NOT NULL,
    [cedula_proveedor]   VARCHAR (12) NOT NULL,
	[fecha_adquisicion] DATE NOT NULL,
    CONSTRAINT [PK_Certificados_de_proveedor] PRIMARY KEY CLUSTERED ([id_certificado] ASC, [cedula_proveedor] ASC),
    CONSTRAINT [fk_cedula_proveedores_certificados] FOREIGN KEY ([cedula_proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_nombre_certificado_proveedor] FOREIGN KEY ([id_certificado]) REFERENCES [dbo].[Certificados] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Tipo_de_Servicio] (
    [id_servicio] INT          NOT NULL,
    [tipo]      INT NOT NULL,
    CONSTRAINT [PK_Tipo_de_Servicio] PRIMARY KEY CLUSTERED ([id_servicio] ASC, [tipo] ASC),
    CONSTRAINT [fk_id_servicio_tipo_servicio] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[Servicio] ([id]),
    CONSTRAINT [fk_nombre_tipo_servicio] FOREIGN KEY ([tipo]) REFERENCES [dbo].[Tipo] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Empresa] (
    [nit]    VARCHAR (12) NOT NULL,
    [nombre] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED ([nit] ASC)
);

CREATE TABLE [dbo].[Empleador_en_empresa] (
    [cedula_empleador] VARCHAR (12) NOT NULL,
    [nit_empresa]                 VARCHAR (12) NOT NULL,
    CONSTRAINT [PK_Empleador_en_empresa] PRIMARY KEY CLUSTERED ([cedula_empleador] ASC, [nit_empresa] ASC),
    CONSTRAINT [fk_cedula_empleador_en_empresa] FOREIGN KEY ([cedula_empleador]) REFERENCES [dbo].[Empleador] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_nit_empresa] FOREIGN KEY ([nit_empresa]) REFERENCES [dbo].[Empresa] ([nit]) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE [dbo].[Resena_Proveedor] (
    [empleador] VARCHAR (12)  NOT NULL,
    [proveedor] VARCHAR (12)  NOT NULL,
    [calificacion]               TINYINT    NOT NULL,
    [comentarios]                VARCHAR (280) NOT NULL,
    CONSTRAINT [PK_Resena_Proveedor] PRIMARY KEY CLUSTERED ([empleador] ASC, [proveedor] ASC),
    CONSTRAINT [fk_empleador_resena_proveedor] FOREIGN KEY ([empleador]) REFERENCES [dbo].[Empleador] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_proveedor_resena_proveedor] FOREIGN KEY ([proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Resena_Empleador] (
    [proveedor] VARCHAR (12)  NOT NULL,
    [empleador] VARCHAR (12)  NOT NULL,
    [calificacion]               TINYINT    NOT NULL,
    [comentarios]                VARCHAR (280) NOT NULL,
    CONSTRAINT [PK_Resena_Empleador] PRIMARY KEY CLUSTERED ([proveedor] ASC, [empleador] ASC),
    CONSTRAINT [fk_empleador_resena_empleador] FOREIGN KEY ([empleador]) REFERENCES [dbo].[Empleador] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [fk_proveedor_resena_empleador] FOREIGN KEY ([proveedor]) REFERENCES [dbo].[Proveedor] ([cedula]) ON DELETE CASCADE ON UPDATE CASCADE
);


