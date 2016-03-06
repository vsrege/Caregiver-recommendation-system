package com.caretaker.rest;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.simple.JSONObject;

@Path("/authenticate")
public class Authenticate {

	
Connection conn = null;
	
	public Connection connect() throws SQLException{
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/geo", "root", "");
			if(!conn.isClosed()){
				System.out.println("Connection Successful");
				
			}else{
				System.out.println("Connection Error!!");
			}
			 
		   
		     
		}
			catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	return conn;		
	}
	
	
	
	
	@POST
	public String authenticate(String data, @QueryParam("email") String email,
			@QueryParam("pass") String pass) throws Exception {
		Connection conn = connect();
		//List<JSONObject> details = new ArrayList();
		JSONArray fname=new JSONArray();
		JSONArray caretaker = new JSONArray();
		JSONArray uid = new JSONArray();
		
		System.out.println(data);
		
		 
		
			String query = "SELECT COUNT(*),firstname,account,id FROM user WHERE email = '" + email
					+ "' AND password = '" + getHash(pass) + "'";
			System.out.println(query);
			
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.execute();
			ResultSet rs = stmt.getResultSet();
			JSONObject final_obj = new JSONObject();
			rs.first();
			int cnt = rs.getInt(1);
			
			
			
			
				fname.put(rs.getString(2));
				String acc = rs.getString(3);
				uid.put(rs.getInt(4));
				caretaker.put(data);
			
			final_obj.put("firstname", fname);
			final_obj.put("caretaker", caretaker);
			final_obj.put("acc", acc);
			final_obj.put("uid", uid);
			
			
			String finalObj = final_obj.toString();	
			System.out.println(finalObj);
			System.out.println("I passed");
			if(conn!=null)
			{
				conn.close();
			}
			return finalObj;
			
		
	}

	public String getHash(String str) throws Exception {

		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(str.getBytes());

		byte byteData[] = md.digest();

		// convert the byte to hex format method 1
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
					.substring(1));
		}

		String hex = sb.toString();
		return hex;

	}
}