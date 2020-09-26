package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.Location;
import location.LocationHandler;

@WebServlet(urlPatterns = "/locationFormDb")
public class locationFormDb extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name"),
				phone = req.getParameter("Phone"),
				address = req.getParameter("address");
		int pincode = Integer.parseInt(req.getParameter("pincode"));
		String city =req.getParameter("city"),
				state = req.getParameter("state"),
				alternateNo = req.getParameter("alterphone"),
				addresstype = req.getParameter("addresstype");
		int userId = Integer.parseInt(req.getParameter("userid"));
		
		Location l = new Location(name,phone,address,pincode,city,state,alternateNo,addresstype,userId);
		
		LocationHandler lh = new LocationHandler();
		lh.insert(l);
		resp.sendRedirect("Payment.jsp");
	}

}
