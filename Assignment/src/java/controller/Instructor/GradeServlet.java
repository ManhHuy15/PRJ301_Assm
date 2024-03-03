/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.CourseGrade;
import model.Student;

/**
 *
 * @author HUY
 */
@WebServlet(name = "GradeServlet", urlPatterns = {"/Grade"})
public class GradeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = 1;
        int gid = 1;
        StudentDBContext sdb = new StudentDBContext();
        GradeDBContext gdb = new GradeDBContext();

        ArrayList<CourseGrade> grades = gdb.getCourseGradesByCid(cid);
        ArrayList<Student> listStudent = sdb.getStudentByGroup(gid);
        request.setAttribute("grades",  grades);
        request.setAttribute("listStudent", listStudent);
        request.getRequestDispatcher("Instructor/checkGrade.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
