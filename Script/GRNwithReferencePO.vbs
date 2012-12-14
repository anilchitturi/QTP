Function GRNwithReferencePO

	Dim button
	Set button = CreateObject("wScript.Shell")

'----------------- Main Form Object----------------	
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"
'-------------- GRN Screen Object -------------------
	Dim grnform
	Set grnform= Description.Create()
	grnform("Class Name").value = "VbWindow"
	grnform("text").value = "Goods Receipt Note"
	grnform("vbname").value = "frmGRNote"
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
'-----------------------------------------------------------------
	VbWindow(grnform).Activate
	button.SendKeys "{F2}"
	button.SendKeys "{Tab 5}"
'--------------Clicking the Vendor List button-------------------
	VbWindow(grnform).VbButton(vendor_button).Click
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
	button.SendKeys "{TAB 3}"	
	wait 1
'---------------- For getting Reference PO number from Results sheet---------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count1
	count1 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count1)
'-------------- Object for Purchase Order Number control -----------------
	Dim createdPONumber
	Set createdPONumber = Description.Create()
	createdPONumber("Class Name").Value = "WinEditor"
	createdPONumber("window id").Value = "2"
	createdPONumber("y").Value = "186"
'---------- For Dialog Box showing created GRN number -------------
	Dim DocNoDialog
	Set DocNoDialog = Description.Create()
	DocNoDialog("Class Name").Value = "Dialog"
	DocNoDialog("text").Value = "Retail Excel"
		
	VbWindow(grnform).Activate
	wait 1
	VbWindow(grnform).WinEditor(createdPONumber).Type DataTable.Value("DocNumber","poResults")
	button.SendKeys "{Tab}"
	wait 1
	button.SendKeys "{Tab}"
	wait 1
	button.SendKeys "{F10}"
	VbWindow(mainform).VbWindow(grnform).Dialog(DocNoDialog).Activate
	button.SendKeys "{Enter}"
'-----------------Objects for different values-------------
	Dim GrnDocNumber
	Set GrnDocNumber= Description.Create()
	GrnDocNumber("Class Name").value = "vbEdit"
	GrnDocNumber("vbname").value = "txtDocNo"
	GrnDocNumber("window id").value = "34"	
	
	Dim GrnItemDisc
	Set GrnItemDisc= Description.Create()
	GrnItemDisc("Class Name").value = "vbEdit"
	GrnItemDisc("vbname").value = "txtItemLevelDisc"
	GrnItemDisc("window id").value = "19"		
	
	Dim GrnHeaderDisc
	Set GrnHeaderDisc= Description.Create()
	GrnHeaderDisc("Class Name").value = "vbEdit"
	GrnHeaderDisc("vbname").value = "txtGRNDiscAmount"
	GrnHeaderDisc("window id").value = "17"
	
	Dim GrnItemTax
	Set GrnItemTax= Description.Create()
	GrnItemTax("Class Name").value = "vbEdit"
	GrnItemTax("vbname").value = "txtItemLevelTax"
	GrnItemTax("window id").value = "9"
	
	Dim GrnHeaderTax
	Set GrnHeaderTax= Description.Create()
	GrnHeaderTax("Class Name").value = "vbEdit"
	GrnHeaderTax("vbname").value = "txtTaxAmount"	
	GrnHeaderTax("window id").value = "10"	
	
	Dim GrnAddChargeByVen
	Set GrnAddChargeByVen= Description.Create()
	GrnAddChargeByVen("Class Name").value = "vbEdit"
	GrnAddChargeByVen("vbname").value = "txtACByVendor"		
	GrnAddChargeByVen("window id").value = "13"		

	Dim GrnAddChargeNotByVen
	Set GrnAddChargeNotByVen= Description.Create()
	GrnAddChargeNotByVen("Class Name").value = "vbEdit"
	GrnAddChargeNotByVen("vbname").value = "txtACNotBornByVendor"			
	GrnAddChargeNotByVen("window id").value = "11"			
	
	Dim GrnAddChargeBySerVen
	Set GrnAddChargeBySerVen= Description.Create()
	GrnAddChargeBySerVen("Class Name").value = "vbEdit"
	GrnAddChargeBySerVen("vbname").value = "txtACByServVendor"				
	GrnAddChargeBySerVen("window id").value = "15"				
	
	Dim GrnTotalValue
	Set GrnTotalValue= Description.Create()
	GrnTotalValue("Class Name").value = "vbEdit"
	GrnTotalValue("vbname").value = "txtTotal"					
	GrnTotalValue("window id").value = "20"					
	
	Dim GrnNetValue
	Set GrnNetValue= Description.Create()
	GrnNetValue("Class Name").value = "vbEdit"
	GrnNetValue("vbname").value = "txtGRNValue"					
	GrnNetValue("window id").value = "12"						
	
	Dim GRNnetWithoutAddChg
	Set GRNnetWithoutAddChg= Description.Create()
	GRNnetWithoutAddChg("Class Name").value = "vbEdit"
	GRNnetWithoutAddChg("vbname").value = "txtVenDCValue"					
	GRNnetWithoutAddChg("window id").value = "14"						
'------------------------------------------------------------
	GrnDocNumber = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnDocNumber).GetROProperty("text")

'--------For getting focus in GRN values Tab(because otherwise objects becoming disappeared)-------
	DataTable.AddSheet("cordinates")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","cordinates","cordinates"
	DataTable.SetCurrentRow(1)
	x = DataTable.Value("ClickGRNvalueTab","cordinates")
	DataTable.SetCurrentRow(2)
	y = DataTable.Value("ClickGRNvalueTab","cordinates")

	VbWindow(mainform).VbWindow(grnform).ActiveX(acx2).Click x,y
'--------Storing values in variables ------------------------------------------------------------	
	GrnItemDisc = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnItemDisc).GetROProperty("text")
	GrnHeaderDisc = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnHeaderDisc).GetROProperty("text")
	GrnItemTax = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnItemTax).GetROProperty("text")
	GrnHeaderTax = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnHeaderTax).GetROProperty("text")	
	GrnAddChargeByVen = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnAddChargeByVen).GetROProperty("text")	
	GrnAddChargeNotByVen = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnAddChargeNotByVen).GetROProperty("text")		
	GrnAddChargeBySerVen = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnAddChargeBySerVen).GetROProperty("text")		
	GrnTotalValue = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnTotalValue).GetROProperty("text")			
	GrnNetValue = VbWindow(mainform).VbWindow(grnform).VbEdit(GrnNetValue).GetROProperty("text")				
	GRNnetWithoutAddChg = VbWindow(mainform).VbWindow(grnform).VbEdit(GRNnetWithoutAddChg).GetROProperty("text")				
	VbWindow(grnform).Activate
'---------------------Adding and Importing Sheet for values---------------------------------------
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count2
	count2 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count2 + 1)
	VbWindow(grnform).Activate
	DataTable.value("Document","poResults")="GRN"	
	DataTable.value("DocNumber","poResults")=GrnDocNumber
	DataTable.value("ItemDisc","poResults")=GrnItemDisc
	DataTable.value("HeaderDisc","poResults")=GrnHeaderDisc
	DataTable.value("ItemTax","poResults")=GrnItemTax
	DataTable.value("HeaderTax","poResults")=GrnHeaderTax
	DataTable.value("AddVen","poResults")=GrnAddChargeByVen
	DataTable.value("AddNVen","poResults")=GrnAddChargeNotByVen
	DataTable.value("AddSVen","poResults")=GrnAddChargeBySerVen
	DataTable.value("TotalValue","poResults")=GrnTotalValue
	DataTable.value("NetValue","poResults")=GrnNetValue
	DataTable.value("NetWithoutAddChg","poResults")=GRNnetWithoutAddChg
	VbWindow(grnform).Activate
'--------- Exporting the Results from QTP dataTable to External Results Sheet -------------
	DataTable.ExportSheet "C:\QTP\Results\Results.xls","poResults"
	VbWindow(grnform).Activate
	VbWindow(grnform).ActiveX(acx2).click
End Function