
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%> 
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%><%@page import="java.io.*" %>




<% 
// create a small spreadsheet
HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sheet = wb.createSheet();


HSSFRow row = sheet.createRow(0);

sheet.addMergedRegion(new CellRangeAddress(
        0, //first row (0-based)
        0, //last row  (0-based)
        0, //first column (0-based)
        6  //last column  (0-based)
));


	row = sheet.createRow(0);
	
		HSSFCell cell = row.createCell(0);

		cell = row.createCell(0);
		cell.setCellValue("Leave Requests");
 
	row = sheet.createRow(1);

		cell = row.createCell(0);
		cell.setCellValue("#");
		
		cell = row.createCell(1);
		cell.setCellValue("Name");
		
		cell = row.createCell(2);
		cell.setCellValue("Subject");

		cell = row.createCell(3);
		cell.setCellValue("Requested From Date");
		
		cell = row.createCell(4);
		cell.setCellValue("Requested To Date");

		cell = row.createCell(5);
		cell.setCellValue("Approved From Date");

		cell = row.createCell(6);
		cell.setCellValue("Approved To Date");

		cell = row.createCell(7);
		cell.setCellValue("Last Leave Date");

		cell = row.createCell(8);
		cell.setCellValue("Last Rejoin Date");

		cell = row.createCell(9);
		cell.setCellValue("Requested Number of Days");

		cell = row.createCell(10);
		cell.setCellValue("Approved Number of Days");

		cell = row.createCell(11);
		cell.setCellValue("Reliever");

		cell = row.createCell(12);
		cell.setCellValue("Nationality");

		cell = row.createCell(13);
		cell.setCellValue("Native Address");

		cell = row.createCell(14);
		cell.setCellValue("Comments");

		cell = row.createCell(15);
		cell.setCellValue("Qatar Contact Number");

		cell = row.createCell(16);
		cell.setCellValue("Native Number");

		cell = row.createCell(17);
		cell.setCellValue("Requested On");

		cell = row.createCell(18);
		cell.setCellValue("Status");

 
	row = sheet.createRow(2);
		cell = row.createCell(0);
		cell.setCellValue("2#");
		
		cell = row.createCell(1);
		cell.setCellValue("2Name");
		
		cell = row.createCell(2);
		cell.setCellValue("2Subject");
		
		cell = row.createCell(3);
		cell.setCellValue("2Requested From Date");
		
		cell = row.createCell(4);
		cell.setCellValue("2Requested To Date");

		cell = row.createCell(5);
		cell.setCellValue("2Approved From Date");

		cell = row.createCell(6);
		cell.setCellValue("2Approved To Date");

		cell = row.createCell(7);
		cell.setCellValue("2Last Leave Date");

		cell = row.createCell(8);
		cell.setCellValue("2Last Rejoin Date");

		cell = row.createCell(9);
		cell.setCellValue("2Requested Number of Days");

		cell = row.createCell(10);
		cell.setCellValue("2Approved Number of Days");

		cell = row.createCell(11);
		cell.setCellValue("2Reliever");

		cell = row.createCell(12);
		cell.setCellValue("2Nationality");

		cell = row.createCell(13);
		cell.setCellValue("2Native Address");

		cell = row.createCell(14);
		cell.setCellValue("2Comments");

		cell = row.createCell(15);
		cell.setCellValue("2Qatar Contact Number");

		cell = row.createCell(16);
		cell.setCellValue("2Native Number");

		cell = row.createCell(17);
		cell.setCellValue("2Requested On");

		cell = row.createCell(18);
		cell.setCellValue("2Status");





		// write it as an excel attachment
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		wb.write(outByteStream);
		byte [] outArray = outByteStream.toByteArray();
		response.setContentType("application/ms-excel");
		response.setContentLength(outArray.length); 
		response.setHeader("Expires:", "0"); // eliminates browser caching
		response.setHeader("Content-Disposition", "attachment; filename=Leave Details.xls");
		OutputStream outStream = response.getOutputStream();
		outStream.write(outArray);
		outStream.flush();

%>