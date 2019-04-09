package org.sv.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dispDailySaleReport
 */
@WebServlet("/dispDailySaleReport")
public class dispDailySaleReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String storeID=request.getParameter("storeID");
		
		String Date=request.getParameter("datetime");
		
		request.setAttribute("storeID", storeID);
		request.setAttribute("Date", Date);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("dispDailySaleReport.jsp");  
	      dispatcher.forward(request, response);
		
	}

}
