package com.etg.actions;

import static com.mongodb.client.model.Filters.eq;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.bson.Document;

import com.db.util.MongoAccess;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;




@WebServlet("/ETG")
public class ETGenerator extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	private MongoCollection<Document> dcltn;
	private static final long serialVersionUID = 1L;
       

	
    public ETGenerator() {
        super();

    }
    
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String uid = request.getParameter("id");
		if(uid == null || uid == "") {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
		dcltn = mcnn.getData_Collection();
		
		FindIterable<Document> rcrd = rcltn.find(eq("UID", uid));

		if(rcrd.first() == null) {
			request.setAttribute("RCRD", "NotAvailable");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		if(rcrd.first() != null) {
			
			FindIterable<Document> dta = dcltn.find(eq("UID", uid));
			MongoCursor<Document> data = dta.iterator();
			
			XSSFWorkbook workbook = new XSSFWorkbook(); 
			XSSFSheet sheet = workbook.createSheet("Question Paper");
			Map<String, Object[]> mdata = new TreeMap<String, Object[]>(); 
			mdata.put("1", new Object[]{ "Question No", "Question", "Question Type", "Label For Sub-Questions/Options", "Sub-Questions/Options", "Marks" });
			int slno = 2;
			
			while(data.hasNext()) {
				
				Document dcrsr = data.next();
				ArrayList<String> sqomcqoal =  (ArrayList<String>) dcrsr.get("SQoMCQO");
				
				String SQoMCQO = "";
				for (String sqomcqo : sqomcqoal) {
		            if(!sqomcqo.equals("None")) {
		            	SQoMCQO = SQoMCQO + sqomcqo + ",  ";
		            }
		        }
				
		        mdata.put(Integer.toString(slno), new Object[]{ dcrsr.getString("QN"), dcrsr.getString("Question"), dcrsr.getString("QType"), dcrsr.getString("Label"), SQoMCQO, dcrsr.getString("Marks") });
				slno+=1;
			}
			
			String fn = null;
			MongoCursor<Document> record = rcrd.iterator();
			while(record.hasNext()) {
				fn = record.next().getString("UID") + ".xlsx";
			}
			
			String filepath = "A:\\UPLOADS\\" + fn;

	        Set<String> keyset = mdata.keySet(); 
	        int rownum = 0;
	        for (String key : keyset) { 
	            
	            Row row = sheet.createRow(rownum++); 
	            Object[] objArr = mdata.get(key); 
	            int cellnum = 0; 
	            for (Object obj : objArr) { 
	                
	                Cell cell = row.createCell(cellnum++); 
	                if (obj instanceof String) 
	                    cell.setCellValue((String)obj); 
	                else if (obj instanceof Integer) 
	                    cell.setCellValue((Integer)obj); 
	            } 
	        } 
	        
	        try { 
	   
	            FileOutputStream out = new FileOutputStream(new File(filepath));
	            workbook.write(out); 
	            out.close(); 
	            workbook.close();

	            File downloadFile = new File(filepath);
	            FileInputStream inStream = new FileInputStream(downloadFile);
	            
	            ServletContext context = getServletContext();
	            String mimeType = context.getMimeType(filepath);
	            if (mimeType == null) {        
	                
	                mimeType = "application/octet-stream";
	            }

	            response.setContentType(mimeType);
	            response.setContentLength((int) downloadFile.length());

	            String headerKey = "Content-Disposition";
	            String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
	            response.setHeader(headerKey, headerValue);

	            OutputStream outStream = response.getOutputStream();
	             
	            byte[] buffer = new byte[4096];
	            int bytesRead = -1;
	             
	            while ((bytesRead = inStream.read(buffer)) != -1) {
	                outStream.write(buffer, 0, bytesRead);
	            }
	            
	            inStream.close();
	            outStream.close(); 

	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
	        
		}
  
	}

    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
