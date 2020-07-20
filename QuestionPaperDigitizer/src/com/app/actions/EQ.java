package com.app.actions;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/Edit")
public class EQ extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
       
    
	
    public EQ() {
        super();
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
		HttpSession session = request.getSession();

	
		if(uid == null || uid == "") {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
        requestDispatcher.forward(request, response);
	    }		
		if(uid != null || uid != "") {
			session.setAttribute("uid", uid);
			request.setAttribute("PSWRD", "Available");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchQuestions.jsp");
	        requestDispatcher.forward(request, response);
		}
		


	}
	
	
	
	
	
}
