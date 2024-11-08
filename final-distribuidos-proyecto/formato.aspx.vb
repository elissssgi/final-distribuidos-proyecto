Imports capaNegocio ' Asegúrate de que el espacio de nombres es correcto

Public Class formato
    Inherits System.Web.UI.Page

    Private formatoNegocio As New clsFormatoPedro

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarFormatos()
        End If
    End Sub

    Private Sub CargarFormatos()
        Try
            Dim dt As DataTable = formatoNegocio.obtenerTodos()
            gdvFormato.DataSource = dt
            gdvFormato.DataBind()
        Catch ex As Exception
            lblError.Text = ex.Message
            lblError.Visible = True
        End Try
    End Sub

    Protected Sub gdvFormato_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            lblMensaje.Text = "Evento SelectedIndexChanged ejecutado."
            lblMensaje.Visible = True

            Dim idFormato As Integer = Convert.ToInt32(gdvFormato.SelectedDataKey.Value)
            hfIdFormato.Value = idFormato.ToString()

            Dim dt As DataTable = formatoNegocio.obtenerPorId(idFormato)
            If dt.Rows.Count > 0 Then
                txtNombre.Text = dt.Rows(0)("nombre_formato").ToString()
                chkVigencia.Checked = Convert.ToBoolean(dt.Rows(0)("vigencia"))
            Else
                lblError.Text = "No se encontraron datos para el formato seleccionado."
                lblError.Visible = True
            End If

            btnAgregar.Enabled = False
            btnModificar.Enabled = True
            btnDarBajaAlta.Enabled = True
        Catch ex As Exception
            lblError.Text = "Error al seleccionar el formato: " & ex.Message
            lblError.Visible = True
        End Try
    End Sub


    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs)
        Try
            Dim nombreFormato As String = txtNombre.Text.Trim()
            Dim vigencia As Boolean = chkVigencia.Checked

            If formatoNegocio.registrar(nombreFormato, vigencia) Then
                lblMensaje.Text = "Formato agregado correctamente."
                lblMensaje.Visible = True
                lblError.Visible = False
                LimpiarFormulario()
                CargarFormatos()
            End If
        Catch ex As Exception
            lblError.Text = ex.Message
            lblError.Visible = True
            lblMensaje.Visible = False
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim idFormato As Integer = Convert.ToInt32(hfIdFormato.Value)
            Dim nombreFormato As String = txtNombre.Text.Trim()
            Dim vigencia As Boolean = chkVigencia.Checked

            If formatoNegocio.modificar(idFormato, nombreFormato, vigencia) Then
                lblMensaje.Text = "Formato modificado correctamente."
                lblMensaje.Visible = True
                lblError.Visible = False
                LimpiarFormulario()
                CargarFormatos()
            End If
        Catch ex As Exception
            lblError.Text = ex.Message
            lblError.Visible = True
            lblMensaje.Visible = False
        End Try
    End Sub

    Protected Sub btnDarBajaAlta_Click(sender As Object, e As EventArgs)
        Try
            Dim idFormato As Integer = Convert.ToInt32(hfIdFormato.Value)

            ' Obtener el estado actual de vigencia
            Dim dt As DataTable = formatoNegocio.obtenerPorId(idFormato)
            If dt.Rows.Count > 0 Then
                Dim vigenciaActual As Boolean = Convert.ToBoolean(dt.Rows(0)("vigencia"))
                Dim resultado As Boolean

                If vigenciaActual Then
                    ' Dar de baja
                    resultado = formatoNegocio.darBaja(idFormato)
                Else
                    ' Dar de alta
                    resultado = formatoNegocio.darAlta(idFormato)
                End If

                If resultado Then
                    lblMensaje.Text = "Vigencia del formato actualizada correctamente."
                    lblMensaje.Visible = True
                    lblError.Visible = False
                    LimpiarFormulario()
                    CargarFormatos()
                End If
            End If
        Catch ex As Exception
            lblError.Text = ex.Message
            lblError.Visible = True
            lblMensaje.Visible = False
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        LimpiarFormulario()
    End Sub

    Private Sub LimpiarFormulario()
        hfIdFormato.Value = String.Empty
        txtNombre.Text = String.Empty
        chkVigencia.Checked = False
        btnAgregar.Enabled = True
        btnModificar.Enabled = False
        btnDarBajaAlta.Enabled = False
        gdvFormato.SelectedIndex = -1
    End Sub
End Class
