<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%  
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    String quesList=(String)session.getAttribute("ExamQuestionSequence");
            
        Statement st=db.getSt();
    int score = 0;
    String sol=request.getParameter("ques");
    String ans=request.getParameter("answer");
    int q=(Integer)session.getAttribute("qid");
    //int q=(Integer)qid;
   
    ArrayList<Integer> tq=(ArrayList<Integer>)session.getAttribute("totalQuesArray");
 
    if(quesList.equals(""))
        quesList=String.valueOf(tq.get(q-1))+":"+sol+":"+ans;
    else
        quesList+="#"+String.valueOf(tq.get(q-1))+":"+sol+":"+ans;
     session.setAttribute("ExamQuestionSequence",quesList);  
    if(ans.equals(sol))
    {
        score =((Integer)session.getAttribute("examScore")).intValue() + 1;
        session.setAttribute("examScore", score);
        out.println(score);
    }
    try
    {
        st.executeUpdate("insert into result_review values('"+sol+"','"+ans+"')");
    }
    catch(Exception e)
    {
        System.out.println(e);  
    }
    response.sendRedirect("Exam.jsp");
%>
