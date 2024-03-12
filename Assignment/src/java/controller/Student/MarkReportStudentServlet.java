/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Student;

import controller.Authentication.BaseRBACServlet;
import dal.AssessmentDBContex;
import dal.GradeDBContext;
import dal.GroupsDBContext;
import dal.TermDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.ArrayList;
import model.Account;
import model.Assessment;
import model.CourseGrade;
import model.Groups;
import model.Role;
import model.Term;
import util.DateTimeHelper;

/**
 *
 * @author HUY
 */
@WebServlet(name = "MarkReportStudentServlet", urlPatterns = {"/MarkReportStudent"})
public class MarkReportStudentServlet extends BaseRBACServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles)
            throws ServletException, IOException { 
        Account c = (Account) request.getSession().getAttribute("account");
        int sid = c.getUserId();

        TermDBContext tdb = new TermDBContext();
        GroupsDBContext gdb = new GroupsDBContext();
        ArrayList<Term> terms = tdb.getAllTermsBySID(sid);// laasy o session
        Date today = new Date();
        java.sql.Date sqltoDay = DateTimeHelper.convertUtilDateToSqlDate(today);
        Term t = tdb.getTermByDate(sqltoDay);

        ArrayList<Groups> groupses = gdb.getGroupsByTermAndSID(t, sid);// lasy stuid trong session
        request.setAttribute("t", t.getId());
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.getRequestDispatcher("Students/markReport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles)
            throws ServletException, IOException {
        Account c = (Account) request.getSession().getAttribute("account");
        int sid = c.getUserId();

        int tid = Integer.parseInt(request.getParameter("term"));
        int cid = -1;
        if (request.getParameter("cid") != null) {
            cid = Integer.parseInt(request.getParameter("cid"));
        }
        TermDBContext tdb = new TermDBContext();
        GroupsDBContext gdb = new GroupsDBContext();
        AssessmentDBContex adb = new AssessmentDBContex();
        GradeDBContext gradedb = new GradeDBContext();

        ArrayList<CourseGrade> courseGrades = gradedb.getCourseGradesByCid(cid);
        ArrayList<Term> terms = tdb.getAllTermsBySID(tid);
        Term t = tdb.getTermById(tid);

        ArrayList<Assessment> asses = adb.getAssBySidCid(sid, cid, t);
        ArrayList<Groups> groupses = gdb.getGroupsByTermAndSID(t, sid);// lasy stuid trong session

        double avg = 0;
        String status = "NOT PASS";
        if (asses.size() == courseGrades.size()) {
            avg = (double) Math.round(calculatorAvg(asses) * 100) / 100;
            status = checkStatus(asses, avg);
        }
        request.setAttribute("t", tid);
        request.setAttribute("c", cid);
        request.setAttribute("courseGrades", courseGrades);
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.setAttribute("asses", asses);
        request.setAttribute("avg", avg);
        request.setAttribute("status", status);
        request.getRequestDispatcher("Students/markReport.jsp").forward(request, response);
    }

    private double calculatorAvg(ArrayList<Assessment> asses) {
        double avg = 0;
        for (Assessment asse : asses) {
            avg += asse.getScore() * asse.getWeight();
        }
        return avg;
    }

    private String checkStatus(ArrayList<Assessment> asses, double avg) {
        String status = "PASS";
        if (avg < 5) {
            status = "NOT PASS";
        } else {
            for (Assessment asse : asses) {
                if (asse.getRequired() == 0) {
                    if (asse.getScore() == asse.getRequired()) {
                        status = "NOT PASS";
                        break;
                    }
                } else if (asse.getScore() < asse.getRequired()) {
                    status = "NOT PASS";
                    break;
                }
            }
        }
        return status;
    }
}
