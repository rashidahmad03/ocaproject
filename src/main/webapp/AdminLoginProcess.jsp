<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
    String u=request.getParameter("aid");
    String p=request.getParameter("pass");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkAdmin=db.getCheckAdmin();
    checkAdmin.setString(1, u);
    checkAdmin.setString(2, p);
    ResultSet rs=checkAdmin.executeQuery();
    if(rs.next())
    {
        HashMap ud=new HashMap();
        ud.put("aid",rs.getString(1));
        ud.put("name",rs.getString(2));
        session.setAttribute("admindata", ud);
        rs.close();
        response.sendRedirect("AdminHome.jsp");
    }
    else
    {
        session.setAttribute("msg", "Wrong Enteries!");
        response.sendRedirect("AdminLogin.jsp");
    }  
%>