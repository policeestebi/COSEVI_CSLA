using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


using COSEVI.CSLA.lib.accesoDatos.App_InterfaceComunes;
using ExceptionManagement.Exceptions;
using COSEVI.CSLA.lib.entidades.mod.Administracion;
using COSEVI.CSLA.lib.accesoDatos.mod.Administracion;
using COSEVI.CSLA.lib.accesoDatos.mod.Reportes;

using CSLA.web.App_Variables;
using CSLA.web.App_Constantes;

namespace CSLA.web.App_pages.mod.Reportes.RegistroTiemposUsuario
{
    public partial class frw_rep_registroTiemposUsuarioParam : System.Web.UI.Page
    {
        #region Inicializacion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.inicializarValores();
            }
        }
        #endregion

        #region Metodos

        /// <summary>
        /// Inicializa los valores
        /// para los controles
        /// </summary>
        private void inicializarValores()
        {
            this.txt_fechaImpresion.Text = DateTime.Now.ToString("MM/yyyy");
        }

        /// <summary>
        /// Método que se encarga
        /// de llamar al reporte
        /// </summary>
        private void imprimirReporte()
        {
            string vs_fechaInicio = String.Empty, vs_fechaFinal = String.Empty;

            DateTime vd_fechaInicial = Convert.ToDateTime(this.txt_fechaImpresion.Text);

            DateTime vd_fechaFinal = vd_fechaInicial.AddMonths(1).AddDays(-1);

     //       cls_gestorReportes.insertConsecutivo(((cls_usuario)this.Session["cls_usuario"]).pPK_usuario, vd_fechaInicial);

            Response.Redirect(this.contruirURl(vd_fechaInicial,vd_fechaFinal));

        }

        /// <summary>
        /// Método que construye la url
        /// con los parámetros que serán 
        /// enviados al reporte.
        /// </summary>
        /// <param name="po_fechaInicial">Fecha Incial</param>
        /// <param name="po_fechaFinal">Fecha Final</param>
        private string contruirURl(DateTime po_fechaInicial, DateTime po_fechaFinal)
        {
            //Parámetros del reporte FechaInicio FechaFinal
            StringBuilder vo_url = new StringBuilder();

            vo_url.AppendFormat("frw_rep_registroTiemposUsuario.aspx?{0}={1}&{2}={3}",
                                "fechaInicio",
                                po_fechaInicial.ToString("dd/MM/yyyy"),
                                "fechaFinal",
                                po_fechaFinal.ToString("dd/MM/yyyy"));

            return vo_url.ToString();
        }

        #endregion

        #region Eventos
        /// <summary>
        /// Evento que se ejecuta cuando se imprime un reporte
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            try
            {
                this.imprimirReporte();
            }
            catch (Exception po_exception)
            {
            }
        }

        #endregion

        #region Atributos

        #endregion


    }
}