Dim nrowCount
Dim strKeyword
Dim strScriptName
DataTable.AddSheet("ControlFile")
DataTable.ImportSheet "C:\QTP\ControlFile\ControlFile.xls","ControlFile","ControlFile"
nrowCount = DataTable.GetSheet ("ControlFile").GetRowCount

For i = 1 to nrowCount
DataTable.SetCurrentRow(i)
strKeyword = DataTable.Value("Keyword","ControlFile")
strScriptName = DataTable.Value("ScriptName","ControlFile")
If Ucase(strKeyword = "YES") Then
	Execute strScriptName &"()"
End If
Next
