Function PickListwithReferenceSO

	Dim button
	Set button = CreateObject("wScript.Shell")

'----------------- Main Form Object----------------	
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"
'-------------- GRN Screen Object -------------------
	Dim PickListform
	Set PickListform= Description.Create()
	PickListform("Class Name").value = "VbWindow"
	PickListform("text").value = "Pick List"
	PickListform("vbname").value = "frmPickList"
'--------------ActiveX component inside GRN VbWindow-------------------
	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("acx_name").value = "DataCombo"
'-------------- Button for Vendor List -------------------
	Dim CustomerName
	Set CustomerName= Description.Create()
	CustomerName("Class Name").value = "WinEditor"
	CustomerName("window id").value = "2"
	CustomerName("width").value = "307"
	CustomerName("x").value = "117"
'-----------------------------------------------------------------------
	DataTable.AddSheet("CustomerName")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","vendor","CustomerName"
	
	vbWindow(PickListform).WinEditor(CustomerName).Type DataTable.Value("Customer","CustomerName") 
	button.Sendkeys "%{Down}"
	button.Sendkeys "{Enter}"
	button.Sendkeys "{Tab}"
	
	DataTable.AddSheet("CustomerName")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","DocNumber","soResults"
	soRowCount = DataTable.GetSheet("soResults").GetRowCount
	DataTable.SetCurrentRow(soRowCount)
	
	Dim createdSONumber
	Set createdSONumber = Description.Create()
	createdSONumber("Class Name").Value = "WinEditor"
	createdSONumber("window id").Value = "2"
	createdSONumber("width").Value = "121"
	createdSONumber("y").Value = "103"
	
	Dim createdScheduleNumber
	Set createdScheduleNumber = Description.Create()
	createdScheduleNumber("Class Name").Value = "WinEditor"
	createdScheduleNumber("window id").Value = "2"
	createdScheduleNumber("width").Value = "121"
	createdScheduleNumber("y").Value = "133"
	
	vbWindow(PickListform).WinEditor(createdSONumber).Type DataTable.Value("DocNumber","soResults")
	button.Sendkeys "{Tab}"
	button.Sendkeys "%{Down}"
	button.Sendkeys "{Down}"
	button.Sendkeys "{Enter}"
	wait 1
	button.Sendkeys "%{P}"
	VbWindow(PickListform).Activate
	wait 2
	button.Sendkeys "%{F4}"
	button.Sendkeys "%{E}"
End Function