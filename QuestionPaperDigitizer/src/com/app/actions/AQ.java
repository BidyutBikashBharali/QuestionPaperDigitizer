package com.app.actions;



import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import org.apache.commons.io.IOUtils;
import org.bson.Document;

import com.db.util.*;

import com.mongodb.client.MongoCollection;






@WebServlet("/Add")
@MultipartConfig
public class AQ extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	private MongoCollection<Document> dcltn;
	
	private static final long serialVersionUID = 1L;
       
 
	
	
    public AQ() {
        super();
      
    }


    
    
	public void init(ServletConfig config) throws ServletException {
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
		dcltn = mcnn.getData_Collection();
	}


	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Search"); 
        requestDispatcher.forward(request, response);
	}


	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTask(request, response);
		doGet(request, response);
	}
	
	
	
	
	protected void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		session.setAttribute("email", email);
		
		String password = request.getParameter("confirm_password");
		String title = request.getParameter("title");
		String qinfo = request.getParameter("qinfo");
	
		String[] questions = request.getParameterValues("question");
	    String[] qTypes= request.getParameterValues("qType");
	    String[] labels = request.getParameterValues("label");
	    String[] sqomcqo = request.getParameterValues("sqomcqo");
	    List<String> sqomcqoptn = new ArrayList<String>(Arrays.asList(sqomcqo));
	
	    String[] marks= request.getParameterValues("marks");
	    
	    Collection<Part> parts = request.getParts(); 
	    Map<String, String> srcs = new HashMap<String, String>();
	    int cnt = 1;
	    
	    for(Part part : parts) {
	    	if( part.getName().equalsIgnoreCase("qimage")) {
	    		if (part.getSize()>0) {
	    			String base64="";
      	    		InputStream iSteamReader = part.getInputStream();
      	    		byte[] imageBytes = IOUtils.toByteArray(iSteamReader);
	 		        base64 = Base64.getEncoder().encodeToString(imageBytes);
	 		        String src = "data:image/png;base64,"+base64;
	 		        srcs.put(Integer.toString(cnt), src);
		        	cnt+=1;
	    		}
	    		if (part.getSize()<=0) {
	    			srcs.put(Integer.toString(cnt), "NoSrc");
	    			cnt+=1;
	    		}
	    	}
	    }
	    
	    
	    UUID id = UUID.randomUUID();
	    String uuid = id.toString();
		session.setAttribute("uuid", uuid);
	    
	    
	    Document rec = new Document("UID", uuid).append("CEmail", email).append("Password", password).append("Title", title).append("QFInfo", qinfo);
	    
	    List<Document> datalist = new ArrayList<Document>(); 
	    ArrayList<String> sqomcqoptnArray = new ArrayList<String>();
	    ArrayList<String> srcArray = new ArrayList<String>();
	    
	    
	    for(int i = 0; i<questions.length; i++) {
	    	
	    	Object finalArray = new ArrayList<String>();
	    	
	    	String qstnNo = "QN" + Integer.toString(i+1);
	    	sqomcqoptnArray.clear();
	    	srcArray.clear();
	    	
	    	for(int j=0; j<10; j++) {
	    		sqomcqoptnArray.add(sqomcqoptn.get(0));
	    		finalArray = sqomcqoptnArray.clone();
	    		sqomcqoptn.remove(0);
	    	}
	    	
	    	for(String key : srcs.keySet()) {
	    		srcArray.add(srcs.get(key));
	    		srcs.remove(key);
	    		break;
	    	}
	    	
	    	Document data = new Document();
	    	data.append("UID", uuid).append("QN", qstnNo).append("Question", questions[i]).append("QType", qTypes[i]).append("Label", labels[i]).append("SQoMCQO", finalArray).append("QImage", srcArray.get(0)).append("Marks", marks[i]);
	    	datalist.add(data);
	    	
	    }
	  
	    rcltn.insertOne(rec);
	    dcltn.insertMany(datalist);
	    
	    

	    
	}





     



}
