<%@ page import="java.sql.*" %>
<% String cat_id= request.getParameter("categoryid");
//String sub_cat_id= request.getParameter("subcategoryid");
%>
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
				background-color:#6985b5;					
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
				background-color:#999;					
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
<table   cellspacing="0px" class="fav-table">
<tr>
<%
int sub_cat_id=0,catid=0,i=0;
String subcatname="";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
ResultSet rst=st.executeQuery("select * from sub_category where category_id="+cat_id+";");
ResultSet rst1;
while(rst.next())
{
	i++;
	sub_cat_id=rst.getInt(1);
	subcatname=rst.getString(2);
	catid=rst.getInt(3);
	out.print("<td class='bord1 axz' width='30px' align='center'><input type='button' class='xyz'   catid='"+catid+"'  cus='"+sub_cat_id+"' value='"+subcatname+"' /></td>");
	
}%>
</tr>
</table>
<div id="mydiv1">
</div>

 
 <!-- popup1-->
 
 <div id="popup123" style="display:none;background-color:#CCC;font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
 <form method="post">
   	<table align="center" class="fav-table">
    <tr><th colspan="2" style="color:white;" ><h2>Add item</h2></th></tr>
<tr><td colspan="2">&nbsp;</td></tr>
    	<tr>
   <td class="r">Category Type :</td> <td><select id="cat_id">
   <%
   Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();

    rst1 =st1.executeQuery("select * from category;");
   			while(rst1.next())
			{
				int id=rst1.getInt(1);
				//if(id==Integer.parseInt(cat_id+""))
				//{
				//out.println("<option value='"+rst1.getInt(1)+"' selected>"+rst1.getString(2)+"</option>");
				//}else
				//{
					out.println("<option value='"+rst1.getInt(1)+"'>"+rst1.getString(2)+"</option>");
				//}
			}
   					%>
            </select></td></tr>
            <tr>
               <td class="r">SubCategory Type :</td> <td><select id="sub_cat_id">
   <% rst1 =st1.executeQuery("select * from sub_category;");
   			while(rst1.next())
			{
				int id=rst1.getInt(1);
				int id1=rst1.getInt(3);
				//if(id1==Integer.parseInt(cat_id+""))
				//{
				//if(id==Integer.parseInt(sub_cat_id))
				//{
				//out.println("<option value='"+rst1.getInt(1)+"' selected>"+rst1.getString(2)+"</option>");
				//}else
				//{
					out.println("<option value='"+rst1.getInt(1)+"'>"+rst1.getString(2)+"</option>");
				//}
				//}
			}
   					%>
            </select></td></tr>
            <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Item name :</td> <td><input type="text" id="item_name"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Item Path :</td> <td><input type="text" id="item_path"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Price :</td> <td><input type="text" id="prc"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Quantity :</td> <td><input type="text" id="qua"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Brand :</td> <td><input type="text" id="brd"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Status :</td> <td><input type="text" id="sts"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
 <tr><th colspan="2" style="color:white;" ><h2>Add Item Thumb</h2></th></tr>
    	<tr><td class="r" class='bord1'>Thumb Path 1:</td> <td class='bord1'><input type="text" id="addpath1"  /></td></tr>
 <tr> <td class="r" class="bord1">Thumb Path 2:</td> <td class='bord1'><input type="text" id="addpath2"  /></td></tr>
  <tr> <td class="r" class="bord1">Thumb Path 3:</td> <td class='bord1'><input type="text" id="addpath3"  /></td></tr>
   <tr> <td class="r" class="bord1">Thumb Path 4:</td> <td class='bord1'><input type="text" id="addpath4"  /></td></tr>
  <tr><td colspan="2"><button id="additem"> Add </button>
</td></tr> </table></form>
   </div>  
  <!-- popup div -->
   <div id="popupitem" style="display:none;background-color:#CCC;font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
   <form method="post">
   	<table align="center" class="fav-table">
    <tr><td colspan="2"  style="color:white;">Update Sub Category</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
    	<tr>
   <td class="r">Category Type :</td> <td><select id="cate_id">
   <% rst1 =st1.executeQuery("select * from category;");
   			while(rst1.next())
			{
				int id=rst1.getInt(1);
				if(id==Integer.parseInt(cat_id))
				{
				out.println("<option value='"+rst1.getInt(1)+"' selected>"+rst1.getString(2)+"</option>");
				}else
				{
					out.println("<option value='"+rst1.getInt(1)+"'>"+rst1.getString(2)+"</option>");
				}
			}
   					%>
            </select></td></tr>
            <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Item name :</td> <td><input type="text" id="itemname"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Item Path :</td> <td><input type="text" id="itempath"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Price :</td> <td><input type="text" id="price"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Quantity :</td> <td><input type="text" id="quantity"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Brand :</td> <td><input type="text" id="brand"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr> <td class="r">Status :</td> <td><input type="text" id="status"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2" class="r"><input type="text" id="itemid"  /></td></tr>
   	<tr>
   <td class="r"> Item Thumb Path1:</td> <td><input type="text" id="itemthumb1"  /></td></tr>
            <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Item Thumb Path2:</td> <td><input type="text" id="itemthumb2"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Item Thumb Path3:</td> <td><input type="text" id="itemthumb3"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Item Thumb Path4:</td> <td><input type="text" id="itemthumb4"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2" class="r"><button id="updateitem"> Update </button>
</td></tr></table></form>
   </div>  
   <script>
    
		 $("#additem").click(function(){
			  
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
		alert(path1+path2+path3+path4);
		 
		    $.ajax({
			 type: "POST",
             url: "additem.jsp?itemname="+item_name+"&catid="+catid+"&itempath="+item_path+"&price="+price+"&quantity="+quantity+"&brand="+brand+"&status="+status+"&subcatid="+subcatid+"&path1="+path1+"&path2="+path2+"&path3="+path3+"&path4="+path4,
             success: function(data) 
			           {
						   alert("Hi success"+data);
					   }
                       
                 });
				 alert("back");
		 });
		 $(".xyz").click(function(){
			        alert("hi");
					var a = $(this).attr("cus");
					var catid = $(this).attr("catid");
					//	alert(a+"@"+catid); 
			 $.ajax({
       url:"showitem1.jsp?subcatid="+a+"&catid="+catid,
       success: function( data ) {
		 $("#mydiv1").html(data);
	   }
	});
	});
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
			  
			  alert("hi"+id);
	  $.ajax({
		   url: "deleteitem.jsp?itemid="+id,
		   success: function(data) 
			           {
						   //alert("delete success");
					   }
                       
	  });
	  location.reload();
	 });
	 	$("#additem").click(function(){
			
			
			  $('#popup123').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });

		});
 $("#updateitem").click(function(){
		 itemname=$("#itemname").val();
		 itempath=$("#itempath").val();
		 price=$("#price").val();
		 quantity=$("#quantity").val();
		 brand=$("#brand").val();
		 itemid=$("#itemid").val();
		 status=$("#status").val();
		 path1= $("#itemthumb1").val();
		 path2= $("#itemthumb2").val();
		 path3= $("#itemthumb3").val();
		 path4= $("#itemthumb4").val();
	alert(path1+path2+path3+path4);
		 
		    $.ajax({
			 type: "POST",
             url: "updateitem.jsp?itemid="+itemid+"&itemname="+itemname+"&itempath="+itempath+"&price="+price+"&quantity="+quantity+"&brand="+brand+"&status="+status+"&path1="+path1+"&path2="+path2+"&path3="+path3+"&path4="+path4,
             success: function(data) 
			           {
						 alert("Hi success");
					   }
                       
                 });
		 });
   </script>