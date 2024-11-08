Imports capaNegocio
Public Class cine
    Inherits System.Web.UI.Page
    Dim objCine As New clsCine
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cargarTabla()
        End If
    End Sub


    Private Sub cargarTabla()
        Try
            ' Asignamos la fuente de datos del GridView y lo enlazamos
            gdvCine.DataSource = objCine.ObtenerCines()
            gdvCine.DataBind()
        Catch ex As Exception
            ' Manejar cualquier excepción que ocurra al cargar la tabla
            lblError.Text = "Error al cargar la lista de cines: " & ex.Message
            lblError.Visible = True
        End Try
    End Sub


End Class