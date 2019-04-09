package org.sv.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String employeeID = request.getParameter("employeeID");
		String birthDate=request.getParameter("birthDate");
		
		String newPassword = request.getParameter("newPassword");
		String newConfirmPassword = request.getParameter("newConfirmPassword");
		
		Connection con = DBConnection.getConnection();
		
		String sql= "select * from usermaster join employeemaster where usermaster.userID = employeemaster.empID AND userID=? AND employeemaster.birthDate=?";
		
		try 
		{
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, employeeID);
			pstmt.setString(2, birthDate);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				String sql2 = "update usermaster set password=? where userId = ?";
				
				pstmt=con.prepareStatement(sql2);
				
				pstmt.setString(1, newPassword);
				pstmt.setString(2, employeeID);
				
				pstmt.executeUpdate();
				
				System.out.println("Passwod Updated Scussecfully");
			}
			else
			{
				System.out.println("Please check the Employeee ID OR Date of Birth");
			}
			con.close();	
			response.sendRedirect("login.jsp");
			
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
