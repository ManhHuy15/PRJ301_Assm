/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Instructor;

import controller.Authentication.BaseRBACServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Role;

/**
 *
 * @author HUY
 */
@WebServlet(name="HomeInstructorServlet", urlPatterns={"/HomeInstructor"})
public class HomeInstructorServlet extends BaseRBACServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,Account account,ArrayList<Role> Roles )
    throws ServletException, IOException {
         if(account.getRole() == 0){
            request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("Instructor/Home.jsp").forward(request, response);
    } 
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response,Account account,ArrayList<Role> Roles)
    throws ServletException, IOException {
      
    }

}
