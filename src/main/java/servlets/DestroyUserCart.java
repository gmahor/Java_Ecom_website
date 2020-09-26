package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartHandler;

@WebServlet(urlPatterns="/DestroyUserCart")
public class DestroyUserCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userid = Integer.parseInt(req.getParameter("id"));
		
		CartHandler cth = new CartHandler();
		cth.DestoryUserById(userid);
		
		resp.sendRedirect("ThankYou.jsp");
	}

	
	
	
}
