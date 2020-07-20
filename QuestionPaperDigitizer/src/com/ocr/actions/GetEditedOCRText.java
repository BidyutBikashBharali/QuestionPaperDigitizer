package com.ocr.actions;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/GEOCRT")
public class GetEditedOCRText extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
    public GetEditedOCRText() {
        super();

    }


    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("AddQuestions.jsp");
        requestDispatcher.forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String EditedOCRText = request.getParameter("EditedOCRText");
        request.setAttribute("EditedOCRText", EditedOCRText);
		doGet(request, response);
	}

}
