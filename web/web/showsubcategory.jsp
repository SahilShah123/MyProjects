<% String cat_id= request.getParameter("category_id");%>
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
<table  style="margin-left:200px;" cellspacing="0px" class="fav-table">
<tr height="50px">
<th width="150px"  class="bord1">
Sub_category Id 
</th>
<th width="150px"  class="bord1">
Sub_category Name
</th>

<th width="50px"  class="bord1">
Operation
</th>
</tr>
<%@ page import="java.sql.*" %><%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst1=st1.executeQuery("select * from sub_category where category_id="+cat_id+";");
int jh=0;
String catname="";
int subcat_id=0;
while(rst1.next())
{
	jh++;
	catname=rst1.getString(2);
	subcat_id=rst1.getInt(1);
out.print("<tr height='50px'><td class='bord1' width='150px'>"+jh+"</td><td class='bord1' width='150px'>"+catname+"</td><td width='50px' class='bord1'><a href='#' id='subcat"+subcat_id+"' subcatid="+subcat_id+" subcatname='"+catname+"' class='editsubcat'><img src='images/expand25.png' /></a><a href='#' id='subcat"+subcat_id+"' subcatid="+subcat_id+" subcatname='"+catname+"' class='deletesubcat'><img src='images/expand26.png' /></a></td></tr>");	
}
%>
</table>
<button id="subcat">add subcategory</button>

  <!-- popup div -->
   <div id="popup" style="height:50%;width:50%;display:none;background-color:#CCC;font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
   <form method="post">
   	<table align="center">
    <tr><td colspan="2" style="color:#F00;padding-left:140px;">Update Sub Category</td></tr>
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
 <tr> <td class="r">Sub Category Name :</td> <td><input type="text" id="catname"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2" class="r"><input type="text" id="catid"  /></td></tr>
  <tr><td colspan="2" class="r"><button id="update"> Update </button>
</td></tr></table></form>
   </div>  
   <div id="popup1" style="height:50%;width:50%;display:none;background-color:#CCC;font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
   <form method="post">
   	<table align="center" class="fav-table" width="630px" height="320px">
    <tr><th colspan="2" style="color:white;" ><h2>Add New SubCategory</h2></th></tr>
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
 <tr> <td class="r" class="bord1">Sub Category Name :</td> <td class='bord1'><input type="text" id="subcatname"  /></td></tr>
  <tr><td colspan="2" class="r" align="center" class='bord1'><button id="addsub"> Add</button>
</td></tr></table></form>
   </div>  
   <script>
   $(".editsubcat").click(function(){
			 var name = $(this).attr("subcatname");
			 $("#catname").val(name);
			 var id=$(this).attr("subcatid");
			  $("#catid").val(id);
		   $('#popup').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
});
 $("#update").click(function(){
		 catsubname=$("#catname").val();
		 cat_id=$("#cate_id").val();
		 cat_sub_id=$("#catid").val();
		    $.ajax({
			 type: "POST",
             url: "updatesubcat.jsp?catsubname="+catsubname+"&cat_id="+cat_id+"&cat_sub_id="+cat_sub_id,
             success: function(data) 
			           {
						   alert("Hi success");
					   }
                       
                 });
		 });
		  $(".deletesubcat").click(function(){
	  var id=$(this).attr("subcatid");
			  
			  alert("hi"+id);
	  $.ajax({
		   url: "deletesubcat.jsp?subcatid="+id,
		   success: function(data) 
			           {
						   //alert("delete success");
					   }
                       
	  });
	 });
		$("#subcat").click(function(){
			
			  $('#popup1').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });

		});
		$("#addsub").click(function(){
		 subcatname=$("#subcatname").val();
		 cat_id=$("#cate_id").val();
			alert("$$"+subcatname+"$$"+cat_id);
		    $.ajax({
			 type: "POST",
             url: "addsubcat.jsp?subcatname="+subcatname+"&cat_id="+cat_id,
             success: function(data) 
			           {
						   alert("Hi success");
					   }
                       
                 });
		 });
   </script>