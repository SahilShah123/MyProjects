<%
int id=Integer.parseInt(request.getParameter("id"));
int quant=Integer.parseInt(request.getParameter("quant"));
String code = (String)session.getAttribute("item_code");
String qt = (String)session.getAttribute("quant");
if(code==null)
code="";
if(qt==null)
qt="";
code =code+id+"%";
qt = qt+quant+"%";
session.setAttribute("item_code",code);
session.setAttribute("quant",qt);
%>