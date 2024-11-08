<%@ Page Title="Cine" Language="VB" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.master" CodeBehind="cine.aspx.vb" Inherits="final_distribuidos_proyecto.cine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Cine
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Lista de Cines</h2>

        <!-- GridView para listar los datos -->
        <asp:GridView runat="server" ID="gdvCine" AutoGenerateColumns="True" CssClass="table table-bordered table-striped">
        </asp:GridView>



        <!-- Label para mensajes de error -->
        <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
    </div>
</asp:Content>
