package org.sv.servlet;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sv.dto.DBConnection;


/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		Map<String, Object> map=new HashMap<String, Object>();
		
		boolean isValid = false;
		String userID = request.getParameter("userName");
		
		
		Connection conn = DBConnection.getConnection();
		
		int check=0;
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from usermaster WHERE userID="+userID);
			
			if(rs.next())
			{
				System.out.println("IN Valid true condition");
				isValid = true;
				
			}
			System.out.println("isValid condition = "+isValid);
			map.put("isValid", isValid);
			conn.close();
			stmt.close();
			rs.close();
		//	write(response,map);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	/*private void write(HttpServletResponse response, Map<String, Object> map) throws IOException
	{
		response.setContentType("application/json");
		response.setCharacterEncoding("ISO-8859-1");
		response.getWriter().write(new Gson().toJson(map));
	}*/
}
