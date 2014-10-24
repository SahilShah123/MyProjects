<%@ page import="java.sql.*" %><%
String catsubname=request.getParameter("catsubname");
int cat_id= Integer.parseInt(request.getParameter("cat_id"));
int cat_sub_id=Integer.parseInt( request.getParameter("cat_sub_id"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
//ResultSet rst=st.executeQuery("select * from sub_category where category_id="+cat_id+";");
st.executeUpdate("UPDATE  `shop_cart`.`sub_category` SET  `sub_category_name` ='"+catsubname+"' WHERE  `sub_category`.`sub_category_id` ="+cat_sub_id+";");
out.print(request.getParameter("catsubname"));
%>