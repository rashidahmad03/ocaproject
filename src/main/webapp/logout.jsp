<%@page import="java.util.HashMap"%>
<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
session.invalidate();
response.sendRedirect("Home.jsp");
    }
    else{
session.invalidate();
response.sendRedirect("AdminLogin.jsp");
    }
%>