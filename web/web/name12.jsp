<%@ page import="java.sql.*" %>
<% int a=Integer.parseInt(request.getParameter("subcat"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con1.createStatement();
ResultSet rst1=st.executeQuery("select count(*) from item where sub_category_id="+a);
int count1=0,count=0,kd=1,i_code;
int countmod=0;
String path="";
String name1="";
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
out.print("<div id='div-clothes' style='width:595px;'>");
     out.print("<div id='container' class='cf' style='width:500px;margin:0 auto;' align='center'>");
	 out.print("<div id='main' role='main'>");
      out.print("<section class='slider'>");
         out.print("<div  id='apply' class='flexslider' >");
out.print("<ul class='slides'>");
	
for(int i=0;i<count;i++)
{
ResultSet rst=st.executeQuery("select * from item where sub_category_id="+a+" limit "+(i*9)+",9");

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
	   name1=rst.getString(2);
	  path=rst.getString(3);
	  i_code=rst.getInt(1);
	 out.print("<div ><img src='"+path+"' class='img' cus='man_tshirt_a_1' id="+i_code+"  height='126px' width='112px' /></div>");
	  out.print(" <div ><center class='cloth-desc' style='height:20px;'><span  id='man_tshirt_a'>"+name1+"</span></center></div> </td>");
      
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
  
  <!-- FlexSlider -->
 

<script>
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
  </script>