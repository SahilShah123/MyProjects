<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
int subcatid=Integer.parseInt(request.getParameter("subcatid"));
int catid=Integer.parseInt(request.getParameter("catid"));
%>
<table   cellspacing="0px" class="fav-table">
<tr height="50px" >
<th width="30px"  class="bord1">
Item Id 
</th>
<th width="100px"  class="bord1">
Item Name
</th>
<th width="100px"  class="bord1">
Item Path
</th>
<th width="100px"  class="bord1">
Price
</th>
<th width="100px"  class="bord1">
Quantity
</th>
<th width="100px"  class="bord1">
Brand
</th><th width="100px"  class="bord1">
Status
</th>
<th width="50px"  class="bord1">
Operation
</th>
</tr>
<%
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst1=st1.executeQuery("select * from item where category_id="+catid+" and sub_category_id="+subcatid+";");
int jh=0;
String itemname="";
String itempath="";
String brand="",status="";
int price =0;
int quantity=0;
int item_id=0;
while(rst1.next())
{
	jh++;
	itemname=rst1.getString(2);
	itempath=rst1.getString(3);
	price=rst1.getInt(6);
	quantity=rst1.getInt(7);
	brand=rst1.getString(8);
	item_id=rst1.getInt(1);
	status=rst1.getString(9);
	out.print("<tr height='50px' align='center'><td class='bord1' width='30px' align='center'>"+jh+"</td><td class='bord1' width='100px'>"+itemname+"</td><td class='bord1' width='100px'><img src="+itempath+" /></td><td class='bord1' width='100px'>"+price+"</td><td class='bord1' width='100px'>"+quantity+"</td><td class='bord1' width='100px'>"+brand+"</td><td class='bord1' width='100px'>"+status+"</td>");
	Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st2=con2.createStatement();
ResultSet rst2=st2.executeQuery("select * from item_thumb where item_id="+item_id+";");
String path1="",path2="",path3="",path4="";
while(rst2.next())
{
	path1=rst2.getString(2);
	path2=rst2.getString(3);
	path3=rst2.getString(4);
	path4=rst2.getString(5);
out.print("<td width='100px' class='bord1'><a href='#' id='item"+item_id+"' itemid="+item_id+" itemname='"+itemname+"' itempath='"+itempath+"' price="+price+" quantity="+quantity+" brand='"+brand+"' status='"+status+"' path1='"+path1+"' path2='"+path2+"' path3='"+path3+"' path4='"+path4+"' class='edititem'><img src='images/expand25.png' /></a><a href='#' id='item"+item_id+"' itemid="+item_id+" itemname='"+itemname+"' itempath='"+itempath+"' price="+price+" quantity="+quantity+" brand='"+brand+"' status='"+status+"' path1='"+path1+"' path2='"+path2+"' path3='"+path3+"' path4='"+path4+"' class='deleteitem'><img src='images/expand26.png' /></a></td></tr>");	
}
}
%>
</table>
<button id="additem">add item</button>
<script>
$(".edititem").click(function(){
			 var itemname = $(this).attr("itemname");
			 $("#itemname").val(itemname);
			 var id=$(this).attr("itemid");
			  $("#itemid").val(id);
			   var itempath = $(this).attr("itempath");
			 $("#itempath").val(itempath);
			  var price = $(this).attr("price");
			 $("#price").val(price);
			  var quantity = $(this).attr("quantity");
			 $("#quantity").val(quantity);
			 var brand = $(this).attr("brand");
			 $("#brand").val(brand);
			  var status = $(this).attr("status");
			 $("#status").val(status);
			  var path1 = $(this).attr("path1");
			 $("#itemthumb1").val(path1);
			 var path2 = $(this).attr("path2");
			 $("#itemthumb2").val(path2);
			 var path3 = $(this).attr("path3");
			 $("#itemthumb3").val(path3);
			 var path4 = $(this).attr("path4");
			 $("#itemthumb4").val(path4);
			 var id=$(this).attr("itemid");
			  $("#itemid").val(id);
			  
		   $('#popupitem').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
});
 $(".deleteitem").click(function(){
	  var id=$(this).attr("itemid");
			  
			  alert("hi12"+id);
	  $.ajax({
		   url: "deleteitem.jsp?itemid="+id,
		   success: function(data) 
			           {
						   alert("delete successfully");
					   }
                       
	  });
	  location.reload();
	 });
	 
	 $("#add122").click(function(){
			  
		 item_name=$("#item_name").val();
		 catid=$("#cate_id").val();
		 subcatid=$("#sub_cat_id").val();
		 item_path=$("#item_path").val();
		 price=$("#prc").val();
		 quantity=$("#qua").val();
		 brand=$("#brd").val();
		 
		 status=$("#sts").val();
		  path1= $("#addpath1").val();
		 path2= $("#addpath2").val();
		 path3= $("#addpath3").val();
		 path4= $("#addpath4").val();
		// alert(path1+path2+path3+path4);
		 
		    $.ajax({
			 type: "POST",
             url: "additem.jsp?itemname="+item_name+"&catid="+catid+"&itempath="+item_path+"&price="+price+"&quantity="+quantity+"&brand="+brand+"&status="+status+"&subcatid="+subcatid+"&path1="+path1+"&path2="+path2+"&path3="+path3+"&path4="+path4,
             success: function(data) 
			           {
						  // alert("Hi success"+data);
					   }
                       
                 });
				// alert("back");
		 });
		 $("#additem").click(function(){
			
			
			  $('#popup123').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });

		});
</script>