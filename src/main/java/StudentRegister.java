import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import db.DbConnect;

@MultipartConfig 
public class StudentRegister extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException{
HttpSession session=request.getSession();
    try{
        
ServletContext application=getServletContext();
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement insertStudent=db.getInsertStudent();
    Statement st=db.getSt();
    String s1=request.getParameter("incappid");
    String s2=request.getParameter("name");
    String s3=request.getParameter("email");
    String s4=request.getParameter("phone");
    String s6=request.getParameter("category");
    String msg="";
    ResultSet rs=st.executeQuery("select * from student_login where name='"+s2+"'"); //where incappid="+id);
    if(rs.next()||s1==null)
    {
        response.sendRedirect("Login.jsp?msg=Student Already Registered!!");
    }
    else
    {
        int id=Integer.parseInt(s1);
        insertStudent.setInt(1, id);
        insertStudent.setString(2,s2);
        insertStudent.setString(3, s3);
        insertStudent.setString(4, s4);
        Random RANDOM = new Random();
        int PASSWORD_LENGTH = 8;
        String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
        String pw = "";
        for (int i=0; i<PASSWORD_LENGTH; i++)
        {
            int index = (int)(RANDOM.nextDouble()*letters.length());
            pw += letters.substring(index, index+1);
        }
        insertStudent.setString(5, pw);
       // insertStudent.setString(6, s6);
        // insert photo code
        javax.servlet.http.Part file=request.getPart("photo");
        java.io.InputStream fis=file.getInputStream();
        insertStudent.setBinaryStream(6, fis);
        //code end
        insertStudent.executeUpdate();
        msg="Registered Successfully. IncappId: "+s1+" and for Password Contact Incapp Admin (Front-Desk)!";
        session.setAttribute("msg",msg);
    }
    response.sendRedirect("Login.jsp");
    }
        catch(Exception ex){
        System.out.println("Exception ="+ex);
        ex.printStackTrace();
        response.sendRedirect("Login.jsp?msg="+ex);
        } 
    }
}
