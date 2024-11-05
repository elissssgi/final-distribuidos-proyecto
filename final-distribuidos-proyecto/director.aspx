<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="director.aspx.vb" Inherits="final_distribuidos_proyecto.director" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Director de Pelicula
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-2">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Lista de Directores</h2>
            <!-- Botón para abrir el modal de agregar director -->
            <button type="button" class="btn btn-primary" onclick="abrirDirectorModal()">
                <i class="bi bi-plus-circle me-2"></i>Agregar Director
            </button>
        </div>

        <!-- Tabla de directores -->
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>País</th>
                        <th>Premios</th>
                        <th>Vigencia</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Ejemplo de fila de director -->
                    <tr>
                        <td>Quentin</td>
                        <td>Tarantino</td>
                        <td>Estados Unidos</td>
                        <td>Oscar, Globo de Oro</td>
                        <td>Activo</td>
                        <td class="text-center">
                            <a href="#" class="text-primary me-2" title="Ver">
                                <i class="bi bi-eye-fill"></i>
                            </a>
                            <a href="#" class="text-warning me-2" title="Modificar">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="#" class="text-danger" title="Eliminar">
                                <i class="bi bi-trash-fill"></i>
                            </a>
                        </td>
                    </tr>
                    <!-- Agregar más filas aquí según los datos de los directores -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal para agregar director -->
    <div class="modal fade" id="addDirectorModal" tabindex="-1" aria-labelledby="addDirectorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDirectorModalLabel">Agregar Nuevo Director</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="directorForm" novalidate>
                        <!-- Fila para Nombre y Apellidos -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="directorNombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="directorNombre" name="directorNombre" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="directorApellidos" class="form-label">Apellidos</label>
                                <input type="text" class="form-control" id="directorApellidos" name="directorApellidos" required>
                            </div>
                        </div>

                        <!-- Fila para País -->
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label for="directorPais" class="form-label">País</label>
                                <input type="text" class="form-control" id="directorPais" name="directorPais" required>
                            </div>
                        </div>

                        <!-- Fila para Bibliografía -->
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label for="directorBibliografia" class="form-label">Bibliografía</label>
                                <textarea class="form-control" id="directorBibliografia" name="directorBibliografia" rows="3" required></textarea>
                            </div>
                        </div>

                        <!-- Fila para Premios y Vigencia -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="directorPremios" class="form-label">Premios</label>
                                <input type="text" class="form-control" id="directorPremios" name="directorPremios" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="directorVigencia" class="form-label">Vigencia</label>
                                <select id="directorVigencia" class="form-select" name="directorVigencia" required>
                                    <option value="Activo">Activo</option>
                                    <option value="Retirado">Retirado</option>
                                </select>
                            </div>
                        </div>

                        <!-- Botón de Enviar -->
                        <button type="submit" class="btn btn-primary w-100">Guardar Director</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Script para abrir el modal y manejar el formulario -->
    <script>
        // Función para abrir el modal
        function abrirDirectorModal() {
            const addDirectorModal = new bootstrap.Modal(document.getElementById('addDirectorModal'));
            addDirectorModal.show();
        }

        // Prevenir el envío del formulario y hacer una validación manual
        document.getElementById('directorForm').addEventListener('submit', (event) => {
            event.preventDefault();
            alert('Formulario de director enviado');  // Aquí puedes manejar el envío del formulario
        });
    </script>
</asp:Content>
