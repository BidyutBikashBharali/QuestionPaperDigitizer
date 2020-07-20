package com.ocr.actions;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Collection;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;


@WebServlet("/OCRE")
@MultipartConfig
public class OCRExecutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OCRExecutor() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditOCRText.jsp");
        requestDispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTask(request, response);
		doGet(request, response);
	}
	
	
	
	protected void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Collection<Part> parts = request.getParts(); 
		String[] imageurls = request.getParameterValues("url");
		
		String ocrtext = "  ";
	    ITesseract tesseract = new Tesseract();
	    
	    tesseract.setDatapath("A:\\tessdata");
	    
        if(imageurls == null) {
        	for(Part part : parts) {
    	    	if( part.getName().equalsIgnoreCase("file")) {
    	    		if (part.getSize()>0) {

    	    				try { 
    	    					InputStream fileInputStream = part.getInputStream();  
    	    					BufferedImage txtimage = ImageIO.read(fileInputStream);  
    	    					String text = tesseract.doOCR(txtimage);
    	    					ocrtext = ocrtext + text;
    	    				} 
    	    				catch (TesseractException e) { 
    	    					e.printStackTrace(); 
    	    				}

    	    		}
    	    	}
    	    }

        }
        if(imageurls != null){
			
			try { 
                for(String imageurl : imageurls) {
                	BufferedImage urlImage = ImageIO.read(new URL(imageurl)); 
    	            String text = tesseract.doOCR(urlImage); 	
    				ocrtext = ocrtext + text;
                }
				
			} 
			catch (TesseractException ee) { 
				ee.printStackTrace(); 
			}
        }
        
	    request.setAttribute("ocrtext", ocrtext);
	    
	}

		
		

}
