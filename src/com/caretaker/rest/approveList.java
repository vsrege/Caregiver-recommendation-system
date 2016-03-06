package com.caretaker.rest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



@Path("/approveList") 
public class approveList {
	
	
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
	

	

	  
		@GET
		@Path("/viewapprovalList")
		@Produces("text/html")
		public String viewList(String data,@Context HttpServletRequest request,
			      @Context HttpServletResponse response)throws Exception{
			
			System.out.println(data);
	        Connection conn = connect();
			
				     
				 //char acc='C';
				String query = "select id,firstname,lastname,service,address1,city,proofurl,prooftype from user where status='P'";
				System.out.println("This query"+query);
				JSONArray uid = new JSONArray();
				JSONArray fname=new JSONArray();
				JSONArray lname=new JSONArray();
				JSONArray service=new JSONArray();
				JSONArray address = new JSONArray();
				JSONArray city = new JSONArray();
				JSONArray proofurl = new JSONArray();
				JSONArray prooftype = new JSONArray();
				JSONObject final_obj = new JSONObject();
				
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs1 = stmt.executeQuery(query);
				String proof="";
				while(rs1.next())
				{
					
					uid.put(rs1.getInt(1));
					fname.put(rs1.getString(2));
					lname.put(rs1.getString(3));
					service.put(rs1.getString(4));
					address.put(rs1.getString(5));
					city.put(rs1.getString(6));
					proofurl.put(rs1.getString(7));
					if(rs1.getString(8)=="P"){ proof="Passport";}
					else if(rs1.getString(8)=="L"){ proof="License";}
					else{proof="State Id";}
					prooftype.put(proof);
					
				
				}
				
				final_obj.put("uid", uid);
				final_obj.put("fname", fname);
				final_obj.put("lname", lname);
				final_obj.put("service", service );
				final_obj.put("address", address );
				final_obj.put("city", city );
				final_obj.put("proofurl", proofurl );
				final_obj.put("prooftype", prooftype );
				
				
				String finalObj = final_obj.toString();
				System.out.println("JSON approvallist"+finalObj);
				if(conn!=null)
				{
					conn.close();
				}
				return finalObj;
	       	
				
				
			}
			
			
			
		@POST
		@Path("/updateapprovalList")
		//@Produces(MediaType.TEXT_PLAIN)
		@Produces("text/html")
		//@Consumes(MediaType.APPLICATION_JSON)
		public String updateList(String data,@Context HttpServletRequest request,
			      @Context HttpServletResponse response)throws Exception{
			
			System.out.println(data);
	        String details = ""; 
	        Connection conn = connect();
			
				     
				 //char acc='C';
				String query = "update user set status='A' where id='"+data+"'";
				System.out.println("This query"+query);
				
				
				PreparedStatement stmt = conn.prepareStatement(query);
				int rowcount = stmt.executeUpdate();
				System.out.println(rowcount);
				String s=new String();
				if(rowcount>0){
					s="success";
				}
				else{
					s="failure";
				}
				if(conn!=null)
				{
					conn.close();
				}
				return s;
				
			}
			
			
	
		@POST
		@Path("/viewCaretakerProfile")
		
		@Produces("text/html")
		
		public String viewProfile(String data,@Context HttpServletRequest request,
			      @Context HttpServletResponse response)throws Exception{
			
			
	       
	        String Str=""; 
	        ServiceResponseObj resp = new ServiceResponseObj();
	        Connection conn = connect();
			
				 
	        String query = "select u.firstname,u.lastname,u.address1,u.city,u.pincode,date_format(u.fromdate, '%m/%d/%y') as fromdate,date_format(u.todate, '%m/%d/%y') as todate,u.profilepicurl,u.id,c.service,c.rate,c.BlockedDates from user as u,caretaker as c where u.id='"+data+"' and c.caretaker_id=u.id";
	       	
			String query2 = "select r.customer_id,r.rating,r.comments,u.firstname from rating as r,user as u where r.caretaker_id='"+data+"' and r.customer_id=u.id";
				
				
				JSONArray fname=new JSONArray();
				JSONArray lname=new JSONArray();
				JSONArray service=new JSONArray();
				JSONArray address = new JSONArray();
				JSONArray city = new JSONArray();
				JSONArray pincode = new JSONArray();
				JSONArray profilepicurl = new JSONArray();
				JSONArray fromdate = new JSONArray();
				JSONArray uid = new JSONArray();
				JSONArray todate = new JSONArray();
				JSONArray custid = new JSONArray();
				JSONArray rating = new JSONArray();
				JSONArray comments = new JSONArray();
				JSONArray custname = new JSONArray();
				JSONArray charge = new JSONArray();
				JSONArray BD = new JSONArray();
				JSONObject final_obj = new JSONObject();
				
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs1 = stmt.executeQuery(query);
				String proof="";
				resp.services = new ArrayList<String>();
				while(rs1.next())
				{
					
					
					fname.put(rs1.getString(1));
					lname.put(rs1.getString(2));
					address.put(rs1.getString(3));
					city.put(rs1.getString(4));
					pincode.put(rs1.getString(5));
					fromdate.put(rs1.getString(6));
					todate.put(rs1.getString(7));
					profilepicurl.put(rs1.getString(8));
					uid.put(rs1.getInt(9));
					charge.put(rs1.getString(11));
					BD.put(rs1.getString(12));
					String[] A = rs1.getString(10).split(",");
					
					for(int i=0;i<A.length ; i++)
	            	{
	            		if(A[i].equals("1"))
	            		{
	            			
	            			 Str = "Pet Care";
	            		}
	            		
	            		else if(A[i].equals("2"))
	            		{
	            			
	            			 Str = "Child Care";
	            		}
	            		
	            		else if(A[i].equals("3"))
	            		{
	            			 Str = "Old Age Care";
	            		}
	            		else if(A[i].equals("4"))
	            		{
	            			 Str = "Plant Care";
	            		}
	            		
	            		resp.services.add(Str);
	            		
	            	}
					service.put(resp.services);
				}
				System.out.println(resp.services);
				PreparedStatement stmt2 = conn.prepareStatement(query2);
				ResultSet rs2 = stmt.executeQuery(query2);
				
				while(rs2.next())
				{
				
					custid.put(rs2.getInt(1));
					rating.put(rs2.getInt(2));
					comments.put(rs2.getString(3));
					custname.put(rs2.getString(4));
					
				
				}
				
				
				final_obj.put("fname", fname);
				final_obj.put("lname", lname);
				final_obj.put("address", address );
				final_obj.put("city", city );
				final_obj.put("pincode", pincode );
				final_obj.put("service", service);
				final_obj.put("fromdate", fromdate );
				final_obj.put("todate", todate );
				final_obj.put("profilepicurl", profilepicurl );
				final_obj.put("uid", uid );
				final_obj.put("charge", charge );
				final_obj.put("custid", custid );
				final_obj.put("rating", rating );
				final_obj.put("comments", comments );
				final_obj.put("custname", custname );
				final_obj.put("BD", BD);
				
				
				String finalObj = final_obj.toString();
				
				System.out.println("JSON approvallist"+finalObj);
				if(conn!=null)
				{
					conn.close();
				}
				return finalObj;
	       	
				
			}
			
		
		
		//sorting servicewise
//		@POST
//		@Path("/getService")
//		@Produces("text/html")
//		public String getService(String data,@Context HttpServletRequest request,
//			      @Context HttpServletResponse response)throws Exception{
//			
//			System.out.println(data);
//	        String details = "";
//	        String Str=""; 
//	        ObjectMapper mapper = new ObjectMapper();
//	        ServiceResponseObj resp = new ServiceResponseObj();
//	        Connection conn = connect();
//	        char acc='C';
//				     
//				
//	        String query = "select u.firstname,u.lastname,u.fromdate,u.todate,u.city,u.id,u.profilepicurl,u.service,c.rate,r.rating from user as u, caretaker as c, rating as r where u.account='"+acc+"' and c.service in ("+data+")c.caretaker_id=u.id and u.id=r.caretaker_id group by u.id order by u.firstname asc"; 
//	        
//				
//				JSONArray fname=new JSONArray();
//				JSONArray lname=new JSONArray();
//				JSONArray service=new JSONArray();
//				JSONArray address = new JSONArray();
//				JSONArray city = new JSONArray();
//				JSONArray pincode = new JSONArray();
//				JSONArray profilepicurl = new JSONArray();
//				JSONArray fromdate = new JSONArray();
//				JSONArray uid = new JSONArray();
//				JSONArray todate = new JSONArray();
//				JSONArray custid = new JSONArray();
//				JSONArray rating = new JSONArray();
//				JSONArray comments = new JSONArray();
//				JSONArray custname = new JSONArray();
//				JSONArray charge = new JSONArray();
//				JSONArray BD = new JSONArray();
//				JSONObject final_obj = new JSONObject();
//				
//				PreparedStatement stmt = conn.prepareStatement(query);
//				ResultSet rs1 = stmt.executeQuery(query);
//				String proof="";
//				resp.services = new ArrayList<String>();
//				while(rs1.next())
//				{
//					
//					
//					fname.put(rs1.getString(1));
//					lname.put(rs1.getString(2));
//					address.put(rs1.getString(3));
//					city.put(rs1.getString(4));
//					pincode.put(rs1.getString(5));
//					fromdate.put(rs1.getString(6));
//					todate.put(rs1.getString(7));
//					profilepicurl.put(rs1.getString(8));
//					uid.put(rs1.getInt(9));
//					charge.put(rs1.getString(11));
//					BD.put(rs1.getString(12));
//					String[] A = rs1.getString(10).split(",");
//					
//					for(int i=0;i<A.length ; i++)
//	            	{
//	            		if(A[i].equals("1"))
//	            		{
//	            			
//	            			 Str = "Pet Care";
//	            		}
//	            		
//	            		else if(A[i].equals("2"))
//	            		{
//	            			
//	            			 Str = "Child Care";
//	            		}
//	            		
//	            		else if(A[i].equals("3"))
//	            		{
//	            			 Str = "Old Age Care";
//	            		}
//	            		else if(A[i].equals("4"))
//	            		{
//	            			 Str = "Plant Care";
//	            		}
//	            		
//	            		resp.services.add(Str);
//	            		
//	            	}
//					service.put(resp.services);
//				}
//				System.out.println(resp.services);
//				//PreparedStatement stmt2 = conn.prepareStatement(query2);
//				//ResultSet rs2 = stmt.executeQuery(query2);
//				
////				while(rs2.next())
////				{
////				
////					custid.put(rs2.getInt(1));
////					rating.put(rs2.getInt(2));
////					comments.put(rs2.getString(3));
////					custname.put(rs2.getString(4));
////					
////				
////				}
////				
//				
//				final_obj.put("fname", fname);
//				final_obj.put("lname", lname);
//				final_obj.put("address", address );
//				final_obj.put("city", city );
//				final_obj.put("pincode", pincode );
//				final_obj.put("service", service);
//				final_obj.put("fromdate", fromdate );
//				final_obj.put("todate", todate );
//				final_obj.put("profilepicurl", profilepicurl );
//				final_obj.put("uid", uid );
//				final_obj.put("charge", charge );
//				final_obj.put("custid", custid );
//				final_obj.put("rating", rating );
//				final_obj.put("comments", comments );
//				final_obj.put("custname", custname );
//				final_obj.put("BD", BD);
//				
//				
//				String finalObj = final_obj.toString();
//				
//				System.out.println("JSON approvallist"+finalObj);
//				return finalObj;
//	       	
//				
//			}
		
		
		
		

		@POST
		@Path("/insertRating")
		@Produces("text/html")
		public String insertRating(String data,@Context HttpServletRequest request,
			      @Context HttpServletResponse response)throws Exception{
			
	  
	        Connection conn = connect();
	        
	        JSONParser parser = new JSONParser();
			Object obj = parser.parse(data);
			JSONObject jsonObject = (JSONObject) obj;
			
			String rating= (String) jsonObject.get("rating");
			String customerid = (String) jsonObject.get("customerid");
			String caretaker = (String) jsonObject.get("caretaker");
			String comment = (String) jsonObject.get("comment");
			
			String query = "INSERT into rating(caretaker_id,customer_id,rating,comments) values (?, ?, ?, ?)";
			System.out.println(query);
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, caretaker);
			stmt.setString(2, customerid);
			stmt.setString(3, rating);
			stmt.setString(4, comment);
			int rowcount = stmt.executeUpdate();
			String result="";
		if(rowcount>0)
		{
			
			System.out.println("Comments added successfully!");
			result="Your review is recorded!";
		}
		if(conn!=null)
		{
			conn.close();
		}
				return result;
	       	
				
			}
			
			

		
		@POST
		@Path("/getServiceByCost")
		
		@Produces("text/html")
		
		public String getServiceByCost(String data,@Context HttpServletRequest request,
			      @Context HttpServletResponse response)throws Exception{
			
			
	
	        Connection conn = connect();
	        
	        String[] arr = new String[]{};
			arr = data.split(",");
			char acc='C';
	       
			JSONObject JObj = new JSONObject();
	        
	        
	        JSONArray name=new JSONArray();
			JSONArray availfrom=new JSONArray();
			JSONArray availto=new JSONArray();
			JSONArray city = new JSONArray();
			JSONArray star = new JSONArray();
			JSONArray id = new JSONArray();
			JSONArray profilepic = new JSONArray();
			JSONArray charge = new JSONArray();
			JSONArray rid = new JSONArray();
			JSONArray service = new JSONArray();
			
			
			String query = "select u.firstname,u.lastname,u.fromdate,u.todate,u.city,u.id,u.profilepicurl,u.service,c.rate,avg(r.rating) as rating from user as u, caretaker as c, rating as r where u.account='"+acc+"' and c.rate between '"+arr[0]+"' and '"+arr[1]+"' and c.caretaker_id=u.id and u.id=r.caretaker_id group by u.id order by u.firstname asc";// 
	        System.out.println(query);
	        PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery(query);
	        while (rs.next()) {
			
	        name.put(rs.getString("firstname")+" "+rs.getString("lastname"));
        	availfrom.put(rs.getString("fromdate"));
        	availto.put(rs.getString("todate"));
        	city.put(rs.getString("city")+",CA");
            star.put("img/star.png");
            id.put(rs.getInt("id"));
            profilepic.put(rs.getString("profilepicurl"));
            charge.put(rs.getString("rate"));
            rid.put(Math.round(rs.getInt("rating")));
            service.put(rs.getString("service"));
            
           
	        
				
			}
	        JObj.put("name", name);
	        JObj.put("service", service);
	        JObj.put("availfrom", availfrom);
	        JObj.put("availto", availto);
	        JObj.put("city", city);
	        JObj.put("charge", charge);
	        JObj.put("rating", star);
	        JObj.put("id", id);
	        JObj.put("profilepic", profilepic);
	        JObj.put("rating", rid);
	        
	        String finalObj = JObj.toString();
	        System.out.println(finalObj);
	        System.out.println("JSON list"+finalObj);
	        if(conn!=null)
			{
				conn.close();
			}
			return finalObj;
		}	

}
