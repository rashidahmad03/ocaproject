<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@page errorPage="ExceptionPage.jsp"%>
    
<%
    try{
        DbConnect db=(DbConnect)application.getAttribute("db");
    
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    Statement st=db.getSt();
    HashMap ad=(HashMap)session.getAttribute("admindata");
    
    String aid=(String)ad.get("aid");
    String cpass=request.getParameter("cpass");
    String npass=request.getParameter("npass");
    String conpass=request.getParameter("conpass");
    
       PreparedStatement getAdmin=db.getGetAdmin();
    getAdmin.setString(1, aid);
    ResultSet rs=getAdmin.executeQuery();
    
     String oldpass="";
     if(rs.next())
    {
        oldpass=rs.getString(2);
    }
    
    if(npass.equals(conpass) ){
        
            if(cpass.equals(oldpass))
            {
                int x= st.executeUpdate("update admin_login set pass='"+npass+"' where aid='"+aid+"'");
             String msg="Admin Password Updated New Password is=>"+npass;
                 
                //Mail sending code which runs on GlassFish Server        
                String subject="Admin Password Updated!!";
                String body=msg;
                String email="namratasingh@incapp.in";
                  final String aemail=application.getInitParameter("aemail");
            final String apass=application.getInitParameter("apass");
       
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com"); 
          properties.put("mail.smtp.port", 587);
          properties.put("mail.smtp.auth", "true");
          properties.put("mail.smtp.starttls.enable", "true");
          properties.put("mail.user", aemail);
          properties.put("mail.password", apass);
             Authenticator auth = new Authenticator()
          {
              public PasswordAuthentication getPasswordAuthentication()
              {
                  return new PasswordAuthentication(aemail, apass);
              }
          };
           Session ses = Session.getInstance(properties, auth); 

            Message message = new MimeMessage(ses); 
            message.setFrom(new InternetAddress(aemail)); 
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); 
            message.setSubject(subject); 
            message.setText(body); 
            Transport.send(message); 
/*
           The original mail sending code which runs with Apache Tomcat Server
           
           
                Properties properties = new Properties();
                properties.put("mail.smtp.host", "smtp.gmail.com");  
                properties.put("mail.smtp.socketFactory.port", "465");  
                properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
                properties.put("mail.smtp.auth", "true");  
                properties.put("mail.smtp.port", "465");
                Session ses = Session.getInstance(properties,    
                    new javax.mail.Authenticator() {  
                     protected PasswordAuthentication getPasswordAuthentication() {  
                     return new PasswordAuthentication(aemail, apass); } 
                    });  
            
                Message message = new MimeMessage(ses);  
                message.setFrom(new InternetAddress(aemail));  
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(e));  
                message.setSubject(subject);  
                message.setText(body);  
                Transport.send(message); 
            //mail sending code ends
  */                  
                  session.setAttribute("msg",msg);
                   response.sendRedirect("AdminChangePassword.jsp");
            }
            else{
                    String msg="Old Pasword does not match!!";
                   session.setAttribute("msg",msg);
                   response.sendRedirect("AdminChangePassword.jsp");
            }
       }
        else{
            String msg="new password and confirm password does not match!!";
           session.setAttribute("msg",msg);
           response.sendRedirect("AdminChangePassword.jsp");
        }
    }
    catch(Exception ex){
        System.out.println("Exception ="+ex);
    }
%>