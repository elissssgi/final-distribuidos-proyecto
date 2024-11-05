<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="gestionarCine.aspx.vb" Inherits="final_distribuidos_proyecto.gestionarCine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Gestionar Cine
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Lista de Cines</h2>
            <!-- Botón para abrir el modal con onclick -->
            <button type="button" class="btn btn-primary" onclick="abrirModal()">
                <i class="bi bi-plus-circle me-2"></i>Agregar Cine
            </button>
        </div>

        <!-- Tabla de cines -->
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Nombre</th>
                        <th>Cantidad de Salas</th>
                        <th>Dirección</th>
                        <th>Imagen</th>
                        <th>Departamento</th>
                        <th>Provincia</th>
                        <th>Distrito</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Ejemplo de fila de cine -->
                    <tr>
                        <td>Cinepolis</td>
                        <td>10</td>
                        <td>Av. Principal 123</td>
                        <td><img src="ruta_de_imagen.jpg" alt="Imagen Cine" width="50"></td>
                        <td>Lima</td>
                        <td>Lima</td>
                        <td>Miraflores</td>
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
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal para agregar cine -->
    <div class="modal fade" id="addCineModal" tabindex="-1" aria-labelledby="addCineModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCineModalLabel">Agregar Nuevo Cine</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <form id="cineForm" novalidate>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cineNombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="cineNombre" name="cineNombre" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cantidadSalas" class="form-label">Cantidad de Salas</label>
                            <input type="number" class="form-control" id="cantidadSalas" name="cantidadSalas" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="imagen" class="form-label">Imagen</label>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept="image/*">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="departamento" class="form-label">Departamento</label>
                            <input type="text" class="form-control" id="departamento" name="departamento" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="provincia" class="form-label">Provincia</label>
                            <input type="text" class="form-control" id="provincia" name="provincia" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="distrito" class="form-label">Distrito</label>
                            <input type="text" class="form-control" id="distrito" name="distrito" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>


    <!-- Script para manejar el modal y el formulario -->
    <script>
        // Función para abrir el modal
        function abrirModal() {
            const addCineModal = new bootstrap.Modal(document.getElementById('addCineModal'));
            addCineModal.show();
        }

        // Prevenir el envío del formulario y hacer una validación manual
        document.getElementById('cineForm').addEventListener('submit', (event) => {
            event.preventDefault();
            alert('Formulario enviado');  // Aquí puedes manejar el envío del formulario
        });
    </script>
</asp:Content>
