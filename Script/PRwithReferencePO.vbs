Function PRwithReferencePO

	Dim button
	Set button = CreateObject("wScript.Shell")

'----------------- Main Form Object----------------	
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"
'-------------- GRN Screen Object -------------------
	Dim PRform
	Set PRform= Description.Create()
	PRform("Class Name").value = "VbWindow"
	PRform("text").value = "Purchase Returns"
	PRform("vbname").value = "FrmPurchaseReturn"
'--------------ActiveX component inside GRN VbWindow-------------------
	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("acx_name").value = "SSTabS"
	acx2("x").value = "5"
	acx2("y").value = "85"
'-------------- Button for Vendor List -------------------
	Dim vendor_button
	Set vendor_button= Description.Create()
	vendor_button("Class Name").value = "VbButton"
	vendor_button("text").value = "V"
	vendor_button("vbName").value = "cmdVendHelp"
'-----------------------------------------------------------------
	'VbWindow(PRform).Activate
	button.SendKeys "{F2}"
	wait 1
	Dim AutomaticBtn
	Set AutomaticBtn = Description.Create()
	AutomaticBtn("Class Name").Value = "VbRadioButton"
	AutomaticBtn("window id").Value = "15"
	AutomaticBtn("y").Value = "153"
'--------------Clicking the Vendor List button-------------------
	VbWindow(PRform).VbRadioButton(AutomaticBtn).Click
	VbWindow(PRform).VbButton(vendor_button).Click
	
'-------------- Vendor Search Window -------------------
	Dim ven_srch_frm
	Set ven_srch_frm= Description.Create()
	ven_srch_frm("Class Name").value = "vbWindow"
	ven_srch_frm("vbName").value = "frmVenSearch"
'-------------- Text Box inside Vendor Search-------------------
	Dim ven_srch_txt
	Set ven_srch_txt= Description.Create()
	ven_srch_txt("Class Name").value = "vbEdit"
	ven_srch_txt("vbName").value = "txtVendorName"
	ven_srch_txt("window id").value = "2"
'--------------Setting the values inside vendor search -------------------
	DataTable.AddSheet("Vendor")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","Vendor","Vendor"
	VbWindow(PRform).vbWindow(ven_srch_frm).vbEdit(ven_srch_txt).Activate
	VbWindow(PRform).vbWindow(ven_srch_frm).vbEdit(ven_srch_txt).Set DataTable.Value("Vendor","Vendor")
	button.SendKeys "{UP}"
	button.SendKeys "{ENTER}"
	'button.SendKeys "{TAB 2}"	
	'wait 1
	'button.SendKeys "{TAB 3}"	
	'wait 1
	button.SendKeys "{TAB}"	
	
'---------------- For getting Reference PO number from Results sheet---------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count1
	count1 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count1-2)
'-------------- Object for Purchase Order Number control -----------------
	Dim createdPONumber
	Set createdPONumber = Description.Create()
	createdPONumber("Class Name").Value = "WinEditor"
	createdPONumber("window id").Value = "2"
	createdPONumber("y").Value = "263"
	
	Dim createdGRNNumber
	Set createdGRNNumber = Description.Create()
	createdGRNNumber("Class Name").Value = "WinEditor"
	createdGRNNumber("window id").Value = "2"
	createdGRNNumber("y").Value = "299"
'---------- For Dialog Box showing created GRN number -------------
	Dim DocNoDialog
	Set DocNoDialog = Description.Create()
	DocNoDialog("Class Name").Value = "Dialog"
	DocNoDialog("text").Value = "Retail Excel"
		
	VbWindow(PRform).Activate
	
	VbWindow(PRform).WinEditor(createdPONumber).Type DataTable.Value("DocNumber","poResults")
	button.SendKeys "{Tab}"
	DataTable.SetCurrentRow(count1-1)
	VbWindow(PRform).WinEditor(createdGRNNumber).Type DataTable.Value("DocNumber","poResults")
	button.SendKeys "{Enter}"
	button.SendKeys "{Tab}"
	wait 5
	
'----------------------------------------
	
			Set objExcel = CreateObject("Excel.Application")
			objExcel.WorkBooks.Open "C:\QTP\TestData\TestData.xls"
			Set objSheet = objExcel.ActiveWorkbook.Worksheets(1)
			rowcount=objSheet.usedrange.rows.count

			For i = 1 To rowcount

			If objSheet.cells(i,1).value="" Then
			objSheet.Rows(i).delete
			End If

			Next

			objExcel.ActiveWorkbook.save
			objExcel.ActiveWorkbook.Close
			objExcel.Application.Quit
			Set objExcel = Nothing
			Set objSheet = Nothing

	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","poTestData","poTestData"
	Dim countItem
	countItem = DataTable.GetSheet("poTestData").GetRowCount
	For j = 1 to countItem
	
		button.SendKeys "{UP}"
	Next
	button.SendKeys "{Tab}"
	button.SendKeys "{Tab}"
	wait 2

	Dim ReturnQty
	Set ReturnQty = Description.Create()
	ReturnQty("Class Name").Value = "WinEditor"
	ReturnQty("window id").Value = "12759"
	ReturnQty("width").Value = "138"
	
	
	
	For i = 1 to countItem
		DataTable.SetCurrentRow(i)
		button.SendKeys "{Delete}"
		qty = DataTable.Value("ItemQty","poTestData")
		VbWindow(mainform).VbWindow(PRform).VbEditor(ReturnQty).Activate
		VbWindow(mainform).VbWindow(PRform).VbEditor(ReturnQty).Type qty
		wait 1
		button.SendKeys "{TAB 2}"
		wait 1
		button.SendKeys "%{DOWN}"
		wait 1
		button.SendKeys "{DOWN}"
	wait 1
		button.SendKeys "{Enter}"
	wait 1

			button.SendKeys "{Left 2}"
	wait 1
			button.SendKeys "{DOWN}"
	
	Next
			
	VbWindow(PRform).Activate
	wait 2
	button.SendKeys "{F10}"
	
	VbWindow(mainform).VbWindow(PRform).Dialog(DocNoDialog).Activate
	button.SendKeys "{Enter}"
'-----------------Objects for different values-------------
	VbWindow(PRform).Activate
	Dim PRDocNumber
	Set PRDocNumber= Description.Create()
	PRDocNumber("Class Name").value = "vbEdit"
	PRDocNumber("vbname").value = "txtPrNo"
	PRDocNumber("window id").value = "35"	
		
	Dim PRNetValue
	Set PRNetValue= Description.Create()
	PRNetValue("Class Name").value = "vbEdit"
	PRNetValue("vbname").value = "TxtRejectionValue"					
	PRNetValue("window id").value = "19"						
'------------------------------------------------------------
	PRDocNumber = VbWindow(mainform).VbWindow(PRform).VbEdit(PRDocNumber).GetROProperty("text")
	PRNetValue = VbWindow(mainform).VbWindow(PRform).VbEdit(PRNetValue).GetROProperty("text")
	VbWindow(PRform).Activate
'---------------------Adding and Importing Sheet for values---------------------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim countPR
	countPR = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(countPR + 1)
	
	
	DataTable.value("Document","poResults")="Purchase Return"	
	DataTable.value("DocNumber","poResults")=PRDocNumber
	DataTable.value("NetValue","poResults")=PRNetValue

	
'--------- Exporting the Results from QTP dataTable to External Results Sheet -------------
	DataTable.ExportSheet "C:\QTP\Results\Results.xls","poResults"
	VbWindow(PRform).ActiveX(acx2).click
End Function