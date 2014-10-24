<script src="js/jquery.min.js"></script>
<style>
.bord1
{
	border : 1px black solid;
	font-size:14px;
	font-family:Verdana, Geneva, sans-serif;
	font-style:normal;
}
.fav-table th
			{
				color:white;
				background-color:#212121;					
				padding:5px;
				border:solid 1px #BBB;
			}
.fav-table table
			{
				margin:5px;
				
			}
.fav-table table th
			{
				color:white;
				background-color:#111;					
				padding:5px;
				border:solid 1px #BBB;
			}
.fav-table td
			{
				padding:5px;
				border:solid 1px #CCCCCC;
			}
.fav-table tr
			{
				background-color:#f6f6f6;
			}
.fav-table tr:hover
			{
				background-color:#E0E0E0; /*:#e7e5da   #bc3604*/
				color:#F00;
			}
</style>
<div style="width:585px;float:left" >
<table border="1px" class="fav-table" width="585px">
<tr><th>Item Code</th><th>Item Name</th><th>Quantity</th><th>Item</th><th>Price(1-qty)</th><th>total</th><th>Operation</th></tr>
<%@ page import="java.sql.*" %><%
String item=(String)session.getAttribute("item_code");
String quant=(String)session.getAttribute("quant");
int gtotal=0;
String item1[]=item.split("%");
String quant1[]=quant.split("%");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
for(int i=0;i<item1.length;i++)
{
	ResultSet rst=st.executeQuery("select item_path,price,item_name from item where item_id="+item1[i]);
	rst.next();
	String path=rst.getString("item_path");
	int price=rst.getInt("price");
	int total=price*(Integer.parseInt(quant1[i]));
	gtotal+=total;
	String name=rst.getString("item_name");
out.print("<tr><td>"+item1[i]+"</td><td>"+name+"</td><td>"+quant1[i]+"</td><td><img src='"+path+"' /></td><td>&#8377;&nbsp"+ price+"</td><td>&#8377;&nbsp"+total+"</td><td align='center' id="+item1[i]+"><img  src='images/expand26.png' id='"+item1[i]+"-"+quant1[i]+"'  class='lk'/></td></tr>");	
	
}
%>
<tr><td colspan="5"></td><td >&#8377;<span id="gtotal"><%=gtotal%></span></td><td><button id="chkout" >Check Out</button></td></tr>
</table>
</div>
<div id="shippopup" style="display:none;background-image:url(images/popup-bg.jpg);font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
   <table class="fav-table">
   
   <tr>
   <th colspan="2">
   Hello&nbsp;<%=(String)session.getAttribute("user")%>  
   </th>

   </tr>
   <tr>
   <td ><span style="margin-top:0px;color:#212121">Please Provide <br />Shipping Address:</span>
   </td>
   <td>
   <textarea rows="10" cols="35" id="s_add">
</textarea><span id="err" class="rd"></span>
   </td>
   </tr>
   <tr>
   <td colspan="2">
   <button id="proc">Proceed</button>
   </td>
   </tr>
   </table>
   </div>
<script>
$(".lk").click(function(){
	var n = $(this).attr("id");
	
$.ajax({
       url: "deletecart.jsp?id="+n,
       success: function( data ) {
		   $.ajax({
             url: "showcart.jsp",
             success: function(data) 
			           { 
					   $("#slide12").html(data);					   
					   }
  
  });
		
	   }
	});	
	
	});
	
$("#chkout").click(function(){
	 $('#shippopup').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
                                 });

$("#proc").click(function(){
	var address=$("#s_add").val();
	if(address=="")
	{
	$("#err").text("*required");
	}
	else{
		$("#err").text("");
		var total=$("#gtotal").html();
		$.ajax({
			url:"addship.jsp?s_add="+address+"&total="+total,
			success:function(data)
			{
			if(data=="success")
			{
			 $('#shippopup').bPopup().close();
			 $.ajax({
			url:"addship.jsp?s_add="+address+"&total="+total,
			success:function(data)
			{
			window.location.replace("mail");
			}
			 });
			  	
			}
			else{
				
				
			}
			}
		});
	}
});
</script>

