package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.CartHandler;
import product.Product;
import product.ProductHandler;

@WebServlet(urlPatterns = "/EditCart")
public class EditCart extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductHandler ph = new ProductHandler();
		Product p = ph.fetchProduct(Integer.parseInt(req.getParameter("pid")));

		int CurrntprodStock = p.getStockqty();
		
		System.out.println("CurrprodStock:" + CurrntprodStock);
		
		
		CartHandler ch=new CartHandler();
		Cart c=ch.fetchCartQty(Integer.parseInt(req.getParameter("id")));
		System.out.println(c);
		int currCartStock=c.getQty();
		
		System.out.println("currntcartStck:"+currCartStock);
				
				

		int reqstock = Integer.parseInt(req.getParameter("qty"));
		System.out.println("reqcartStock:" + reqstock);

		if (CurrntprodStock < reqstock) {

			resp.sendRedirect("NotEnoughStock.jsp");
		}
		else {

			int id = Integer.parseInt(req.getParameter("id"));
			int qty = Integer.parseInt(req.getParameter("qty"));

			Cart ct = new Cart(id, qty);

			CartHandler cth = new CartHandler();

			p.setStockqty((short) (CurrntprodStock+currCartStock- reqstock));
			
			ph.update(p);
			System.out.println(p);

			cth.update(ct);
			System.out.println(ct);

			resp.sendRedirect("ViewCart.jsp");

		}

	}
}