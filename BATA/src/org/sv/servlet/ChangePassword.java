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
import javax.servlet.http.HttpSession;

import org.sv.dto.DBConnection;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int check=0;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String reEnterPassword = request.getParameter("reEnterPassword");
		
		System.out.println("Old Pass = "+oldPassword+"\nNew Pass = "+newPassword+" Re-Entered Pass ="+reEnterPassword);
		
		HttpSession session=request.getSession();
		
		PreparedStatement pstm1,pstm2;
		
		Connection con = DBConnection.getConnection();
		
		String userName = (String) request.getSession().getAttribute("userName");
		
		System.out.println("User Name in the change password = "+userName);
		
		try 
		{
			pstm1 = con.prepareStatement("SELECT * FROM usermaster where userId = ?");
			pstm1.setString(1, userName);
			ResultSet rs = pstm1.executeQuery();
			
			if(rs.next())
			{	
				String passInDb=rs.getString(3);
				
				System.out.println("Geeting password from usermaster table to check = "+passInDb);
				
				if(oldPassword.equals(passInDb))
				{
					System.out.println("Storing the new password in DB");
					pstm2 = con.prepareStatement("UPDATE usermaster set password = ? where userID = ?");
					pstm2.setString(1, newPassword);
					pstm2.setString(2, userName);
					pstm2.execute();
					check=1;
					System.out.println("Passsword Has been changed.!!!");
					pstm2.close();
				}
				else
				{
					session.setAttribute("resultOldPassword", "OLD password is INCORRECT");
					
				}
				
			}
			
			if(check == 1)
			{
				check=0;
				response.sendRedirect("showStoreManagerForm.jsp");
			}else
			{
				response.sendRedirect("changePassword.jsp");
			}
			con.close();
			pstm1.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
