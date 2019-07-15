B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6.47
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private driver As JavaObject
	Public navigate As DriverNavigate
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(ChromeDriverPath As String)
	SetSystemProperty("webdriver.chrome.driver",ChromeDriverPath)
	driver.InitializeNewInstance("org.openqa.selenium.chrome.ChromeDriver",Null)
	navigate.Initialize(driver)
End Sub


Sub ToWebElement(we As Object) As WebElement
    Dim we1 As WebElement
	we1.Initialize(we)
	Return we1
End Sub

Public Sub Get(link As String)
	driver.RunMethod("get",Array(link))
End Sub

Public Sub getTitle As String
	Return driver.RunMethod("getTitle",Null)
End Sub

Public Sub findElement(objBy As Object) As WebElement
	Return ToWebElement(driver.RunMethod("findElement",Array(objBy)))
End Sub

Public Sub findElements(objBy As Object) As List
	Dim list1 As List
	list1.Initialize
	Dim elements As List=driver.RunMethod("findElements",Array(objBy))
	For Each we As Object In elements
		list1.Add(ToWebElement(we))
	Next
	Return list1
End Sub

Sub inline As JavaObject
	Return Me
End Sub

Sub asJavascriptExecutor As JavaObject
	Return inline.RunMethodJO("toJE",Array(driver))
End Sub

#If JAVA
import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WebDriver;  
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.JavascriptExecutor;


public JavascriptExecutor toJE (WebDriver driver) {
    JavascriptExecutor jsexecutor = (JavascriptExecutor) driver;
    return jsexecutor;
}

public String start() {
    WebDriver driver = new ChromeDriver();
    driver.get("https://www.baidu.com");  
	System.out.println("The testing page title is: " + driver.getTitle());   
	WebElement kw = driver.findElement(By.id("kw"));
	List<WebElement> inputs = driver.findElements(By.tagName("input"));
    for (WebElement inp : inputs){
	    System.out.println(inp.getAttribute("value")); 
	}
    return kw.getAttribute("name");
}

public void check() {

}
#End If