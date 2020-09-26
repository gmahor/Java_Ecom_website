package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserHandler;

@WebServlet(urlPatterns = "/AddUserToDB")
public class AddUserToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("AddUserToDB post");

		String UName= req.getParameter("userName"),
				UPhone = req.getParameter("userPhone"),
				UEmail = req.getParameter("userEmail"),
				UPassword = req.getParameter("userPassword");

		System.out.printf("Name: %s , Phone: %s , Email: %s , Password: %s \n ",UName,UPhone,UEmail,UPassword);

		User us = new User(UName,UPhone,UEmail,UPassword);
			
		UserHandler ush = new UserHandler();
		
		ush.insert(us);
		
		System.out.println("User Added Successfully");

		resp.sendRedirect("Login.jsp");
	}

}
