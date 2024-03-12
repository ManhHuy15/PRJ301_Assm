/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.SyllabusDetails;

import dal.CoursesDBContext;
import dal.GradeDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.CourseGrade;

/**
 *
 * @author HUY
 */
@WebServlet(name="SyllabusDetailsServlet", urlPatterns={"/SyllabusDetails"})
public class SyllabusDetailsServlet extends HttpServlet {
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int cid = 16;
        String code = request.getParameter("course");
        CoursesDBContext cdb = new CoursesDBContext();
        GradeDBContext gdb = new GradeDBContext();
        
        Course course = cdb.getInfor(code);
        
        ArrayList<CourseGrade> cGrade = gdb.getInfoByCourse(code);
        System.out.println(cGrade.size());
        request.setAttribute("courseGrade",cGrade );
        request.setAttribute("course", course);
        request.getRequestDispatcher("Syllabus/SyllabusDetail.jsp").forward(request, response);
        
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

 

}
