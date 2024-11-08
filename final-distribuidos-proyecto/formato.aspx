<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="formato.aspx.vb" Inherits="final_distribuidos_proyecto.formato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Formato de Película
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="container mt-4">
        <h2 class="mb-4">Lista de Formatos</h2>
        <!-- Label para mensajes de error -->
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success mt-3" Visible="False"></asp:Label>
        <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-3" Visible="False"></asp:Label>

        <div class="row">
            <!-- Columna de la tabla -->
            <div class="col-md-8">
                <!-- GridView dentro de un UpdatePanel -->
                <asp:UpdatePanel ID="UpdatePanelFormato" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gdvFormato" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Width="100%" OnSelectedIndexChanged="gdvFormato_SelectedIndexChanged" DataKeyNames="id_formato">
                                <Columns>
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" Text="Seleccionar" CausesValidation="false"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="nombre_formato" HeaderText="Nombre" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />

                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%# If(Convert.ToBoolean(Eval("vigencia")), "<i class='bi bi-check-circle-fill text-success'></i>", "<i class='bi bi-x-circle-fill text-danger'></i>") %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="25%" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gdvFormato" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
            <!-- Columna del formulario -->
            <div class="col-md-4">
                <h3>Detalles del Formato</h3>
                <asp:Panel ID="pnlFormato" runat="server">
                    <asp:HiddenField ID="hfIdFormato" runat="server" />
                    <div class="mb-3">
                        <asp:Label ID="lblNombre" runat="server" AssociatedControlID="txtNombre">Nombre del Formato</asp:Label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblVigencia" runat="server" AssociatedControlID="chkVigencia">Vigencia</asp:Label>
                        <div>
                            <asp:CheckBox ID="chkVigencia" runat="server" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAgregar_Click" />
                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" OnClick="btnModificar_Click" Enabled="False" />
                        <asp:Button ID="btnDarBajaAlta" runat="server" Text="Dar Baja/Alta" CssClass="btn btn-danger" OnClick="btnDarBajaAlta_Click" Enabled="False" />
                        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="btnLimpiar_Click" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
