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
<table  style="margin-left:200px;" cellspacing="0px" class="fav-table">
<tr height="50px">
<th width="150px"  class="bord1">
Category Id 
</th>
<th width="150px"  class="bord1">
Category Name
</th>
<th width="50px"  class="bord1">
Operation
</th>
</tr>
<%@ page import="java.sql.*" %><%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst1=st1.executeQuery("select * from category");
String catname="";
int catid=0;
while(rst1.next())
{
	catname=rst1.getString(2);
	catid=rst1.getInt(1);
out.print("<tr height='50px'><td class='bord1' width='150px'>"+catid+"</td><td class='bord1' width='150px'>"+catname+"</td><td width='50px' class='bord1'><a href='#' catid="+catid+" catname='"+catname+"' class='updatecat' ><img src='images/expand25.png'/></a><a href=''  catid="+catid+" catname='"+catname+"' class='deletecat'><img src='images/expand26.png' catid="+catid+" catname='"+catname+"' class='deletecat'/></a></td></tr>");	
}
%>
</table>
<!--  popup-->
 <div id="popupcat" style="height:50%;width:50%;display:none;background-color:#CCC;font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
   <form method="post">
   	<table align="center">
    <tr><td colspan="2" style="color:#F00;padding-left:140px;">Update Category</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
    	<tr>
   <td class="r">Category id :</td> <td><input type="text" id="catid"  /></td></tr>
            <tr><td colspan="2">&nbsp;</td></tr>
 <tr> <td class="r">Category Name :</td> <td><input type="text" id="catname"  /></td></tr>
 <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2" class="r"><button id="update12"> Update </button>
</td></tr></table></form>
   </div>  
   <script>
     $(".updatecat").click(function(){
		 	var id = $(this).attr("catid");
			$("#catid").val(id);
			 var name = $(this).attr("catname");
			 $("#catname").val(name);
		   $('#popupcat').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                   });                   
				   });
				   
	$("#update12").click(function(){
		//alert("hellooo");
		 catname=$("#catname").val();
		 catid=$("#catid").val();
		 //alert(catname+"hhi"+catid);
		    $.ajax({
			 type: "POST",
             url: "updatecat.jsp?catname="+catname+"&catid="+catid,
             success: function(data) 
			           {
						   alert("Hi success");
					   }
                       
                 });
		 });
 $(".deletecat").click(function(){
	  var id=$(this).attr("catid");
			  
			 // alert("hi"+id);
	  $.ajax({
		   url: "deletecat.jsp?catid="+id,
		   success: function(data) 
			           {
						   alert("delete successfully");
					   }
                       
	  });
	  location.reload();
	 });

</script>