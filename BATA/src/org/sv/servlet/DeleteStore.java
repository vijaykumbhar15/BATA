package org.sv.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class DeleteStore
 */
@WebServlet("/DeleteStore")
public class DeleteStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con=null;
	Statement stmt=null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
						
						con=DBConnection.getConnection();
						try 
						{
							stmt=con.createStatement();
						
							String storeID=request.getParameter("storeID");
							String query="DELETE * FROM storemaster where storeid='"+storeID+"'";
						
							stmt.execute(query);
							con.close();
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						response.sendRedirect("showStoreDetails.jsp");
	
	}

	
	
}
