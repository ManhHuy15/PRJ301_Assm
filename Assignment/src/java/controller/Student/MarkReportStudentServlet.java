/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Student;

import controller.Authentication.BaseRequiredAuthenticionServlet;
import dal.AssessmentDBContex;
import dal.GradeDBContext;
import dal.GroupsDBContext;
import dal.TermDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
import model.Term;
import util.DateTimeHelper;

/**
 *
 * @author HUY
 */
@WebServlet(name = "MarkReportStudentServlet", urlPatterns = {"/MarkReportStudent"})
public class MarkReportStudentServlet extends BaseRequiredAuthenticionServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MarkReportStudentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarkReportStudentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        if (account.getRole() == 1) {
            request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
        }
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        if (account.getRole() == 1) {
            request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
        }
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

        if (asses.size() == courseGrades.size()) {
            avg = (double) Math.round(calculatorAvg(asses) * 100) / 100;
        }
        request.setAttribute("t", tid);
        request.setAttribute("c", cid);
        request.setAttribute("courseGrades", courseGrades);
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.setAttribute("asses", asses);
        request.setAttribute("avg", avg);
        request.getRequestDispatcher("Students/markReport.jsp").forward(request, response);
    }

    private double calculatorAvg(ArrayList<Assessment> asses) {
        double avg = 0;
        for (Assessment asse : asses) {
            avg += asse.getScore() * asse.getWeight();
        }
        return avg;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
