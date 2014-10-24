<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver").newInstance();Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");Statement st=con.createstatement();
st.executeUpdate("insert into user_register values('ketul','ketulshah','ketul123','admin','7383598095',21,'male','xyz',1111,2222,'jndjd','ejndjed');");
%>