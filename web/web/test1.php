<body  id="bd">
<script src="js/jquery-1.9.0.js"></script>
<script src="js/jquery.bpopup-0.8.0.min.js"></script>
<button id="my-button">POP IT UP</button>
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
	min-height:400px;
}
.rd
{
  color:#F00;
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
.button:hover{background-color:#1e1e1e}.button>span{font-size:84%}.button.bClose{border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px}
</style>
<div id="popup" style="display:none;background-color:#CCF;;font-family:Verdana, Geneva, sans-serif;"><span class="button bClose">
<span>X</span>
</span>
<form  method="post">
<table align="center">
<tr><td colspan="2"><center><img src="images/register.png" height="60px"/></center></td></tr>
<tr><td colspan="2"></td></tr>
<tr><td>Name:</td><td><input type="text" id="name1" name="name" size="40px" style="border:1px solid #09F;" maxlength="30" />&nbsp;<span class="rd" id="name2"></span></td></tr>
<tr><td>Contact No:</td><td><input type="text" name="cn" id="cn" style="border:1px solid #09F;" maxlength="15"/></td></tr> 
<tr><td>Age:</td><td><input type="text" name="name" id="age1" style="border:1px solid #09F;" maxlength="2"/>&nbsp;<span class="rd" id="age2"></span></td></tr>
<tr><td>Gender:</td><td><input type="radio" name="gen" value="male" checked/> Male<input type="radio" name="gen" value="female" /> Female</td></tr>
<tr><td>Occupation:</td><td><input type="text" name="occupation" id="occupation1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="occupation2"></span></td></tr>
<tr><td>Salary:</td><td><input type="text" name="salary" id="salary1" style="border:1px solid #09F;" maxlength="10"/>&nbsp;<span class="rd" id="salary2"></span></td></tr>
<tr><td>Zip code:</td><td><input type="text" id="zipcode1" name="zipcode" style="border:1px solid #09F;" maxlength="10"/>&nbsp;<span class="rd" id="zipcode2"></span></td></tr>
<tr><td>Favorite clothing:</td><td><input type="text" name="fclothing" id="fc1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="fc2"></span></td></tr>
<tr><td>Favorite retail store:</td><td><input type="text" name="frstore" id="frs1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="frs2"></span></td></tr>
<tr><td>Favorite online store:</td><td><input type="text" name="fostore" id="fos1" size="40px" style="border:1px solid #09F;" maxlength="30"/>&nbsp;<span class="rd" id="fos2"></span></td></tr>
<tr><td colspan="2"></td></tr>
<tr><td colspan="2"></center></td></tr>
<tr><td colspan="2"><center><span id="sbmt"><input type="button" value="Submit" class="sbtn" /></span></center></td></tr>
</table>
</form>
</div>
<script>
  ;(function($) {
        $(function() {
             $('#popup').bPopup({	 
            fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
            followSpeed: 1500, //can be a string ('slow'/'fast') or int
            modalColor: '#6E6E6E'
                                        });
         });
     })(jQuery);
   $(".sbtn").click(function(){
	     $("#name2").html("");
		 $("#age2").html("");
		 $("#fc2").html("");
		 $("#fos2").html("");
		 $("#frs2").html("");
		 $("#occupation2").html("");
		 $("#salary2").html("");
		 $("#zipcode2").html("");	 
		 b=true;
	     err="";
	     name1=$("#name1").val();
		 age1=$("#age1").val();
		 occupation1=$("#occupation1").val();
		 fc1=$("#fc1").val();
		 fos1=$("#fos1").val();
		 frs1=$("#frs1").val();
		 salary1=$("#salary1").val();
		 zipcode1=$("#zipcode1").val();
		 cn=$("#cn").val();
		 if(name1=="")
		 {  
		    err="err";
  		    $("#name2").html("<sup>*</sup>Required");	 
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
		 if(frs1=="")
		 {  
		    err="err";
  		    $("#frs2").html("<sup>*</sup>Required");	 
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
		    $(document).ajaxSend(function() {
                  $("#sbmt").html("<img src='images/mapLoadBar.gif' />");
               });
		    $.ajax({
			 type: "POST",
             url: "registerajax.php?name="+name1+"&cn"+cn+"&age"+age1,
             success: function(data) 
			           {   
						   $("#popup").html("Register Successfully");
                       }
                 });	 
		   $('#popup').bPopup().close(); 
		    $("#name1").val("");
		    $("#age1").val("");
		    $("#occupation1").val("");
		    $("#fc1").val("");
		    $("#fos1").val("");
		    $("#frs1").val("");
		    $("#salary1").val("");
		    $("#zipcode1").val("");
		    $("#cn").val("");
		 }
		});
</script>
</body>