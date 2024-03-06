/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import controller.Authentication.BaseRequiredAuthenticionServlet;
import dal.CoursesDBContext;
import dal.GroupsDBContext;
import dal.TermDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Course;
import model.Groups;
import model.Term;
import util.DateTimeHelper;

/**
 *
 * @author HUY
 */
@WebServlet(name = "AllGroupServelet", urlPatterns = {"/AllGroup"})
public class AllGroupServelet extends BaseRequiredAuthenticionServlet {

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
            out.println("<title>Servlet AllGroupServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllGroupServelet at " + request.getContextPath() + "</h1>");
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
        int insid = account.getUserId();

        TermDBContext tdb = new TermDBContext();
        CoursesDBContext cdb = new CoursesDBContext();

        ArrayList<Term> terms = tdb.getAllTermByIns(insid);
        Date today = new Date();
        java.sql.Date sqltoDay = DateTimeHelper.convertUtilDateToSqlDate(today);
        Term t = tdb.getTermByDate(sqltoDay);
        ArrayList<Course> courses = cdb.getCoursesByInsAndTerm(insid, t.getId());

        request.setAttribute("t", t.getId());
        request.setAttribute("course", courses);
        request.setAttribute("terms", terms);
        request.getRequestDispatcher("Instructor/viewAllGroup.jsp").forward(request, response);
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
        int insid = account.getUserId();
        int tid = Integer.parseInt(request.getParameter("term"));
        int cid = -1;
        if (request.getParameter("cid") != null) {
            cid = Integer.parseInt(request.getParameter("cid"));
        }
        int gid = -1;
        if (request.getParameter("gid") != null) {
            gid = Integer.parseInt(request.getParameter("gid"));
        }

        TermDBContext tdb = new TermDBContext();
        GroupsDBContext gdb = new GroupsDBContext();
        CoursesDBContext cdb = new CoursesDBContext();

        ArrayList<Term> terms = tdb.getAllTermByIns(insid);
        Term t = tdb.getTermById(tid);
        ArrayList<Groups> groupses = gdb.getGroupsByTermAndIns(t, insid, cid);
        ArrayList<Course> courses = cdb.getCoursesByInsAndTerm(insid, tid);
        Groups groupStudent = gdb.getGroupsById(gid);
        request.setAttribute("t", tid);
        request.setAttribute("c", cid);
        request.setAttribute("g", gid);
        request.setAttribute("groupStudent", groupStudent);
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.setAttribute("course", courses);
        request.getRequestDispatcher("Instructor/viewAllGroup.jsp").forward(request, response);
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
