<style>
#img
{
position:absolute;
}
</style>
<%@ page import="java.sql.*" %><%
int i=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
ResultSet rst=st.executeQuery("select * from item_thumb where item_id="+i);
rst.next();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con.createStatement();
ResultSet rst1=st1.executeQuery("select * from item where item_id="+i);
rst1.next();
int quantity=rst1.getInt("quantity");;
%>
<div id="popupimg" style="display:none;background-color:#CCF;;font-family:Verdana, Geneva, sans-serif;"><span class="button bClose">
<span>X</span>
</span>
<div style="float:left;width:496px;height:600px; ">
    <div style="width:495px;height:325px">
    
    	<!--<div style="width:400px;height:200px; margin:100px 50px;border:1px solid white">-->
        			<div style="float:left;width:200px;height:198px;border:1px solid white"> 
        					<a href="#" id="<%=i%>" ><img src="<%=rst1.getString(3)%>"  width="150px" height="200px"/></a>
        			</div>
       <div style="float:left;width:290px;height:198px;border:1px solid white">
        	Price :  &#8377;&nbsp; <%=rst1.getInt("price")%><br /><br /><br />
            Quantity: <select style="width:100px;" id="quant"><% for(int k=1;k<=quantity;k++){%><option ><%=k%></option><%}%></select><br /><br />
             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="button" id="cart" style="background-image:url(images/Untitled.png);height:35px;width:90px;margin:20px 50px;" />
        </div>
       
   </div>
     <div style="width:495px">
     <div style="float:left;width:121px;height:172px;border:1px solid white;"><a href="#" ><img src="<%=rst.getString(2)%>.png" width="121px" height="172px"/></a></div> <div style="float:left;width:121px;height:172px;border:1px solid white;"><a href="#" ><img src="<%=rst.getString(3)%>.png" width="121px" height="172px"/></a></div> <div style="float:left;width:121px;height:172px;border:1px solid white;"><a href="#" ><img src="<%=rst.getString(4)%>.png" width="121px" height="172px"/></a></div> <div style="float:left;width:120px;height:172px;border:1px solid white;"><a href="#" ><img src="<%=rst.getString(5)%>.png" width="121px" height="172px"/></a></div>
     </div>
</div>

<div style="float:left;width:495px;height:600px;">
<%
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st2=con.createStatement();
ResultSet rst2=st2.executeQuery("select category_name from category where category_id=(select category_id from item where item_id="+i+")");
rst2.next();
String img="";
String cus1="";
int width=0,height=0;
if(rst2.getString(1).equals("Men"))
{
img="images/man/man_body_1.png";
//img="images/men-1.jpg";
cus1="man_body_1";
if(rst1.getInt(5)==1)
{
	width=100;
	height=140;
	
	out.print("<script>$('#img').css('margin-left','11px')</script>");
	out.print("<script>$('#img').css('margin-top','20px')</script>");
}
if(rst1.getInt(5)==2)
{
	width=128;
	height=220;
	
	out.print("<script>$('#img').css('margin-left','-5px')</script>");
	out.print("<script>$('#img').css('margin-top','140px')</script>");
}
if(rst1.getInt(5)==4)
{
	width=128;
	height=140;
	
	out.print("<script>$('#img').css('margin-left','-5px')</script>");
	out.print("<script>$('#img').css('margin-top','140px')</script>");
}
if(rst1.getInt(5)==5)
{
	width=128;
	height=140;
	
	out.print("<script>$('#img').css('margin-left','11px')</script>");
	out.print("<script>$('#img').css('margin-top','22px')</script>");
}
if(rst1.getInt(5)==3)
{
	width=113;
	height=180;
}
if(rst1.getInt(5)==5)
{
	width=90;
	height=140;
}


}

else
{
img="images/lady/lady_body_1.png";
cus1="lady_body_1";	
if(rst1.getInt(5)==10)
{
	width=80;
	height=150;
	
	out.print("<script>$('#img').css('margin-left','90px')</script>");
	out.print("<script>$('#img').css('margin-top','72px')</script>");
}
if(rst1.getInt(5)==9)
{
	
	out.print("<script>$('#img').css('margin-left','67px')</script>");
	out.print("<script>$('#img').css('margin-top','45px')</script>");
	width=128;
	height=200;

}
if(rst1.getInt(5)==7)
{
	width=135;
	height=240;
	
	out.print("<script>$('#img').css('margin-left','61px')</script>");
	out.print("<script>$('#img').css('margin-top','178px')</script>");
}
if(rst1.getInt(5)==6)
{
	width=135;
	height=240;
	
	out.print("<script>$('#img').css('margin-left','61px')</script>");
	out.print("<script>$('#img').css('margin-top','45px')</script>");
}
}
%>
 <div id="div-avatar" style="margin-left:120px;width:295px;background-image:url(css/images/dressing-room-bg.png)">
          
          <div id="img"  style="width:<%=width%>px;height=<%=height%>px;background-image:url(images/women/000(1).png);z-index:2;border:1px solid red;"><img id="img1" src="<%=rst1.getString(3)%>" width="<%=width%>px" height="<%=height%>px"/></div>
            <div id="avatar-middle">
               <img src="<%=img%>" cus1="<%=cus1%>" id="oi" width="260px" height="473px" />
            </div>
           
            
     </div>
 

</div>

</div>
<input type="hidden" id="item_id" value="<%=rst1.getInt(1)%>"/>

<script>
$("#cart").click(function()
{	
var id=$("#item_id").val();
var quant=$("#quant").val();
$.ajax({
       url: "add_cart.jsp?id="+id+"&quant="+quant,
       success: function( data ) {
		$("#popupimg").bPopup().close();
		window.location.reload(); 
	   }
	});

});
 $(function() {
    $( "#img" ).draggable();
	$( "#img" ).resizable();
	 $( "#img1" ).resizable();
  });

</script>
