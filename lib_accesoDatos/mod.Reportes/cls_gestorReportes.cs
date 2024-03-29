﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using COSEVI.CSLA.lib.accesoDatos;
using COSEVI.CSLA.lib.entidades.mod.ControlSeguimiento;
using COSEVI.CSLA.lib.accesoDatos.App_Database;
using COSEVI.CSLA.lib.accesoDatos.App_Constantes;
using COSEVI.CSLA.lib.accesoDatos.App_InterfaceComunes;
using COSEVI.CSLA.lib.entidades.mod.Estadistico;

//=======================================================================
// Consejo de Seguridad Vial (COSEVI). - 2011
// Sistema CSLA
//
// cls_gestorReportes.cs
//
// Explicación de los contenidos del archivo.
// =========================================================================
// Historial
// PERSONA 			        MES - DIA - AÑO		DESCRIPCION
// GENERADOR			 	13    06    2012    Se crea la clase
//								
//
//======================================================================

namespace COSEVI.CSLA.lib.accesoDatos.mod.Reportes
{
    public class cls_gestorReportes
    {
        /// <summary>
        /// Método que permite insertar 
        /// un nuevo registro en la tabla usuario
        /// </summary>
        /// <param name="poUsuario">Usuario a insertar</param>
        /// <returns>Int valor del resultado de la ejecución de la sentencia</returns>
        public static int insertConsecutivo(string ps_usuario, DateTime pd_fecha)
        {
            int vi_resultado;

            try
            {
                String vs_comando = "PA_cont_imprimeReporteRegistro";
                cls_parameter[] vu_parametros = 
                {
                    new cls_parameter("@paramUsuario", ps_usuario),
                    new cls_parameter("@paramFecha", pd_fecha)
                };

                cls_sqlDatabase.beginTransaction();

                vi_resultado = cls_sqlDatabase.executeNonQuery(vs_comando, true, vu_parametros);

                cls_sqlDatabase.commitTransaction();

                return vi_resultado;

            }
            catch (Exception po_exception)
            {
                cls_sqlDatabase.rollbackTransaction();
                throw new Exception("Ocurrió un error al insertar el usuario.", po_exception);
            }

        }

    }
}
