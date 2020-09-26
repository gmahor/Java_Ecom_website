package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserHandler;

@WebServlet (urlPatterns="/SetUserToInactive")
public class SetUserToInactive  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		UserHandler ush = new UserHandler();
		ush.toggleActive(id, false);
		
		resp.sendRedirect("ViewUser.jsp");
	}

	
}
