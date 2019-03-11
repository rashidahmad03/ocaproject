<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>

<%@page errorPage="ExceptionPage.jsp"%>
<%
    String category=request.getParameter("category");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkCategory=db.getCheckCategory();
    checkCategory.setString(1,category);
    ResultSet rs=checkCategory.executeQuery();
    if(rs.next()){
                    Statement st=db.getSt();
                    PreparedStatement getExamNameFromCategory=db.getGetExamNameFromCategory();
                    getExamNameFromCategory.setString(1,category);
                    ResultSet rs1=getExamNameFromCategory.executeQuery();
                    while(rs1.next()){
                        String examName=rs1.getString(1);
                        st.executeUpdate("DELETE FROM `oca`.`exams` WHERE `examName`='"+examName+"'");
                    //code to remove spaces between Exam Name so that proper table name can be formed
                    String exam="";
                    for(int i=0;i<examName.length();i++)
                        if(examName.charAt(i)!=' ')
                            exam+=examName.charAt(i);
                    //end of code
                        st.executeUpdate("Drop TABLE `certification_placement_portal`.`"+exam+"`");
                    }
                    st.executeUpdate("DELETE FROM `oca`.`exams_category` WHERE `examCategory`='"+category+"'");
                        session.setAttribute("msg","Category Deleted!!");
                        response.sendRedirect("AdminHome.jsp");
     }
        else{
        session.setAttribute("msg","Category doesn't Exists!!");
        response.sendRedirect("AdminHome.jsp");
    }
%> 
