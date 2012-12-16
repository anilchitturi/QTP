Function DNwithReferenceSO

	Dim button
	Set button = CreateObject("wScript.Shell")


	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"

	Dim DNform
	Set DNform= Description.Create()
	DNform("Class Name").value = "VbWindow"
	DNform("text").value = "Delivery Note"
	DNform("vbname").value = "frmDeliveryNote"

	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("acx_name").value = "SSTabS"


	button.Sendkeys "{F2}"
	button.Sendkeys "{Tab}"
	DataTable.AddSheet("soResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","soResults","soResults"	
	DNcount = DataTable.GetSheet("soResults").GetRowCount
	DataTable.SetCurrentRow(DNcount)

	Dim CreatedSONumber
	Set CreatedSONumber= Description.Create()
	CreatedSONumber("Class Name").value = "WinEditor"
	CreatedSONumber("window id").value = "2"
	CreatedSONumber("y").value = "153"	
	CreatedSONumber("x").value = "146"	
	CreatedSONumber("width").value = "225"	
	
End Function