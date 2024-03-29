﻿<%@ Page Title="" Language="C#" MasterPageFile="~/msp.EstiloBasico/mspContenido.Master" AutoEventWireup="true" CodeBehind="frw_rep_registroTiemposUsuarioParam.aspx.cs" Inherits="CSLA.web.App_pages.mod.Reportes.RegistroTiemposUsuario.frw_rep_registroTiemposUsuarioParam" %>
<%@ Register Assembly="COSEVI.web.controls" Namespace="COSEVI.web.controls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="tituloPagina" runat="server">
Reporte de Registro de tiempos del Usuario
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cuerpoPagina" runat="server">
<asp:ScriptManager ID="scr_Man" runat="server">
</asp:ScriptManager>
<table>
    <tr>
        <td colspan="3">    
            <strong>Parámetros</strong>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbl_oficio" runat="server" Text="Número Oficio: "></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_oficio" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbl_fechaImpresion" runat="server" Text="Mes de Impresión: "></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_fechaImpresion" runat="server"></asp:TextBox>
            <asp:ImageButton ID="img_cldFechaImpresion" runat="server" ImageUrl="../../../App_Themes/Basico/botones/img_calendario.png" CausesValidation="false" />
             <act:CalendarExtender ID="dt_fechaImpresion" runat="server" TargetControlID="txt_fechaImpresion" PopupButtonID="img_cldFechaImpresion" Format="MM/yyyy" />
        <%--    <act:MaskedEditExtender runat="server" ID="msk_fechaImpresión" TargetControlID="txt_fechaImpresion"
                Mask="99/9999" CultureName="es-ES" MessageValidatorTip="true" MaskType="Date"
                UserDateFormat="None">
            </act:MaskedEditExtender>--%>
        </td>
        <td>
         <%--    <asp:RequiredFieldValidator ID="rfv_codigo" runat="server" ControlToValidate="txt_fechaImpresion"
            ToolTip="Ingrese la fecha de impresión" ErrorMessage="La fecha es requerida"><img alt="imagen" width="25px" height="20px" src="../../../App_Themes/Basico/botones/img_warning.gif" border="none"/></asp:RequiredFieldValidator>--%>
            
        </td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Button ID="btn_imprimir" runat="server" Text="Imprimir" 
                onclick="btn_imprimir_Click" OnClientClick="aspnetForm.target ='_blank';"
 />
        </td>
    </tr>
</table>
</asp:Content>
