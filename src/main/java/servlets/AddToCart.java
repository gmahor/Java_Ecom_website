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

@WebServlet(urlPatterns = "/AddToCart")
public class AddToCart extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		

		System.out.println("AddToCart");

		ProductHandler ph = new ProductHandler();

		Product pr = ph.fetchProduct(Short.parseShort(req.getParameter("proid")));
		int currStock = pr.getStockqty();
		System.out.println("Current Stock Qty:");
		System.out.println(currStock);

		/*
		 * System.out.println(pr); System.out.println(currStock);
		 */

		int requestedStock = Integer.parseInt(req.getParameter("quantity"));

		System.out.println(requestedStock);

		if (currStock < requestedStock) {

			resp.sendRedirect("NotEnoughStock.jsp");

		}

		else {

			CartHandler cth = new CartHandler();

			if (cth.checkProductCart(Integer.parseInt(req.getParameter("proid")),
					Integer.parseInt(req.getParameter("userid")))) {

				resp.sendRedirect("AlreadInCart.jsp");

			} else

			{
				Cart ct = new Cart(Integer.parseInt(req.getParameter("proid")),
						Integer.parseInt(req.getParameter("userid")),
						Integer.parseInt(req.getParameter("quantity")));

				pr.setStockqty((short) (currStock - requestedStock));
				ph.update(pr);

				cth.insert(ct);
				resp.sendRedirect("Location.jsp");
			}

		}

	}

}
