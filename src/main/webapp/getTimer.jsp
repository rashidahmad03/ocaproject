
<%@ page errorPage="error.jsp" %>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page errorPage="ExceptionPage.jsp"%>

<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
    String roll=(String)ud.get("incappId");
    String name=(String)ud.get("name");
  
 
    session.setAttribute("min",Integer.parseInt(request.getParameter("min1")));
    session.setAttribute("sec",(request.getParameter("sec1")));
  }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("Login.jsp");
    }
%>