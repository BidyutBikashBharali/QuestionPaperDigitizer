package com.app.actions;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;

import com.db.util.MongoAccess;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;



@WebServlet("/PasswordValidation")
public class PV extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	private MongoCollection<Document> dcltn;
	private static final long serialVersionUID = 1L;
       
    
	
    public PV() {
        super();
    }

        
        
	public void init(ServletConfig config) throws ServletException {
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
		dcltn = mcnn.getData_Collection();
	}
	

		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET");
	}
	
		
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
		doTask(request, response);
	}
    
	
	
	protected void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		if(password != null){
			
			FindIterable<Document> rcrd = rcltn.find(eq("UID", session.getAttribute("uid")));
			if(rcrd.first() == null) {
				request.setAttribute("RCRD", "NotAvailable");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
		        requestDispatcher.forward(request, response);
			}
			if(rcrd.first() != null) {
				MongoCursor<Document> record = rcrd.iterator();
				while(record.hasNext()) {
					
					String Password = record.next().getString("Password");
					
					if(password.equals(Password)) {
						
						if(session.getAttribute("isDelete") != null && session.getAttribute("isDelete") == "D") {
							session.removeAttribute("isDelete");
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("Delete");
					        requestDispatcher.forward(request, response);
						}
						else {
							
							FindIterable<Document> rcrdd = rcltn.find(eq("UID", session.getAttribute("uid")));
							MongoCursor<Document> recordd = rcrdd.iterator();
							request.setAttribute("RCRDDATA", recordd);
							
							FindIterable<Document> dta = dcltn.find(eq("UID", session.getAttribute("uid")));
							MongoCursor<Document> data = dta.iterator();
							request.setAttribute("DOCDATA", data);
							
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditQuestions.jsp");
					        requestDispatcher.forward(request, response);
						}
						
					}
					if(!password.equals(Password)) {
						request.setAttribute("WP", "Available");
						request.setAttribute("PSWRD", "Available");
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
				        requestDispatcher.forward(request, response);
					}
					
					
					
				}
				
			}
		}
		
		

		
	}
	
	
	
	
	
}
