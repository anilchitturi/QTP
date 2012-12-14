Function OpenLoginForm()

' ===============For  opening the Application Path ================= 
Systemutil.Run"C:\Program Files\Retail Excel\Base\Rxlbase"
'===============For creating the objects of Login Form =============
Dim LoginForm
Set LoginForm = Description.Create()
LoginForm("Class Name").Value = "VbWindow"
LoginForm("text").Value = "Retail Excel"
LoginForm("vbname").Value = "frmLogin"

Dim UserName
Set UserName = Description.Create()
UserName("Class Name").Value = "vbEdit"
UserName("vbname").Value = "txtUser"

Dim Password
Set Password = Description.Create()
Password("Class Name").Value = "vbEdit"
Password("vbname").Value = "txtPassword"

Dim LoginOk
Set LoginOk = Description.Create()
LoginOk("Class Name").Value = "vbButton"
LoginOk("vbname").Value = "cmdOk"
LoginOk("text").Value = "&Ok"

Dim LoginCancel
Set LoginCancel = Description.Create()
LoginCancel("Class Name").Value = "vbButton"
LoginCancel("vbname").Value = "cmdCancel"
LoginCancel("text").Value = "&Cancel"
'====================For setting the values in the Login form==============================
 VbWindow(LoginForm).vbEdit(UserName).Set "administrator"
 VbWindow(LoginForm).vbEdit(Password).Set "rdt"
 VbWindow(LoginForm).vbButton(LoginOk).Click
'===================================================================================

End Function
