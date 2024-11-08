Imports capaNegocio
Public Class login
    Inherits System.Web.UI.Page
    Dim objUser As New clsUsuario
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Try
            If loginEmail.Text <> "" And loginPassword.Text <> "" Then
                If objUser.verificar_usuario(loginEmail.Text, loginPassword.Text) Then
                    lbl_error.Text = "Usuario correcto"
                    errorContainer.Visible = False
                    Response.Redirect("cine.aspx")
                Else
                    lbl_error.Text = "Usuario incorrecto"
                    lbl_error.Visible = True
                    errorContainer.Visible = True ' Muestra el contenedor de error
                End If
            Else
                lbl_error.Text = "Por favor, ingrese el correo y la contraseña."
                lbl_error.Visible = True
                errorContainer.Visible = True ' Muestra el contenedor de error
            End If
        Catch ex As Exception
            lbl_error.Text = ex.Message
            lbl_error.Visible = True
            errorContainer.Visible = True ' Muestra el contenedor de error
        End Try
    End Sub




End Class