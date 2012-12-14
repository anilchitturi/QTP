Function soCreationWithoutItemHelp

	Dim button
	Set button = CreateObject("wScript.Shell")
'-------------- For NEW Document mode of  PO -------------------
	button.SendKeys "{F2}"
'----------------- Main Form Object----------------
	Dim mainform
	Set mainform= Description.Create()
	mainform("Class Name").value = "VbWindow"
	mainform("nativeclass").value = "ThunderRT6FormDC"
	mainform("is owned window").value = "True"
'-------------- Sales Order Screen Object -------------------
	Dim salesform
	Set salesform= Description.Create()
	salesform("Class Name").value = "VbWindow"
	salesform("text").value = "Sales Order"
	
	Dim CusField
	Set CusField= Description.Create()
	CusField("Class Name").value = "VbEditor"
	CusField("window id").value = "2"
	CusField("width").value = "184"
	CusField("x").value = "128"
	CusField("y").value = "217"
'--------------ActiveX component inside SO VbWindow-------------------
	Dim acx2
	Set acx2= Description.Create()
	acx2("Class Name").value = "ActiveX"
	acx2("acx_name").value = "SSTabs"

	Dim acx3
	Set acx3= Description.Create()
	acx3("Class Name").value = "ActiveX"
	acx3("acx_name").value = "SSTabPanel"
	
	Dim acx4
	Set acx4= Description.Create()
	acx4("Class Name").value = "ActiveX"
	acx4("acx_name").value = "True OLE DBGrid 7  Control"	
'--------------Selecting the Sales Order Type-------------------
	button.SendKeys "{Down}"
	button.SendKeys "{Down}"
	button.SendKeys "{Down}"
	wait 1
	button.SendKeys "{Down}"
	
	button.SendKeys "{Tab 3}"
	DataTable.AddSheet("vendor")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","vendor","vendor"	
	button.SendKeys "%{Down}"
	button.SendKeys "{Down}"
	button.SendKeys "{Delete}"
	customername = DataTable.Value("Customer","vendor") 
	vbWindow(salesform).VbEditor(CusField).Set customername
	button.SendKeys "{Tab}"
	wait 1
	button.SendKeys "{Tab}"
	wait 1
	button.SendKeys "{Tab}"
	wait 1
	button.SendKeys "{Down}"
	wait 1
	button.SendKeys "{Tab}"
	
	Dim DeliveryDate
	Set DeliveryDate= Description.Create()
	DeliveryDate("Class Name").value = "VbEdit"
	DeliveryDate("x").value = "747"
	DeliveryDate("y").value = "563"
	
	vbWindow(salesform).VbEdit(DeliveryDate).Set Date()
	wait 1
	button.SendKeys "{Tab}"
	
	
	vbWindow(salesform).ActiveX(acx2).Click
	wait 1
	button.SendKeys "^{N}"
'------------------------------------------------------
	Dim ItemCode
	Set ItemCode= Description.Create()
	ItemCode("Class Name").value = "WinEditor"
	ItemCode("window id").value = "12759"
	ItemCode("abs_x").value = "148"
	ItemCode("abs_y").value = "383"
	ItemCode("x").value = "151"
	ItemCode("y").value = "386"
	
	Dim ItemQty
	Set ItemQty= Description.Create()
	ItemQty("Class Name").value = "WinEditor"
	ItemQty("window id").value = "12759"
	ItemQty("abs_x").value = "520"
	ItemQty("abs_y").value = "383"	
	ItemQty("x").value = "523"
	ItemQty("y").value = "386"
	
	Dim ItemPrice
	Set ItemPrice= Description.Create()
	ItemPrice("Class Name").value = "WinEditor"
	ItemPrice("window id").value = "12759"
	ItemPrice("abs_x").value = "644"
	ItemPrice("abs_y").value = "383"		
	ItemPrice("x").value = "647"
	ItemPrice("y").value = "386"

	Dim ItemDiscs
	Set ItemDiscs= Description.Create()
	ItemDiscs("Class Name").value = "WinEditor"
	ItemDiscs("window id").value = "12759"
	ItemDiscs("abs_x").value = "1077"
	ItemDiscs("abs_y").value = "383"	
	ItemDiscs("x").value = "1080"
	ItemDiscs("y").value = "386"	
	
	Dim HeaderDiscs
	Set HeaderDiscs= Description.Create()
	HeaderDiscs("Class Name").value = "WinEditor"
	HeaderDiscs("window id").value = "2"
	HeaderDiscs("x").value = "811"
	HeaderDiscs("y").value = "117"
	
	Dim Add1
	Set Add1= Description.Create()
	Add1("Class Name").value = "WinEdit"
	Add1("vbname").value = "txtFreight"
	Add1("x").value = "69"
	Add1("y").value = "527"		
	
	Dim Add2
	Set Add2= Description.Create()
	Add2("Class Name").value = "WinEdit"
	Add2("vbname").value = "txtInsurance"
	Add2("x").value = "233"
	Add2("y").value = "527"		
'----------------------------------------------------------	
	Dim nRow
	DataTable.AddSheet("soTestData")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","soTestData","soTestData"
	nRow = DataTable.GetSheet("soTestData").GetRowCount
	
	For i = 1 to nRow
		DataTable.SetCurrentRow(i)
		vbWindow(salesform).vbEditor(ItemCode).Type DataTable.Value("ItemCode","soTestData") 
		button.SendKeys "{TAB 2}"
		vbWindow(salesform).vbEditor(ItemQty).Type DataTable.Value("ItemQty","soTestData")
		button.SendKeys "{TAB}"
		button.SendKeys "{Delete}"
		vbWindow(salesform).vbEditor(ItemPrice).Type DataTable.Value("ItemPrice","soTestData")
		button.SendKeys "{TAB}"
		'vbWindow(salesform).vbEditor(ItemDiscs).Type DataTable.Value("SalesItemDisc","vendor")
		button.SendKeys "{TAB}"
		button.SendKeys "{TAB}"
		wait 1
		button.SendKeys "^{N}"
	Next
	button.SendKeys "{F4}"
	
	DataTable.AddSheet("AddlCharges")
	DataTable.ImportSheet "C:\QTP\TestData\TestData.xls","AddlCharges","AddlCharges"	
	
	vbWindow(salesform).VbEditor(Add1).Set DataTable.Value("Add1","AddlCharges") 
	vbWindow(salesform).VbEditor(Add2).Set DataTable.Value("Add2","AddlCharges") 
	
	button.SendKeys "{TAB}"

'------------------------------------------------------------------------------------------------------------------------------------------
	'============ For PO number created -==================
	Dim soNumber
	Set soNumber = Description.Create()
	soNumber("Class Name").Value = "vbEdit"
	soNumber("vbname").value = "txtOrderCode"
	'============ For Item Discount ===================
	Dim ItemDisc
	Set ItemDisc = Description.Create()
	ItemDisc("Class Name").Value = "vbEdit"
	ItemDisc("vbname").value = "txtItemLevelDiscAmt"
	'============ For Header Discount ==================
	Dim HeaderDisc
	Set HeaderDisc = Description.Create()
	HeaderDisc("Class Name").Value = "vbEdit"
	HeaderDisc("vbname").value = "txtDiscountAmount"
	'============ For Additional Charges ==================
	Dim AddVen
	Set AddVen = Description.Create()
	AddVen("Class Name").Value = "vbEdit"
	AddVen("vbname").value = "txtTotalAdlChargesAmt"
	'============ For Total Value ==================
	Dim TotalValue
	Set TotalValue = Description.Create()
	TotalValue("Class Name").Value = "vbEdit"
	TotalValue("vbname").value = "txtTotalValue"
	'=========== For Net Value of PO=====================
	Dim NetValue
	Set NetValue = Description.Create()
	NetValue("Class Name").Value = "vbEdit"
	NetValue("vbname").value = "txtNetAmount"
'--------------------------------------------------------------------------------------------------------------
	VbWindow(salesform).Activate
'--------------- For saving the PO document -------------------------------
	button.SendKeys "{F10}"
	
	button.SendKeys "{ENTER}"
	wait 2
	VbWindow(salesform).Activate
'--------------- Saving values saved in PO screen objects ---------------------
	soNumber = VbWindow(salesform).vbEdit(soNumber).GetROProperty("text")
	ItemDisc = VbWindow(salesform).vbEdit(ItemDisc).GetROProperty("text")
	HeaderDisc = VbWindow(salesform).vbEdit(HeaderDisc).GetROProperty("text")
	AddVen = VbWindow(salesform).vbEdit(AddVen).GetROProperty("text")
	TotalValue = VbWindow(salesform).vbEdit(TotalValue).GetROProperty("text")
	NetValue = VbWindow(salesform).vbEdit(NetValue).GetROProperty("text")
'--------------- Importing previous RESULTS sheet and appending the current result ----------------------------	
	DataTable.AddSheet("soResults")
	DataTable.ImportSheet "C:\QTP\Results\Results.xls","soResults","soResults"
	Dim count1
	count1 = DataTable.GetSheet("soResults").GetRowCount
	DataTable.SetCurrentRow(count1+1)

	DataTable.value("Document","soResults")="Sales Order"	
	DataTable.value("DocNumber","soResults")=soNumber
	DataTable.value("ItemDisc","soResults")=ItemDisc
	DataTable.value("HeaderDisc","soResults")=HeaderDisc
	DataTable.value("AddVen","soResults")=AddVen
	DataTable.value("TotalValue","soResults")=TotalValue
	DataTable.value("NetValue","soResults")=NetValue
'--------- Exporting the Results from QTP dataTable to External Results Sheet -------------
	DataTable.ExportSheet "C:\QTP\Results\Results.xls","soResults"

	VbWindow(salesform).Activate
End Function