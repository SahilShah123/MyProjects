<%@ page import="java.sql.*" %><%
String itemname=request.getParameter("itemname");
String itempath=request.getParameter("itempath");
int itemid= Integer.parseInt(request.getParameter("itemid"));
int price= Integer.parseInt(request.getParameter("price"));
int quantity= Integer.parseInt(request.getParameter("quantity"));
String brand=request.getParameter("brand");
String status=request.getParameter("status");
String path1=request.getParameter("path1");
String path2=request.getParameter("path2");
String path3=request.getParameter("path3");
String path4=request.getParameter("path4");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
st.executeUpdate("UPDATE  `shop_cart`.`item` SET  `item_name` =  '"+itemname+"',`item_path` =  '"+itempath+"',`price` =  "+price+",`quantity` =  "+quantity+",`brand` =  '"+brand+"',`status` =  '"+status+"' WHERE  `item`.`item_id` ="+itemid+";");

Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
st1.executeUpdate("UPDATE  `shop_cart`.`item_thumb` SET  `thumb_path_1` =  '"+path1+"',`thumb_path_2` =  '"+path2+"',`thumb_path_3` =  '"+path3+"' ,`thumb_path_4` = '"+path4+"' WHERE  `item_thumb`.`item_id` ="+itemid+" ;");
%>
