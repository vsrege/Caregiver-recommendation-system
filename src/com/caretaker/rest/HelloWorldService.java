package com.caretaker.rest;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.jws.WebMethod;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;




@Path("/hello")
public class HelloWorldService {
 
	
//	@GET
//    @Path("/retrive")
//    @Produces("application/json")
//    @WebMethod(operationName = "retrive")
//    public String retrive(@QueryParam("id") String id) 
//    {
//        ResultSet rs = null;
//        String details = ""; 
//        ObjectMapper mapper = new ObjectMapper();
//        ServiceResponseObj response = new ServiceResponseObj();
//
//        try 
//        {
//            Class.forName("com.mysql.jdbc.Driver").newInstance();
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/geo", "root", "");
//
//            String query = "select id,service,date_format(from_date, '%m-%d-%y') as from_date,date_format(to_date, '%m-%d-%y') as to_date , rate , BlockedDates from caretaker where id =" + id;
//            
//            System.out.println(query);
//            PreparedStatement st = con.prepareStatement(query);
//            rs = st.executeQuery();
//
//
//            String Str = "" ;
//            response.careTakeId = id;
//            
//            response.services = new ArrayList<String>();
//          
//            
//            
//            while (rs.next()) 
//            	
//            {
//            	response.fromDate = rs.getString("from_date");
//            	response.toDate = rs.getString("to_date");
//            	response.Rate = rs.getInt("rate");
//            	response.BD = rs.getString("BlockedDates");
//            	String[] A = rs.getString("service").split(",");
//            	
//            	for(int i=0;i<A.length ; i++)
//            	{
//            		if(A[i].equals("1"))
//            		{
//            			
//            			 Str = "Pet Care";
//            		}
//            		
//            		else if(A[i].equals("2"))
//            		{
//            			
//            			 Str = "Child Care";
//            		}
//            		
//            		else if(A[i].equals("3"))
//            		{
//            			 Str = "Old Age Care";
//            		}
//            		else if(A[i].equals("4"))
//            		{
//            			 Str = "Plant Care";
//            		}
//            		response.services.add(Str);
//            	}
//            	
//           }
//
//            details = mapper.writeValueAsString(response);
//
//        } 
//        catch (Exception e) 
//        {
//            System.out.println(e.getMessage());
//        }   
//    
//        return details;
//    }
//	
//	
	
	
	
	@POST
	@Path("/reserve")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response postMessage(String reserveStr) {
		ObjectMapper obj = new ObjectMapper();
		ReserveObj reserve;
		String output = "";
        int rs = 0;

		try {
			reserve = obj.readValue(reserveStr, ReserveObj.class);
			output = "Jersey say Hello World!!! :" + reserve.fromDate + "name" + reserve.toDate +reserve.ID+reserve.BlDate;
		
		            Class.forName("com.mysql.jdbc.Driver");
		            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/geo", "root", "");

		            String query = "Update caretaker set BlockedDates='" + reserve.BlDate +","+ reserve.fromDate + "-" + reserve.toDate+ "'where id =" +reserve.ID;

		            PreparedStatement st = con.prepareStatement(query);
		            rs = st.executeUpdate();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Response.status(200).entity(output).build();

	}
}