<%@ page import="java.sql.*" %><% int a=Integer.parseInt(request.getParameter("subcat"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con1.createStatement();
ResultSet rst1=st.executeQuery("select count(*) from item where sub_category_id="+a);
int count1=0,count=0,kd=1;
int countmod=0;
String path="";
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
	  path=rst.getString(3);
      out.print("<img src='"+path+"' class='img' cus='man_tshirt_a_1' height='126px' width='112px' />");
	%>
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
	<!--<table width='100%'>


             <!--1st row
             <tr height="126px">
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_a.png" class="img" cus="man_tshirt_a_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_b.png" class="img" cus="man_tshirt_b_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>                
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_c.png" class="img" cus="man_tshirt_c_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
             </tr>
             <tr height="30px">
             <td width="15px">
             </td>
             <td width="112px" class="cloth-desc"><center>T-Shirt-1</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-2</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-3</center></td>
             <td width="15px">
             </td>
             </tr>
             <!--2st row
             <tr height="126px">
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_d.png" class="img" cus="man_tshirt_d_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_e.png" class="img" cus="man_tshirt_e_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>                
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_f.png" class="img" cus="man_tshirt_f_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
             </tr>
             <tr height="30px">
             <td width="15px">
             </td>
             <td width="112px" class="cloth-desc"><center>T-Shirt-4</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-5</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-6</center></td>
             <td width="15px">
             </td>
             </tr>
              <!--3st row
             <tr height="126px">
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_g.png" class="img" cus="man_tshirt_g_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_h.png" class="img" cus="man_tshirt_h_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>                
                <td width="112px" class="arrow">
                 <img src="images/man/man_thump/thumb-man_tshirt_i.png" class="img" cus="man_tshirt_i_1" height="126px" width="112px" />
                </td>
                <td width="15px">
                </td>
             </tr>
             <tr height="30px">
             <td width="15px">
             </td>
             <td width="112px" class="cloth-desc"><center>T-Shirt-7</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-8</center></td>
             <td width="15px">
             </td>                
             <td width="112px" class="cloth-desc"><center>T-Shirt-9</center></td>
             <td width="15px">
             </td>
             </tr>
          </table>-->
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