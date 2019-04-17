package org.sv.servlet;

import java.io.IOException;
import java.sql.Connection;
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
 * Servlet implementation class registerNewUser
 */
@WebServlet("/registerNewUser")
public class registerNewUser extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
  
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String userID,userName,password;
			
			
			userID=request.getParameter("empID");
			userName=request.getParameter("userName");
			password=request.getParameter("password");
			
			Connection conn=DBConnection.getConnection();
			
			Statement stmt;
			try {
				stmt = conn.createStatement();
				ResultSet rs=stmt.executeQuery("select userID from usermaster");
				
				
				while(rs.next())
				{
					if(rs.getString("userID").equals("userID"))
					{
						response.getWriter().print("<h4>User Already Exists!!!!</h4>");
					}
					else
					{
						stmt.executeUpdate("insert into usermaster values('"+userID+"','"+userName+"','"+password+"')");
						System.out.println("User Created");
						response.getWriter().println("<h4>User Created "+userName+"</h4>");
					}
				}
				rs.close();
				stmt.close();
			conn.close();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

}
