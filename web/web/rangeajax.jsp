<%@ page import="java.sql.*" %><%
String range=request.getParameter("range");
int catid=Integer.parseInt(request.getParameter("categoryid"));
int subcatid=Integer.parseInt(request.getParameter("subcatid"));
int count1=0,count=0,kd=1,i_code;
int countmod=0;
String path="";
String name1="";
String arr[]=range.split("-");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
ResultSet rst2=st1.executeQuery("SELECT count(*) FROM item WHERE price BETWEEN "+arr[0]+" AND "+arr[1]+" AND category_id ="+catid+" AND sub_category_id ="+subcatid);
if(rst2.next())
{
	count1=Integer.parseInt(rst2.getString(1));	
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
ResultSet rst=st1.executeQuery("SELECT * FROM item WHERE price BETWEEN "+arr[0]+" AND "+arr[1]+" AND category_id ="+catid+" AND sub_category_id ="+subcatid+" limit "+(i*9)+",9");	
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
     <script>
$(".img").click(function(){
	var i=$(this).attr("id");
	
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
  });
  </script>
  