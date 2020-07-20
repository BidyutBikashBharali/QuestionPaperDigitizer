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
import com.mongodb.client.FindIterable;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;


@WebServlet("/Search")
public class SQ extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	
	private static final long serialVersionUID = 1L;
       

    public SQ() {
        super();
        
    }


    
	public void init(ServletConfig config) throws ServletException {
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
        requestDispatcher.forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doTask(request, response);
		doGet(request, response);
	}
	
	
	protected void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = null;
		HttpSession session = request.getSession();
		String Semail = (String) session.getAttribute("email");
		String Femail = request.getParameter("email");
		
		if(Semail != null) {
			email = Semail;
			session.removeAttribute("email");
		}
		
		if(Femail != null) {
			email = Femail;
		}
		
		FindIterable<Document> rcrd = rcltn.find(eq("CEmail", email));
		
		if(rcrd.first() == null) {
			request.setAttribute("RCRD", "NotAvailable");
		}
		if(rcrd.first() != null) {
			MongoCursor<Document> record = rcrd.iterator();
			request.setAttribute("RCRD", "Available");
			request.setAttribute("RCRDDATA", record);
			request.setAttribute("Email", email);
		}
			
		
		
	}

}
