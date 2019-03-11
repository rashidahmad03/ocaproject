<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>

<%
    String Cat=request.getParameter("category");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkCategory=db.getCheckCategory();
     checkCategory.setString(1,Cat);
    ResultSet rs=checkCategory.executeQuery();
    if(rs.next()){
        response.sendRedirect("AdminHome.jsp?msg=Category Already Exists!!");
        }
    else{
    Statement st=db.getSt();
    st.executeUpdate("insert into exams_Category (examCategory) values('"+Cat+"')");
    session.setAttribute("msg","Category Inserted!!");
    response.sendRedirect("AdminHome.jsp");
    }
   %> 
