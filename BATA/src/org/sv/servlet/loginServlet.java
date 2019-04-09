package org.sv.servlet;

import java.io.IOException;  
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sv.dto.DBConnection;



/**
 * Servlet implementation class for loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
  
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userName="",password="",page="",designation="";
		
		HttpSession session=request.getSession();
				
		String userID="";
		userName=request.getParameter("userName");
		password=request.getParameter("password");
		
		String fName = null, lName = null;
		
		Connection conn = DBConnection.getConnection();
		
		System.out.println("User Name = "+userName);
		System.out.println("User Password = "+password);
		
		int check=0;
		Statement stmt;
		try {
			stmt = conn.createStatement();
			//ResultSet rs=stmt.executeQuery("select * from userMaster");
			ResultSet rs=stmt.executeQuery("select * from usermaster join employeemaster where usermaster.userID = employeemaster.empID AND userID="+userName);
			//ResultSet rs=stmt.executeQuery("select * from employeemaster");
			
			while(rs.next())
			{
				designation=rs.getString("designation");
				
				System.out.println("Designation in Login Servlet = "+designation);
				
				fName = rs.getString(5);
				lName = rs.getString(6);
				
				System.out.println("Name of Employee = "+fName+" "+lName);			
				session.setAttribute("fName", fName);
				session.setAttribute("lName", lName);
				if(userName.equals("admin")&& password.equals("admin"))
				{
					userID=rs.getString("userID");
					
					session.setAttribute("userName", userName);
					session.setAttribute("userID", userID);
					
					page="showAdminPage.jsp";
					check=1;
					//response.sendRedirect("adminPage.jsp");
				}
				else if(rs.getString("username").equals(userName) && rs.getString("password").equals(password))
				{
					userID=rs.getString("userID");
					session.setAttribute("userName", userName);
					session.setAttribute("userID", userID);
					System.out.println("Login Sucess");

								
					page="welcome.jsp";
					//response.sendRedirect("welcome.jsp");
					check=1;
					break;
				}
			}
			if(check==0)
			{
				System.out.println("Login Failure........Please check the user name and password");
				//request.setAttribute("result","Login Failure........Please check the user name and password");
				
				session.setAttribute("result", "Login Failure........Please check the user name and password");
				
				page="login.jsp";
			}
			
			session.setAttribute("designation", designation);
			conn.close();
		if(designation.equals("District_Manager"))
		{
			page="showDistrictManagerForm.jsp";
		}
		else if(designation.equals("Regional_Manager"))
		{
			page="showRegionalManagerForm.jsp";
		}
		else if(designation.equals("Store_Manager"))
		{
			page="showStoreManagerForm.jsp";
		}
		if(designation.equals("admin"))
		{		
			
			page="showAdminPage.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.include(request, response);
		
		response.sendRedirect(page);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
