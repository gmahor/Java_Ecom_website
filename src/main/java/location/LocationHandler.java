package location;

import java.sql.Connection;
import java.sql.PreparedStatement;

import config.Configuration;

interface LocationStandard{
	String insert (Location l);
}
public class LocationHandler implements LocationStandard{

	public String insert(Location l) {
		try {
			
			String query ="insert into location (name,phone,address,pincode,city,state,alternateno,addresstype,userid)values(?,?,?,?,?,?,?,?,?)";
			
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setString(1, l.getName());
			p.setString(2, l.getPhone());
			p.setString(3, l.getAddress());
			p.setInt(4, l.getPincode());
			p.setString(5, l.getCity());
			p.setString(6, l.getState());
			p.setString(7, l.getAlternateNo());
			p.setString(8, l.getAddresstype());
			p.setInt(9, l.getUserid());
			
			p.executeUpdate();
			
			
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		
		
		
		return "Address Inserted Successfully";
	}

}
