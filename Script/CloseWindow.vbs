Function CloseWindow

'--------------Creating the object of using the Shortcut Keys-------------------
Dim button1
Set button1 = CreateObject("wScript.Shell")
'--------------Creating the object of Main VbWindow of the Retail Exel Base-------------------
button1.SendKeys "^{F4}"
button1.SendKeys "{Enter}"
'button1.SendKeys "%{F4}"

End Function