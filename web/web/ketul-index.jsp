<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NDView - Virtual Dressing Room</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--
for menu-->
<link href="css/skins/black.css" rel="stylesheet" type="text/css" />
<link href="css/dcmegamenu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />

<!-- Syntax Highlighter -->
	<link href="css/shCore.css" rel="stylesheet" type="text/css" />
  <link href="css/shThemeDefault.css" rel="stylesheet" type="text/css" />
  <!-- Demo CSS -->
	<link rel="stylesheet" href="css/demo.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script src="js/modernizr.js"></script>  
	

<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type='text/javascript' src='js/jquery.hoverIntent.minified.js'></script>
<script type='text/javascript' src='js/jquery.dcmegamenu.1.3.3.js'></script>
<script src="js/nav.js"></script>
<script src="js/jquery.bpopup-0.8.0.min.js"></script>
<style>
#popup
{
	background-color:#fff;
	border-radius:10px 10px 10px 10px;
	box-shadow:0 0 25px 5px #999;
	color:#111;
	display:none;
	min-width:650px;
	padding:25px;
	min-height:350px;
}
</style>

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
%>
<div id="div-wrapper">
     <div id="div-outer">
         <div id="div-logo">
         <!--logo--> 
         </div>
         <div id="div-logo-right">
         <!--content-->
         </div>
     </div>
     <div id="div-menu1">
       <ul id="mega-menu-1" class="mega-menu">
       <li class="active"><a href="ketul-index.jsp">WOMEN</a></li>
       <li><a href="ketul-men.jsp">MEN</a></li>
       <li><a href="ketul-child.jsp">CHILD</a></li>
      </ul>
     </div> 
     <div id="div-menu2">
       <ul id="mega-menu-1" class="mega-menu">
       	<li class="active"><a href="" id="login">Login</a></li>
         <li class="active"><a href="" id="rgstr">REGISTER NOW</a></li>
      </ul>
     </div> 
     <div id="div-v-space">
     </div>
     <div id="div-cloth-type">
       <nav>
       <ul id="nav">
        <%
		 ResultSet rs=st.executeQuery("select * from sub_category where category_id=(select category_id from category where category_name='women');");
		 while(rs.next())
		 {
			 int k=rs.getInt("sub_category_id");
			 %>
           <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;" ><a href="#" id="<%=k%>"> <%out.print(rs.getString("sub_category_name")); %></a></li>
           <%
		   }
		   %>
           </ul>
       </nav>  
     </div>
     <div id="div-h-space" style="width:15px">
     </div>
     
     <div id="div-clothes" style="width:595px">
     <div id="container" class="cf" style="width:500px;margin:0 auto;" align="center">
	<div id="main" role="main">
      <section class="slider">
        <div class="flexslider">
          <ul class="slides">
             <% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst1=st1.executeQuery("select count(*) from item where sub_category_id=10");
int count1=0,count=0,kd=1,it=1;
int countmod=0;
String path="",name="";
if(rst1.next())
{
	count1=Integer.parseInt(rst1.getString(1));	
}
countmod=count1%9;
count=count1/9;

if(countmod>0)
{
	count+=1;
}
for(int i=0;i<count;i++)
{
ResultSet rst=st.executeQuery("select * from item where sub_category_id="+10+" limit "+(i*9)+",9");

	out.print("<li><table  border='1px'>");
		out.print("<tr height='126px'>");
	while(rst.next())
		{
		kd++;
 %>
	  <td width="15px">
      </td>
     <td width="112px" class="arrow">
    <%
	  path=rst.getString(3);
	  name=rst.getString(2);
      out.print("<div><img src='"+path+"' class='img' cus='lady_tshirt_a_"+it+"'  height='126px' width='112px' /></div>");
	  out.print(" <div ><center><span class='cloth-desc' id='lady_tshirt_a'>"+name+"</span></center></div> </td>");
	  it++;
	%>
 	    <td width="15px">
      </td>          
<%
if(kd>3)
	{
		kd=1;
		out.print("</tr><tr>");
	}
	}
		out.print("</tr></table></li>");
		}

%>
          </ul>
        </div>
      </section>
      
    </div>
  
  </div>
     </div>
     <div id="div-h-space">
     </div>
     <div id="div-h-space">
     </div>
     <div id="div-avatar-right" style="width:130px">
       <div id="div-avatar-right-top" style="width:130px">
        <center>Check New</center>
       </div>
       <div id="div-avatar-right-bottom" style="width:128px">
         <table>
          <tr height="85">
           <td><img src="images/women/000(1).png" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/women/000(2).png" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/women/000(3).png" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/women/000(4).png" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/women/000(5).png" width="99px" height="85px" /></td>
          </tr>
         </table>
       </div>
     </div>
    <div class="footer">
        <div class="footer-left">
         Copy rights 2013 with NDVIEW
        </div>
        <div class="footer-right">
        <span class="social"><img src="images/facebook.png" width="30px" height="30px"/>&nbsp;&nbsp;
        <img src="images/twitter.jpeg" width="30px" height="30px"/>&nbsp;&nbsp;
        <img src="images/in.jpeg" width="30px" height="30px"/></span>
        </div>
     </div>  
     </div>
   <!--popup-->
   <div id="popup" style="display:none;background-image:url(images/popup-bg.jpg);font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   </span>
<form  method="post">
<table align="center" style="margin-left:50px;margin-top:45px;">
<tr><td colspan="2" style="color:#F00;padding-left:140px;">Registration Form</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Name:</td><td><input type="text" id="name1" name="name" size="40px" style="border:1px solid #09F;" maxlength="30" />&nbsp;<span class="rd" id="name2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">UserName:</td><td><input type="text" id="username" name="username" size="40px" style="border:1px solid #09F;" maxlength="30" />&nbsp;<span class="rd" id="name4"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Password:</td><td><input type="password" name="password" id="password" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="password2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Contact No:</td><td><input type="text" name="cn" id="cn" style="border:1px solid #09F;" maxlength="15"/></td></tr> 
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Age:</td><td><input type="text" name="name" id="age1" style="border:1px solid #09F;" maxlength="2"/>&nbsp;<span class="rd" id="age2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Gender:</td><td class="r"><input type="radio" name="gen" id="gen" value="male" checked/> Male&nbsp;<input type="radio" id="gen" name="gen" value="female" /> Female</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Occupation:</td><td><input type="text" name="occupation" id="occupation1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="occupation2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Salary:</td><td><input type="text" name="salary" id="salary1" style="border:1px solid #09F;" maxlength="10"/>&nbsp;<span class="rd" id="salary2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Zip code:</td><td><input type="text" id="zipcode1" name="zipcode" style="border:1px solid #09F;" maxlength="10"/>&nbsp;<span class="rd" id="zipcode2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Favorite clothing:</td><td><input type="text" name="fclothing" id="fc1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="fc2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Favorite online store:</td><td><input type="text" name="fostore" id="fos1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="fos2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2"><span id="sbmt" style="margin-left:170px;"><img src="images/popup_03.jpg" /></span></td></tr>
</table>
  </form>
  </div>   
   <div id="popuplogin" style="height:50%;width:50%;display:none;background-image:url(images/popup-bg.jpg);font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
     <span>X</span>
   </span>
  
   <form action="#">
   <table align="center" style="margin-left:200px;margin-top:100px;">
   <tr><td colspan="2" style="color:#F00;padding-left:125px;">Login Form</td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td colspan="2"><span id="error" class="rd"></span></td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td class="r">User Name&nbsp;&nbsp;</td><td><input type="text" style="border:1px solid #09F;" name="user" id="user" />&nbsp;<span class="rd" id="user2"></span></td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td class="r">Password&nbsp;&nbsp;</td><td><input type="password" name="pass"style="border:1px solid #09F;" id="pass" />&nbsp;<span class="rd" id="pass2"></span></td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   <tr><td colspan="2"><span id="sbmt1" style="margin-left:125px;"><img src="images/popup_03.jpg" /></span></td></tr>
   </table>
   </form>
   </div>
    <div id="popup1" style="display:none;background-image:url(images/popup-bg.jpg);font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
   <span>X</span>
   <div id="div-avatar">
            <div id="avatar-left" >
               <span class="mov" atr="lftarr"><img src="images/ndimages/pre-butt.png" class="arrow" width="20px" height="25px" /></span>
            </div>
            <div id="avatar-middle">
               <img src="images/lady/lady_body_1.png" cus1="lady_body_1" id="oi" width="260px" height="473px" />
            </div>
            <div id="avatar-right">
               <span class="mov" atr="rghtarr"><img src="images/ndimages/for-butt.png" class="arrow" width="20px" height="25px" /></span>
            </div>
            <div id="avatar-bottom">
             <a href="upload/size add.html"><span class="trial" onmouseout="this.style.color='#fff'"  onmouseover="this.style.color='red'">Go To Trial Room</span></a>
            </div>
   </span>
   </div>           
<script>
$(document).ready(function($){
	$('#mega-menu-1').dcMegaMenu({
		rowItems: '3',
		speed: 0,
		effect: 'slide',
		event: 'click',
		fullWidth: true
	});
});
$(".img").click(function(){
	var i=$(this).attr("cus");
	alert(i);
	$.ajax({
       url: "mainwomen_ajax.jsp?n="+i,
       success: function( data ) {
		   n=1;
		   $( "#div-avatar" ).html(data);
		   $('#popup1').bPopup();
                                 }
           });
  });

$("#username").blur(function(){
	var user=$("#username").val();
	$.ajax({
       url: "username_ajax.jsp?user="+user,
       success: function( data ) {
		  alert("$$"+data+"$$");
       $( "#name4" ).html(data);
                                 }
           });
  });
  var n=1;
    $(".mov").click(function(){
	var v=$(this).attr("atr");
	var c=$("#oi").attr("cus1");
	var m=c.lastIndexOf('_');
	var f=c.substr(0,m+1);
	if(v=="lftarr")
	{
	   if(n==1)
	   {
		 n=4;  
	    }	
	   else
	    {
		 n--;
	    } 
     }	
	if(v=="rghtarr")
	{
	  if(n==4)
	   {
		 n=1;  
	    }	
	   else
	    {
		 n++;
	    }
	}
     $.ajax({
       url: "arr_ajax1.php?n="+f+n,
       success: function( data ) {
       $( "#avatar-middle" ).html(data);
                                 }
           });
	});
	
;(function($) {
        $(function() {
             $('#popup').bPopup({	 
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
         });
     })(jQuery);

 ;(function($) {
        $(function() {
            $('#rgstr').bind('click', function(e) {
                e.preventDefault();
                $('#popup').bPopup();
            });
        });
    })(jQuery);
	 (function($) {
        $(function() {
            $('#login').bind('click', function(e) {
                e.preventDefault();
				 msg=$('#login').text();
			if(msg=="Logout")
			{
			 user=$("#user").val();
			 $.ajax({
			 type: "POST",
             url: "logoutajax.jsp?user="+user,
             success: function(data) 
			           {   
						  $("#login").text("Login");
                       }
                 });
			 }
			 else
			 {
              
			    $('#popuplogin').bPopup();
			 }
            });
        });
    })(jQuery);
   $("#sbmt").click(function(){
	     $("#name2").html("");
		 $("#age2").html("");
		  $("#username").html("");
		 $("#fc2").html("");
		 $("#fos2").html("");
		 $("#password2").html("");
		 $("#occupation2").html("");
		 $("#salary2").html("");
		 $("#zipcode2").html("");	 
		 b=true;
	     err="";
	     name1=$("#name1").val();
		 username=$("#username").val();
		 age1=$("#age1").val();
		 gen=$("#gen").val();
		 occupation1=$("#occupation1").val();
		 fc1=$("#fc1").val();
		 fos1=$("#fos1").val();
		 password=$("#password").val();
		 salary1=$("#salary1").val();
		 zipcode1=$("#zipcode1").val();
		 name4=$("#name4").html();
		 cn=$("#cn").val();
		 if(name4=="username already exist")
		 {
			 err="err";
		 }
		 if(name1=="")
		 {  
		    err="err";
  		    $("#name2").html("<sup>*</sup>Required");	 
	     }
		 if(password=="")
		 {
			   err="err";
  		    $("#password2").html("<sup>*</sup>Required");	 
		 }
		 if(username=="")
		 {  
		    err="err";
  		    $("#name4").html("<sup>*</sup>Required");	 
	     }
         if(age1=="")
		 {  
		    b=false;
		    err="err";
  		    $("#age2").html("<sup>*</sup>Required");	 
	     }
		 if(b)
		 {
		     if(isNaN(age1))
		    {  
		      b=false;
		      err="err";
  		      $("#age2").html("Only Digits are allowed");	 
	        }	 
		 }
		 if(occupation1=="")
		 {  
		    err="err";
  		    $("#occupation2").html("<sup>*</sup>Required");	 
	     }
         if(fc1=="")
		 {  
		    err="err";
  		    $("#fc2").html("<sup>*</sup>Required");	 
	     }
		 if(fos1=="")
		 {  
		    err="err";
  		    $("#fos2").html("<sup>*</sup>Required");	 
	     }
		 if(salary1=="")
		 {  
		    err="err";
  		    $("#salary2").html("<sup>*</sup>Required");	 
	     }
		 if(zipcode1=="")
		 {  
		    err="err";
  		    $("#zipcode2").html("<sup>*</sup>Required");	 
	     }
	
  
		 if(err=="")
		 { 
		    alert("regajax.jsp?name="+name1+"&username="+username+"&password="+password+"&cn="+cn+"&age="+age1+"&gen="+gen+"&occupation="+occupation1+"&salary="+salary1+"&zipcode="+zipcode1+"&fostore="+fos1+"&fccloth="+fc1);
			$(document).ajaxSend(function(){
                  $("#sbmt").html("<img src='images/mapLoadBar.gif' />");
               });
		    $.ajax({
			 type: "POST",
             url: "regajax.jsp?name="+name1+"&username="+username+"&password="+password+"&cn="+cn+"&age="+age1+"&gen="+gen+"&occupation="+occupation1+"&salary="+salary1+"&zipcode="+zipcode1+"&fostore="+fos1+"&fccloth="+fc1,
             success: function(data) 
			           {   
						   $("#popup").html("Register Successfully");
                       }
                 });	 
		    $('#popup').bPopup().close(); 
		    $("#name1").val("");
			$("#name4").val("");
			$("#name2").val("");
		    $("#age1").val("");
		    $("#occupation1").val("");
		    $("#fc1").val("");
		    $("#fos1").val("");
		    $("#password").val("");
		    $("#salary1").val("");
		    $("#zipcode1").val("");
		    $("#cn").val("");
			
		 }
		});	
		 $("#sbmt1").click(function(){
		 msg=$("#login").text();
		 if(msg=="Login")
		 {

	     $("#user").html("");
		 $("#pass").html("");	 
		 err="";
		 flag=false;
	     user=$("#user").val();
		 pass=$("#pass").val();
		 if(user=="")
		 {
			err="err";
  		    $("#user2").html("<sup>*</sup>Required");	 
	     }
         if(pass=="")
		 {  
		    err="err";
  		    $("#pass2").html("<sup>*</sup>Required");	 
	     }
		 if(err=="")
		 { 
		    //alert("regajax.jsp?name="+name1+"&username="+username+"&password="+password+"&cn="+cn+"&age="+age1+"&gen="+gen+"&occupation="+occupation1+"&salary="+salary1+"&zipcode="+zipcode1+"&fostore="+fos1+"&fccloth="+fc1);
			$(document).ajaxSend(function(){
                  
               });
		    $.ajax({
			 type: "POST",
             url: "logajax.jsp?user="+user+"&pass="+pass,
             success: function(data) 
			           {   
						  if(data=="success")
						  {
					$("#login").text("Logout");
					$("#popuplogin").bPopup().close(); 
				    $("#user").val("");
			 		$("#pass").val("");	 
					//window.location.reload(true);   
						  }
						  else{
							  $("#error").html(data);
						  }
						  
                       }
                 });
		  }
		 }
		 });
		 
		 
</script>   
<script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
  
  <!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
  
  <script type="text/javascript">
    $(function(){
		
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
		 
        animation: "slide",
        start: function(slider){
			
          $('body').removeClass('loading');
        }
      });
    });
  </script>


  <!-- Syntax Highlighter -->
  <script type="text/javascript" src="js/shCore.js"></script>
  <script type="text/javascript" src="js/shBrushXml.js"></script>
  <script type="text/javascript" src="js/shBrushJScript.js"></script>
  
  <!-- Optional FlexSlider Additions -->
  <script src="js/jquery.easing.js"></script>
  <script src="js/jquery.mousewheel.js"></script>
  <script defer src="js/demo.js"></script>

</body>
</html>
<%
String user=null;
user=(String)session.getAttribute("user");
if(user==null)
{
}
else{
	%>
    <script>
	$("#login").text("Logout");
	</script>
    <%
}
%>