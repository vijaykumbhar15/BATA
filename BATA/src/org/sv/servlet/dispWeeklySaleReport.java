package org.sv.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dispWeeklySaleReport
 */
@WebServlet("/dispWeeklySaleReport")
public class dispWeeklySaleReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	   String storeID=request.getParameter("storeID");
		
		String weekNo=request.getParameter("weekNo");
		
		request.setAttribute("storeID", storeID);
		request.setAttribute("weekNo", weekNo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("dispWeeklySaleReport.jsp");  
	      dispatcher.forward(request, response);
	   
	}

}
