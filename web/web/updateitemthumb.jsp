<%@ page import="java.sql.*" %><%
String path1=request.getParameter("path1");
String path2=request.getParameter("path2");
int itemid= Integer.parseInt(request.getParameter("itemid"));
String path3=request.getParameter("path3");
String path4=request.getParameter("path4");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
//ResultSet rst=st.executeQuery("select * from sub_category where category_id="+cat_id+";");
st.executeUpdate("UPDATE  `shop_cart`.`item_thumb` SET  `thumb_path_1` =  '"+path1+"',`thumb_path_2` =  '"+path2+"',`thumb_path_3` =  '"+path3+"' ,`thumb_path_4` = '"+path4+"' WHERE  `item_thumb`.`item_id` ="+itemid+" ;");
%>