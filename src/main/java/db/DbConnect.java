package db;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.sql.*;
public class DbConnect {
    private Connection c;
    private Statement st;
    private PreparedStatement insertStudent,getExamNameFromCategory,getExamQuestion,updateStudentWithoutPhoto,updateQuestion,getAdmin,updateStudent,getPassword,getPhoto,getAllQuestions,insertExamReport,getExamReport,getResult,getDataIncappId,insertQues,checkExamName,getQuesCount,checkUser,checkAdmin,deleteResult,getCategory,getExamName,checkCategory;

    public Statement getSt() {
        return st;
    }

    public PreparedStatement getGetExamNameFromCategory() {
        return getExamNameFromCategory  ;
    }

    public PreparedStatement getGetExamQuestion() {
        return getExamQuestion  ;
    }
    
    public PreparedStatement getUpdateQuestion() {
        return updateQuestion;
    }

    public PreparedStatement getGetAdmin() {
        return getAdmin;
    }

    public PreparedStatement getInsertExamReport() {
        return insertExamReport;
    }

    public PreparedStatement getUpdateStudent() {
        return updateStudent;
    }

    public PreparedStatement getUpdateStudentWithoutPhoto() {
        return updateStudentWithoutPhoto;
    }

    public PreparedStatement getGetPassword() {
        return getPassword;
    }

    public PreparedStatement getGetPhoto() {
        return getPhoto;
    }

    public PreparedStatement getGetAllQuestions() {
        return getAllQuestions;
    }

    public PreparedStatement getInsertStudent() {
        return insertStudent;
    }


    public PreparedStatement getGetExamReport() {
        return getExamReport;
    }

    public PreparedStatement getGetDataIncappId() {
        return getDataIncappId;
    }
    
    public PreparedStatement getGetResult() {
        return getResult;
    }
    public PreparedStatement getGetQuesCount() {
        return getQuesCount;
    }
    
    public PreparedStatement getGetCategory() {
        return getCategory;
    }
    
    public PreparedStatement getInsertQues() {
        return insertQues;
    }
    
    public PreparedStatement getGetExamName() {
        return getExamName;
    }
    
    public PreparedStatement getCheckCategory() {
        return checkCategory;
    }
    
    public PreparedStatement getCheckExamName() {
        return checkExamName;
    }

    public PreparedStatement getCheckUser() {
        return checkUser;
    }
    
    public PreparedStatement getCheckAdmin() {
        return checkAdmin;
    }
    
    public PreparedStatement getDeleteResult() {
        return deleteResult;
    }
    public DbConnect(){
        try{
    //   Class.forName("oracle.jdbc.driver.OracleDriver");
    //  c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","lladb", "lladb");
    Class.forName("com.mysql.cj.jdbc.Driver");
    //c=DriverManager.getConnection("jdbc:mysql://localhost:3306/Preparation_For_Certification","root","incapp");
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/oca","root","Nokia@123");
    st=c.createStatement();
    getResult=c.prepareStatement("select * from result_review");
    checkUser=c.prepareStatement("select * from student_login where incappid=? and pass=?");
    checkAdmin=c.prepareStatement("select * from admin_login where aid=? and pass=?");
    insertExamReport=c.prepareStatement("insert into exam_report values(null,?,?,CURRENT_TIMESTAMP,?,?,?)");
    insertStudent=c.prepareStatement("insert into student_login values(?,?,?,?,?,null,?)");
    updateStudent=c.prepareStatement("update student_login set phone=?,photo=?,name=? where incappid=?");
    updateStudentWithoutPhoto=c.prepareStatement("update student_login set phone=?,name=? where incappid=?");
    // updateQuestion=c.prepareStatement("update ? set ques=?,op1=?,op2=?,op3=?,op4=?,ans=? where qid=?");
    getExamReport=c.prepareStatement("select * from exam_report where incappid=?");
    getExamQuestion=c.prepareStatement("select * from exam_report where erid=?");
    getDataIncappId=c.prepareStatement("select * from student_login where incappid=?");
    getAdmin=c.prepareStatement("select * from admin_login where aid=?");
    getPhoto=c.prepareStatement("select photo from student_login where incappid=?");
    getQuesCount=c.prepareStatement("select count(*) from topic_wise");
    deleteResult=c.prepareStatement("delete from result_review");
    checkCategory=c.prepareStatement("select * from exams_category where examCategory=?");
    getPassword=c.prepareStatement("select pass from student_login where incappid=?");
    checkExamName=c.prepareStatement("select * from exams where examName=?");
    getAllQuestions=c.prepareStatement("select * from ?");
    getCategory=c.prepareStatement("select * from exams_category");
    getExamName=c.prepareStatement("select * from exams");// where exam_Category=?
    getExamNameFromCategory=c.prepareStatement("select * from exams where examCategory=?");
        }
        catch(Exception ex){
             ex.printStackTrace();  
        }
    }
}
