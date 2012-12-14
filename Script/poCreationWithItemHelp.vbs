Function poCreationWithItemHelp

'--------------Creating the object of using the Shortcut Keys-------------------
Dim button
Set button = CreateObject("wScript.Shell")
'--------------Creating the object of Main VbWindow of the Retail Exel Base-------------------
Dim login_form1
Set login_form1 = Description.Create()
login_form1("Class Name").value = "VbWindow"
login_form1("text").value = "Retail Excel - GROUP COMPANY/Punjas & Sons Limited  USER :  ADMINISTRATOR"

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

'--------------Clicking the ActiveX Component at different dimensions for opening the PO -------------------
VbWindow(login_form1).ActiveX(actx).ActiveX(actx1).Click 62,560
VbWindow(login_form1).ActiveX(actx).ActiveX(actx1).Click 65,166

'-------------- Pressing the F2 for NEW MODE and TAB -------------------
button.SendKeys "{F2}"
button.SendKeys "{Tab}"

'--------------Creating the object of VbWindow of Purchse Order Screen -------------------
Dim purchaseform
Set purchaseform= Description.Create()
purchaseform("Class Name").value = "VbWindow"
purchaseform("text").value = "Purchase Order"

'--------------Creating the object of ActiveX component inside PO VbWindow-------------------
Dim acx2
Set acx2= Description.Create()
acx2("Class Name").value = "ActiveX"
acx2("text").value = "SSTab"

'--------------Creating the object of Button for Vendor List-------------------
Dim vendor_button
Set vendor_button= Description.Create()
vendor_button("Class Name").value = "VbButton"
vendor_button("text").value = "V"
vendor_button("vbName").value = "cmdVendHelp"

'--------------Clicking the Vendor List button-------------------
VbWindow(purchaseform).VbButton(vendor_button).Click

'--------------Creating the object of VbWindoe of the Vendor Search-------------------
Dim ven_srch_frm
Set ven_srch_frm= Description.Create()
ven_srch_frm("Class Name").value = "vbWindow"
ven_srch_frm("vbName").value = "frmVenSearch"

'--------------Creating the object of Text Box inside Vendor Search-------------------
Dim ven_srch_txt
Set ven_srch_txt= Description.Create()
ven_srch_txt("Class Name").value = "vbEdit"
ven_srch_txt("vbName").value = "txtVendorName"

'--------------Setting the values inside vendor search -------------------
vbWindow(ven_srch_frm).vbEdit(ven_srch_txt).Set "NORMAL VENDOR BWP1"
button.SendKeys "{UP}"
button.SendKeys "{ENTER}"
button.SendKeys "{TAB}"
button.SendKeys "{TAB}"
button.SendKeys "{TAB}"

'--------------Creating the object of Manual Radiobutton inside the PO-------------------
Dim manual_btn
Set manual_btn= Description.Create()
manual_btn("Class Name").value = "VbRadioButton"
manual_btn("vbName").value = "optManual"

'--------------Clicking the Manual button-------------------
VbWindow(purchaseform).VbRadioButton(manual_btn).Click

'-------------Opening the Item Code help --------------------------------
button.SendKeys "{F12}"

Dim Itm_help
Set Itm_help =  Description.Create()
Itm_help("Class Name").value = "VbWindow"
Itm_help("vbName").value = "frmMultipleItemCdHelp"

Dim Name_txt
Set Name_txt =  Description.Create()
Name_txt("Class Name").value = "VbEdit"
Name_txt("vbName").value = "txtItemSName"

Dim query_btn
Set query_btn =  Description.Create()
query_btn("Class Name").value = "VbButton"
query_btn("vbName").value = "cmdQry"

Dim Select_all
Set Select_all =  Description.Create()
Select_all("Class Name").value = "VbButton"
Select_all("vbName").value = "cmdSelectAll"

VbWindow(Itm_help).VbEdit(Name_txt).Set "Fr-"
VbWindow(Itm_help).VbButton(query_btn).Click
VbWindow(Itm_help).VbButton(Select_all).Click
wait 5
VbWindow(purchaseform).Activate

button.SendKeys "{F10}"
button.SendKeys "{ENTER}"

End Function