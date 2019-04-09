package org.sv.dto;

import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{	
	public static Connection getConnection()
	{
		Connection con=null;
		try 
		{			
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Driver Found");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/MyFirstAppDB","root","root");
			
			//con=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com:3306/script_bata_sales","script_root",";vBP%?S!r3o[");
			                   			
			System.out.println("Connection success");
		
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("Driver Not available "+e);
		} 
		catch (SQLException e) 
		{
			System.out.println("Connection issue"+e);
		}
		
		return con;
	}

}
