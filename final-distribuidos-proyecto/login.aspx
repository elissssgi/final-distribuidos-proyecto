<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="login.aspx.vb" Inherits="final_distribuidos_proyecto.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
            <!-- Título -->
            <h3 class="text-center mb-4">Bienvenido</h3>
            <p class="text-center text-muted mb-4">Inicia sesión con tu cuenta</p>

            <!-- Formulario de Login -->
            <form >
                <div class="mb-3">
                    <label for="loginEmail" class="form-label">Correo electrónico</label>
                    <input type="email" class="form-control" id="loginEmail" placeholder="correo@ejemplo.com" required>
                </div>
                <div class="mb-3">
                    <label for="loginPassword" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="loginPassword" placeholder="Contraseña" required>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Recuérdame</label>
                    </div>
                    <a href="#" class="text-decoration-none small">¿Olvidaste tu contraseña?</a>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
