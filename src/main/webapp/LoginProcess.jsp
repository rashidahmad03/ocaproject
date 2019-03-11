<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
    try{
    String u=request.getParameter("uid");
    String p=request.getParameter("pass");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkUser=db.getCheckUser();
    checkUser.setString(1, u);
    checkUser.setString(2, p);
    ResultSet rs=checkUser.executeQuery();
    if(rs.next())
    {
        HashMap ud=new HashMap();
        ud.put("incappId",rs.getString(1));
        ud.put("name",rs.getString(2));
        session.setAttribute("userdata", ud);
        rs.close();
        response.sendRedirect("Profile.jsp");
    }
    else
    {
        session.setAttribute("msg","Wrong Enteries!");
        response.sendRedirect("Home.jsp");
    }  
   }
    catch(Exception ex){
        String msg="Exception"+ex;
        session.setAttribute("msg",msg);
        response.sendRedirect("Home.jsp");
    }
%>