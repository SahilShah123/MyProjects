<%@ page import="java.sql.*" %><%
String address=request.getParameter("s_add");
String user=(String)session.getAttribute("user");
int orderid=0;
int total=Integer.parseInt(request.getParameter("total"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into order_detail values(null,'"+user+"','"+address+"',"+total+")");
if(i==1)
{
ResultSet rst=st.executeQuery("select * from order_detail order by order_id DESC");
rst.next();
orderid=rst.getInt("order_id");	
}
String item=(String)session.getAttribute("item_code");
String quant=(String)session.getAttribute("quant");
String item1[]=item.split("%");
String quant1[]=quant.split("%");
int finquant=0;
for(int k=0;k<item1.length;k++)
{
	ResultSet rst1=st.executeQuery("select * from item where item_id="+item1[k]);
	rst1.next();
	int price=rst1.getInt("price");
	int actquant=rst1.getInt("quantity");
	finquant=(actquant-Integer.parseInt(quant1[k]));
	st.executeUpdate("insert into order_history values("+orderid+","+item1[k]+","+quant1[k]+","+price+")");
	st.executeUpdate("Update item set quantity="+finquant+" where item_id="+item1[k]+" ");
}

out.print("success");
%>