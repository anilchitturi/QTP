Dim App 'As Application
Set App = CreateObject("QuickTest.Application")
App.Launch
App.Visible = True

App.open "C:\QTP\DriverFile",false
'Set qtRepositories = App.Test.Actions("DriverFile").ObjectRepositories

'If qtRepositories.find("C:\Automation\ObjectRepository\ObjectRepository.tsr") = -1 Then
'qtRepositories.Add "C:\Automation\ObjectRepository\ObjectRepository.tsr",1
'End If

App.Test.Settings.Launchers("Web").Active = False
App.Test.Settings.Launchers("Web").Browser = "IE"
App.Test.Settings.Launchers("Web").Address = "http://facebook.com "
App.Test.Settings.Launchers("Web").CloseOnExit = True
App.Test.Settings.Launchers("Windows Applications").Active = False
App.Test.Settings.Launchers("Windows Applications").Applications.RemoveAll
App.Test.Settings.Launchers("Windows Applications").RecordOnQTDescendants = True
App.Test.Settings.Launchers("Windows Applications").RecordOnExplorerDescendants = False
App.Test.Settings.Launchers("Windows Applications").RecordOnSpecifiedApplications = True
App.Test.Settings.Run.IterationMode = "rngAll"
App.Test.Settings.Run.StartIteration = 1
App.Test.Settings.Run.EndIteration = 1
App.Test.Settings.Run.ObjectSyncTimeOut = 20000
App.Test.Settings.Run.DisableSmartIdentification = False
App.Test.Settings.Run.OnError = "Dialog"
App.Test.Settings.Resources.DataTablePath = "<Default>"
App.Test.Settings.Resources.Libraries.RemoveAll
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpenLoginForm.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\poCreationWithItemHelp.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\poCreationWithoutItemHelp.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningPO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\CloseWindow.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\GRNwithReferencePO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningGRN.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\CloseRXL.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningPI.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\PIwithReferencePO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\PRwithReferencePO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningPR.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningSO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\soCreationWithoutItemHelp.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningDN.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\DNwithReferenceSO.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\OpeningPickList.vbs")
App.Test.Settings.Resources.Libraries.Add("C:\QTP\Script\PickListwithReferenceSO.vbs")
App.Test.Settings.Web.BrowserNavigationTimeout = 60000
App.Test.Settings.Web.ActiveScreenAccess.UserName = ""
App.Test.Settings.Web.ActiveScreenAccess.Password = ""

Set qtResultsopt = CreateObject("QuickTest.RunResultsoptions")
qtResultsopt.ResultsLocation = "C:\QTP\Results\Res1"
App.test.Run qtResultsopt