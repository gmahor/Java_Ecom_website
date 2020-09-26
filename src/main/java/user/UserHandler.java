package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

interface UserStandard{
	String insert(User us);
	
	List<User> fetchAllUser();
	
	String toggleActive(int id, boolean state);
	
	User checkLogin( String email, String password );
	
	boolean deleteById(int id);
}

public class UserHandler implements UserStandard {

	public String insert(User us) {
		try {
			String query = "insert into user" + "(name,phone,email,password)" + " values " + "(?,?,?,?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, us.getName());
			p.setString(2, us.getPhone());
			p.setString(3, us.getEmail());
			p.setString(4, us.getPassword());
			

			p.executeUpdate();
		} catch (Exception e) {
			return e.getMessage();

		}
		return "User Inserted Successfully";
	
	}

	public User checkLogin(String email, String password) {
		
		try {
			
			Connection conn = Configuration.conn;
			
			String query = "SELECT * FROM USER WHERE EMAIL =? AND PASSWORD = ? and ACTIVE = 1";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				User us = new User();
				
				us.setEmail(rs.getString("EMAIL"));
				us.setRole(rs.getString("ROLE"));
				us.setId(rs.getInt("ID"));
				
				return us;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<User> fetchAllUser() {
		List<User> list = new ArrayList<User>();

		try {

			String query = "select * from user";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new User(

						rs.getInt("id"), rs.getString("name"), rs.getString("phone"), rs.getString("email"),
						rs.getString("password"), rs.getBoolean("active")));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public String toggleActive(int id, boolean state) {
		try {

			String query = "update user set active =? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, state ? 1 : 0);

			p.setInt(2, id);

			p.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return "Success";
	}

	public boolean deleteById(int id) {
		try {
			String query = "delete from user where id=?";
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

	
	
}
