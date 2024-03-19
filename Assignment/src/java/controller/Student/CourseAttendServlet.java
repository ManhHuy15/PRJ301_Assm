/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Student;

import controller.Authentication.BaseRBACServlet;
import controller.Authentication.BaseRequiredAuthenticionServlet;
import dal.AttendantDBContext;
import dal.GroupsDBContext;
import dal.TermDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Attendant;
import model.Groups;
import model.Role;
import model.Term;
import util.DateTimeHelper;

/**
 *
 * @author HUY
 */
@WebServlet(name="CourseAttendServlet", urlPatterns={"/CourseAttend"})
public class CourseAttendServlet extends BaseRBACServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CourseAttendServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseAttendServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @param a
     * @param Roles
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,Account a, ArrayList<Role> Roles)
    throws ServletException, IOException {
        Account c = (Account) request.getSession().getAttribute("account");
        int sid = c.getUserId();
        
        
        TermDBContext tdb = new TermDBContext();
        GroupsDBContext gdb = new GroupsDBContext();
        ArrayList<Term> terms = tdb.getAllTermsBySID(sid);
        Date today = new Date();
        java.sql.Date sqltoDay = DateTimeHelper.convertUtilDateToSqlDate(today);
        Term t = tdb.getTermByDate(sqltoDay);

        ArrayList<Groups> groupses = gdb.getGroupsByTermAndSID(t, sid);
        request.setAttribute("t", t.getId());
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.getRequestDispatcher("Students/courseAttend.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @param a
     * @param Roles
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response,Account a, ArrayList<Role> Roles)
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
        AttendantDBContext adb = new AttendantDBContext();
        
        ArrayList<Term> terms = tdb.getAllTermsBySID(tid);
        Term t = tdb.getTermById(tid);
        ArrayList<Groups> groupses = gdb.getGroupsByTermAndSID(t, sid);
        ArrayList<Attendant> attendants = adb.getAllAttendBySid(sid, tid, cid);
        
        
        int countAbsent = 0;
        for (Attendant att : attendants) {
            if(att.getStatus() == 1){
                countAbsent++;
            }
        }
        float percent =Math.round(((float)countAbsent / attendants.size())*100.0 );
        
        request.setAttribute("percent", percent);
        request.setAttribute("absent", countAbsent);
        request.setAttribute("t", tid);
        request.setAttribute("c", cid);
        request.setAttribute("attendants", attendants);
        request.setAttribute("groups", groupses);
        request.setAttribute("terms", terms);
        request.getRequestDispatcher("Students/courseAttend.jsp").forward(request, response);
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
