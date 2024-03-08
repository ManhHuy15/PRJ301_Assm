/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Instructor;

import controller.Authentication.BaseRBACServlet;
import dal.AssessmentDBContex;
import dal.GradeDBContext;
import dal.GroupsDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Assessment;
import model.CourseGrade;
import model.Groups;
import model.Instructor;
import model.Role;
import model.Student;

/**
 *
 * @author HUY
 */
@WebServlet(name = "GradeServlet", urlPatterns = {"/Grade"})
public class GradeServlet extends BaseRBACServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account,ArrayList<Role> Roles)
            throws ServletException, IOException {
        int insid = account.getUserId();
        int gid = Integer.parseInt(request.getParameter("gid")); // group
        GradeDBContext gdb = new GradeDBContext();
        GroupsDBContext groupsdb = new GroupsDBContext();
        AssessmentDBContex adb = new AssessmentDBContex();

        Groups g = groupsdb.getGroupsById(gid);
        ArrayList<CourseGrade> grades = gdb.getCourseGradesByCid(g.getCouse().getId());
        ArrayList<Assessment> assessments = adb.listAssessmentsbyInsid(insid, g.getCouse().getId());
        request.setAttribute("group", g);
        request.setAttribute("grades", grades);
        request.setAttribute("assessments", assessments);
        request.getRequestDispatcher("Instructor/checkGrade.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account,ArrayList<Role> Roles)
            throws ServletException, IOException {
        int insid = account.getUserId();
        int gid = Integer.parseInt(request.getParameter("group"));
        GradeDBContext gdb = new GradeDBContext();
        GroupsDBContext groupsdb = new GroupsDBContext();
        AssessmentDBContex adb = new AssessmentDBContex();

        ArrayList<Assessment> checkAssessments = new ArrayList<>();

        Groups g = groupsdb.getGroupsById(gid);
        ArrayList<CourseGrade> grades = gdb.getCourseGradesByCid(g.getCouse().getId());

        for (CourseGrade courseGrade : grades) {
            for (Student student : g.getListStudent()) {
                Assessment a = new Assessment();
                String score_raw = request.getParameter("score_" + student.getId() + "_" + courseGrade.getGrade().getId());
                if ((score_raw != null) && (!score_raw.isEmpty())) {
                    float score = Float.parseFloat(score_raw);
                    a.setScore(score);
                    a.setWeight(courseGrade.getWeight());
                    a.setRequired(courseGrade.getRequired());
                    a.setStudent(student);

                    Instructor ins = new Instructor();
                    ins.setId(insid);
                    a.setIns(ins);

                    a.setGrade(courseGrade.getGrade());
                    a.setCourse(g.getCouse());

                    checkAssessments.add(a);
                    System.out.println(a);
                }
            }
        }

        adb.insertAssessment(checkAssessments);
        ArrayList<Assessment> assessments = adb.listAssessmentsbyInsid(insid, g.getCouse().getId());
        request.setAttribute("group", g);
        request.setAttribute("grades", grades);
        request.setAttribute("assessments", assessments);
        request.setAttribute("done", "Grading successfuly");
        request.getRequestDispatcher("Instructor/checkGrade.jsp").forward(request, response);
    }

}
