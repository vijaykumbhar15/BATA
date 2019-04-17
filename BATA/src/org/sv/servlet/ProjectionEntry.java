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
import org.sv.dto.TodayDate;

/**
 * Servlet implementation class ProjectionEntry
 */
@WebServlet("/ProjectionEntry")
public class ProjectionEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String storeID,weekNo = null,monLY,monETS,monPROJ,tueLY,tueETS,tuePROJ,wedLY,wedETS,wedPROJ,thuLY,thuETS,thuPROJ;
		String friLY,friETS,friPROJ,satLY,satETS,satPROJ,sunLY,sunETS,sunPROJ,weeklyLY,weeklyETS,weeklyPROJ;
		
		
		Connection con=DBConnection.getConnection();
		try
		{
			Connection con1=DBConnection.getConnection();
			Statement stmt1=con1.createStatement();
								
			System.out.println("SELECT WeekNo FROM dsrcalendar WHERE dateMatch= '"+TodayDate.getDateYMD()+"'");
			ResultSet rs= stmt1.executeQuery("SELECT WeekNo FROM dsrcalendar WHERE dateMatch='"+TodayDate.getDateYMD()+"'");
			rs.next();
			weekNo= rs.getString("weekNo");
			con1.close();
			stmt1.close();
			rs.close();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		storeID=request.getParameter("storeID");
		
		
		
		monLY=request.getParameter("monLY");
		monETS=request.getParameter("monETS");
		monPROJ=request.getParameter("monPROJ");
		
		tueLY=request.getParameter("tueLY");
		tueETS=request.getParameter("tueETS");
		tuePROJ=request.getParameter("tuePROJ");
		
		wedLY=request.getParameter("wedLY");
		wedETS=request.getParameter("wedETS");
		wedPROJ=request.getParameter("wedPROJ");
		
		thuLY=request.getParameter("thuLY");
		thuETS=request.getParameter("thuETS");
		thuPROJ=request.getParameter("thuPROJ");
		
		friLY=request.getParameter("friLY");
		friETS=request.getParameter("friETS");
		friPROJ=request.getParameter("friPROJ");
		
		satLY=request.getParameter("satLY");
		satETS=request.getParameter("satETS");
		satPROJ=request.getParameter("satPROJ");
		
		sunLY=request.getParameter("sunLY");
		sunETS=request.getParameter("sunETS");
		sunPROJ=request.getParameter("sunPROJ");
		
		
		/*weeklyLY  = monLY+tueLY+wedLY+thuLY+friLY+satLY+sunLY;
		weeklyETS = monETS+tueETS+wedETS+thuETS+friETS+satETS+sunETS;
		weeklyPROJ = monPROJ+tuePROJ+tuePROJ+wedPROJ+thuPROJ+friPROJ+satPROJ+sunPROJ;
		
		
		*/
		weeklyLY=request.getParameter("weeklyLY");
		weeklyETS=request.getParameter("weeklyETS");
		weeklyPROJ=request.getParameter("weeklyPROJ");
		
		System.out.println("WEEK LY"+weeklyLY);
		System.out.println("WEEK EST"+weeklyETS);
		System.out.println("WEEK PROJ"+weeklyPROJ);
		
		try 
		{			
			Statement stmt=con.createStatement();
			
			// create table EmployeeMaster(empID varchar(25),fname varchar(25), lname varchar(25),password varchar(25),designation varchar(25));
			stmt.executeUpdate("insert into projectionentry values('"+storeID+"','"+weekNo+"','"+monLY+"','"+monETS+"','"+monPROJ+"','"+tueLY+"','"+tueETS+"','"+tuePROJ+"','"+wedLY+"','"+wedETS+"','"+wedPROJ+"','"+thuLY+"','"+thuETS+"','"+thuPROJ+"','"+friLY+"','"+friETS+"','"+friPROJ+"','"+satLY+"','"+satETS+"','"+satPROJ+"','"+sunLY+"','"+sunETS+"','"+sunPROJ+"','"+weeklyLY+"','"+weeklyETS+"','"+weeklyPROJ+"')");
			
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+monLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+tueLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+wedLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+thuLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+friLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+satLY+"')");
			stmt.executeUpdate("insert into projection_ly values('"+storeID+"','"+weekNo+"','"+sunLY+"')");
			
			
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+monETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+tueETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+wedETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+thuETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+friETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+satETS+"')");
			stmt.executeUpdate("insert into projection_est values('"+storeID+"','"+weekNo+"','"+sunETS+"')");
			
			
			response.getWriter().println("<h3>Projection details added in the DB</h3>");
			con.close();
			stmt.close();
			
			response.sendRedirect("showStoreManagerForm.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
