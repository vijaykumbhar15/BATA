package org.sv.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class addRegion
 */
@WebServlet("/addRegion")
public class addRegion extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String regionID="",regionName="",stateID="",RM_ID="";
		
		regionID= request.getParameter("regionID");
		regionName=request.getParameter("regionName");
		stateID=request.getParameter("stateID");
		RM_ID=request.getParameter("cmbRM_ID");
		
		Connection conn=DBConnection.getConnection();
		
		try 
		{			
			Statement stmt=conn.createStatement();
			
			stmt.executeUpdate("insert into regionmaster (regionID,regionName,regionState_ID,RM_ID) values('"+regionID+"','"+regionName+"','"+stateID+"','"+RM_ID+"')");
			
			response.getWriter().println("<h3>Region added Successfully in the DB</h3>");
			
			conn.close();
			response.sendRedirect("index.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
