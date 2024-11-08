Imports System.Data.SqlClient
Imports capaNegocio
Public Class registro
    Inherits System.Web.UI.Page

    Dim objUbi As New clsUbigeo
    Dim objTipoSocio As New clsSocio
    Dim objUser As New clsUsuario
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarTiposSocio()
            CargarUbigeos()
        End If
    End Sub



    Private Sub CargarTiposSocio()
        ' Suponiendo que tienes un método en capaNegocio para obtener los tipos de socio
        Dim dt As DataTable = objTipoSocio.ObtenerSocios()
        idTipoSocio.DataSource = dt
        idTipoSocio.DataTextField = "nombre_tipo"  ' Campo para mostrar
        idTipoSocio.DataValueField = "id_tipo"    ' Campo de valor
        idTipoSocio.DataBind()
        idTipoSocio.Items.Insert(0, New ListItem("Seleccionar Tipo de Socio", ""))
    End Sub

    Private Sub CargarUbigeos()
        ' Suponiendo que tienes un método en capaNegocio para obtener los ubigeos
        Dim dt As DataTable = objUbi.ObtenerUbigeos()
        idUbigeo.DataSource = dt
        idUbigeo.DataTextField = "distrito"  ' Campo para mostrar (ajusta según la estructura)
        idUbigeo.DataValueField = "id_ubigeo"     ' Campo de valor
        idUbigeo.DataBind()
        idUbigeo.Items.Insert(0, New ListItem("Seleccionar Ubigeo", ""))
    End Sub

    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        Try
            ' Captura los valores del formulario
            Dim numeroDo As String = numeroDoc.Text.Trim()
            Dim nombr As String = nombre.Text.Trim()
            Dim apellido As String = apellidos.Text.Trim()
            Dim corre As String = correo.Text.Trim()
            Dim gener As String = genero.SelectedValue
            Dim contraseñ As String = contrasena.Text.Trim()
            Dim telefon As String = telefono.Text.Trim()
            Dim fechaNacimient As Date = Date.Parse(fechaNacimiento.Text.Trim())
            Dim idTipoSoci As Integer = Integer.Parse(idTipoSocio.SelectedValue)
            Dim idUbige As Integer = Integer.Parse(idUbigeo.SelectedValue)

            ' Llama al método para registrar el usuario
            If objUser.RegistrarUsuario(numeroDo, nombr, apellido, corre, gener, contraseñ, telefon, fechaNacimient, idTipoSoci, idUbige) Then
                lblAlert.Text = "Registro exitoso"
                lblAlert.CssClass = "text-success"
            Else
                lblAlert.Text = "Error al registrar el usuario"
                lblAlert.CssClass = "text-danger"
            End If
            lblAlert.Visible = True
            alertContainer.Attributes("style") = "display: block;"
        Catch ex As Exception
            lblAlert.Text = "Error: " & ex.Message
            lblAlert.CssClass = "text-danger"
            lblAlert.Visible = True
            alertContainer.Attributes("style") = "display: block;"
        End Try
    End Sub
End Class