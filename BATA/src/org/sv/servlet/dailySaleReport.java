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
 * Servlet implementation class dailySaleReport
 */
@WebServlet("/dailySaleReport")
public class dailySaleReport extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String storeID,datetime,lyPairs,estPairs,actPairs,lyTurnover,estTurnover,actTurnover,nftSaleTurnover,nftPercent,margin;
		String uptEy,uptTy,lachesHandbagPCS,diskOpeningStock,disckSalePairs,diskClosingStock,noOfBills,npsScore,impressoUpdate,order,fulfilled,rpu;

		
		storeID=request.getParameter("storeID");
		datetime=request.getParameter("datetime");
		lyPairs=request.getParameter("lyPairs");
		estPairs=request.getParameter("estPairs");
		actPairs=request.getParameter("actPairs");
		lyTurnover=request.getParameter("lyTurnover");
		estTurnover=request.getParameter("estTurnover");
		actTurnover=request.getParameter("actTurnover");
		nftSaleTurnover=request.getParameter("nftSaleTurnover");
		nftPercent=request.getParameter("nftPercent");
		margin=request.getParameter("margin");
		uptEy=request.getParameter("uptEy");
		uptTy=request.getParameter("uptTy");
		lachesHandbagPCS=request.getParameter("lachesHandbagPCS");		
		diskOpeningStock=request.getParameter("diskOpeningStock");
		disckSalePairs=request.getParameter("disckSalePairs");
		diskClosingStock=request.getParameter("diskClosingStock");
		noOfBills=request.getParameter("noOfBills");
		npsScore=request.getParameter("npsScore");
		impressoUpdate=request.getParameter("impressoUpdate");
		order=request.getParameter("order");
		fulfilled=request.getParameter("fulfilled");
		rpu=request.getParameter("rpu");
		
		
		int checkEmpID=0;
		try(Connection conn=DBConnection.getConnection();
				Statement stmt=conn.createStatement();
				Statement stmt1=conn.createStatement();
				Statement stmt2=conn.createStatement();)
		{	
			String SQL="select storeID_Date from dailysalereport";
			
			ResultSet rs=stmt.executeQuery(SQL);
			
			while (rs.next()) {
				
				if(rs.getString(1).equals(storeID+"_"+datetime))
				{
					checkEmpID=1;
				}
			}
			
			if(checkEmpID==0)
			{
				System.out.println("SELECT * FROM dsrcalendar WHERE dateMatch='"+datetime+"'");
				ResultSet rs2= stmt2.executeQuery("SELECT * FROM dsrcalendar WHERE dateMatch='"+datetime+"'");
				rs2.next();
				
				//stmt1.executeUpdate("insert into dailysalereport (storeID_Date,storeID,datetime_form, datetime_to, Pairs_EST, Pairs_ACT, LY_Turnover, Turnover_EST, Turnover_ACT, NFT_Sale_Turnover, NFT_Percent, Margin, UPT_EY, UPT_TY, Laches_Handbag_PCS, Disk_Opening_Stock, Disk_sale_Pairs, Disk_Closing_Stock, No_Of_Bills, NPS_Score, Impresso_Update) values('"+storeID+"_"+datetime+"','"+storeID+"','"+datetime+"','"+lyPairs+"','"+estPairs+"','"+actPairs+"','"+lyTurnover+"','"+estTurnover+"','"+actTurnover+"','"+nftSaleTurnover+"','"+nftPercent+"','"+margin+"','"+uptEy+"','"+uptTy+"','"+lachesHandbagPCS+"','"+diskOpeningStock+"','"+disckSalePairs+"','"+diskClosingStock+"','"+noOfBills+"','"+npsScore+"','"+impressoUpdate+"')");
				//stmt1.executeUpdate("insert into dailysalereport (storeID_Date,storeID,date,LY_Pairs, Pairs_EST, Pairs_ACT, LY_Turnover, Turnover_EST, Turnover_ACT, NFT_Sale_Turnover, NFT_Percent, Margin, UPT_EY, UPT_TY, Laches_Handbag_PCS, Disk_Opening_Stock, Disk_sale_Pairs, Disk_Closing_Stock, No_Of_Bills, NPS_Score, Impresso_Update, order, fulfilled) values ('"+storeID+"_"+datetime+"','"+storeID+"','"+datetime+"','"+lyPairs+"','"+estPairs+"','"+actPairs+"','"+lyTurnover+"','"+estTurnover+"','"+actTurnover+"','"+nftSaleTurnover+"','"+nftPercent+"','"+margin+"','"+uptEy+"','"+uptTy+"','"+lachesHandbagPCS+"','"+diskOpeningStock+"','"+disckSalePairs+"','"+diskClosingStock+"','"+noOfBills+"','"+npsScore+"','"+impressoUpdate+"','"+order+"','"+fulfilled+"')");
				
				stmt1.executeUpdate("insert into dailysalereport values ('"+storeID+"_"+datetime+"','"+rs2.getString("WeekNo")+"','"+rs2.getString("day")+"','"+storeID+"','"+datetime+"','"+lyPairs+"','"+estPairs+"','"+actPairs+"','"+lyTurnover+"','"+estTurnover+"','"+actTurnover+"','"+nftSaleTurnover+"','"+nftPercent+"','"+margin+"','"+uptEy+"','"+uptTy+"','"+lachesHandbagPCS+"','"+diskOpeningStock+"','"+disckSalePairs+"','"+diskClosingStock+"','"+noOfBills+"','"+npsScore+"','"+impressoUpdate+"','"+order+"','"+fulfilled+"',0)");
				
				response.getWriter().println("Daily sale Report Successfully Saved in the DB");
				
				stmt1.executeUpdate("delete from projection_ly where value='"+lyTurnover+"' LIMIT 1");
				stmt1.executeUpdate("delete from projection_est where value='"+estTurnover+"' LIMIT 1");
				
				conn.close();
				rs.close();
				stmt.close();
				stmt1.close();
				stmt2.close();
				rs2.close();
				response.sendRedirect("showStoreManagerForm.jsp");
			}
			else
			{
				System.out.println("Record Already Exist");
				response.sendRedirect("dailySaleReport.jsp");
			}
			
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}

}
