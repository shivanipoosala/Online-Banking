package com.atm;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
			String uname=request.getParameter("uname");
			String pass=request.getParameter("pass");
			if(uname.equals("Shivani")&&(pass.equals("123")))
			{
				response.sendRedirect("option.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
				
			}
		
	
	}
}
