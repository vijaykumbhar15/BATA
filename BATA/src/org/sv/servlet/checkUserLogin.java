package org.sv.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class checkUserLogin
 */
@WebServlet("/checkUserLogin")
public class checkUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userName,password;
		
		PrintWriter out=response.getWriter();
		
		String userID="";
		userName=request.getParameter("userID");
		password=request.getParameter("password");
		
		Connection conn = DBConnection.getConnection();
		
		int check=0;
		Statement stmt;
		try {
			stmt = conn.createStatement();
			//ResultSet rs=stmt.executeQuery("select * from userMaster");
			ResultSet rs=stmt.executeQuery("select * from usermaster join employeemaster where usermaster.userID = employeemaster.empID AND userID="+userName);
			//ResultSet rs=stmt.executeQuery("select * from employeemaster");

			if(rs.next())
			{
				if(rs.getString("username").equals(userName)&& rs.getString("password").equals(password))
				{
					response.setContentType("text/html");
					out.print("Success");
					System.out.println("Login Sucess");
					check=1;
				}
			}
			if(check==0)
			{
				response.setContentType("text/html");
				out.print("Fail");
			}
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
