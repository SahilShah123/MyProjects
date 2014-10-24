<%
String id=request.getParameter("id").trim();
String arr[]=id.split("-");
String item=(String)session.getAttribute("item_code");
String quant=(String)session.getAttribute("quant");
String item1[]=item.split("%");
String quant1[]=quant.split("%");
String item2="";
String quant2="";
for(int i=0;i<item1.length;i++)
{
	
	if(item1[i].equals(arr[0]) && quant1[i].equals(arr[1]))
	{
		
	}
	else
	{
		item2+=item1[i]+"%";
		quant2+=quant1[i]+"%";	
	}
}

session.setAttribute("item_code",item2);
session.setAttribute("quant",quant2);
out.print("success");
%>