IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_cont_reporteRegritroTiempos]'))
DROP VIEW [dbo].[v_cont_reporteRegritroTiempos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Generador
-- Fecha Creación:	15-05-2011
-- Fecha Actulización:	15-05-2011
-- Descripción: 
-- =============================================
CREATE VIEW v_cont_reporteRegritroTiempos
AS
SELECT 
	op.PK_codigo codigo,
	op.descripcion descripcion,
	op.tipo tipo,
	ro.PK_usuario usuario,
	SUM(ro.horas) total_horas
FROM
	t_cont_operacion op
INNER JOIN
	t_cont_registro_operacion ro
ON
	op.PK_codigo = ro.PK_codigo
WHERE
	op.FK_proyecto IS NULL
GROUP BY
	op.PK_codigo,op.descripcion,op.tipo,op.FK_proyecto,ro.PK_usuario 
	
UNION ALL

SELECT 
	pr.PK_proyecto codigo,
	pr.descripcion descripcion,
	'P' tipo,
	rp.PK_usuario usuario,
	SUM(rp.horas) total_horas
FROM
	t_cont_proyecto pr
INNER JOIN
	t_cont_registro_actividad rp
ON
	pr.PK_proyecto = rp.PK_proyecto
GROUP BY
	pr.PK_proyecto,pr.descripcion,rp.PK_usuario
GO