<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="ExceptionPage.jsp"%>

<% 
    String id=request.getParameter("incappid");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement getPassword=db.getGetPassword();
     getPassword.setString(1,id);
    ResultSet rs=getPassword.executeQuery();
    if(rs.next()){
        String pass=rs.getString(1);
        session.setAttribute("pass",pass);
    response.sendRedirect("AdminHome.jsp");
        }
    else{
        String msg="Student's Incapp Id doesn't exist!!!";
        session.setAttribute("msg",msg);
        response.sendRedirect("AdminHome.jsp");
    }
%>