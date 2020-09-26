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

@WebServlet(urlPatterns="/DeleteCartFromDB")
public class DeleteCartFromDB extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		
		CartHandler cth = new CartHandler();
		
		Cart c=cth.fetchCartQty(Integer.parseInt(req.getParameter("id")));
		int currcartqty=c.getQty();
		System.out.println("CurntCartQty:"+currcartqty);
		
		ProductHandler ph=new ProductHandler();
		Product p=ph.fetchProduct(c.getProductid());
		int currprodqty=p.getStockqty();
		System.out.println(currprodqty);
		
		if(cth.deleteById(id)==true) {

			p.setStockqty((short) (currcartqty+currprodqty));
			ph.update(p);
			
		}
		
		
		
		resp.sendRedirect("ViewCart.jsp");
		
	}

	
	
}
