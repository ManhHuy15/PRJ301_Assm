/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Authentication;

import dal.RoleDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Role;

/**
 *
 * @author HUY
 */
@WebServlet(name = "BaseRBACServlet", urlPatterns = {"/BaseRBAC"})
public abstract class BaseRBACServlet extends BaseRequiredAuthenticionServlet {

    private ArrayList<Role> getRoles(HttpServletRequest request, Account account) {
        String url = request.getServletPath();
        System.out.println(request.getServletPath());
        RoleDBContext db = new RoleDBContext();
        return db.getByAccIdAndUrl(account.getId(), url);
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles) throws ServletException, IOException;
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(request, account);
        if (roles.size() < 1) {
            response.sendRedirect("Login");
        } else {
            doGet(request, response, account, roles);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(request, account);
        if (roles.size() < 1) {
            response.sendRedirect("Login");
        } else {
            doPost(request, response, account, roles);
        }
    }

}
