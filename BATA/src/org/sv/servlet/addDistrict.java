package org.sv.servlet;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class addDistrict
 */
@WebServlet("/addDistrict")
public class addDistrict extends HttpServlet {

	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String distID="",distName="",stateID="",DM_ID="";
		
		distID= request.getParameter("distID");
		distName=request.getParameter("distName");
		stateID=request.getParameter("stateID");
		DM_ID=request.getParameter("cmbDM_ID");
		
		try(Connection conn=DBConnection.getConnection();Statement stmt=conn.createStatement();) 
		{			
			stmt.executeUpdate("insert into districtmaster (districtID,districtName,stateID,DM_ID) values('"+distID+"','"+distName+"','"+stateID+"','"+DM_ID+"')");
			
			response.getWriter().println("<h3>District added Successfully in the DB</h3>");
			
			System.out.println("District added in the Database");
			
			
			RequestDispatcher rsd = request.getRequestDispatcher("showRegionalManagerForm.jsp");
			rsd.forward(request, response);
			//response.sendRedirect("showRegionalManagerForm.jsp");
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			System.out.println("In finally");
		}
	
		
		
	}

}
