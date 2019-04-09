package org.sv.servlet;


import java.io.File; 
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.sv.dto.DBConnection;

import com.giaybac.traprange.PDFTableExtractor;
import com.giaybac.traprange.entity.Table;

/**
 * Servlet implementation class SaveWeeklyPDF
 */
@WebServlet("/SaveWeeklyPDF")
@MultipartConfig(location="D:/ApplicationData",fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   	// 100 MB
public class SaveWeeklyPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Connection conn = DBConnection.getConnection();
		Statement stmt=null;
    	
    	String filePath= System.getProperty("java.io.tmpdir");
    	
    	//PrintWriter out = response.getWriter();
    	
    	String storeId = null,datetime_form = null,datetime_to = null,fileName = null;
    	
    	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
    	
    	List<FileItem> fileItem;
		try 
		{
			fileItem = sf.parseRequest(request);
			
    		for(FileItem item: fileItem)
    		{
    			if(item.getFieldName().equals("storeID"))
    			{
    				storeId = item.getString();
    			}
    			if(item.getFieldName().equals("datetime_from"))
    			{
    				datetime_form = item.getString();
    			}
    			if(item.getFieldName().equals("datetime_to"))
    			{
    				datetime_to = item.getString();
    			}
    			if(item.getFieldName().equals("file_upload"))
    			{
    				item.write(new File(filePath+File.separator+item.getName()));
    				fileName = item.getName();
    			}
    			
    			System.out.println("Filed Name "+item.getFieldName());
    		}
    		System.out.println("\t Store ID ="+storeId+" \n\tDate From = "+datetime_form+" \n\tDate To = "+datetime_to+" \n\t File Name = "+fileName);
    		
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    		
    		System.out.println("Hello");
    		
    		System.out.println("File path to be find = "+filePath+File.separator+fileName);
    		
    		
			try {
				stmt = conn.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    		//SaveWeeklyPDF.extractPDF(fileName);
    		
    		FileInputStream inStream = new FileInputStream(new File(filePath+File.separator+fileName));
    		
    		PDFTableExtractor extractor = new PDFTableExtractor();
    		
    		List<Table> tables = extractor.setSource(inStream).exceptLine(new int[]{0, 1, -1}).extract();
    		
    		String csv = tables.get(0).toString();//table in csv format
    		
    	    //System.out.println(csv);
         
          	String Hours_worked="";
        	String Turnover_Estimate="";
        	String Turnover_Actual="";
        	String TEST="";
        	String Non_Ftwr_Turnover="";
        	String No_Of_Trans="";
        	String Nunber_Of_Prs_Pcs="";
        	String Avg_Turnover="";
       		String Pairs_Pcs_Per_Trans="";
       		String Turnover_Per_Hour="";
       		String NFT_Percent_Of_Turnover="";
      		
       		String TOTAL = csv.substring(csv.lastIndexOf("TOTAL"),csv.length());
        		
       		System.out.println(TOTAL);
       		
       		String data[] = TOTAL.split(";");
       		
       		System.out.println("Following are the required Data");
       		System.out.println("------------------------------");
       	
       		for(int i=0; i < data.length; i++)
       		{
       			switch(i)
       			{
       			   case 4 :
       				   Hours_worked=data[i];
       				   break;
       			   case 5 :
       				   Turnover_Estimate=data[i];
       				   break;
      			   case 6 :
       				   Turnover_Actual=data[i];
      				   break;
       			   case 7 :
       				   TEST=data[i];
       				   break;
        			   case 8 :
       				   Non_Ftwr_Turnover=data[i];
       				   break;
       			   case 10 :
      				   No_Of_Trans=data[i];
       				   break;
       			   case 11 :
       				   Nunber_Of_Prs_Pcs=data[i];
       				   break;
       			   case 12 :
       				   Avg_Turnover=data[i];
       				   break;
      			   case 13 :
       				   Pairs_Pcs_Per_Trans=data[i];
       				   break;
       			   case 14 :
       				   Turnover_Per_Hour=data[i];
       				   break;
      			   case 15 :
       				   NFT_Percent_Of_Turnover=data[i];
       				   break;
      			}
        	
        	}
        	System.out.println("Take your data :");
        	System.out.println(Hours_worked+" "+Turnover_Estimate+" "+Turnover_Actual+" "+TEST+" "+Non_Ftwr_Turnover+" "+No_Of_Trans+" "+Nunber_Of_Prs_Pcs+" "+Avg_Turnover+" "+Pairs_Pcs_Per_Trans+" "+Turnover_Per_Hour+" "+NFT_Percent_Of_Turnover);

    		
    		try {
				stmt.executeUpdate("insert into storeweeklydata(storeID,formDate, toDate, Hours_worked, Turnover_Estimate, Turnover_Actual, TEST, Non_Ftwr_Turnover, No_Of_Trans, Nunber_Of_Prs_Pcs, Avg_Turnover, Pairs_Pcs_Per_Trans, Turnover_Per_Hour, NFT_Percent_Of_Turnover) values('"+storeId+"','"+datetime_form+"','"+datetime_to+"','"+Hours_worked+"','"+Turnover_Estimate+"','"+Turnover_Actual+"','"+TEST+"','"+Non_Ftwr_Turnover+"','"+No_Of_Trans+"','"+Nunber_Of_Prs_Pcs+"','"+Avg_Turnover+"','"+Pairs_Pcs_Per_Trans+"','"+Turnover_Per_Hour+"','"+NFT_Percent_Of_Turnover+"')");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
    		
    		
    		HttpSession session=request.getSession();
    		session.setAttribute("storeId", storeId);
    		session.setAttribute("dateFrom",datetime_form);
    		session.setAttribute("dateTo", datetime_to);
    		session.setAttribute("Hours_worked", Hours_worked);
    		session.setAttribute("Turnover_Estimate",Turnover_Estimate);
    		session.setAttribute("Turnover_Actual", Turnover_Actual);
    		session.setAttribute("TEST", TEST);
    		session.setAttribute("Non_Ftwr_Turnover",Non_Ftwr_Turnover);
    		session.setAttribute("NFT_Percent_Of_Turnover", NFT_Percent_Of_Turnover);
    		
    		/*RequestDispatcher rd  = request.getRequestDispatcher("weeklySaleReport.jsp");
    		rd.include(request, response);
    		*/
    		try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		response.sendRedirect("weeklySaleReport.jsp");
    		
	
    }
	
}
