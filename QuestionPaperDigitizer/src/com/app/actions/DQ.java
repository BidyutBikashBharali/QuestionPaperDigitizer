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
import com.mongodb.client.MongoCollection;




@WebServlet("/Delete")
public class DQ extends HttpServlet {
	
	private MongoCollection<Document> rcltn;
	private MongoCollection<Document> dcltn;
	private static final long serialVersionUID = 1L;
       
    
	
    public DQ() {
        super();
    }

        
        
	public void init(ServletConfig config) throws ServletException {
		MongoAccess mcnn = MongoAccess.getInstance();
		rcltn = mcnn.getRecord_Collection();
		dcltn = mcnn.getData_Collection();
	}
	

		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String uid = request.getParameter("id");
		if(uid == null || uid == "") {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		else {
			session.setAttribute("isDelete", "D");
			session.setAttribute("uid", uid);
			request.setAttribute("PSWRD", "Available");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
	}
	
		
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("POST");
		rcltn.deleteOne(eq("UID",  session.getAttribute("uid")));
		dcltn.deleteMany(eq("UID",  session.getAttribute("uid")));
		request.setAttribute("DELETE", "Available");
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
        requestDispatcher.forward(request, response);
	}
    
	

	
	
}
