B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.32
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private fx As JFX
	Private objBy As JavaObject
End Sub

Sub initBy
	If objBy.IsInitialized=False Then
		objBy.InitializeStatic("org.openqa.selenium.By")
	End If
End Sub

Sub name(text As String)  As Object
	initBy
	Return objBy.RunMethod("name",Array(text))
End Sub

Sub id(text As String)  As Object
	initBy
	Return objBy.RunMethod("id",Array(text))
End Sub

Sub tagName(text As String)  As Object
	initBy
	Return objBy.RunMethod("tagName",Array(text))
End Sub

Sub className(text As String) As Object
	initBy
	Return objBy.RunMethod("className",Array(text))
End Sub