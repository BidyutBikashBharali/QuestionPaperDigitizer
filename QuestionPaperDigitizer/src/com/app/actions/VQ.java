package com.app.actions;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.db.util.MongoAccess;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;



@WebServlet("/View")
public class VQ extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	private MongoCollection<Document> dcltn;
	private static final long serialVersionUID = 1L;
       
    
	
    public VQ() {
        super();
    }

        
        
	public void init(ServletConfig config) throws ServletException {
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
		dcltn = mcnn.getData_Collection();
	}
	

		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTask(request, response);
	}
	
		
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
		doGet(request, response);
	}
    
	
	protected void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("id");
		if(uid == null || uid == "") {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		
		FindIterable<Document> rcrd = rcltn.find(eq("UID", uid));
		
		if(rcrd.first() == null) {
			request.setAttribute("RCRD", "NotAvailable");
			request.setAttribute("DOC", "NotAvailable");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ViewQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		if(rcrd.first() != null) {
			MongoCursor<Document> record = rcrd.iterator();
			request.setAttribute("RCRD", "Available");
			request.setAttribute("RCRDDATA", record);
			
			FindIterable<Document> dta = dcltn.find(eq("UID", uid));
			MongoCursor<Document> data = dta.iterator();
			request.setAttribute("DOC", "Available");
			request.setAttribute("DOCDATA", data);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ViewQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
	}
	

	
	
}
