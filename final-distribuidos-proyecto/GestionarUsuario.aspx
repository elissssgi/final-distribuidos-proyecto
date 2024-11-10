<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="GestionarUsuario.aspx.vb" Inherits="final_distribuidos_proyecto.GestionarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Gestión de Usuarios
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Lista de Usuarios</h2>
            <button type="button" class="btn btn-primary rounded-pill px-4 py-2" onclick="abrirUsuarioModal()">
                <i class="bi bi-plus-circle me-2"></i>Agregar Usuario
            </button>
        </div>

        <!-- Tabla para listar usuarios -->
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead class="table-primary text-center">
                    <tr>
                        <th>ID</th>
                        <th>Documento</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Género</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Tipo Socio</th>
                        <th>Ubigeo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="tablaUsuarios"></tbody>
            </table>
        </div>
    </div>

    <!-- Modal para agregar y editar usuario -->
    <div class="modal fade" id="usuarioModal" tabindex="-1" aria-labelledby="usuarioModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="usuarioModalLabel">Agregar/Editar Usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="usuarioForm">
                        <input type="hidden" id="usuarioId">
                        
                        <div class="mb-3">
                            <label for="numeroDoc" class="form-label">Número Documento</label>
                            <input type="text" class="form-control" id="numeroDoc" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" required>
                        </div>

                        <div class="mb-3">
                            <label for="apellidos" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" required>
                        </div>

                        <div class="mb-3">
                            <label for="genero" class="form-label">Género</label>
                            <select id="genero" class="form-select" required>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo</label>
                            <input type="email" class="form-control" id="correo" required>
                        </div>

                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" required>
                        </div>

                        <div class="mb-3">
                            <label for="idTipoSocio" class="form-label">Tipo Socio</label>
                            <input type="number" class="form-control" id="idTipoSocio" required>
                        </div>

                        <div class="mb-3">
                            <label for="idUbigeo" class="form-label">Ubigeo</label>
                            <input type="number" class="form-control" id="idUbigeo" required>
                        </div>

                        <button type="button" class="btn btn-primary w-100" onclick="guardarUsuario()">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Script para manejar el CRUD -->
    <script>
        function cargarUsuarios() {
            fetch('gestionarUsuario.aspx?accion=listar')
                .then(response => response.json())
                .then(data => {
                    const tbody = document.getElementById('tablaUsuarios');
                    tbody.innerHTML = '';
                    data.forEach(usuario => {
                        tbody.innerHTML += `
                            <tr>
                                <td>${usuario.id_usuario}</td>
                                <td>${usuario.numero_doc}</td>
                                <td>${usuario.nombre}</td>
                                <td>${usuario.apellidos}</td>
                                <td>${usuario.genero}</td>
                                <td>${usuario.correo}</td>
                                <td>${usuario.telefono}</td>
                                <td>${usuario.id_tiposocio}</td>
                                <td>${usuario.id_ubigeo}</td>
                                <td class="text-center">
                                    <button class="btn btn-warning btn-sm" onclick="editarUsuario(${usuario.id_usuario})">Editar</button>
                                    <button class="btn btn-danger btn-sm" onclick="eliminarUsuario(${usuario.id_usuario})">Eliminar</button>
                                </td>
                            </tr>`;
                    });
                });
        }

        function guardarUsuario() {
            const id = document.getElementById('usuarioId').value;
            const numeroDoc = document.getElementById('numeroDoc').value;
            const nombre = document.getElementById('nombre').value;
            const apellidos = document.getElementById('apellidos').value;
            const genero = document.getElementById('genero').value;
            const correo = document.getElementById('correo').value;
            const telefono = document.getElementById('telefono').value;
            const idTipoSocio = document.getElementById('idTipoSocio').value;
            const idUbigeo = document.getElementById('idUbigeo').value;

            fetch(`gestionarUsuario.aspx?accion=guardar&id=${id}&numeroDoc=${numeroDoc}&nombre=${nombre}&apellidos=${apellidos}&genero=${genero}&correo=${correo}&telefono=${telefono}&idTipoSocio=${idTipoSocio}&idUbigeo=${idUbigeo}`)
                .then(() => cargarUsuarios());
        }

        cargarUsuarios();
    </script>
</asp:Content>
