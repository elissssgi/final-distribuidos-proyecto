<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="comprobante.aspx.vb" Inherits="final_distribuidos_proyecto.comprobante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Comprobante
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-2">
    <h2 class="text-center text-primary mb-4">Comprobante</h2>

    <div class="row">
        <!-- Panel izquierdo con formulario de comprobante -->
        <div class="col-md-3">
            <div class="card p-3 mb-4">
                <h5>Datos del Comprobante</h5>
                <div class="mb-3">
                    <label for="formaPago" class="form-label">Forma de Pago</label>
                    <select id="formaPago" class="form-select">
                        <option value="Efectivo">Efectivo</option>
                        <option value="Tarjeta">Tarjeta</option>
                        <option value="Transferencia">Transferencia</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="venta" class="form-label">Venta</label>
                    <input type="text" class="form-control" id="venta">
                </div>
                <div class="mb-3">
                    <label for="ticket" class="form-label">Ticket</label>
                    <input type="text" class="form-control" id="ticket">
                </div>
                <div class="mb-3">
                    <label class="form-label">Impuesto</label>
                    <p>-------</p>
                </div>
                <div class="mb-3">
                    <label class="form-label">Sub-total</label>
                    <p>-------</p>
                </div>
                <div class="mb-3">
                    <label class="form-label">Total</label>
                    <p>-------</p>
                </div>
                <div class="d-flex flex-column">
                    <button class="btn btn-primary mb-2">Nuevo</button>
                    <button class="btn btn-secondary mb-2">Modificar</button>
                    <button class="btn btn-light border">Limpiar</button>
                </div>
            </div>
        </div>

        <!-- Sección principal para el detalle de compras -->
        <div class="col-md-9">
            <div class="card p-3 mb-4">
                <h5>Detalle del Comprobante</h5>
                <!-- Tabla de detalle de las compras -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary text-center">
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Precio Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Ejemplo de fila de compra -->
                            <tr>
                                <td>Producto A</td>
                                <td>2</td>
                                <td>10.00</td>
                                <td>20.00</td>
                                <td class="text-center">
                                    <a href="#" class="text-warning me-2" title="Modificar">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="#" class="text-danger" title="Eliminar">
                                        <i class="bi bi-trash-fill"></i>
                                    </a>
                                </td>
                            </tr>
                            <!-- Agregar más filas según los productos en el comprobante -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Sección de opciones adicionales -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card p-3 mb-4">
                        <h5>Productos Disponibles</h5>
                        <p>Lista de productos para agregar al comprobante.</p>
                        <button class="btn btn-primary w-100">Agregar Producto</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3 mb-4">
                        <h5>Resumen del Comprobante</h5>
                        <p>Detalles adicionales sobre el comprobante actual.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
