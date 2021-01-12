## 서블릿 구현하기
**1. 서블릿 클래스를 작성할때는 HttpServlet 클래스를 상속받게 해야한다.**  
=> HttpServlet 클래스는 HTTP 프로토콜 기반으로 브라우저로부터 요청을 전달받아 처리하도록하는 클래스다. 

**2. 서블릿 등록하는법**  
=> 서블릿을 등록하는 방법에는 두가지가 있다.  

- web.xml 설정하기  
=> 다음 코드를보면, 구현하고자하는 서블릿 클래스를 servlet-class를 이용해 설정해준것을 알 수있다. 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5">
  <display-name>lifeWeb</display-name>
  <servlet>
  	<servlet-name>test</servlet-name>
  	<servlet-class>lifeWeb.LifeCycleServlet</servlet-class> 
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test</servlet-name>
  	<url-pattern>/life</url-pattern>
  </servlet-mapping>
  
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
</web-app>
```  

다음은 서블릿 클래스를 구현한 것이다. HttpServlet클래스를 상속받도록 했으며, service, destroy, init 메소드를 정의해주었다.
특히, init() 메소드는 딱 한번만 호출되며 서블릿이 작업하는데 필요한 자원을 준비시키는 코드를 넣도록 해주고 service()는 요청이 들어올때마다 호출된다. 
클라이언트가 요청한 작업을 처리하는 코드가 service()에 들어온다. 

```java
package lifeWeb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycleServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		System.out.println("service call");
	}

	@Override
	public void destroy() {
		System.out.println("destroy call");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init call");
	}
	
}
```
실행시킨후, 여러번 요청하는 작업을 했을때 출력결과는 다음과 같다. 
```
init call
service call
service call
service call
service call
```

- @WebServlet 어노테이션      
=> 다음은 @WebServlet 어노테이션을 사용해 서블릿 클래스를 구현한 것이다. 어노테이션을 활용하면 위에서 처럼 직접 web.xml을 작성해 매핑하지 않아도된다. 
아래 코드에서는 ```@WebServlet("/hiServlet")``` 라고 했는데 톰캣은 이 어노테이션을 확인하여 "해당 Servlet으로 접근하기 위해서는 url에 /hiServlet으로 접근하면 된다"를 매핑시킨다. 


```java
package kr.co.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("/hiServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloServlet() {
        super();
    }

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("name"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title> sevlet test page</title>");
		out.print("<body>");
		out.print("Hello "+request.getParameter("name"));
		out.print("<h1>and.. hello servlet!!</h1>");
		out.print("</body></html>");
		out.close();
		
	}

}
```
=> 어노테이션으로 매핑하는것이 훨씬 간단하다! url에 원하는 name을 지정해주고 출력해보았다.  

![image](https://user-images.githubusercontent.com/61649201/104351828-3ed43400-5549-11eb-8e2d-8691961d1384.png)

