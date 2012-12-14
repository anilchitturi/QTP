Function poCreationWithoutItemHelp

	Dim button
	Set button = CreateObject("wScript.Shell")
'-------------- For NEW Document mode of  PO -------------------
	button.SendKeys "{F2}"
	button.SendKeys "{Tab}"
'----------------- Main Form Object----------------
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("vbname").value = "frmMain"
'-------------- Purchse Order Screen Object -------------------
	Dim purchaseform
	Set purchaseform= Description.Create()
	purchaseform("Class Name").value = "VbWindow"
	purchaseform("text").value = "Purchase Order"
'--------------ActiveX component inside PO VbWindow-------------------
	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("text").value = "SSTab"
'-------------- Button for Vendor List -------------------
	Dim vendor_button
	Set vendor_button= Description.Create()
	vendor_button("Class Name").value = "VbButton"
	vendor_button("text").value = "V"
	vendor_button("vbName").value = "cmdVendHelp"
'--------------Clicking the Vendor List button-------------------
	VbWindow(purchaseform).VbButton(vendor_button).Click
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
	button.SendKeys "{TAB}"
	button.SendKeys "{TAB}"
	button.SendKeys "{TAB}"
'-------------- MANUAL Radiobutton inside the PO -------------------
	Dim manual_btn
	Set manual_btn= Description.Create()
	manual_btn("Class Name").value = "VbRadioButton"
	manual_btn("vbName").value = "optManual"
'--------------Clicking the Manual button-------------------
	VbWindow(purchaseform).VbRadioButton(manual_btn).Click
'------------------------------------------------------------------------------------------------------------------------------------------
'------------- Item grid in PO screen -------------------------
	Dim ItemCode
	Set ItemCode = Description.Create()
	ItemCode("Class Name").Value = "WinEditor"
	ItemCode("window id").Value = "12759"
	ItemCode("NativeClass").Value = "Edit"
	ItemCode("Column").Value = "0"

	Dim ItemQty
	Set ItemQty = Description.Create()
	ItemQty("Class Name").Value = "WinEditor"
	ItemQty("window id").Value = "12759"
	ItemQty("NativeClass").Value = "Edit"
	ItemQty("Column").Value = "5"

	Dim ItemPrice
	Set ItemPrice = Description.Create()
	ItemPrice("Class Name").Value = "WinEditor"
	ItemPrice("window id").Value = "12759"
	ItemPrice("nativeClass").Value = "Edit"
	'ItemPrice("Column").Value = "11"
	ItemPrice("width").Value = "94"
'------------ Adding TestData Sheet to QTP and accessing the values ------------------	
	Dim nRow
	DataTable.AddSheet("poTestData")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","poTestData","poTestData"
	nRow = DataTable.GetSheet("poTestData").GetRowCount
	
	For i = 1 to nRow
		DataTable.SetCurrentRow(i)
		VbWindow(mainform).VbWindow(purchaseform).VbEditor(ItemCode).Type DataTable.Value("ItemCode","poTestData")
		button.SendKeys "{TAB}"
		VbWindow(mainform).VbWindow(purchaseform).VbEditor(ItemQty).Type DataTable.Value("ItemQty","poTestData")
		button.SendKeys "{TAB 2}"
		VbWindow(mainform).VbWindow(purchaseform).VbEditor(ItemPrice).Type DataTable.Value("ItemPrice","poTestData")
		button.SendKeys "{TAB 5}"	
	Next
	button.SendKeys "{F4}"
'---------------------------------------------------------------------------------------------------------------------------------------------
'-------------- Additional Charges -------------------------
	Dim Add1
	Set Add1 = Description.Create()
	Add1("Class Name").Value = "WinEditor"
	Add1("window id").Value = "12759"
	Add1("NativeClass").Value = "Edit"
	Add1("y").Value = "128"
	
		Dim Add2
	Set Add2 = Description.Create()
	Add2("Class Name").Value = "WinEditor"
	Add2("NativeClass").Value = "Edit"
	Add2("window id").Value = "12759"
	Add2("y").Value = "146"
	
		Dim Add3
	Set Add3 = Description.Create()
	Add3("Class Name").Value = "WinEditor"
	Add3("window id").Value = "12759"
	Add3("NativeClass").Value = "Edit"
	Add3("y").Value = "164"
	
		Dim Add4
	Set Add4 = Description.Create()
	Add4("Class Name").Value = "WinEditor"
	Add4("window id").Value = "12759"
	Add4("NativeClass").Value = "Edit"
	Add4("y").Value = "182"
	
		Dim Add5
	Set Add5 = Description.Create()
	Add5("Class Name").Value = "WinEditor"
	Add5("window id").Value = "12759"
	Add5("NativeClass").Value = "Edit"
	Add5("y").Value = "200"
	
		Dim Add6
	Set Add6 = Description.Create()
	Add6("Class Name").Value = "WinEditor"
	Add6("window id").Value = "12759"
	Add6("NativeClass").Value = "Edit"
	Add6("y").Value = "218"
	
		Dim Add7
	Set Add7 = Description.Create()
	Add7("Class Name").Value = "WinEditor"
	Add7("window id").Value = "12759"
	Add7("NativeClass").Value = "Edit"
	Add7("y").Value = "236"
	
		Dim Add8
	Set Add8 = Description.Create()
	Add8("Class Name").Value = "WinEditor"
	Add8("window id").Value = "12759"
	Add8("NativeClass").Value = "Edit"
	Add8("y").Value = "254"
	
		Dim Add9
	Set Add9 = Description.Create()
	Add9("Class Name").Value = "WinEditor"
	Add9("window id").Value = "12759"
	Add9("NativeClass").Value = "Edit"
	Add9("y").Value = "272"
	
		Dim Add10
	Set Add10 = Description.Create()
	Add10("Class Name").Value = "WinEditor"
	Add10("window id").Value = "12759"
	Add10("NativeClass").Value = "Edit"
	Add10("y").Value = "290"
'----------------------- Adding the TestData Sheet of Additional charges to QTP and accesing values ----------------------
	DataTable.AddSheet("AddlCharges")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","AddlCharges","AddlCharges"		

	button.Sendkeys "%{A}"
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	wait 1
	button.Sendkeys "{Tab}"
	button.Sendkeys "{Tab}"
	
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add1).Type DataTable.Value("Add1","AddlCharges")
	button.Sendkeys "{Down}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add2).Type DataTable.Value("Add2","AddlCharges")
	button.Sendkeys "{Down}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add3).Type DataTable.Value("Add3","AddlCharges")
	button.Sendkeys "{Down}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add4).Type DataTable.Value("Add4","AddlCharges")
	button.Sendkeys "{Down}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add5).Type DataTable.Value("Add5","AddlCharges")
	button.Sendkeys "{Down}"
	button.Sendkeys "{Right}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add6).Type DataTable.Value("Add6","AddlCharges")
	button.Sendkeys "{Down}"
	button.Sendkeys "{Left}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add7).Type DataTable.Value("Add7","AddlCharges")
	button.Sendkeys "{Down}"
	button.Sendkeys "{Left}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add8).Type DataTable.Value("Add8","AddlCharges")
	button.Sendkeys "{Down}"
	button.Sendkeys "{Left}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add9).Type DataTable.Value("Add9","AddlCharges")
	button.Sendkeys "{Down}"
	button.Sendkeys "{Left}"
	VbWindow(mainform).VbWindow(purchaseform).VbEditor(Add10).Type DataTable.Value("Add10","AddlCharges")
	button.Sendkeys "{Tab}"
	'---------------------------------------------------------------------------------------------------------------------------------------------
	'============ For PO number created -==================
	Dim poNumber
	Set poNumber = Description.Create()
	poNumber("Class Name").Value = "vbEdit"
	poNumber("vbname").value = "dispPONumber"
	'============ For Item Discount ===================
	Dim ItemDisc
	Set ItemDisc = Description.Create()
	ItemDisc("Class Name").Value = "vbEdit"
	ItemDisc("vbname").value = "dispItemDisc"
	'============ For Header Discount ==================
	Dim HeaderDisc
	Set HeaderDisc = Description.Create()
	HeaderDisc("Class Name").Value = "vbEdit"
	HeaderDisc("window id").value = "11"
	'============ For Item Tax ==================
	Dim ItemTax
	Set ItemTax = Description.Create()
	ItemTax("Class Name").Value = "vbEdit"
	ItemTax("window id").value = "10"
	'============ For Header Tax ==================
	Dim HeaderTax
	Set HeaderTax = Description.Create()
	HeaderTax("Class Name").Value = "vbEdit"
	HeaderTax("window id").value = "9"
	'============ For Additional Charges Borne By Vendor ==================
	Dim AddVen
	Set AddVen = Description.Create()
	AddVen("Class Name").Value = "vbEdit"
	AddVen("window id").value = "21"
	'============ For Additional Charges Not Borne By Vendor ==================
	Dim AddNVen
	Set AddNVen = Description.Create()
	AddNVen("Class Name").Value = "vbEdit"
	AddNVen("window id").value = "20"
	'============ For Additional Charges By Service Vendor ==================
	Dim AddSVen
	Set AddSVen = Description.Create()
	AddSVen("Class Name").Value = "vbEdit"
	AddSVen("window id").value = "23"
	'============ For Total Value ==================
	Dim TotalValue
	Set TotalValue = Description.Create()
	TotalValue("Class Name").Value = "vbEdit"
	TotalValue("window id").value = "6"
	'=========== For Net Value of PO=====================
	Dim NetValue
	Set NetValue = Description.Create()
	NetValue("Class Name").Value = "vbEdit"
	NetValue("vbname").value = "dispPOValue"
	
	Dim NetWithoutAddChg
	Set NetWithoutAddChg = Description.Create()
	NetWithoutAddChg("Class Name").Value = "vbEdit"
	NetWithoutAddChg("vbname").value = "dispNetValue"
'--------------------------------------------------------------------------------------------------------------
	VbWindow(purchaseform).Activate
'--------------- For saving the PO document -------------------------------
	button.SendKeys "{F10}"
	
	button.SendKeys "{ENTER}"
	wait 2
	VbWindow(purchaseform).Activate
'--------------- Saving values saved in PO screen objects ---------------------
	poNumber = VbWindow(purchaseform).vbEdit(poNumber).GetROProperty("text")
	ItemDisc = VbWindow(purchaseform).vbEdit(ItemDisc).GetROProperty("text")
	HeaderDisc = VbWindow(purchaseform).vbEdit(HeaderDisc).GetROProperty("text")
	ItemTax = VbWindow(purchaseform).vbEdit(ItemTax).GetROProperty("text")
	HeaderTax = VbWindow(purchaseform).vbEdit(HeaderTax).GetROProperty("text")
	AddVen = VbWindow(purchaseform).vbEdit(AddVen).GetROProperty("text")
	AddNVen = VbWindow(purchaseform).vbEdit(AddNVen).GetROProperty("text")
	AddSVen = VbWindow(purchaseform).vbEdit(AddSVen).GetROProperty("text")
	TotalValue = VbWindow(purchaseform).vbEdit(TotalValue).GetROProperty("text")
	NetValue = VbWindow(purchaseform).vbEdit(NetValue).GetROProperty("text")
	NetWithoutAddChg = VbWindow(purchaseform).vbEdit(NetWithoutAddChg).GetROProperty("text")
'--------------- Importing previous RESULTS sheet and appending the current result ----------------------------	
	DataTable.AddSheet("poResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","poResults","poResults"
	Dim count1
	count1 = DataTable.GetSheet("poResults").GetRowCount
	DataTable.SetCurrentRow(count1+2)

	DataTable.value("Document","poResults")="Purchase Order"	
	DataTable.value("DocNumber","poResults")=poNumber
	DataTable.value("ItemDisc","poResults")=ItemDisc
	DataTable.value("HeaderDisc","poResults")=HeaderDisc
	DataTable.value("ItemTax","poResults")=ItemTax
	DataTable.value("HeaderTax","poResults")=HeaderTax
	DataTable.value("AddVen","poResults")=AddVen
	DataTable.value("AddNVen","poResults")=AddNVen
	DataTable.value("AddSVen","poResults")=AddSVen
	DataTable.value("TotalValue","poResults")=TotalValue
	DataTable.value("NetValue","poResults")=NetValue
	DataTable.value("NetWithoutAddChg","poResults")=NetWithoutAddChg
	
'--------- Exporting the Results from QTP dataTable to External Results Sheet -------------
	DataTable.ExportSheet "C:\QTP\Results\Results.xls","poResults"
	button.SendKeys "%{O}"
	if nRow > 20 then
		wait 5
	end if
	VbWindow(purchaseform).Activate
End Function