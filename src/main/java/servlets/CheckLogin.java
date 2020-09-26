package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserHandler;

@WebServlet(urlPatterns="/CheckLogin")
public class CheckLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		
		UserHandler ush = new UserHandler();
		
		User us = ush.checkLogin(email, password);
		
		if( us == null ) {
			req.setAttribute("invalid", "invalid");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);			
		}else {
			
			req.getSession().setAttribute("currentUser", us);
			
			resp.sendRedirect("ViewProduct.jsp");
			
		}
	}	
	
}
