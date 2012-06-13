﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using COSEVI.CSLA.lib.accesoDatos.mod.Estadistico;
using COSEVI.CSLA.lib.entidades.mod.Estadistico;
using System.Drawing;
using CSLA.web.App_Variables;
using ExceptionManagement.Exceptions;
using CSLA.web.App_Constantes;
using COSEVI.CSLA.lib.entidades.mod.Administracion;

// =========================================================================
// COSEVI - Consejo de Seguridad Vial. - 2011
// Sistema CSLA (Sistema para el Control y Seguimiento de Labores)
//
// frw_grf_compHorasActividades.aspx.cs
//
// Explicación de los contenidos del archivo.
// =========================================================================
// Historial
// PERSONA 			           MES – DIA - AÑO		DESCRIPCIÓN
// Esteban Ramírez Gónzalez  	03 – 06  - 2012	 	Se crea la clase
// 
//								
//								
//
// =========================================================================


namespace CSLA.web.App_pages.mod.Estadistico
{
    public partial class frw_grf_compHorasActividades : System.Web.UI.Page
    {

        #region Inicialización

        /// <summary>
        /// Función que se ejecuta al cargar
        /// la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            this.validarSession();

            if (!Page.IsPostBack)
            {
                try
                {
                    this.validarAcceso();
                    cargarProyectos();
                }
                catch (Exception po_exception)
                {
                    String vs_error_usuario = "Error en la consulta de datos para el gráfco de actividades top por proyecto.";
                    this.lanzarExcepcion(po_exception, vs_error_usuario);
                }

            }
        }

        /// <summary>
        /// Función que se ejecuta al inicializar la página.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            try
            {
                base.OnInit(e);
            }
            catch (Exception po_exception)
            {
                String vs_error_usuario = "Error al inicializar los controles de la ventana para el gráfico de actividades top por proyecto.";
                this.lanzarExcepcion(po_exception, vs_error_usuario);
            }
        }

        /// <summary>
        /// Función que se ejecute cada vez que se realice un postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grafico_Init(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    //Cuando se está ingresando a la página, se limpian las variables de sesión para evitar valores incorrectos
                    LimpiarVariablesSession();
                }
                else
                {
                    if (!(Session[cls_constantes.CODIGOPROYECTO] == null))
                    {
                        CargaGrafico(Convert.ToInt32(Session[cls_constantes.CODIGOPROYECTO]), Convert.ToInt32(Session[cls_constantes.CODIGOPAQUETE]));
                    }
                }
            }
            catch (Exception po_exception)
            {
                String vs_error_usuario = "Ocurrió un error al inicializar los controles del gráfico.";
                this.lanzarExcepcion(po_exception, vs_error_usuario);
            }
        }


        #endregion Inicialización

        #region Métodos Privados

        /// <summary>
        /// Método que realiza la consulta en BD para obtener la información por proyecto y cargar sus valores
        /// </summary>
        private void CargaGrafico(int pi_proyecto, int pi_paquete)
        {
            try
            {
                //Si se está obteniendo información para un proyecto que NO es el proyecto por defecto
                if (pi_proyecto > 0)
                {
                    obtenerGraficoActividadesPorProyecto(pi_proyecto, pi_paquete);
                }
                else
                {
                    obtenerGraficoPorDefecto();
                }
            }
            catch (Exception po_exception)
            {
                throw new Exception("Ocurrió un error al definir el tipo de gráfico.", po_exception);
            }
        }

        /// <summary>
        /// Metodo que carga el ddl de proyectos para escoger por cual se quiere filtrar
        /// </summary>
        private void cargarProyectos()
        {
            try
            {
                this.ddl_proyecto.DataSource = cls_gestorEstadistico.listarProyectos();
                this.ddl_proyecto.DataTextField = "pNombre";
                this.ddl_proyecto.DataValueField = "pPK_proyecto";
                this.ddl_proyecto.DataBind();

                this.ddl_proyecto.Items.Insert(0, new ListItem("Seleccione un proyecto", "0"));
                this.ddl_proyecto.SelectedIndex = 0;

            }
            catch (Exception po_exception)
            {
                throw new Exception("Ocurrió un error al cargar la lista de proyectos.", po_exception);
            }
        }

        /// <summary>
        /// Metodo que carga el ddl de paquetes para escoger por cual se quiere filtrar
        /// </summary>
        private void cargarPaquetes(int pi_proyecto)
        {
            try
            {
                this.ddl_paquete.DataSource = cls_gestorEstadistico.listarPaquetesAsignacion(pi_proyecto);
                this.ddl_paquete.DataTextField = "pNombre";
                this.ddl_paquete.DataValueField = "pPK_paquete";
                this.ddl_paquete.DataBind();

                this.ddl_paquete.Items.Insert(0, new ListItem("Seleccione un paquete", "0"));
                this.ddl_paquete.SelectedIndex = 0;
                this.ddl_paquete.Enabled = true;

            }
            catch (Exception po_exception)
            {
                throw new Exception("Ocurrió un error al cargar la lista de proyectos.", po_exception);
            }
        }

        /// <summary>
        /// Método que obtiene la información con la que se va a cargar en gráfico
        /// </summary>
        private void obtenerGraficoActividadesPorProyecto(int pi_proyecto, int pi_paquete)
        {
            try
            {
                //Se procede a obtener la información por proyecto
                cls_compHorasActividades vo_compHorasActividades = new cls_compHorasActividades();
                vo_compHorasActividades.pPK_proyecto = pi_proyecto;
                vo_compHorasActividades.pPK_paquete = pi_paquete;

                List<cls_compHorasActividades> vl_topActividades = cls_gestorEstadistico.CompHorasActividadesPorProyecto(vo_compHorasActividades);

                //Se asignan los tooltips para el gráfico
                Grafico.Series["Leyendas"].ToolTip = "#VALX: #VAL{d} horas";
                Grafico.Series["Leyendas"].LegendToolTip = "#VALX: #VAL{d} Horas";
                Grafico.Series["Leyendas"].IsVisibleInLegend = true;
                Grafico.Series["Leyendas"].Label = "#VALX\n#PERCENT";
                Grafico.Series["Leyendas"].PostBackValue = "#INDEX";
                Grafico.Series["Leyendas"].LegendPostBackValue = "#INDEX";

                //Se realiza el binding de la información que se obtuvo en la consulta
                Grafico.Series["Leyendas"].Points.DataBindXY(vl_topActividades, "pNombreActividad", vl_topActividades, "pHorasReales");

                //
                Grafico.Legends[0].Enabled = false;

                // Set pyramid chart type
                Grafico.Series["Leyendas"].ChartType = SeriesChartType.Column;





                // create the destination series and add it to the chart
                Series destSeries = new Series("Pareto");

                Grafico.Series.Add(destSeries);
                
                // ensure the destination series is a Line or Spline chart type
                destSeries.ChartType = SeriesChartType.Line;
                destSeries.BorderWidth = 3;
                // assign the series to the same chart area as the column chart
                destSeries.ChartArea = Grafico.Series["Leyendas"].ChartArea;
                // assign this series to use the secondary axis and set it maximum to be 100%
                destSeries.YAxisType = AxisType.Secondary;
                Grafico.ChartAreas["AreaGrafico"].AxisY2.Maximum = 100;
                // locale specific percentage format with no decimals
                Grafico.ChartAreas["AreaGrafico"].AxisY2.LabelStyle.Format = "P0";
                // turn off the end point values of the primary X axis
                Grafico.ChartAreas["AreaGrafico"].AxisX.LabelStyle.IsEndLabelVisible = false;
                // for each point in the source series find % of total and assign to series
                //double percentage = 0.0;
                //foreach (DataPoint pt in chart.Series[srcSeriesName].Points)
                //{
                //    // findes the growth percent and makes a cumulative function
                //    percentage += (pt.YValues[0] / total * 100.0);
                //    // Sets the cumulative value to the chart
                //    destSeries.Points.Add(Math.Round(percentage, 2));
                //}

                //Se realiza el binding de la información que se obtuvo en la consulta
                Grafico.Series["Pareto"].Points.DataBindXY(vl_topActividades, "pNombreActividad", vl_topActividades, "pHorasAsignadas");


                // Set chart types for output data
                Grafico.Series["Pareto"].ChartType = SeriesChartType.Line;
                // set the markers for each point of the Pareto Line
                Grafico.Series["Pareto"].IsValueShownAsLabel = true;
                Grafico.Series["Pareto"].MarkerColor = Color.Red;
                Grafico.Series["Pareto"].MarkerBorderColor = Color.MidnightBlue;
                Grafico.Series["Pareto"].MarkerStyle = MarkerStyle.Circle;
                Grafico.Series["Pareto"].MarkerSize = 8;
                Grafico.Series["Pareto"].LabelFormat = "0.#";  // format with one decimal and leading zero
                // Set Color of line Pareto chart
                Grafico.Series["Pareto"].Color = Color.FromArgb(252, 180, 65);





                // Set 3D mode
                Grafico.ChartAreas["AreaGrafico"].Area3DStyle.Enable3D = false;              

                //Se aplica el estilo pastel a los colores definidos para el gráfico
                Grafico.Palette = ChartColorPalette.BrightPastel;
                Grafico.ApplyPaletteColors();
                //Para que el estilo tome efecto se debe asignar a cada uno de los puntos de la serie en el gráfico
                foreach (var series in Grafico.Series)
                {
                    foreach (var point in series.Points)
                    {
                        point.Color = Color.FromArgb(220, point.Color);
                    }
                }

                // Set Antialiasing mode
                Grafico.AntiAliasing = AntiAliasingStyles.Graphics;
                Grafico.AlignDataPointsByAxisLabel();
            }
            catch (Exception po_exception)
            {
                throw new Exception("Ocurrió un error al cargar el gráfico con la información de la base de datos.", po_exception);
            }
        }

        /// <summary>
        /// Método que obtiene la información para el gráfico por defecto
        /// </summary>
        private void obtenerGraficoPorDefecto()
        {
            try
            {
                string[] valoresX = new string[] { "Sin Actividades" };
                decimal[] valoresY = new decimal[] { 0 };

                //Se realiza el binding de la información que se obtuvo en la consulta
                Grafico.Series["Leyendas"].Points.DataBindXY(valoresX, valoresY);
                Grafico.Legends[0].Enabled = false;

                //Se asignan los colores de la composición del gráfico
                Grafico.Series["Leyendas"].Points[0].Color = Color.White;

                //Se indica que tipo de gráfico se va a presentar al usuario
                Grafico.Series["Leyendas"].ChartType = SeriesChartType.Pie;
            }
            catch (Exception po_exception)
            {
                throw new Exception("Ocurrió un error al cargar el gráfico con la información por defecto.", po_exception);
            }
        }

        /// <summary>
        /// Método utilizado para limpiar las 3 variables de sesión que utiliza este gráfico
        /// </summary>
        private void LimpiarVariablesSession()
        {
            Session[cls_constantes.CODIGOPROYECTO] = null;
            Session[cls_constantes.CODIGOPAQUETE] = null;
        }

        /// <summary>
        /// Método que lanza la excepción personalizada
        /// </summary>
        /// <param name="po_exception">Excepción a levantar</param>
        /// <param name="ps_mensajeUsuario">Mensaje a comunicar al usuario</param>
        private void lanzarExcepcion(Exception po_exception, String ps_mensajeUsuario)
        {
            try
            {
                String vs_error_usuario = ps_mensajeUsuario;
                vs_error_usuario = vs_error_usuario.Replace(" ", "_");
                vs_error_usuario = vs_error_usuario.Replace("'", "|");

                String vs_error_tecnico = po_exception.Message;
                vs_error_tecnico = vs_error_tecnico.Replace(" ", "_");
                vs_error_tecnico = vs_error_tecnico.Replace("'", "|");

                String vs_script = "window.showModalDialog(\"../../frw_error.aspx?vs_error_usuario=" + vs_error_usuario + "&vs_error_tecnico=" + vs_error_tecnico + "\",\"Ventana\",\"dialogHeight:450px;dialogWidth:625px;center:yes;status:no;menubar:no;resizable:no;scrollbars:yes;toolbar:no;location:no;directories:no\");";
                ScriptManager.RegisterClientScriptBlock(this.Grafico, this.Grafico.GetType(), "jsKeyScript", vs_script, true);

                throw new GeneralException("GeneralException", po_exception);
            }
            catch (GeneralException po_general_exception)
            {
                ExceptionManagement.ExceptionManager.Publish(po_general_exception);
            }
        }

        #endregion Métodos Privados

        #region Eventos

        /// <summary>
        /// Evento para levantar el explode del gráfico(Explode = destacar, hacer sobresalir una de las secciones)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Generar_Click(object sender, EventArgs e)
        {
            try
            {
                Session[cls_constantes.CODIGOPROYECTO] = ddl_proyecto.SelectedValue;
                Session[cls_constantes.CODIGOPAQUETE] = ddl_paquete.Text;

                //Si el proyecto es un proyecto válido, se carga, de lo contrario, se limpia la variable en memoria
                //Si el proyecto es el "0", no se traerá nada, por lo que no se mostrará nada en ventana, que es el 
                //caso defecto, y está bien
                if (Convert.ToInt32(ddl_proyecto.SelectedValue) > -1)
                {
                    CargaGrafico(Convert.ToInt32(ddl_proyecto.SelectedValue), Convert.ToInt32(ddl_paquete.SelectedValue));
                }
            }
            catch (Exception po_exception)
            {
                String vs_error_usuario = "Ocurrió un error al enfocar la sección del gráfico.";
                this.lanzarExcepcion(po_exception, vs_error_usuario);
            }
        }

        /// <summary>
        /// Evento obtiene el valor del ddl para el llamado al método que lo carga en ventana
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlProyecto_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.ddl_proyecto.SelectedValue = ((DropDownList)sender).SelectedValue;
                Session[cls_constantes.CODIGOPROYECTO] = ddl_proyecto.SelectedValue;

                //Si el proyecto es un proyecto válido, se carga, de lo contrario, se limpia la variable en memoria
                //Si el proyecto es el "0", no se traerá nada, por lo que no se mostrará nada en ventana, que es el 
                //caso defecto, y está bien
                if (Convert.ToInt32(ddl_proyecto.SelectedValue) > -1)
                {
                    cargarPaquetes(Convert.ToInt32(ddl_proyecto.SelectedValue));
                }
            }
            catch (Exception po_exception)
            {
                String vs_error_usuario = "Ocurrió un error al obtener intentar cambiar el proyecto.";
                this.lanzarExcepcion(po_exception, vs_error_usuario);
            }
        }

        #endregion Eventos

        #region Seguridad

        /// <summary>
        /// Valida si el usuario
        /// tiene acceso a la página de lo contrario
        /// destruye la sessión
        /// 
        /// </summary>
        private void validarAcceso()
        {
            if (!this.pbAcceso)
            {
                this.Session.Abandon();
                this.Session.Clear();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Salida", cls_constantes.SCRIPTLOGOUT, true);
            }
        }

        /// <summary>
        /// Determina si la sesión se encuentra
        /// activa, si no es así se envía a la página de inicio.
        /// </summary>
        private void validarSession()
        {
            if (this.Session["cls_usuario"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Salida", cls_constantes.SCRIPTLOGOUT, true);
            }
        }

        /// <summary>
        /// Valida el acceso del usuario en la página
        /// </summary>
        private bool pbAcceso
        {
            get
            {
                if (Session[cls_constantes.PAGINA] != null)
                {
                    return (Session[cls_constantes.PAGINA] as cls_pagina)[cls_constantes.ACCESO] != null;
                }
                else
                {
                    return false;
                }
            }
        }

        #endregion Seguridad

    }
}