package org.sv.dto;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TodayDate {
	
	public static String getDateYMD()
	{
		String today;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		today = dateFormat.format(date);
		System.out.println("Today date is :"+today);
		return today;
	}

	public static String getDateDMY()
	{
		String today;
		
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		today = dateFormat.format(date);
		System.out.println("Today date is :"+today);
		return today;
	}
	
	public static String getWeekNo()
	{
		String weekNo=null;
		
		String today = TodayDate.getDateDMY();
		
		Connection con = DBConnection.getConnection();
		ResultSet rs=null;
		Statement stmt = null;
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("SELECT weekNo from dsrcalander where dateMatch='"+today+"'");
		try {
			rs= stmt.executeQuery("SELECT weekNo from dsrcalander where dateMatch='"+today+"'");
			rs.next();
			weekNo=rs.getString("weekNo");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return weekNo;
	}
	public static void main(String[] args) {
		System.out.println(TodayDate.getDateYMD());
	}
}
