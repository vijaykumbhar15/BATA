package org.sv.servlet;

import java.io.ByteArrayOutputStream; 
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.sv.dto.DBConnection;

/**
 * Servlet implementation class downloadHoleWeekReport
 */
@WebServlet("/downloadHoleWeekReport")
public class downloadHoleWeekReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String weekNo = request.getParameter("weekNoTocheckReport");
		
		Connection con = DBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		String sql = "SELECT * FROM dailysalereport";
		
		try 
		{
			pstm=con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet1 = wb.createSheet("Monday Daily Sale Report");
		HSSFSheet sheet2 = wb.createSheet("Tuesday Daily Sale Report");
		HSSFSheet sheet3 = wb.createSheet("Wednesday Daily Sale Report");
		HSSFSheet sheet4 = wb.createSheet("Thursday Daily Sale Report");
		HSSFSheet sheet5 = wb.createSheet("Friday Daily Sale Report");
		HSSFSheet sheet6 = wb.createSheet("Saturday Daily Sale Report");
		HSSFSheet sheet7 = wb.createSheet("Sunday Daily Sale Report");
		HSSFSheet sheetWeek = wb.createSheet("Whole Week Sale Report");
		

		

		//**********Monday SHEET**********//
		HSSFRow row1 = sheet1.createRow(0);
		
		int i=0;
		row1 = sheet1.createRow(0);
		HSSFCell cell1 = row1.createCell(0);

		cell1 = row1.createCell(0);
		cell1.setCellValue("Monday Daily Sale Report");
		
		try 
		{
			pstm=con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
				while(rs.next())
				{
					++i;
					
					row1 = sheet1.createRow(i);

					cell1 = row1.createCell(0);
					cell1.setCellValue(rs.getString("storeID"));
					
					cell1 = row1.createCell(1);
					cell1.setCellValue(rs.getString("Date"));
					
					cell1 = row1.createCell(2);
					cell1.setCellValue(rs.getString("LY_Pairs"));

					cell1 = row1.createCell(3);
					cell1.setCellValue(rs.getString("Pairs_EST"));
					
					cell1 = row1.createCell(4);
					cell1.setCellValue(rs.getString("Pairs_ACT"));

					cell1 = row1.createCell(5);
					cell1.setCellValue(rs.getString("LY_Turnover"));

					cell1 = row1.createCell(6);
					cell1.setCellValue(rs.getString("Turnover_EST"));

					cell1 = row1.createCell(7);
					cell1.setCellValue(rs.getString("Turnover_ACT"));

					cell1 = row1.createCell(8);
					cell1.setCellValue(rs.getString("NFT_Sale_Turnover"));

					cell1 = row1.createCell(9);
					cell1.setCellValue(rs.getString("NFT_Percent"));

					cell1 = row1.createCell(10);
					cell1.setCellValue(rs.getString("Margin"));

					cell1 = row1.createCell(11);
					cell1.setCellValue(rs.getString("UPT_EY"));

					cell1 = row1.createCell(12);
					cell1.setCellValue(rs.getString("UPT_TY"));

					cell1 = row1.createCell(13);
					cell1.setCellValue(rs.getString("Laches_Handbag_PCS"));

					cell1 = row1.createCell(14);
					cell1.setCellValue(rs.getString("Disk_Opening_Stock"));

					cell1 = row1.createCell(15);
					cell1.setCellValue(rs.getString("Disk_sale_Pairs"));

					cell1 = row1.createCell(16);
					cell1.setCellValue(rs.getString("Disk_Closing_Stock"));

					cell1 = row1.createCell(17);
					cell1.setCellValue(rs.getString("No_Of_Bills"));

					cell1 = row1.createCell(18);
					cell1.setCellValue(rs.getString("NPS_Score"));
					
					cell1 = row1.createCell(19);
					cell1.setCellValue(rs.getString("Impresso_Update"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		//**********Tuesday SHEET**********//
				HSSFRow row2 = sheet2.createRow(0);
				
				int j=0;
				row2 = sheet2.createRow(0);
				HSSFCell cell2 = row2.createCell(0);

				cell2 = row2.createCell(0);
				cell2.setCellValue("Tuesday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++j;
							
							row2 = sheet2.createRow(j);

							cell2 = row2.createCell(0);
							cell2.setCellValue(rs.getString("storeID"));
							
							cell2 = row2.createCell(1);
							cell2.setCellValue(rs.getString("Date"));
							
							cell2 = row2.createCell(2);
							cell2.setCellValue(rs.getString("LY_Pairs"));

							cell2 = row2.createCell(3);
							cell2.setCellValue(rs.getString("Pairs_EST"));
							
							cell2 = row2.createCell(4);
							cell2.setCellValue(rs.getString("Pairs_ACT"));

							cell2 = row2.createCell(5);
							cell2.setCellValue(rs.getString("LY_Turnover"));

							cell2 = row2.createCell(6);
							cell2.setCellValue(rs.getString("Turnover_EST"));

							cell2 = row2.createCell(7);
							cell2.setCellValue(rs.getString("Turnover_ACT"));

							cell2 = row2.createCell(8);
							cell2.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell2 = row2.createCell(9);
							cell2.setCellValue(rs.getString("NFT_Percent"));

							cell2 = row2.createCell(10);
							cell2.setCellValue(rs.getString("Margin"));

							cell2 = row2.createCell(11);
							cell2.setCellValue(rs.getString("UPT_EY"));

							cell2 = row2.createCell(12);
							cell2.setCellValue(rs.getString("UPT_TY"));

							cell2 = row2.createCell(13);
							cell2.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell2 = row2.createCell(14);
							cell2.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell2 = row2.createCell(15);
							cell2.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell2 = row2.createCell(16);
							cell2.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell2 = row2.createCell(17);
							cell2.setCellValue(rs.getString("No_Of_Bills"));

							cell2 = row2.createCell(18);
							cell2.setCellValue(rs.getString("NPS_Score"));
							
							cell2 = row2.createCell(19);
							cell2.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			
						
				//**********Wednesday SHEET**********//
				HSSFRow row3 = sheet3.createRow(0);
				
				int k=0;
				row3 = sheet3.createRow(0);
				HSSFCell cell3 = row3.createCell(0);

				cell3 = row3.createCell(0);
				cell3.setCellValue("Wednesday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++k;
							
							row3 = sheet3.createRow(k);

							cell3 = row3.createCell(0);
							cell3.setCellValue(rs.getString("storeID"));
							
							cell3 = row3.createCell(1);
							cell3.setCellValue(rs.getString("Date"));
							
							cell3 = row3.createCell(2);
							cell3.setCellValue(rs.getString("LY_Pairs"));

							cell3 = row3.createCell(3);
							cell3.setCellValue(rs.getString("Pairs_EST"));
							
							cell3 = row3.createCell(4);
							cell3.setCellValue(rs.getString("Pairs_ACT"));

							cell3 = row3.createCell(5);
							cell3.setCellValue(rs.getString("LY_Turnover"));

							cell3 = row3.createCell(6);
							cell3.setCellValue(rs.getString("Turnover_EST"));

							cell3 = row3.createCell(7);
							cell3.setCellValue(rs.getString("Turnover_ACT"));

							cell3 = row3.createCell(8);
							cell3.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell3 = row3.createCell(9);
							cell3.setCellValue(rs.getString("NFT_Percent"));

							cell3 = row3.createCell(10);
							cell3.setCellValue(rs.getString("Margin"));

							cell3 = row3.createCell(11);
							cell3.setCellValue(rs.getString("UPT_EY"));

							cell3 = row3.createCell(12);
							cell3.setCellValue(rs.getString("UPT_TY"));

							cell3 = row3.createCell(13);
							cell3.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell3 = row3.createCell(14);
							cell3.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell3 = row3.createCell(15);
							cell3.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell3 = row3.createCell(16);
							cell3.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell3 = row3.createCell(17);
							cell3.setCellValue(rs.getString("No_Of_Bills"));

							cell3 = row3.createCell(18);
							cell3.setCellValue(rs.getString("NPS_Score"));
							
							cell3 = row3.createCell(19);
							cell3.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				//**********Thursday SHEET**********//
				HSSFRow row4 = sheet4.createRow(0);
				
				int l=0;
				row4 = sheet4.createRow(0);
				HSSFCell cell4 = row4.createCell(0);

				cell4 = row4.createCell(0);
				cell4.setCellValue("Thursday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++l;
							
							row4 = sheet4.createRow(l);

							cell4 = row4.createCell(0);
							cell4.setCellValue(rs.getString("storeID"));
							
							cell4 = row4.createCell(1);
							cell4.setCellValue(rs.getString("Date"));
							
							cell4 = row4.createCell(2);
							cell4.setCellValue(rs.getString("LY_Pairs"));

							cell4 = row4.createCell(3);
							cell4.setCellValue(rs.getString("Pairs_EST"));
							
							cell4 = row4.createCell(4);
							cell4.setCellValue(rs.getString("Pairs_ACT"));

							cell4 = row4.createCell(5);
							cell4.setCellValue(rs.getString("LY_Turnover"));

							cell4 = row4.createCell(6);
							cell4.setCellValue(rs.getString("Turnover_EST"));

							cell4 = row4.createCell(7);
							cell4.setCellValue(rs.getString("Turnover_ACT"));

							cell4 = row4.createCell(8);
							cell4.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell4 = row4.createCell(9);
							cell4.setCellValue(rs.getString("NFT_Percent"));

							cell4 = row4.createCell(10);
							cell4.setCellValue(rs.getString("Margin"));

							cell4 = row4.createCell(11);
							cell4.setCellValue(rs.getString("UPT_EY"));

							cell4 = row4.createCell(12);
							cell4.setCellValue(rs.getString("UPT_TY"));

							cell4 = row4.createCell(13);
							cell4.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell4 = row4.createCell(14);
							cell4.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell4 = row4.createCell(15);
							cell4.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell4 = row4.createCell(16);
							cell4.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell4 = row4.createCell(17);
							cell4.setCellValue(rs.getString("No_Of_Bills"));

							cell4 = row4.createCell(18);
							cell4.setCellValue(rs.getString("NPS_Score"));
							
							cell4 = row4.createCell(19);
							cell4.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				//**********Friday SHEET**********//
				HSSFRow row5 = sheet5.createRow(0);
				
				int m=0;
				row5 = sheet5.createRow(0);
				HSSFCell cell5 = row5.createCell(0);

				cell5 = row5.createCell(0);
				cell5.setCellValue("Friday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++m;
							
							row5 = sheet5.createRow(m);

							cell5 = row5.createCell(0);
							cell5.setCellValue(rs.getString("storeID"));
							
							cell5 = row5.createCell(1);
							cell5.setCellValue(rs.getString("Date"));
							
							cell5 = row5.createCell(2);
							cell5.setCellValue(rs.getString("LY_Pairs"));

							cell5 = row5.createCell(3);
							cell5.setCellValue(rs.getString("Pairs_EST"));
							
							cell5 = row5.createCell(4);
							cell5.setCellValue(rs.getString("Pairs_ACT"));

							cell5 = row5.createCell(5);
							cell5.setCellValue(rs.getString("LY_Turnover"));

							cell5 = row5.createCell(6);
							cell5.setCellValue(rs.getString("Turnover_EST"));

							cell5 = row5.createCell(7);
							cell5.setCellValue(rs.getString("Turnover_ACT"));

							cell5 = row5.createCell(8);
							cell5.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell5 = row5.createCell(9);
							cell5.setCellValue(rs.getString("NFT_Percent"));

							cell5 = row5.createCell(10);
							cell5.setCellValue(rs.getString("Margin"));

							cell5 = row5.createCell(11);
							cell5.setCellValue(rs.getString("UPT_EY"));

							cell5 = row5.createCell(12);
							cell5.setCellValue(rs.getString("UPT_TY"));

							cell5 = row5.createCell(13);
							cell5.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell5 = row5.createCell(14);
							cell5.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell5 = row5.createCell(15);
							cell5.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell5 = row5.createCell(16);
							cell5.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell5 = row5.createCell(17);
							cell5.setCellValue(rs.getString("No_Of_Bills"));

							cell5 = row5.createCell(18);
							cell5.setCellValue(rs.getString("NPS_Score"));
							
							cell5 = row5.createCell(19);
							cell5.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				//**********Saturday SHEET**********//
				HSSFRow row6 = sheet6.createRow(0);
				
				int n=0;
				row6 = sheet6.createRow(0);
				HSSFCell cell6 = row6.createCell(0);

				cell6 = row6.createCell(0);
				cell6.setCellValue("Saturday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++n;
							
							row6 = sheet6.createRow(n);

							cell6 = row6.createCell(0);
							cell6.setCellValue(rs.getString("storeID"));
							
							cell6 = row6.createCell(1);
							cell6.setCellValue(rs.getString("Date"));
							
							cell6 = row6.createCell(2);
							cell6.setCellValue(rs.getString("LY_Pairs"));

							cell6 = row6.createCell(3);
							cell6.setCellValue(rs.getString("Pairs_EST"));
							
							cell6 = row6.createCell(4);
							cell6.setCellValue(rs.getString("Pairs_ACT"));

							cell6 = row6.createCell(5);
							cell6.setCellValue(rs.getString("LY_Turnover"));

							cell6 = row6.createCell(6);
							cell6.setCellValue(rs.getString("Turnover_EST"));

							cell6 = row6.createCell(7);
							cell6.setCellValue(rs.getString("Turnover_ACT"));

							cell6 = row6.createCell(8);
							cell6.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell6 = row6.createCell(9);
							cell6.setCellValue(rs.getString("NFT_Percent"));

							cell6 = row6.createCell(10);
							cell6.setCellValue(rs.getString("Margin"));

							cell6 = row6.createCell(11);
							cell6.setCellValue(rs.getString("UPT_EY"));

							cell6 = row6.createCell(12);
							cell6.setCellValue(rs.getString("UPT_TY"));

							cell6 = row6.createCell(13);
							cell6.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell6 = row6.createCell(14);
							cell6.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell6 = row6.createCell(15);
							cell6.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell6 = row6.createCell(16);
							cell6.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell6 = row6.createCell(17);
							cell6.setCellValue(rs.getString("No_Of_Bills"));

							cell6 = row6.createCell(18);
							cell6.setCellValue(rs.getString("NPS_Score"));
							
							cell6 = row6.createCell(19);
							cell6.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				
				

				
				//**********Sunday SHEET**********//
				HSSFRow row7 = sheet7.createRow(0);
				
				int o=0;
				row7 = sheet7.createRow(0);
				HSSFCell cell7 = row7.createCell(0);

				cell7 = row7.createCell(0);
				cell7.setCellValue("Sunday Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++o;
							
							row7 = sheet7.createRow(o);

							cell7 = row7.createCell(0);
							cell7.setCellValue(rs.getString("storeID"));
							
							cell7 = row7.createCell(1);
							cell7.setCellValue(rs.getString("Date"));
							
							cell7 = row7.createCell(2);
							cell7.setCellValue(rs.getString("LY_Pairs"));

							cell7 = row7.createCell(3);
							cell7.setCellValue(rs.getString("Pairs_EST"));
							
							cell7 = row7.createCell(4);
							cell7.setCellValue(rs.getString("Pairs_ACT"));

							cell7 = row7.createCell(5);
							cell7.setCellValue(rs.getString("LY_Turnover"));

							cell7 = row7.createCell(6);
							cell7.setCellValue(rs.getString("Turnover_EST"));

							cell7 = row7.createCell(7);
							cell7.setCellValue(rs.getString("Turnover_ACT"));

							cell7 = row7.createCell(8);
							cell7.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cell7 = row7.createCell(9);
							cell7.setCellValue(rs.getString("NFT_Percent"));

							cell7 = row7.createCell(10);
							cell7.setCellValue(rs.getString("Margin"));

							cell7 = row7.createCell(11);
							cell7.setCellValue(rs.getString("UPT_EY"));

							cell7 = row7.createCell(12);
							cell7.setCellValue(rs.getString("UPT_TY"));

							cell7 = row7.createCell(13);
							cell7.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cell7 = row7.createCell(14);
							cell7.setCellValue(rs.getString("Disk_Opening_Stock"));

							cell7 = row7.createCell(15);
							cell7.setCellValue(rs.getString("Disk_sale_Pairs"));

							cell7 = row7.createCell(16);
							cell7.setCellValue(rs.getString("Disk_Closing_Stock"));

							cell7 = row7.createCell(17);
							cell7.setCellValue(rs.getString("No_Of_Bills"));

							cell7 = row7.createCell(18);
							cell7.setCellValue(rs.getString("NPS_Score"));
							
							cell7 = row7.createCell(19);
							cell7.setCellValue(rs.getString("Impresso_Update"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				//**********Weekly SHEET**********//
				HSSFRow rowWeek = sheetWeek.createRow(0);
				
				int p=0;
				rowWeek = sheetWeek.createRow(0);
				HSSFCell cellWeek = rowWeek.createCell(0);

				cellWeek = rowWeek.createCell(0);
				cellWeek.setCellValue("Weekly Daily Sale Report");
				
				try 
				{
					pstm=con.prepareStatement(sql);
					rs = pstm.executeQuery();
					
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
						while(rs.next())
						{
							++p;
							
							rowWeek = sheetWeek.createRow(p);

							cellWeek = rowWeek.createCell(0);
							cellWeek.setCellValue(rs.getString("storeID"));
							
							cellWeek = rowWeek.createCell(1);
							cellWeek.setCellValue(rs.getString("Date"));
							
							cellWeek = rowWeek.createCell(2);
							cellWeek.setCellValue(rs.getString("LY_Pairs"));

							cellWeek = rowWeek.createCell(3);
							cellWeek.setCellValue(rs.getString("Pairs_EST"));
							
							cellWeek = rowWeek.createCell(4);
							cellWeek.setCellValue(rs.getString("Pairs_ACT"));

							cellWeek = rowWeek.createCell(5);
							cellWeek.setCellValue(rs.getString("LY_Turnover"));

							cellWeek = rowWeek.createCell(6);
							cellWeek.setCellValue(rs.getString("Turnover_EST"));

							cellWeek = rowWeek.createCell(7);
							cellWeek.setCellValue(rs.getString("Turnover_ACT"));

							cellWeek = rowWeek.createCell(8);
							cellWeek.setCellValue(rs.getString("NFT_Sale_Turnover"));

							cellWeek = rowWeek.createCell(9);
							cellWeek.setCellValue(rs.getString("NFT_Percent"));

							cellWeek = rowWeek.createCell(10);
							cellWeek.setCellValue(rs.getString("Margin"));

							cellWeek = rowWeek.createCell(11);
							cellWeek.setCellValue(rs.getString("UPT_EY"));

							cellWeek = rowWeek.createCell(12);
							cellWeek.setCellValue(rs.getString("UPT_TY"));

							cellWeek = rowWeek.createCell(13);
							cellWeek.setCellValue(rs.getString("Laches_Handbag_PCS"));

							cellWeek = rowWeek.createCell(14);
							cellWeek.setCellValue(rs.getString("Disk_Opening_Stock"));

							cellWeek = rowWeek.createCell(15);
							cellWeek.setCellValue(rs.getString("Disk_sale_Pairs"));

							cellWeek = rowWeek.createCell(16);
							cellWeek.setCellValue(rs.getString("Disk_Closing_Stock"));

							cellWeek = rowWeek.createCell(17);
							cellWeek.setCellValue(rs.getString("No_Of_Bills"));

							cellWeek = rowWeek.createCell(18);
							cellWeek.setCellValue(rs.getString("NPS_Score"));
							
							cellWeek = rowWeek.createCell(19);
							cellWeek.setCellValue(rs.getString("Impresso_Update"));
							
						}
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				
				// write it as an excel attachment
				ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
				wb.write(outByteStream);
				byte [] outArray = outByteStream.toByteArray();
				response.setContentType("application/ms-excel");
				response.setContentLength(outArray.length); 
				response.setHeader("Expires:", "0"); // eliminates browser caching
				//response.setHeader("Content-Disposition", "attachment; filename=Leave Details.xls");
				//response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "inline; filename=WeeklySaleReport.xls");
				
				OutputStream outStream = response.getOutputStream();
				outStream.write(outArray);
				outStream.flush();
				
			//	response.sendRedirect("download_excel.jsp");
		
		
	}

}
