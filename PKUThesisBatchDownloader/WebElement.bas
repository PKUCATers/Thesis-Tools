B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.32
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private objWE As JavaObject
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(we As Object)
	objWE=we
End Sub

Sub getAttribute(attributeName As String) As Object
	Return objWE.RunMethod("getAttribute", Array(attributeName))
End Sub

Sub sendKeys(text As String)
	objWE.RunMethod("sendKeys", Array(Array As String(text)))
End Sub

Sub getText(text As String) As String
	Return objWE.RunMethod("getText",Null)
End Sub

Sub click
	objWE.RunMethod("click", Null)
End Sub

Sub clear
	objWE.RunMethod("clear", Null)
End Sub