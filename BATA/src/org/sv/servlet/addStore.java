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
 * Servlet implementation class addStore
 */
@WebServlet("/addStore")
public class addStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String storeID="",storeName="",stateID="",distID="",SM_ID="";
		
		storeID= request.getParameter("storeID");
		storeName=request.getParameter("storeName");
		stateID=request.getParameter("stateID");
		distID=request.getParameter("distID");
		SM_ID=request.getParameter("cmbSM_ID");
		
		int checkEmpID=0;
		
		
		try(Connection conn=DBConnection.getConnection();Statement stmt=conn.createStatement();)
		{			
			String SQL="select storeID from storemaster";
			
			ResultSet rs=stmt.executeQuery(SQL);
			
			while (rs.next()) {
				
				if(rs.getString(1).equals(storeID))
				{
					checkEmpID=1;
				}
			}
			
			rs.close();
			
			if(checkEmpID==0)
			{
			
				try(Statement stmt1=conn.createStatement();)
				{
					stmt1.executeUpdate("insert into storemaster (storeID,storename,stateID,distID,SM_ID) values('"+storeID+"','"+storeName+"','"+stateID+"','"+distID+"','"+SM_ID+"')");
			
					response.getWriter().println("<h3>Stoare added Successfully in the DB</h3>");
					
					response.sendRedirect("showDistrictManagerForm.jsp");
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			}
			else
			{
				System.out.println("Store ID Already Exist");
				response.sendRedirect("addStore.jsp");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
