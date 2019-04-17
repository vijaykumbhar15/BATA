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
 * Servlet implementation class weeklySaleReport
 */
@WebServlet("/weeklySaleReport")
public class weeklySaleReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String storeID,weekNo,DateFrom="",DateTo="",lyPairs,estPairs,actPairs,lyTurnover,estTurnover,actTurnover,nftSaleTurnover,nftPercent,margin;
		String uptEy,uptTy,lachesHandbagPCS,diskOpeningStock,disckSalePairs,diskClosingStock,noOfBills,npsScore,impressoUpdate,order_No,fulfilled,rpu;

		weekNo=request.getParameter("week");
		storeID=request.getParameter("storeID");
		/*DateFrom=(String) request.getSession().getAttribute("dateFrom");
		DateTo=(String) request.getSession().getAttribute("dateTo");*/
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
		order_No=request.getParameter("order_No");
		fulfilled=request.getParameter("fulfilled");
		rpu="0";
		
		
		Connection conn=DBConnection.getConnection();
		int checkEmpID=0;
		try 
		{			
			Statement stmt=conn.createStatement();
			
			String SQL="SELECT min(dateMatch)as DateFrom ,max(dateMatch)as DateTo from dsrcalendar where weekNo='"+weekNo+"'";
			
			ResultSet rs=stmt.executeQuery(SQL);
			
			while (rs.next()) {
				
				DateFrom = rs.getString("DateFrom");
				DateTo = rs.getString("DateTo");
			
				
			}
			
			Statement stmt1=conn.createStatement();
			System.out.println("insert into weeklysalereport (storeID_weekNo,weekNo, storeID, DateFrom, DateTo, LY_Pairs, Pairs_EST, Pairs_ACT, LY_Turnover, Turnover_EST, Turnover_ACT, NFT_Sale_Turnover, NFT_Percent, Margin, UPT_EY, UPT_TY, Laches_Handbag_PCS, Disk_Opening_Stock, Disk_sale_Pairs, Disk_Closing_Stock, No_Of_Bills, Impresso_Update, NPS_Score, order_No, fulfilled, rpu) values ('"+storeID+"_"+weekNo+"','"+weekNo+"','"+storeID+"','"+DateFrom+"','"+DateTo+"','"+lyPairs+"','"+estPairs+"','"+actPairs+"','"+lyTurnover+"','"+estTurnover+"','"+actTurnover+"','"+nftSaleTurnover+"','"+nftPercent+"','"+margin+"','"+uptEy+"','"+uptTy+"','"+lachesHandbagPCS+"','"+diskOpeningStock+"','"+disckSalePairs+"','"+diskClosingStock+"','"+noOfBills+"','"+impressoUpdate+"','"+npsScore+"','"+order_No+"','"+fulfilled+"','"+rpu+"')");
			stmt1.executeUpdate("insert into weeklysalereport (storeID_weekNo,weekNo, storeID, DateFrom, DateTo, LY_Pairs, Pairs_EST, Pairs_ACT, LY_Turnover, Turnover_EST, Turnover_ACT, NFT_Sale_Turnover, NFT_Percent, Margin, UPT_EY, UPT_TY, Laches_Handbag_PCS, Disk_Opening_Stock, Disk_sale_Pairs, Disk_Closing_Stock, No_Of_Bills, Impresso_Update, NPS_Score, order_No, fulfilled, rpu) values ('"+storeID+"_"+weekNo+"','"+weekNo+"','"+storeID+"','"+DateFrom+"','"+DateTo+"','"+lyPairs+"','"+estPairs+"','"+actPairs+"','"+lyTurnover+"','"+estTurnover+"','"+actTurnover+"','"+nftSaleTurnover+"','"+nftPercent+"','"+margin+"','"+uptEy+"','"+uptTy+"','"+lachesHandbagPCS+"','"+diskOpeningStock+"','"+disckSalePairs+"','"+diskClosingStock+"','"+noOfBills+"','"+impressoUpdate+"','"+npsScore+"','"+order_No+"','"+fulfilled+"','"+rpu+"')");
				
				response.getWriter().println("Weekly sale Report Successfully in the DB");
				conn.close();
				stmt.close();
				stmt1.close();
				rs.close();
				response.sendRedirect("showStoreManagerForm.jsp");
			/*}
			else
			{
				System.out.println("Record Already Exist");
				response.sendRedirect("dailySaleReport.jsp");
			}*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
