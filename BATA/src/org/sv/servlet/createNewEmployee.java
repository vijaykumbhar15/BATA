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


@WebServlet("/createNewEmployee")
public class createNewEmployee extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		String fName,lName,empID,password,designation,mobileNo,birthDate;
		
		fName=request.getParameter("fName");
		lName=request.getParameter("lName");
		empID=request.getParameter("empID");
		password=request.getParameter("password");
		designation=request.getParameter("designation");
		mobileNo=request.getParameter("mobileNo");
		birthDate=request.getParameter("birthDate");
		
		System.out.println(designation);
		
		//Geeeting connection object from DBConnection class
				
		try(Connection con=DBConnection.getConnection();Statement stmt=con.createStatement();) 
		{			
			System.out.println("Employee ID = "+empID);
			
			if(checkEmpID(empID))
			{
			// create table EmployeeMaster(empID varchar(25),fname varchar(25), lname varchar(25),password varchar(25),designation varchar(25));
					stmt.executeUpdate("insert into employeemaster values('"+empID+"','"+fName+"','"+lName+"','"+password+"','"+designation+"','"+mobileNo+"','"+birthDate+"')");
					stmt.executeUpdate("insert into usermaster values('"+empID+"','"+empID+"','"+password+"')");
					response.getWriter().println("<h3>Employee added Successfully in the DB</h3>");
					response.sendRedirect("showAdminPage.jsp");
			}
			else
			{
				System.out.println("Employee Alredy Exist");
			}
			con.close();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	boolean checkEmpID(String empID)
	{
		int i=0;
		
		try(Connection con=DBConnection.getConnection();Statement stmt = con.createStatement();) 
		{
			ResultSet rs;
			rs = stmt.executeQuery("SELECT empID FROM employeemaster");
			while(rs.next())
			{
					if(empID.equals(rs.getString("empID")))
					{
						i=1;
					}
			}
			rs.close();
			stmt.close();
			con.close();
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		if(i==0)
			return true;
		else
			return false;
	}

}
