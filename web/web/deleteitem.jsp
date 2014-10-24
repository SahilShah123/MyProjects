<%@ page import="java.sql.*" %><%
int itemid= Integer.parseInt(request.getParameter("itemid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
st.executeUpdate("DELETE FROM `shop_cart`.`item` WHERE `item`.`item_id` ="+itemid+" ;");
st.executeUpdate("DELETE FROM `shop_cart`.`item_thumb` WHERE `item_thumb`.`item_id` ="+itemid+" ;");
%>