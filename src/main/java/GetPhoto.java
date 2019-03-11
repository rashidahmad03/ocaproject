/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.PreparedStatement;
import db.DbConnect;

public class GetPhoto extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
String id=request.getParameter("incappid");
ServletContext application=getServletContext();
DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement getPhoto=db.getGetPhoto();
getPhoto.setString(1, id);
ResultSet rs=getPhoto.executeQuery();
if(rs.next())
{
    response.getOutputStream().write(rs.getBytes(1));
} 
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}