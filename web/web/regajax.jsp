<%@ page import="java.sql.*"%>
<%try{
	String name1=request.getParameter("name");
	String username=request.getParameter("username");
	String gen=request.getParameter("gen");
	int age1=Integer.parseInt(request.getParameter("age"));
	String occup="Buisness";
	String fc=request.getParameter("fccloth");
	String fos=request.getParameter("fostore");
	String mail=request.getParameter("mail");
	String password=request.getParameter("password");
	
	int salary=50000;
	int zip=Integer.parseInt(request.getParameter("zipcode"));
	String cn=request.getParameter("cn");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
	Statement st=con.createStatement();
	st.executeUpdate("insert into user_register values('"+name1+"','"+username+"','"+password+"','normal','"+cn+"',"+age1+",'"+gen+"','"+occup+"',"+salary+","+zip+",'"+fc+"','"+fos+"','"+mail+"');");

}catch(Exception e)
{
	out.print(e);
}
%>