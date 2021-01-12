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
