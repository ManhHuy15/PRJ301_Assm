/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Student;

import controller.Authentication.BaseRBACServlet;
import dal.GroupsDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Groups;
import model.Role;

/**
 *
 * @author HUY
 */
@WebServlet(name="GroupInfoServlet", urlPatterns={"/GroupInfo"})
public class GroupInfoServlet extends BaseRBACServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles) throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));
        GroupsDBContext gdb = new GroupsDBContext();
        Groups g = gdb.getGroupsById(gid);
        
        request.setAttribute("group", g);
        request.getRequestDispatcher("Students/viewGroupInfo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> Roles) throws ServletException, IOException {
    }
   
   
}
