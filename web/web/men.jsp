<%@ page import="java.sql.*" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 
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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
     
    <style>
#popupimg
{
	background-color:#fff;
	border-radius:10px 10px 10px 10px;
	box-shadow:0 0 25px 5px #999;
	color:#111;
	display:none;
	min-width:1000px;
	padding:25px;
	min-height:600px;
}
.button
{
  background-color: #2B91AF;
}
.sbtn{
   background-color:#03F;	
  -moz-border-radius: 10px;
  border-radius: 10px;
  border: 1px solid #000;
  padding: 10px;
  cursor:pointer;
  color:#FFF;
  font-weight:bold;
}
.button:hover{background-color:#1e1e1e;color:#fff;cursor:pointer;}.button>span{font-size:84%}.button.bClose{border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px}
#img
{
position:absolute;
left:713px;
top:72px;
z-index:-1;
}
</style>
<script src="js/modernizr.js"></script>  
<script type='text/javascript' src='js/jquery.hoverIntent.minified.js'></script>
<script type='text/javascript' src='js/jquery.dcmegamenu.1.3.3.js'></script>
<script src="js/nav.js"></script>
<script src="js/jquery.bpopup-0.8.0.min.js"></script>
<script>

</script>    
</head>
<body>
<input type="hidden" id="sub"/>
<input type="hidden" value="2" id="cat_id" />
<div id="imgpop" ></div> 
<%
response.setHeader("Cache-Control", "no-cache");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
%>
   <div id="div-wrapper">
     <div id="div-outer">
         <div id="div-logo">
           
         </div>
         <div id="div-logo-right" >
         <!--content-->
         </div>
     </div>
     <div id="div-menu1">
       <ul id="mega-menu-1" class="mega-menu">
       <li class="active"><a href="index.jsp" style="height:44px">WOMEN</a></li>
       <li><a href="men.jsp" style="height:44px">MEN</a></li>
      </ul>
     </div> 
     <div id="div-menu2">
       <ul id="mega-menu-1" class="mega-menu">
       	<li class="active"><a href="" id="login" style="height:44px">Login</a></li>
         <span id="rgstr1"><li class="active"><a href="" id="rgstr" style="height:44px">REGISTER NOW</a></li></span>
      </ul>
     </div> 
     <div id="div-v-space">
     </div>
     <div id="div-cloth-type">
       <nav>
         <ul id="nav">
         <%
		 ResultSet rs=st.executeQuery("select * from sub_category where category_id=(select category_id from category where category_name='men');");
		 while(rs.next())
		 {
			 int k=rs.getInt("sub_category_id");
			 %>
           <li style="font-family:Verdana, Geneva, sans-serif;font-size:10px;" ><a href="" class="sub" id="<%=k%>"><%=rs.getString("sub_category_name")%></a></li>
           <%
		   }
		   %>
         </ul>
       </nav> 
       <div style="border:1px solid #6985b5;background-color:#343434" class="nav">
       <p>
       <pre>
  <label for="amount" style="color:white;">Price range:</label>
  <br/>
  <span style="color:white">&#8377;</span><input type="text" id="amount" style="border: 1px solid black; color: #f6931f; font-weight: bold; width:90px" readonly />
  <br/>
   <div id="slider-range" style="width:100px;margin-left:15px"></div>
  <br />
  <button id="search">Search</button>
</pre>
</p>
 
<div id="slider-range" style="width:200px"></div>
       
       </div>
     </div>
     <div id="div-h-space" style="width:15px">
     </div>
     <div id="slide12">
     <div id="div-clothes" style="width:595px;">
     <div id="container" class="cf" style="width:500px;margin:0 auto;" align="center">
	<div id="main" role="main">
      <section class="slider">
        <div class="flexslider">
        <ul class="slides">
         
<% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst1=st1.executeQuery("select count(*) from item where sub_category_id=3");
int count1=0,count=0,kd=1,it=1,i_code;
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
ResultSet rst12=st.executeQuery("select * from item where sub_category_id=3 limit "+(i*9)+",9");

	out.print("<li><table  border='1px'>");
		out.print("<tr height='126px'>");
	while(rst12.next())
		{
		kd++;
		
 %>
	<td width="15px">
             </td>
     <td width="112px" class="arrow">
    <%
	  path=rst12.getString(3);
	  name=rst12.getString(2);
	  i_code=rst12.getInt(1);
      out.print("<div ><img src='"+path+"' class='img' cus='man_tshirt_a_"+it+"' id="+i_code+" height='126px' width='112px' /></div>");
	  out.print(" <div ><center class='cloth-desc' style='height:20px;'><span  id='man_tshirt_a'>"+name+"</span></center></div> </td>");
	  it++;
	%> 
 	<td width="15px">
             </td>
             
<%
if(kd>3)
	{
		kd=1;
		out.print("</tr><tr>");
	}%>
	
      
	<%}
		out.print("</tr></table></li>");
		}

out.print("</ul>");
%>
     
        </div>
      </section>
    </div>      
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
       <div id="div-avatar-right-bottom" style="width:128px;">
         <table style="margin:0px auto">
          <tr height="85">
           <td><img src="images/men/cloths/shirt-1.jpg" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/men/cloths/shirt-2.jpg" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/men/cloths/shirt-3.jpg" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/men/cloths/shirt-4.jpg" width="99px" height="85px" /></td>
          </tr>
          <tr height="85">
           <td><img src="images/men/cloths/shirt-5.jpg" width="99px" height="85px" /></td>
          </tr>
         </table>
       </div>
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
<tr><td class="r">Email Id:</td><td><input type="text" id="mail" name="mail" size="40px" style="border:1px solid #09F;" maxlength="30" />&nbsp;<span class="rd" id="name7"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Contact No:</td><td><input type="text" name="cn" id="cn" style="border:1px solid #09F;" maxlength="15"/></td></tr> 
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Age:</td><td><input type="text" name="name" id="age1" style="border:1px solid #09F;" maxlength="2"/>&nbsp;<span class="rd" id="age2"></span></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td class="r">Gender:</td><td class="r"><input type="radio" name="gen" id="gen" value="male" checked/> Male&nbsp;<input type="radio" id="gen" name="gen" value="female" /> Female</td></tr>
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
   <div id="popuplogin" style="height:40%;width:40%;display:none;background-color:white;background-image:url(images/popup-bg.jpg);font-family:Verdana, Geneva, sans-serif;font-size:14px;"><span class="button bClose">
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
            <div id="avatar-right">
               <span class="mov" atr="rghtarr"><img src="images/ndimages/for-butt.png" class="arrow" width="20px" height="25px" /></span>
            </div>
            <div id="avatar-bottom">
             <a href="upload/size add.html"><span class="trial" onMouseOut="this.style.color='#fff'"  onmouseover="this.style.color='red'">Go To Trial Room</span></a>
            </div>
   </span>
   </div>    
        
   <script>
 $(".sub").click(function()

{	
	 var id=$(this).attr("id");
	  $("#sub").val(id);
	   $.ajax({
       url:"name12.jsp?subcat="+id,
       success: function(data) {
		   
		 // $("#slide12").html("");
		  //alert($("#slide12").html()); 
		 // alert(data);
		  $("#slide12").html(data);
		 // alert("hello");
		  //alert($("#slide12").html());
		  //alert("hello");
		  //$("#slider12").addClass("flexslider");
	    $(".flexslider").flexslider({
		
        animation: "slide",
        start: function(slider){
			// alert("hello");
          $("body").removeClass("loading");
        }
      });
       
	           }
           });
	 
 });
   </script>
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
	var i=$(this).attr("id");
	<%String user1=null;
user1=(String)session.getAttribute("user");

if(user1==null)
{
	
%>
alert("Login Required");
<%}
else{
	%>
	
	$.ajax({
       url: "testman1.jsp?id="+i,
       success: function( data ) {
			$("#imgpop").html(data);		 
		   $('#popupimg').bPopup({
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
                                 }
         
		   });
<%}%>
  });

$("#username").blur(function(){
	var user=$("#username").val();
	$.ajax({
       url: "username_ajax.jsp?user="+user,
       success: function( data ) {
		  
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
	


(function($) {
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
					   window.location.reload();
						  $("#login").text("Login");
						   $("#rgstr").text("REGISTER NOW");						  
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
		  $("#name7").html("");
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
		  mail=$("#mail").val();
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
		 if(mail=="")
		 {  
		    err="err";
  		    $("#name7").html("<sup>*</sup>Required");	 
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
		    alert("regajax.jsp?name="+name1+"&username="+username+"&password="+password+"&cn="+cn+"&age="+age1+"&gen="+gen+"&occupation="+occupation1+"&salary="+salary1+"&zipcode="+zipcode1+"&fostore="+fos1+"&fccloth="+fc1+"&mail="+mail);
			$(document).ajaxSend(function(){
                  $("#sbmt").html("<img src='images/mapLoadBar.gif' />");
               });
		    $.ajax({
			 type: "POST",
             url: "regajax.jsp?name="+name1+"&username="+username+"&password="+password+"&cn="+cn+"&age="+age1+"&gen="+gen+"&occupation="+occupation1+"&salary="+salary1+"&zipcode="+zipcode1+"&fostore="+fos1+"&fccloth="+fc1+"&mail="+mail,
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
					   		$("#pass2").text("");
					   		$("#user2").text("");
						  if(data=="normal")
						  {
					$("#login").text("Logout");
					$("#rgstr").text("");
					$("#popuplogin").bPopup().close(); 
					window.location.reload();
				    $("#user").val("");
			 		$("#pass").val("");
					$("#error").text("");
					//window.location.reload(true);   
						  }
						   else if(data=="admin")
						  {
					$("#popuplogin").bPopup().close(); 
					
				    $("#user").val("");
			 		$("#pass").val("");
					$("#error").text("");
					window.location.replace("admin.jsp");
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
		 
		 
</script>   <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
  
  <!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
  
  <script type="text/javascript">
   $(function(){
	 
		
      SyntaxHighlighter.all();
    });
    
    
  </script>


  

<%
String user=null;
user=(String)session.getAttribute("user");
if(user==null)
{
%>
    <script>
	
	</script>
    <%
}
else{
	%>
    <script>
	$("#rgstr").text("");
	$("#login").text("Logout");
	</script>
    <%
}


%>
<%
String item_code=null;
item_code=(String)session.getAttribute("item_code");
if(item_code==null)
{
}
else{
	%>
    <script>$("#rgstr1").html("<li class='active' id='buynw' ><a href='#'  height='44px'>Buy Now</a></li>");</script>
    <%
}


%>
  <!-- Syntax Highlighter -->
  <script type="text/javascript" src="js/shCore.js"></script>
  <script type="text/javascript" src="js/shBrushXml.js"></script>
  <script type="text/javascript" src="js/shBrushJScript.js"></script>
  
  <!-- Optional FlexSlider Additions -->
  <script src="js/jquery.easing.js"></script>
  <script src="js/jquery.mousewheel.js"></script>
  <script defer src="js/demo.js"></script>  
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
  <script>
  
  
  <%@ page import="java.sql.*" %><%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st4=con4.createStatement();
ResultSet rst4=st4.executeQuery("SELECT MIN( price ),MAX(price) FROM  `item`");
rst4.next();

%>
  $(function() {
	
    $( "#slider-range" ).slider({
	
      range: true,
      min:<%=rst4.getInt("MIN( price )")%>,
      max: <%=rst4.getInt("MAX(price)")%>,
      values: [ 0, 500 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      "-" + $( "#slider-range" ).slider( "values", 1 ) );
  });
  
  $("#search").click(function(){
	  var amount=$("#amount").val();
	   var id=$("#sub").val();
  $.ajax({
			 type: "POST",
             url: "rangeajax.jsp?range="+amount+"&categoryid=1&subcatid="+id,
             success: function(data) 
			           { 
					   $("#slide12").html(data);
		 // alert("hello");
		  //alert($("#slide12").html());
		  //alert("hello");
		  //$("#slider12").addClass("flexslider");
	    $(".flexslider").flexslider({
		
        animation: "slide",
        start: function(slider){
			// alert("hello");
          $("body").removeClass("loading");
        }
      });
       
					  
					   }
  });
	  
  });
  
  
  
  </script>
  <script>
  $("#buynw").click(function()
  {
  $.ajax({
             url: "showcart.jsp",
             success: function(data) 
			           { 
					   $("#slide12").html(data);					   
					   }
  
  });
  
  });
  
  
  
  
  
  
  
  </script>
</body>
</html>