Function OpeningDN

'--------------Creating the object of using the Shortcut Keys-------------------
Dim button
Set button = CreateObject("wScript.Shell")
'--------------Creating the object of Main VbWindow of the Retail Exel Base-------------------
Dim login_form1
Set login_form1 = Description.Create()
login_form1("Class Name").value = "VbWindow"
login_form1("vbname").value = "frmMain"

'--------------Creating the object of Username Textbox inside the Base Exe-------------------
Dim actx
Set actx = Description.Create()
actx("Class Name").Value = "ActiveX"
actx("acx_name").Value = "SSSplitter"

'--------------Creating the object of ActiveX Component (Module list in Base)-------------------
Dim actx1
Set actx1 = Description.Create()
actx1("Class Name").Value = "ActiveX"
actx1("acx_name").Value = "SSListBar"

'--------------Clicking the ActiveX Component at different dimensions for opening the SO -------------------
DataTable.AddSheet("cordinates")
DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","cordinates","cordinates"
DataTable.SetCurrentRow(1)
x1 = DataTable.Value("OpenDN","cordinates")
DataTable.SetCurrentRow(2)
y1 = DataTable.Value("OpenDN","cordinates")

VbWindow(login_form1).ActiveX(actx).ActiveX(actx1).Click x1,y1

End Function