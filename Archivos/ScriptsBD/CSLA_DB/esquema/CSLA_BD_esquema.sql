create database [CSLA]
GO
USE [CSLA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_menu](
	[PK_menu] [int] NOT NULL,
	[FK_menuPadre] [int] NULL,
	[imagen] [nvarchar](100) NULL,
	[titulo] [nvarchar](100) NULL,
	[descripcion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_menu] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_permiso](
	[PK_permiso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_permiso] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_registro_permanente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_registro_permanente](
	[tabla] [nvarchar](50) NOT NULL,
	[registro] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_rol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_rol](
	[PK_rol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[nombre] [nvarchar](75) NOT NULL,
	[visible] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_rol] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_actividad](
	[PK_actividad] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](20) NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_actividad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_componente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_componente](
	[PK_componente] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](20) NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_componente] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_entregable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_entregable](
	[PK_entregable] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](20) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_entregable] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_paquete]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_paquete](
	[PK_paquete] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](20) NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_paquete] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_estado](
	[PK_estado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_estado] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_consecutivo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_consecutivo](
	[PK_usuario] [nvarchar](30) NOT NULL,
	[PK_consecutivo] [nvarchar](45) NOT NULL,
	[PK_fecha_impresion] [datetime] NOT NULL,
	[reimpresion] [smallint] NULL
PRIMARY KEY CLUSTERED 
(
	[PK_usuario] ASC,
	[PK_consecutivo] ASC,
	[PK_fecha_impresion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_departamento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_departamento](
	[PK_departamento] [int] IDENTITY(1,1)  NOT NULL,
	[FK_departamento] [int] NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[ubicacion] [nvarchar](100) NULL,
	[administrador] [nvarchar](30) NULL,
	[consecutivo] [nvarchar](45) NOT NULL DEFAULT '0000',
PRIMARY KEY CLUSTERED 
(
	[PK_departamento] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_pagina]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_pagina](
	[PK_pagina] [int] IDENTITY(1,1) NOT NULL,
	[FK_menu] [int] NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[url] [nvarchar](100) NULL,
	[height] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_pagina] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_pagina_permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_pagina_permiso](
	[PK_pagina] [int] NOT NULL DEFAULT ((0)),
	[PK_permiso] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[PK_pagina] ASC,
	[PK_permiso] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_rol_pagina_permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_rol_pagina_permiso](
	[PK_rol] [int] NOT NULL DEFAULT ((0)),
	[PK_pagina] [int] NOT NULL DEFAULT ((0)),
	[PK_permiso] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[PK_rol] ASC,
	[PK_pagina] ASC,
	[PK_permiso] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_usuario](
	[PK_usuario] [nvarchar](30) NOT NULL,
	[FK_rol] [int] NOT NULL,
	[FK_departamento] [int] NOT NULL,
	[clave] [nvarchar](40) NOT NULL,
	[activo] [smallint] NULL,
	[nombre] [nvarchar](45) NOT NULL,
	[apellido1] [nvarchar](45) NOT NULL,
	[apellido2] [nvarchar](45) NOT NULL,
	[puesto] [nvarchar](45) NOT NULL,
	[email] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_usuario] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_asignacion_actividad](
	[PK_actividad] [int] NOT NULL,
	[PK_paquete] [int] NOT NULL,
	[PK_componente] [int] NOT NULL,
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[PK_usuario] [nvarchar](30) NOT NULL,
	[FK_estado] [int] NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[horasAsignadas] [numeric](10, 2) NULL,
	[activo] [smallint] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_actividad] ASC,
	[PK_paquete] ASC,
	[PK_componente] ASC,
	[PK_entregable] ASC,
	[PK_proyecto] ASC,
	[PK_usuario] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_admi_bitacora]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_admi_bitacora](
	[PK_bitacora] [numeric](10, 0) NOT NULL,
	[FK_departamento] [int] NULL,
	[FK_usuario] [nvarchar](30) NOT NULL,
	[accion] [nvarchar](50) NOT NULL,
	[fecha_accion] [datetime] NOT NULL,
	[numero_registro] [nvarchar](100) NOT NULL,
	[tabla] [nvarchar](50) NOT NULL,
	[maquina] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_bitacora] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_operacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_asignacion_operacion](
	[PK_codigo] [nvarchar](50) NOT NULL,
	[PK_usuario] [nvarchar](30) NOT NULL,
	[comentario] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_codigo] ASC,
	[PK_usuario] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_paquete_actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_paquete_actividad](
	[PK_actividad] [int] NOT NULL,
	[PK_paquete] [int] NOT NULL,
	[PK_componente] [int] NOT NULL,
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[activo] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_actividad] ASC,
	[PK_paquete] ASC,
	[PK_componente] ASC,
	[PK_entregable] ASC,
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_registro_actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_registro_actividad](
	[PK_registro] [int] NOT NULL,
	[PK_actividad] [int] NOT NULL,
	[PK_paquete] [int] NOT NULL,
	[PK_componente] [int] NOT NULL,
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[PK_usuario] [nvarchar](30) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[comentario] [nvarchar](100) NULL,
	[horas] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_registro] ASC,
	[PK_actividad] ASC,
	[PK_paquete] ASC,
	[PK_componente] ASC,
	[PK_entregable] ASC,
	[PK_proyecto] ASC,
	[PK_usuario] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_registro_operacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_registro_operacion](
	[PK_registro] [numeric](10, 2) NOT NULL,
	[PK_codigo] [nvarchar](50) NOT NULL,
	[PK_usuario] [nvarchar](30) NOT NULL,
	[fecha] [datetime] NULL,
	[horas] [numeric](10, 2) NULL,
	[comentario] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_registro] ASC,
	[PK_codigo] ASC,
	[PK_usuario] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_entregable_componente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_entregable_componente](
	[PK_componente] [int] NOT NULL,
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[activo] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_componente] ASC,
	[PK_entregable] ASC,
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_proyecto_entregable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_proyecto_entregable](
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[activo] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_entregable] ASC,
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_componente_paquete]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_componente_paquete](
	[PK_paquete] [int] NOT NULL,
	[PK_componente] [int] NOT NULL,
	[PK_entregable] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[activo] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_paquete] ASC,
	[PK_componente] ASC,
	[PK_entregable] ASC,
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_proyecto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_proyecto](
	[PK_proyecto] [int] IDENTITY(1,1) NOT NULL,
	[FK_estado] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[objetivo] [nvarchar](500) NULL,
	[meta] [nvarchar](500) NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[horasAsignadas] [numeric](10, 2) NULL
PRIMARY KEY CLUSTERED 
(
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_departamento_proyecto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_departamento_proyecto](
	[PK_departamento] [int] NOT NULL,
	[PK_proyecto] [int] NOT NULL,
	[activo] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PK_departamento] ASC,
	[PK_proyecto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cont_operacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[t_cont_operacion](
	[PK_codigo] [nvarchar](50) NOT NULL,
	[FK_proyecto] [int]  NULL,
	[tipo] [nchar](1) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[activo] [int] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[PK_codigo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_menu1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_menu]'))
ALTER TABLE [dbo].[t_admi_menu]  WITH CHECK ADD  CONSTRAINT [fk_menu1] FOREIGN KEY([FK_menuPadre])
REFERENCES [dbo].[t_admi_menu] ([PK_menu])
GO
ALTER TABLE [dbo].[t_admi_menu] CHECK CONSTRAINT [fk_menu1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_departamento1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_departamento]'))
ALTER TABLE [dbo].[t_admi_departamento]  WITH CHECK ADD  CONSTRAINT [fk_departamento1] FOREIGN KEY([FK_departamento])
REFERENCES [dbo].[t_admi_departamento] ([PK_departamento])
GO
ALTER TABLE [dbo].[t_admi_departamento] CHECK CONSTRAINT [fk_departamento1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagina1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_pagina]'))
ALTER TABLE [dbo].[t_admi_pagina]  WITH CHECK ADD  CONSTRAINT [fk_pagina1] FOREIGN KEY([FK_menu])
REFERENCES [dbo].[t_admi_menu] ([PK_menu])
GO
ALTER TABLE [dbo].[t_admi_pagina] CHECK CONSTRAINT [fk_pagina1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagina_permiso1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_pagina_permiso]'))
ALTER TABLE [dbo].[t_admi_pagina_permiso]  WITH CHECK ADD  CONSTRAINT [fk_pagina_permiso1] FOREIGN KEY([PK_pagina])
REFERENCES [dbo].[t_admi_pagina] ([PK_pagina])
GO
ALTER TABLE [dbo].[t_admi_pagina_permiso] CHECK CONSTRAINT [fk_pagina_permiso1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagina_permiso2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_pagina_permiso]'))
ALTER TABLE [dbo].[t_admi_pagina_permiso]  WITH CHECK ADD  CONSTRAINT [fk_pagina_permiso2] FOREIGN KEY([PK_permiso])
REFERENCES [dbo].[t_admi_permiso] ([PK_permiso])
GO
ALTER TABLE [dbo].[t_admi_pagina_permiso] CHECK CONSTRAINT [fk_pagina_permiso2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_rol_pagina_permiso1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_rol_pagina_permiso]'))
ALTER TABLE [dbo].[t_admi_rol_pagina_permiso]  WITH CHECK ADD  CONSTRAINT [fk_rol_pagina_permiso1] FOREIGN KEY([PK_rol])
REFERENCES [dbo].[t_admi_rol] ([PK_rol])
GO
ALTER TABLE [dbo].[t_admi_rol_pagina_permiso] CHECK CONSTRAINT [fk_rol_pagina_permiso1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_rol_pagina_permisor2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_rol_pagina_permiso]'))
ALTER TABLE [dbo].[t_admi_rol_pagina_permiso]  WITH CHECK ADD  CONSTRAINT [fk_rol_pagina_permisor2] FOREIGN KEY([PK_pagina], [PK_permiso])
REFERENCES [dbo].[t_admi_pagina_permiso] ([PK_pagina], [PK_permiso])
GO
ALTER TABLE [dbo].[t_admi_rol_pagina_permiso] CHECK CONSTRAINT [fk_rol_pagina_permisor2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_usuario1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_usuario]'))
ALTER TABLE [dbo].[t_admi_usuario]  WITH CHECK ADD  CONSTRAINT [fk_usuario1] FOREIGN KEY([FK_rol])
REFERENCES [dbo].[t_admi_rol] ([PK_rol])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_usuario2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_usuario]'))
ALTER TABLE [dbo].[t_admi_usuario]  WITH CHECK ADD  CONSTRAINT [fk_usuario2] FOREIGN KEY([FK_departamento])
REFERENCES [dbo].[t_admi_departamento] ([PK_departamento])
GO
ALTER TABLE [dbo].[t_admi_usuario] CHECK CONSTRAINT [fk_usuario1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_actividad_asignada1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_actividad]'))
ALTER TABLE [dbo].[t_cont_asignacion_actividad]  WITH CHECK ADD  CONSTRAINT [fk_actividad_asignada1] FOREIGN KEY([PK_actividad], [PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto])
REFERENCES [dbo].[t_cont_paquete_actividad] ([PK_actividad], [PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_asignacion_actividad] CHECK CONSTRAINT [fk_actividad_asignada1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_actividad_asignada2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_actividad]'))
ALTER TABLE [dbo].[t_cont_asignacion_actividad]  WITH CHECK ADD  CONSTRAINT [fk_actividad_asignada2] FOREIGN KEY([PK_usuario])
REFERENCES [dbo].[t_admi_usuario] ([PK_usuario])
GO
ALTER TABLE [dbo].[t_cont_asignacion_actividad] CHECK CONSTRAINT [fk_actividad_asignada2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_actividad_asignada3]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_actividad]'))
ALTER TABLE [dbo].[t_cont_asignacion_actividad]  WITH CHECK ADD  CONSTRAINT [fk_actividad_asignada3] FOREIGN KEY([FK_estado])
REFERENCES [dbo].[t_cont_estado] ([PK_estado])
GO
ALTER TABLE [dbo].[t_cont_asignacion_actividad] CHECK CONSTRAINT [fk_actividad_asignada3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_bitacora1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_bitacora]'))
ALTER TABLE [dbo].[t_admi_bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora1] FOREIGN KEY([FK_usuario])
REFERENCES [dbo].[t_admi_usuario] ([PK_usuario])
GO
ALTER TABLE [dbo].[t_admi_bitacora] CHECK CONSTRAINT [fk_bitacora1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_bitacora2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_admi_bitacora]'))
ALTER TABLE [dbo].[t_admi_bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora2] FOREIGN KEY([FK_departamento])
REFERENCES [dbo].[t_admi_departamento] ([PK_departamento])
GO
ALTER TABLE [dbo].[t_admi_bitacora] CHECK CONSTRAINT [fk_bitacora2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignacion_operacion1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_operacion]'))
ALTER TABLE [dbo].[t_cont_asignacion_operacion]  WITH CHECK ADD  CONSTRAINT [fk_asignacion_operacion1] FOREIGN KEY([PK_codigo])
REFERENCES [dbo].[t_cont_operacion] ([PK_codigo])
GO
ALTER TABLE [dbo].[t_cont_asignacion_operacion] CHECK CONSTRAINT [fk_asignacion_operacion1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignacion_operacion2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_asignacion_operacion]'))
ALTER TABLE [dbo].[t_cont_asignacion_operacion]  WITH CHECK ADD  CONSTRAINT [fk_asignacion_operacion2] FOREIGN KEY([PK_usuario])
REFERENCES [dbo].[t_admi_usuario] ([PK_usuario])
GO
ALTER TABLE [dbo].[t_cont_asignacion_operacion] CHECK CONSTRAINT [fk_asignacion_operacion2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_paquete_actividad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_paquete_actividad]'))
ALTER TABLE [dbo].[t_cont_paquete_actividad]  WITH CHECK ADD  CONSTRAINT [fk_paquete_actividad1] FOREIGN KEY([PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto])
REFERENCES [dbo].[t_cont_componente_paquete] ([PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_paquete_actividad] CHECK CONSTRAINT [fk_paquete_actividad1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_paquete_actividad2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_paquete_actividad]'))
ALTER TABLE [dbo].[t_cont_paquete_actividad]  WITH CHECK ADD  CONSTRAINT [fk_paquete_actividad2] FOREIGN KEY([PK_actividad])
REFERENCES [dbo].[t_cont_actividad] ([PK_actividad])
GO
ALTER TABLE [dbo].[t_cont_paquete_actividad] CHECK CONSTRAINT [fk_paquete_actividad2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_registro_actividad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_registro_actividad]'))
ALTER TABLE [dbo].[t_cont_registro_actividad]  WITH CHECK ADD  CONSTRAINT [fk_registro_actividad1] FOREIGN KEY([PK_actividad], [PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto], [PK_usuario])
REFERENCES [dbo].[t_cont_asignacion_actividad] ([PK_actividad], [PK_paquete], [PK_componente], [PK_entregable], [PK_proyecto], [PK_usuario])
GO
ALTER TABLE [dbo].[t_cont_registro_actividad] CHECK CONSTRAINT [fk_registro_actividad1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_registro_operacion1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_registro_operacion]'))
ALTER TABLE [dbo].[t_cont_registro_operacion]  WITH CHECK ADD  CONSTRAINT [fk_registro_operacion1] FOREIGN KEY([PK_codigo], [PK_usuario])
REFERENCES [dbo].[t_cont_asignacion_operacion] ([PK_codigo], [PK_usuario])
GO
ALTER TABLE [dbo].[t_cont_registro_operacion] CHECK CONSTRAINT [fk_registro_operacion1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_entregable_componente1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_entregable_componente]'))
ALTER TABLE [dbo].[t_cont_entregable_componente]  WITH CHECK ADD  CONSTRAINT [fk_entregable_componente1] FOREIGN KEY([PK_entregable], [PK_proyecto])
REFERENCES [dbo].[t_cont_proyecto_entregable] ([PK_entregable], [PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_entregable_componente] CHECK CONSTRAINT [fk_entregable_componente1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_entregable_componente2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_entregable_componente]'))
ALTER TABLE [dbo].[t_cont_entregable_componente]  WITH CHECK ADD  CONSTRAINT [fk_entregable_componente2] FOREIGN KEY([PK_componente])
REFERENCES [dbo].[t_cont_componente] ([PK_componente])
GO
ALTER TABLE [dbo].[t_cont_entregable_componente] CHECK CONSTRAINT [fk_entregable_componente2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_proyecto_entregable1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_proyecto_entregable]'))
ALTER TABLE [dbo].[t_cont_proyecto_entregable]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_entregable1] FOREIGN KEY([PK_proyecto])
REFERENCES [dbo].[t_cont_proyecto] ([PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_proyecto_entregable] CHECK CONSTRAINT [fk_proyecto_entregable1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_proyecto_entregable2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_proyecto_entregable]'))
ALTER TABLE [dbo].[t_cont_proyecto_entregable]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_entregable2] FOREIGN KEY([PK_entregable])
REFERENCES [dbo].[t_cont_entregable] ([PK_entregable])
GO
ALTER TABLE [dbo].[t_cont_proyecto_entregable] CHECK CONSTRAINT [fk_proyecto_entregable2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_componente_paquete1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_componente_paquete]'))
ALTER TABLE [dbo].[t_cont_componente_paquete]  WITH CHECK ADD  CONSTRAINT [fk_componente_paquete1] FOREIGN KEY([PK_componente], [PK_entregable], [PK_proyecto])
REFERENCES [dbo].[t_cont_entregable_componente] ([PK_componente], [PK_entregable], [PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_componente_paquete] CHECK CONSTRAINT [fk_componente_paquete1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_componente_paquete2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_componente_paquete]'))
ALTER TABLE [dbo].[t_cont_componente_paquete]  WITH CHECK ADD  CONSTRAINT [fk_componente_paquete2] FOREIGN KEY([PK_paquete])
REFERENCES [dbo].[t_cont_paquete] ([PK_paquete])
GO
ALTER TABLE [dbo].[t_cont_componente_paquete] CHECK CONSTRAINT [fk_componente_paquete2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_proyecto1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_proyecto]'))
ALTER TABLE [dbo].[t_cont_proyecto]  WITH CHECK ADD  CONSTRAINT [fk_proyecto1] FOREIGN KEY([FK_estado])
REFERENCES [dbo].[t_cont_estado] ([PK_estado])
GO
ALTER TABLE [dbo].[t_cont_proyecto] CHECK CONSTRAINT [fk_proyecto1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_departamento_proyecto1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_departamento_proyecto]'))
ALTER TABLE [dbo].[t_cont_departamento_proyecto]  WITH CHECK ADD  CONSTRAINT [fk_departamento_proyecto1] FOREIGN KEY([PK_departamento])
REFERENCES [dbo].[t_admi_departamento] ([PK_departamento])
GO
ALTER TABLE [dbo].[t_cont_departamento_proyecto] CHECK CONSTRAINT [fk_departamento_proyecto1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_departamento_proyecto2]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_departamento_proyecto]'))
ALTER TABLE [dbo].[t_cont_departamento_proyecto]  WITH CHECK ADD  CONSTRAINT [fk_departamento_proyecto2] FOREIGN KEY([PK_proyecto])
REFERENCES [dbo].[t_cont_proyecto] ([PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_departamento_proyecto] CHECK CONSTRAINT [fk_departamento_proyecto2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_operacion1]') AND parent_object_id = OBJECT_ID(N'[dbo].[t_cont_operacion]'))
ALTER TABLE [dbo].[t_cont_operacion]  WITH CHECK ADD  CONSTRAINT [fk_operacion1] FOREIGN KEY([FK_proyecto])
REFERENCES [dbo].[t_cont_proyecto] ([PK_proyecto])
GO
ALTER TABLE [dbo].[t_cont_operacion] CHECK CONSTRAINT [fk_operacion1]



--Inserts

--Inserts iniciales
--Departamento inicial
INSERT INTO t_admi_departamento (nombre,ubicacion,administrador) VALUES ('ATI','COSEVI','ATI-ADMIN');
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_departamento','1');

--Rol inicial
INSERT INTO t_admi_rol(nombre,descripcion,visible) VALUES ('Rol Administrador','Rol Administrador',1);
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_rol','1');

--Usuario administrador Administrador/admin
INSERT INTO t_admi_usuario(Pk_usuario,Fk_rol,clave,activo,nombre,apellido1,apellido2,puesto,email,FK_departamento) VALUES ('Administrador', 1, '7d9817242fa8c6f0dd1fdcdc3677c5da', 1, 'Administrador CSLA', 'Sin apellido1', 'Sin apellido2', 'Administrador','Admin@csla.com',1);
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_usuario','Administrador');

--Insert del Menú Principal
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (1,NULL,'Administración', 'Administración');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (2,NULL,'Control y Seguimiento', 'Control y Seguimiento');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (3,NULL,'Estadístico', 'Estadístico');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (4,NULL,'Reportes', 'Reportes');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (21,NULL,'Calendario', 'Calendario');

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','1');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','2');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','3');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','4');

--Insert de la pestaña de Administración
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (5,1,'Bitácora', 'Bitácora');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (6,1,'Departamentos', 'Departamentos');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (7,1,'Usuarios y Permisos', 'Usuarios y Permisos');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (8,7,'Usuarios', 'Usuarios');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (9,7,'Permisos', 'Permisos');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (10,7,'Roles', 'Roles');
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','5');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','6');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','7');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','8');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','9');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','10');

--Insert de la pestaña de Control y Seguimiento
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (11,2,'Proyectos', 'Proyectos');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (12,2,'Estados', 'Estados');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (13,2,'Componentes', 'Componentes');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (14,2,'Entregables', 'Entregables');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (15,2,'Paquetes', 'Paquetes');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (16,2,'Actividades', 'Actividades');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (17,2,'Copiar Proyecto', 'Copiar Proyecto');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (20,2,'Operaciones/Imprevistos', 'Operaciones');

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','11');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','12');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','13');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','14');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','15');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','16');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','17');

INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (18,7,'Menú', 'Menú');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (19,7,'Páginas', 'Páginas');

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','18');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','19');

--Reportes

INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (22,4,'Registro de Tiempos Usuario', 'Registro de Tiempos Usuario');

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','22');

--Gráficos
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (23,3,'Gráfico 1', 'Gráfico 1');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (24,3,'Gráfico 2', 'Gráfico 2');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (25,3,'Gráfico 3', 'Gráfico 3');
INSERT INTO t_admi_menu (PK_menu,FK_menuPadre,titulo,descripcion) VALUES (26,3,'Gráfico 4', 'Gráfico 4');

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','23');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','24');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','25');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_menu','26');

--Insert de las páginas


--Administracion
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (5,'Bitácora','#App_pages/mod.Administracion/frw_bitacora.aspx');			--1
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (6,'Departamentos','#App_pages/mod.Administracion/frw_departamento.aspx');	--2
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (9,'Permisos','#App_pages/mod.Administracion/frw_permisos.aspx');			--3
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (8,'Usuarios','#App_pages/mod.Administracion/frw_usuarios.aspx');			--4
INSERT INTO t_admi_pagina(FK_menu,nombre,url,height) VALUES (10,'Roles','#App_pages/mod.Administracion/frw_roles.aspx','700');				--5
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (18,'Menu','#App_pages/mod.Administracion/frw_menu.aspx');					--6
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (19,'Pagina','#App_pages/mod.Administracion/frw_pagina.aspx');				--7
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','1');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','2');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','3');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','4');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','5');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','6');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','7');

--Control y Seguimiento
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (11,'Proyectos','#App_pages/mod.ControlSeguimiento/frw_proyectos.aspx');				--8
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (12,'Estados','#App_pages/mod.ControlSeguimiento/frw_estados.aspx');					--9
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (13,'Componentes','#App_pages/mod.ControlSeguimiento/frw_componentes.aspx');			--10
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (14,'Entregables','#App_pages/mod.ControlSeguimiento/frw_entregables.aspx');			--11
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (15,'Paquetes','#App_pages/mod.ControlSeguimiento/frw_paquetes.aspx');					--12
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (16,'Actividades','#App_pages/mod.ControlSeguimiento/frw_actividades.aspx');			--13
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (17,'Copiar Proyecto','#App_pages/mod.ControlSeguimiento/frw_copiarProyecto.aspx');		--14

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','8');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','9');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','10');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','11');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','12');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','13');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','14');



--Calendario
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (21,'Calendario','#App_pages/mod.ControlSeguimiento/frw_calendario.aspx');		--15
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (20,'Operaciones/Imprevistos','#App_pages/mod.ControlSeguimiento/frw_operaciones.aspx');		--16


--Reportes
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (22,'Reporte Registro Tiempo Usuario','#App_pages/mod.Reportes/RegistroTiemposUsuario/frw_rep_registroTiemposUsuarioParam.aspx');		--17

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','17');

--Estadístico
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (23,'Grafico 1','#');				--18
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (24,'Grafico 2','#');				--19
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (25,'Grafico 3','#');				--20
INSERT INTO t_admi_pagina(FK_menu,nombre,url) VALUES (26,'Grafico 4','#');				--21

--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','18');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','19');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','20');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_pagina','21');


--Insert de la tabla de permisos
INSERT INTO t_admi_permiso(nombre) VALUES ('Agregar');
INSERT INTO t_admi_permiso(nombre) VALUES ('Modificar');
INSERT INTO t_admi_permiso(nombre) VALUES ('Eliminar');
INSERT INTO t_admi_permiso(nombre) VALUES ('Acceso');
INSERT INTO t_admi_permiso(nombre) VALUES ('CambCont');
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_permiso','1');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_permiso','2');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_permiso','3');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_admi_permiso','4');

--Inserts de la tabla de estados
INSERT INTO t_cont_estado(descripcion) VALUES ('Iniciado');
INSERT INTO t_cont_estado(descripcion) VALUES ('Finalizado');
INSERT INTO t_cont_estado(descripcion) VALUES ('Cancelado');
INSERT INTO t_cont_estado(descripcion) VALUES ('Pausado');
--Registros no eliminables
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_cont_estado','1');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_cont_estado','2');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_cont_estado','3');
INSERT INTO t_admi_registro_permanente(tabla,registro) VALUES ('t_cont_estado','4');

--Inserts de la tabla de pagina permisos.

--Bitácora
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(1,4)

--Departamentos
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(2,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(2,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(2,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(2,4)

--Permisos
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(3,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(3,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(3,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(3,4)

--Usuarios
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(4,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(4,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(4,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(4,4)

--Roles
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(5,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(5,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(5,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(5,4)

--Menu

INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(6,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(6,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(6,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(6,4)

--Página 


INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(7,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(7,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(7,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(7,4)

--Proyectos

INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(8,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(8,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(8,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(8,4)

--Estados

INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(9,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(9,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(9,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(9,4)

--Componentes

INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(10,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(10,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(10,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(10,4)
--Entregables


INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(11,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(11,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(11,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(11,4)

--Paquetes
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(12,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(12,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(12,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(12,4)
--Actividades
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(13,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(13,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(13,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(13,4)
--CopiarProyecto
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(14,4)

--Calendario
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(15,4)

--Operaciones
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(16,1)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(16,2)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(16,3)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(16,4)

--Reportes
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(17,4)

--Graficos
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(18,4)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(19,4)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(20,4)
INSERT INTO t_admi_pagina_permiso (PK_pagina, PK_permiso) VALUES(21,4)

--Se agregan todos los privilegios para el usuario administrador
INSERT INTO t_admi_rol_pagina_permiso
SELECT 1, PK_pagina, PK_permiso FROM t_admi_pagina_permiso
