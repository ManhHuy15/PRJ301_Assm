/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import controller.Authentication.BaseRequiredAuthenticionServlet;
import dal.SessionsDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Session;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author HUY
 */
@WebServlet(name = "ScheduleInstructorServlet", urlPatterns = {"/ScheduleInstructor"})
public class ScheduleInstructorServlet extends BaseRequiredAuthenticionServlet {

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
            out.println("<title>Servlet ScheduleInstructorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleInstructorServlet at " + request.getContextPath() + "</h1>");
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
        if (account.getRole() == 0) {
            request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
        }

        int insid = account.getUserId();
        String ymd_raw = request.getParameter("ymd");
        SessionsDBContext sdb = new SessionsDBContext();
        ArrayList<TimeSlot> slots = sdb.getAllSlot();
        Date toDay = new Date();
        java.sql.Date from = null;
        java.sql.Date to = null;
        java.sql.Date date = null;
        if (ymd_raw == null) {
            from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(toDay));
            to = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.
                    addDaysToDate(DateTimeHelper.getWeekStart(toDay), 6));
            date = DateTimeHelper.convertUtilDateToSqlDate(toDay);
        } else {
            Date ymd = java.sql.Date.valueOf(ymd_raw);
            from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(ymd));
            to = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.
                    addDaysToDate(from, 6));
            date = DateTimeHelper.convertUtilDateToSqlDate(ymd);
        }
        ArrayList<java.sql.Date> dates = DateTimeHelper.getDatesBetween(from, to);
        ArrayList<Session> sessions = sdb.getSessionsInsFromTo(1, from, to);
        request.setAttribute("slots", slots);
        request.setAttribute("date", date);
        request.setAttribute("dates", dates);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("Instructor/viewSchedule.jsp").forward(request, response);
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
        processRequest(request, response);
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
