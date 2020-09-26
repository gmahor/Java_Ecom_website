package cart;

public class Cart {

	private int id, productid, userid, qty;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public Cart() {
	}

	public Cart(int productid, int userid, int qty) {
		this.productid = productid;
		this.userid = userid;
		this.qty = qty;
	}

	

	public Cart(int id, int productid, int userid, int qty) {
		this.id = id;
		this.productid = productid;
		this.userid = userid;
		this.qty = qty;
	}
	
	

	public Cart(int id, int qty) {
		super();
		this.id = id;
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", productid=" + productid + ", userid=" + userid + ", qty=" + qty + "]";
	}

	public Cart(int qty) {
		this.qty = qty;
	}

	
	
}
