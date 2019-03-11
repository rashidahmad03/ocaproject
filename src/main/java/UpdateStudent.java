import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import db.DbConnect;
import java.util.HashMap;

@MultipartConfig
public class UpdateStudent extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session=request.getSession();
    try{
        HashMap ud=(HashMap)session.getAttribute("userdata");

        ServletContext application=getServletContext();

        DbConnect db=(DbConnect)application.getAttribute("db");
        if(db==null){
        db=new DbConnect();
        application.setAttribute("db",db);
        }
        Statement st=db.getSt();
        String s1=(String)ud.get("incappId");
        String s2=request.getParameter("name");
        String phone=request.getParameter("phone");
                 // insert photo code
            javax.servlet.http.Part file=request.getPart("photo");
            java.io.InputStream fis=file.getInputStream();
               if(fis.available()!=0){
                   
                PreparedStatement updateStudent=db.getUpdateStudent();
                //  String category=request.getParameter("course");
                  String msg="";
                  ResultSet rs=st.executeQuery("select * from student_login where incappid="+s1); //where incappid="+id);
                  if(rs.next())
                  { 

                      updateStudent.setString(1,phone);
                  //    updateStudent.setString(2,category);

                      updateStudent.setBinaryStream(2, fis);
                      updateStudent.setString(3,s2);
                      updateStudent.setString(4,s1);
                      updateStudent.executeUpdate();    
                      HashMap user=new HashMap();
                      user.put("incappId",s1);
                      user.put("name",s2);
                      session.setAttribute("userdata", user);
                      msg="Updated Successfully IncappId: "+s1;
                      session.setAttribute("msg",msg);
                      response.sendRedirect("MyAccount.jsp");
                  }
                  else
                  {
                      msg="IncappId Not found "+s1;
                      session.setAttribute("msg",msg);
                      response.sendRedirect("MyAccount.jsp");
                  }
    }
            else{
                     PreparedStatement updateStudentWithoutPhoto=db.getUpdateStudentWithoutPhoto();
                       //  String category=request.getParameter("course");
                     String msg="";
                     ResultSet rs=st.executeQuery("select * from student_login where incappid="+s1); //where incappid="+id);
                     if(rs.next())
                     { 

                         updateStudentWithoutPhoto.setString(1,phone);
                     //    updateStudent.setString(2,category);
                         updateStudentWithoutPhoto.setString(2,s2);
                         updateStudentWithoutPhoto.setString(3,s1);
                         updateStudentWithoutPhoto.executeUpdate();
                         HashMap user=new HashMap();
                         user.put("incappId",s1);
                         user.put("name",s2);
                         session.setAttribute("userdata", user);
                         msg="Updated Successfully IncappId: "+s1;
                         session.setAttribute("msg",msg);
                         response.sendRedirect("MyAccount.jsp");
                     }
                     else
                     {
                         msg="IncappId Not found "+s1;
                         session.setAttribute("msg",msg);
                         response.sendRedirect("MyAccount.jsp");
                     }
            }
    }
        catch(Exception ex){
          String  msg="The image size is too big. Please Choose image of smaller size!!.Exception ="+ex;
        session.setAttribute("msg",msg);
        response.sendRedirect("MyAccount.jsp");
        }
    }
}
