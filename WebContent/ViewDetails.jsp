<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>
<%@page import="org.codehaus.jackson.map.ObjectMapper" %>
<%@page import="org.json.JSONArray" %>
<%@page import="com.caretaker.rest.*" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/geo","root","");

        ResultSet rs = null;
        List<JSONObject> details = new ArrayList();
       
        String Str1 = "";
        char acc='C';
        
        ObjectMapper mapper = new ObjectMapper();
        ServiceResponseObj resp = new ServiceResponseObj();
       
        
        
        String query = "select u.firstname,u.lastname,u.fromdate,u.todate,u.city,u.id,u.profilepicurl,u.service,c.rate,avg(r.rating) as rating from user as u, caretaker as c, rating as r where u.account='"+acc+"' and c.caretaker_id=u.id and u.id=r.caretaker_id group by u.id order by u.firstname asc";// 
        PreparedStatement pstm= con.prepareStatement(query);
		System.out.println(query);
         
           rs = pstm.executeQuery();
           JSONObject JObj = null;
           resp.services = new ArrayList<String>();
           String name="";String availfrom="";String service="";String availto=""; String city="";String star="";String profilepic="";String charge="";
           int id=0;int rid=0;
           

        while (rs.next()) {
        	
        	name=rs.getString("firstname")+" "+rs.getString("lastname");
        	availfrom=rs.getString("fromdate");
        	availto=rs.getString("todate");
        	city = rs.getString("city")+",CA";
            star = "img/star.png";
            id = rs.getInt("id");
            profilepic = rs.getString("profilepicurl");
            charge = rs.getString("rate");
            rid = Math.round(rs.getInt("rating"));
            service= rs.getString("service");
            
           /*  String[] A = rs.getString("service").split(",");
            resp.services.clear();
           
            
			for(int i=0;i<A.length ; i++)
        	{
				
        		if(A[i].equals("1"))
        		{
        			
        			 Str1 = "Pet Care";
        		}
        		
        		else if(A[i].equals("2"))
        		{
        			
        			 Str1 = "Child Care";
        		}
        		
        		else if(A[i].equals("3"))
        		{
        			 Str1 = "Old Age Care";
        		}
        		else if(A[i].equals("4"))
        		{
        			 Str1 = "Plant Care";
        		}
        		
        		//System.out.println(Str1);
        		
        		
        		 
        	}
			resp.services.add(Str1); */
			
			
			//System.out.println(resp.services);
			JObj = new JSONObject();
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
	        details.add(JObj);
        }
        
        
        
        
        JSONObject responseObj = new JSONObject();
        responseObj.put("details", details);
        String json = responseObj.toString();
        System.out.println(json);

    	out.print(json);
    }
    catch(Exception e){
        e.printStackTrace();
    }finally{
        if(con!= null){
            try{
            con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
 %>