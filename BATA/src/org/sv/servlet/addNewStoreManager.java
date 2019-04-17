package org.sv.servlet;

import java.io.IOException; 
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

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class addNewStoreManager
 */
@WebServlet("/addNewStoreManager")
public class addNewStoreManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewStoreManager() {
        super();
        // TODO Auto-generated constructor stub
    }


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
		int checkEmpID=0;
		//Geeeting connection object from DBConnection class
			
		try(Connection con=DBConnection.getConnection();Statement stmt=con.createStatement();) 
		{			
			String SQL="select empID from employeemaster";
			
			ResultSet rs=stmt.executeQuery(SQL);
			
			while (rs.next()) {
				
				if(rs.getString(1).equals(empID))
				{
					checkEmpID=1;
				}
			}
			
			if(checkEmpID==0)
			{
				//create table EmployeeMaster(empID varchar(25),fname varchar(25), lname varchar(25),password varchar(25),designation varchar(25));
				/*stmt.executeUpdate("insert into employeemaster (empID,fname,lname,password,designation) values('"+empID+"','"+fName+"','"+lName+"','"+password+"','"+designation+"')");
				stmt.executeUpdate("insert into usermaster (userID,userName,password) values('"+empID+"','"+empID+"','"+password+"')");*/
				
				stmt.executeUpdate("insert into employeemaster values('"+empID+"','"+fName+"','"+lName+"','"+password+"','"+designation+"','"+mobileNo+"','"+birthDate+"')");
				stmt.executeUpdate("insert into usermaster values('"+empID+"','"+empID+"','"+password+"')");
				
				response.getWriter().println("<h3>Store Manager added Successfully in the DB</h3>");
				rs.close();
				response.sendRedirect("showDistrictManagerForm.jsp");
				
			}
			else
			{
				System.out.println("Employee ID Already Exist");
				response.sendRedirect("showDistrictManagerForm.jsp");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
		}
	}

	

}
