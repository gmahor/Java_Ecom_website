package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.ProductHandler;

@WebServlet(urlPatterns="/EditProductFromDB")
public class EditProductFromDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		int Id = Integer.parseInt(req.getParameter("Pid"));
		String Name = req.getParameter("productName"),
				Desc = req.getParameter("productDescription");
		Double Price = Double.parseDouble(req.getParameter("productPrice"));
		Short StockQty = Short.parseShort(req.getParameter("productStockQty")),
				CategoryId = Short.parseShort(req.getParameter("productCategoryId"));
		int ImageId = Integer.parseInt(req.getParameter("productImageId"));
		
		Product pr = new Product(Id,Name,Desc,Price,StockQty,CategoryId,ImageId);
		
		ProductHandler ph = new ProductHandler();
		ph.update(pr);
		
		resp.sendRedirect("ViewProduct.jsp");
		
	}

	
	
}
