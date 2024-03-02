/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import controller.Authentication.BaseRequiredAuthenticionServlet;
import dal.AttendantDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Attendant;
import model.Session;
import model.Student;

/**
 *
 * @author HUY
 */
@WebServlet(name = "CheckAttendServlet", urlPatterns = {"/CheckAttend"})
public class CheckAttendServlet extends BaseRequiredAuthenticionServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        AttendantDBContext attDb = new AttendantDBContext();
        ArrayList<Attendant> atts = attDb.getAttendantBySesID(sesid);
       request.setAttribute("atts", atts);
        request.getRequestDispatcher("Instructor/checkAttend.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        StudentDBContext sdb = new StudentDBContext();
        ArrayList<Student> students = sdb.getStudentBySession(sesid);
        ArrayList<Attendant> attendance = new ArrayList<>();
        Session session = new Session();
        session.setId(sesid);
        for (Student stu : students) {
            Attendant att = new Attendant();
            att.setSession(session);
           att.setStudent(stu);
            if (request.getParameter("status"+stu.getId()).equals("Yes")) {
                att.setStatus(2);
            }else if(request.getParameter("status"+stu.getId()).equals("No")){
                 att.setStatus(1);
            }
            att.setComment(request.getParameter("cmt"+stu.getId()));
         //   System.out.println(att.getId()+"--"+att.getStudent().getId() 
         //                                   +"--"+att.getSession().getId()+"--"+ att.getStatus());
           attendance.add(att);
        }
        
        AttendantDBContext attDB = new AttendantDBContext();
       attDB.checkAttendBySession(sesid, attendance);
        
       //CHUYEN HUONG DEN TRANG NAO DO HOP LI ???
    }

   
}
