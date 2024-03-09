/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import controller.Authentication.BaseRBACServlet;
import dal.AttendantDBContext;
import dal.GroupsDBContext;
import dal.SessionsDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Attendant;
import model.Groups;
import model.Role;
import model.Session;
import model.Student;
import util.Mail;
import util.MailContent;

/**
 *
 * @author HUY
 */
@WebServlet(name = "CheckAttendServlet", urlPatterns = {"/CheckAttend"})
public class CheckAttendServlet extends BaseRBACServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles)
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        AttendantDBContext attDb = new AttendantDBContext();
        ArrayList<Attendant> atts = attDb.getAttendantBySesID(sesid);
        request.setAttribute("atts", atts);
        request.getRequestDispatcher("Instructor/checkAttend.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles)
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        StudentDBContext sdb = new StudentDBContext();
        SessionsDBContext sesdb = new SessionsDBContext();
        GroupsDBContext gdb = new GroupsDBContext();
        
        Groups group =gdb.getGroupStudentBySession(sesid);
        ArrayList<Student> students = sdb.getStudentBySession(sesid);
        ArrayList<Attendant> attendance = new ArrayList<>();
        
        Session session = new Session();
        session.setId(sesid);
        for (Student stu : group.getListStudent()) {
            Attendant att = new Attendant();
            att.setSession(session);
            att.setStudent(stu);
            if (request.getParameter("status" + stu.getId()).equals("Yes")) {
                att.setStatus(2);
            } else if (request.getParameter("status" + stu.getId()).equals("No")) {
                att.setStatus(1);
            }
            att.setComment(request.getParameter("cmt" + stu.getId()));
            attendance.add(att);
        }

        AttendantDBContext attDB = new AttendantDBContext();
       attDB.checkAttendBySession(sesid, attendance);
        
//        get group by course and term
        int numberCourse = sesdb.numberCourseSesion(group.getCouse().getId(), group.getTerm().getId());
        for (Student stu : group.getListStudent()) {
            int numberAbsent = sesdb.numberAbsent(stu.getId(), group.getCouse().getId());
            float percent =Math.round(((float)numberAbsent / numberCourse)*100.0 );
            if (percent > 20) {
                Mail.sendMail(stu.getEmail(),"Report Attend",
                        MailContent.overAbsent(stu, group, numberCourse, numberAbsent));
            }else if (percent >=10){
                Mail.sendMail(stu.getEmail(),"Report Attend",
                        MailContent.warningAbsent(stu, group, numberCourse, numberAbsent));
            }
        }
        
        request.setAttribute("done", "Attendance check completed!");
        request.getRequestDispatcher("Instructor/checkAttend.jsp").forward(request, response);
    }

}
