Function PIwithReferencePO

	Dim button
	Set button = CreateObject("wScript.Shell")

'----------------- Main Form Object----------------	
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"
'-------------- GRN Screen Object -------------------
	Dim PIform
	Set PIform= Description.Create()
	PIform("Class Name").value = "VbWindow"
	PIform("text").value = "Purchase Invoice"
	PIform("vbname").value = "frmPurchaseInvoice"
'--------------ActiveX component inside GRN VbWindow-------------------
	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("acx_name").value = "SSTabS"
'-------------- Button for Vendor List -------------------
	Dim vendor_button
	Set vendor_button= Description.Create()
	vendor_button("Class Name").value = "VbButton"
	vendor_button("text").value = "V"
	vendor_button("vbName").value = "cmdVendHelp"
'----------------------------------------------------------------
	VbWindow(PIform).Activate
	button.SendKeys "{F2}"
	button.SendKeys "{Tab 5}"
'--------------Clicking the Vendor List button-------------------
	VbWindow(PIform).VbButton(vendor_button).Click
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
'--------------Setting the values inside vendor search -------------------
	DataTable.AddSheet("Vendor")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","Vendor","Vendor"
	vbWindow(ven_srch_frm).vbEdit(ven_srch_txt).Set DataTable.Value("Vendor","Vendor")
	button.SendKeys "{UP}"
	button.SendKeys "{ENTER}"
	button.SendKeys "{TAB 2}"	
	wait 1
'------------------------------
	Dim VenInvNo
	Set VenInvNo= Description.Create()
	VenInvNo("Class Name").value = "vbEdit"
	VenInvNo("vbname").value = "txtVendInvNo"
	VenInvNo("window id").value = "63"
	
	Dim VenInvDate
	Set VenInvDate= Description.Create()
	VenInvDate("Class Name").value = "vbEdit"
	VenInvDate("vbname").value = "txtVenInvDate"
	VenInvDate("window id").value = "62"	
'------------------------------------	
	VbWindow(PIform).VbEdit(VenInvNo).Type Time()
	button.SendKeys "{TAB}"	
	VbWindow(PIform).VbEdit(VenInvDate).Type Date()
	button.SendKeys "{TAB 2}"	
	
'---------------- For getting Reference PO number from Results sheet---------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count1
	count1 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count1-1)
'-------------- Object for Purchase Order Number control -----------------
	Dim createdPONumber
	Set createdPONumber = Description.Create()
	createdPONumber("Class Name").Value = "WinEditor"
	createdPONumber("window id").Value = "2"
	createdPONumber("y").Value = "181"
'---------- For Dialog Box showing created GRN number -------------
	Dim DocNoDialog
	Set DocNoDialog = Description.Create()
	DocNoDialog("Class Name").Value = "Dialog"
	DocNoDialog("text").Value = "Retail Excel"
		
	VbWindow(PIform).Activate
	VbWindow(PIform).WinEditor(createdPONumber).Type DataTable.Value("DocNumber","poResults")
	button.SendKeys "{Tab}"
	button.SendKeys " "
	button.SendKeys "%{P}"
	wait 2
	button.SendKeys "{F10}"
	VbWindow(mainform).VbWindow(PIform).Dialog(DocNoDialog).Activate
	button.SendKeys "{Enter}"
'-----------------Objects for different values-------------

	Dim PIDocNumber
	Set PIDocNumber= Description.Create()
	PIDocNumber("Class Name").value = "vbEdit"
	PIDocNumber("vbname").value = "txtInvoiceNo"
	PIDocNumber("window id").value = "66"	
	
	Dim PIItemDisc
	Set PIItemDisc= Description.Create()
	PIItemDisc("Class Name").value = "vbEdit"
	PIItemDisc("vbname").value = "txtItmLevelDiscAmount"
	PIItemDisc("window id").value = "27"		
	
	Dim PIHeaderDisc
	Set PIHeaderDisc= Description.Create()
	PIHeaderDisc("Class Name").value = "vbEdit"
	PIHeaderDisc("vbname").value = "txtInvLevelDiscAmount"
	PIHeaderDisc("window id").value = "25"
	
	Dim PIItemTax
	Set PIItemTax= Description.Create()
	PIItemTax("Class Name").value = "vbEdit"
	PIItemTax("vbname").value = "txtItemLevelTaxAmnt"
	PIItemTax("window id").value = "18"
	
	Dim PIHeaderTax
	Set PIHeaderTax= Description.Create()
	PIHeaderTax("Class Name").value = "vbEdit"
	PIHeaderTax("vbname").value = "txtTaxAmount"	
	PIHeaderTax("window id").value = "19"	
	
	Dim PIAddChargeByVen
	Set PIAddChargeByVen= Description.Create()
	PIAddChargeByVen("Class Name").value = "vbEdit"
	PIAddChargeByVen("vbname").value = "txtAddChargesByVendor"		
	PIAddChargeByVen("window id").value = "23"		

	Dim PIAddChargeNotByVen
	Set PIAddChargeNotByVen= Description.Create()
	PIAddChargeNotByVen("Class Name").value = "vbEdit"
	PIAddChargeNotByVen("vbname").value = "txtOtherAddCharges"			
	PIAddChargeNotByVen("window id").value = "22"			
	
	Dim PIAddChargeBySerVen
	Set PIAddChargeBySerVen= Description.Create()
	PIAddChargeBySerVen("Class Name").value = "vbEdit"
	PIAddChargeBySerVen("vbname").value = "txtAddChargesByServiceVendor"				
	PIAddChargeBySerVen("window id").value = "16"				
	
	Dim PITotalValue
	Set PITotalValue= Description.Create()
	PITotalValue("Class Name").value = "vbEdit"
	PITotalValue("vbname").value = "txtTotVal"					
	PITotalValue("window id").value = "28"					
	
	Dim PINetValue
	Set PINetValue= Description.Create()
	PINetValue("Class Name").value = "vbEdit"
	PINetValue("vbname").value = "txtVenInvValAftrAddlTax"					
	PINetValue("window id").value = "32"						
	
	Dim PInetWithoutAddChg
	Set PInetWithoutAddChg= Description.Create()
	PInetWithoutAddChg("Class Name").value = "vbEdit"
	PInetWithoutAddChg("vbname").value = "txtNetValBeforAddlChrg"					
	PInetWithoutAddChg("window id").value = "13"						
'------------------------------------------------------------
	PIDocNumber = VbWindow(mainform).VbWindow(PIform).VbEdit(PIDocNumber).GetROProperty("text")
	
	DataTable.AddSheet("cordinates")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","cordinates","cordinates"
	DataTable.SetCurrentRow(1)
	x = DataTable.Value("ClickPIvalueTab","cordinates")
	DataTable.SetCurrentRow(2)
	y = DataTable.Value("ClickPIvalueTab","cordinates")
	
	VbWindow(mainform).VbWindow(PIform).ActiveX(acx2).Click x,y
	
	PIItemDisc = VbWindow(mainform).VbWindow(PIform).VbEdit(PIItemDisc).GetROProperty("text")
	PIHeaderDisc = VbWindow(mainform).VbWindow(PIform).VbEdit(PIHeaderDisc).GetROProperty("text")
	PIItemTax = VbWindow(mainform).VbWindow(PIform).VbEdit(PIItemTax).GetROProperty("text")
	PIHeaderTax = VbWindow(mainform).VbWindow(PIform).VbEdit(PIHeaderTax).GetROProperty("text")	
	PIAddChargeByVen = VbWindow(mainform).VbWindow(PIform).VbEdit(PIAddChargeByVen).GetROProperty("text")	
	PIAddChargeNotByVen = VbWindow(mainform).VbWindow(PIform).VbEdit(PIAddChargeNotByVen).GetROProperty("text")		
	PIAddChargeBySerVen = VbWindow(mainform).VbWindow(PIform).VbEdit(PIAddChargeBySerVen).GetROProperty("text")		
	PITotalValue = VbWindow(mainform).VbWindow(PIform).VbEdit(PITotalValue).GetROProperty("text")			
	PINetValue = VbWindow(mainform).VbWindow(PIform).VbEdit(PINetValue).GetROProperty("text")				
	PInetWithoutAddChg = VbWindow(mainform).VbWindow(PIform).VbEdit(PInetWithoutAddChg).GetROProperty("text")				
'---------------------Adding and Importing Sheet for values---------------------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count2
	count2 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count2 + 1)
	
	DataTable.value("Document","poResults")="Purchase Invoice"	
	DataTable.value("DocNumber","poResults")=PIDocNumber
	DataTable.value("ItemDisc","poResults")=PIItemDisc
	DataTable.value("HeaderDisc","poResults")=PIHeaderDisc
	DataTable.value("ItemTax","poResults")=PIItemTax
	DataTable.value("HeaderTax","poResults")=PIHeaderTax
	DataTable.value("AddVen","poResults")=PIAddChargeByVen
	DataTable.value("AddNVen","poResults")=PIAddChargeNotByVen
	DataTable.value("AddSVen","poResults")=PIAddChargeBySerVen
	DataTable.value("TotalValue","poResults")=PITotalValue
	DataTable.value("NetValue","poResults")=PINetValue
	DataTable.value("NetWithoutAddChg","poResults")=PInetWithoutAddChg

'--------- Exporting the Results from QTP dataTable to External Results Sheet -------------
	DataTable.ExportSheet "C:\QTP\Results\Results.xls","poResults"	
'----------------------------------------------------------
	VbWindow(PIform).Activate
End Function