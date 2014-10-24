<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Virtual Dressing Room</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--
for menu-->
<link href="css/skins/black.css" rel="stylesheet" type="text/css" />
<link href="css/dcmegamenu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />

<script src="js/modernizr.js"></script>  
	

<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type='text/javascript' src='js/jquery.hoverIntent.minified.js'></script>
<script type='text/javascript' src='js/jquery.dcmegamenu.1.3.3.js'></script>
<script src="js/nav.js"></script>
<script src="js/jquery.bpopup-0.8.0.min.js"></script>
  <style>
a:catiden:link {color:#903;}     
a:catiden:visited {color:#093;} 
a:catiden:hover {color:#CFC;}  
a:catiden:active {color:#C03;} 	
 
#popup
{
	background-color:#fff;
	border-radius:10px 10px 10px 10px;
	box-shadow:0 0 25px 5px #999;
	color:#111;
	display:none;
	/*min-width:500px;*/
	padding:25px;
	/*min-height:250px;*/
}
</style>
</head>
<body>
<%
String session_chk=null;
session_chk=(String)session.getAttribute("admin");
if(session_chk==null)
{
	response.sendRedirect("men.jsp");
}
else{
response.setHeader("Cache-Control", "no-cache");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
%>
<input type="hidden" id="catiden" value="2" />
   <div id="div-wrapper">
     <div id="div-outer">
         <div id="div-logo">
           
         </div>
         <div id="div-logo-right">
         <!--content-->
         </div>
     </div>
     <div id="div-menu1">
       <ul id="mega-menu-1" class="mega-menu">
       <li id="wcat"><a cus="2" class="catiden">WOMEN</a></li>
       <li id="mcat"><a cus="1" class="catiden">MEN</a></li>
      </ul>
     </div> 
     <div id="div-menu2">
       <ul id="mega-menu-1" class="mega-menu">
       	<li class="active"><a href=""  style="height:40px">Hello Admin</a></li>
        <li class="active"><a id="logout" style="height:40px">Logout</a></li>
      </ul>
     </div> 
     <div id="div-v-space">
     </div>
     <div id="div-cloth-type">
       <nav>
         <ul id="nav" style="margin-top:10px">
                <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;margin-bottom:7px"> <a href="" id="">Home</a></li>
         <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;margin-bottom:7px"> <a href="" id="">category</a></li>
           <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;margin-bottom:7px" ><a href="" id="">subcategory</a></li>
             <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;margin-bottom:7px" ><a href="" id="">item</a></li>
               <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;margin-bottom:7px" ></li>
         <%/*
		 ResultSet rs=st.executeQuery("select * from sub_category where category_id=(select category_id from category where category_name='men');");
		 while(rs.next())
		 {
			 int k=rs.getInt("sub_category_id");
			 %>
           <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;" ><a href="" id="<%=k%>"><%=rs.getString("sub_category_name")%></a></li>
           <%
		  } */
		   %>
         </ul>
       </nav> 
     </div>
     <div id="div-h-space" style="width:15px">
     </div>
    <div style="width:745px;border:1px solid #005089;float:left;margin-top:10px" id="section">
   <div style="width:500px;height:500px;font:'Times New Roman', Times, serif;font-size:larger;padding-left:150px;"> <center><h1> Hello Admin. Welcome to admin panel. </h1></center>
    <hr/> </div>
    </div>
     <div class="footer">
        <div class="footer-left">
         Copy rights 2013
        </div>
        <div class="footer-right">
        <span class="social"><img src="images/facebook.png" width="30px" height="30px"/>&nbsp;&nbsp;
        <img src="images/twitter.jpeg" width="30px" height="30px"/>&nbsp;&nbsp;
        <img src="images/in.jpeg" width="30px" height="30px"/></span>
        </div>
     </div>
   </div>
 
  </body>
 <%}%>
    
<script>
$("#logout").click(function(){

$.ajax({
       url: "logoutadmin.jsp",
       success: function( data ) {
		 alert(data+"hello");
		 window.location.replace("men.jsp");
	   }
	});
	
});
$(".catiden").click(function(){
var catid = $(this).attr("cus");

$("#catiden").val(catid);

});
$("a").click(function(){
var catid=0;


if(($(this).html())=="category")
{
	$.ajax({
       url: "showcategory.jsp",
       success: function( data ) {
		 $("#section").html(data);
	   }
	});
	
}
if(($(this).html())=="subcategory")
{
	catid=$("#catiden").val();
	//alert(catid);
	$.ajax({
       url: "showsubcategory.jsp?category_id="+catid,
       success: function( data ) {
		 $("#section").html(data);
	   }
	});
	
}
if(($(this).html())=="item")
{
	catid=$("#catiden").val();
	//alert(catid);
	$.ajax({
       url: "showitems.jsp?categoryid="+catid,
       success: function( data ) {
		 $("#section").html(data);
	   }
	});
	
}
/*if(($(this).html())=="item_thumb")
{
	$.ajax({
       url: "showitemsthum.jsp?itemid=1",
       success: function( data ) {
		 $("#section").html(data);
	   }
	});*/
	


});

$(document).ready(function($){
	$('#mega-menu-1').dcMegaMenu({
		rowItems: '3',
		speed: 0,
		effect: 'slide',
		event: 'click',
		fullWidth: true
	});
});

	
;(function($) {
        $(function() {
             $('#popupimg').bPopup({	 
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
         });
     })(jQuery);

 

</script>   
<script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
  
 
</body>
</html>
