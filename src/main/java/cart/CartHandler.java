package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

interface CartStandard {
	String insert(Cart ct);

	boolean checkProductCart(int userid, int productid);

	List<Cart> fetchAllCart();

	Boolean deleteById(int id);

	Boolean DestoryUserById(int userid);

	String update(Cart ct);

	Cart fetchCartQty(int id);

}

public class CartHandler implements CartStandard {

	public String insert(Cart ct) {
		try {
			String query = "insert into cart (productid,userid,qty)values(?,?,?)";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, ct.getProductid());
			p.setInt(2, ct.getUserid());
			p.setInt(3, ct.getQty());

			p.executeUpdate();
		} catch (Exception e)

		{
			return e.getMessage();
		}
		return "Cart Added";
	}

	public boolean checkProductCart(int userid, int productid) {

		try {
			String query = "select * from cart where userid=? and productid=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, productid);
			p.setInt(2, userid);

			ResultSet rs = p.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Cart> fetchAllCart() {
		List<Cart> list = new ArrayList<Cart>();
		try {
			String query = "select * from cart";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				list.add(new Cart(

						rs.getInt("id"), rs.getInt("productid"), rs.getInt("userid"), rs.getInt("qty")

				));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Boolean deleteById(int id) {
		try {

			String query = "delete from cart where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			p.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public Boolean DestoryUserById(int userid) {
		try {
			String query = "delete from cart where userid=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, userid);

			p.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public String update(Cart ct) {
		try {

			String query = "update cart set  qty=? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(2, ct.getId());
			p.setInt(1, ct.getQty());

			p.executeUpdate();
//			System.out.println(p);
			
		} catch (Exception e) 
		
		{
			e.printStackTrace();
			
			return e.getMessage();
		}
		return "Cart Updated Successfully";
	}

	public Cart fetchCartQty(int id) {
		try {
			
			String query = "select * from cart where id=?";
			
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setInt(1, id);
			
			ResultSet rs=p.executeQuery();
			
			while (rs.next()) {
				return	new Cart(
						rs.getInt("id"),
						rs.getInt("productid"),
						rs.getInt("userid"),
						rs.getInt("qty")
						
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new Cart();
	}

}
