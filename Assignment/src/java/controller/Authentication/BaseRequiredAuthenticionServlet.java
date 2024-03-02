/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Authentication;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author HUY
 */
public abstract class BaseRequiredAuthenticionServlet extends HttpServlet {
   
    private Account getAuthentication(HttpServletRequest request){
        Account a = (Account) request.getSession().getAttribute("account");
        return  a;
    }
    
    
protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException;
protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          Account account = getAuthentication(request);
        if (account != null) {
            doGet(request, response, account);
        } else {
            response.sendRedirect("Login");
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          Account account = getAuthentication(request);
        if (account != null) {
            doPost(request, response, account);
        } else {
            response.sendRedirect("Login");
        }
    }
}
