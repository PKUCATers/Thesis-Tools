B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.32
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private nav As JavaObject
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(webdriver As JavaObject)
	nav = webdriver.RunMethodJO("navigate",Null)
End Sub

Sub goto(link As String)
	nav.RunMethod("to",Array(link))
End Sub

Sub back
	nav.RunMethod("back",Null)
End Sub

Sub forward
	nav.RunMethod("forward",Null)
End Sub

Sub refresh
	nav.RunMethod("refresh",Null)
End Sub