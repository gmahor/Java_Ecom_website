package imagebank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import config.Configuration;

interface ImageBankStandard{
	void insert(ImageBank ib) ;
	
	String deleteById(int id);
	
	
	ImageBank fetchImageBank(int id);
	List<ImageBank> fetchAllImageInBank();
	
}

public class ImageBankHandler implements ImageBankStandard{

	public void insert(ImageBank ib) {
		try {
			
			String query = "insert into imagebank"+"(url)"+
							"values"+"(?)";
			
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setString(1, ib.getUrl());
			
			p.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	public List<ImageBank> fetchAllImageInBank() {
		List<ImageBank> list =new ArrayList<ImageBank>();
		
		try {
			
			String query = "select * from imagebank";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
					list.add(new ImageBank(
							rs.getInt("id"),
							rs.getString("url")
							));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public String deleteById(int id) {
		
		String a = "Image Removed Successfully";
		try {

			String query = "delete from imagebank where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			p.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return a ;
	}

	
	public ImageBank fetchImageBank(int id) {
		try {
			String query = "Select * from imagebank where id = ?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setInt(1, id);
			
			ResultSet rs= p.executeQuery();
			
			while (rs.next()) {
				return new ImageBank(
						rs.getInt("id"),
						rs.getString("url")
						);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return new ImageBank();
	}

	

	
}
