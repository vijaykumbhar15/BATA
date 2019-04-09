package org.sv.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewFile
 */
@WebServlet("/NewFileServlet")
public class NewFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("userName");
		
		if(name.equals("hello"))
		{
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'/>");
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'/>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Welcome!!!' ,'Login Success' ,'success' )");
			out.println("});");
			out.println("</script>");
			
			System.out.println("Login Success");
			
		}
		else
		{
			
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Oops' ,'Wrong user ID Password!' ,'error' )");
			out.println("});");
			out.println("</script>");
			
			System.out.println("Login fail");
			
			RequestDispatcher rd= request.getRequestDispatcher("NewFile.jsp");
			
			rd.include(request, response);
			
		}
		
		
	}

}
