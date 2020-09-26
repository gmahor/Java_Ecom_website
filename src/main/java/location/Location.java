package location;

public class Location {

	private int id;
	private String name, phone, address;
	private int pincode;
	private String city, state, alternateNo ,addresstype;
	private int userid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAlternateNo() {
		return alternateNo;
	}
	public void setAlternateNo(String alternateNo) {
		this.alternateNo = alternateNo;
	}
	public String getAddresstype() {
		return addresstype;
	}
	public void setAddresstype(String addresstype) {
		this.addresstype = addresstype;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Location(String name, String phone, String address, int pincode, String city, String state,
			String alternateNo, String addresstype, int userid) {
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.pincode = pincode;
		this.city = city;
		this.state = state;
		this.alternateNo = alternateNo;
		this.addresstype = addresstype;
		this.userid = userid;
	}
	
	
	
	

}
