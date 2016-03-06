<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/geo","root","");
  //System.out.println("hello");
        ResultSet rs = null;
        List<JSONObject> details = new ArrayList();
       

          String query = "SELECT  u.firstname, u.lastname , u.service , u.coordinates, u.id, r.rating from user as u,rating as r  where u.account='c' and u.id=r.caretaker_id ;";
          PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject JObj = null;

        while (rs.next()) {
            String firstname = rs.getString("firstname");
            String lastname = rs.getString("lastname");
            String service = rs.getString("service");
            String cord = rs.getString("coordinates");
            String id = rs.getString("id");
            int rating = rs.getInt("rating");
            JObj = new JSONObject();
            JObj.put("firstname", firstname);
            JObj.put("lastname", lastname);
            JObj.put("service", service);
            JObj.put("cord", cord);
            JObj.put("id", id);
            JObj.put("rating", rating);
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