/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Instructor;

import controller.Authentication.BaseRequiredAuthenticionServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author HUY
 */
@WebServlet(name="HomeInstructorServlet", urlPatterns={"/HomeInstructor"})
public class HomeInstructorServlet extends BaseRequiredAuthenticionServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,Account account )
    throws ServletException, IOException {
         if(account.getRole() == 0){
            request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("Instructor/Home.jsp").forward(request, response);
    } 
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response,Account account)
    throws ServletException, IOException {
      
    }

}
