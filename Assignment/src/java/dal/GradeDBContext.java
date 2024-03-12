/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseGrade;
import model.Grade;
import model.GradeCate;
import model.GradeDetail;

/**
 *
 * @author HUY
 */
public class GradeDBContext extends DBContext {

    public ArrayList<CourseGrade> getInfoByCourse(String code) {

        ArrayList<CourseGrade> list = new ArrayList<>();
        String sql = "SELECT cid ,weight, required, gradeid, g.name As gradeName,type,cateid,gcate.name as cateName \n"
                + "			,g.did,dg.duration,dg.questionType,dg.noQuestion,dg.gradingGuide,dg.describe\n"
                + "FROM CourseGrade cg JOIN Grade g ON cg.gradeid = g.id\n"
                + "	JOIN Courses c ON cg.cid = c.id\n"
                + "	JOIN GradeCategories gcate ON g.cateid = gcate.id\n"
                + "	JOIN DetailGrade dg ON g.did = dg.id \n"
                + "WHERE c.code = ?"
                + "ORDER BY gcate.priority ASC, weight ASC, gradeName ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CourseGrade cg = new CourseGrade();

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(code);
                cg.setCourse(c);

                cg.setWeight(rs.getFloat("weight"));
                cg.setRequired(rs.getInt("required"));

                Grade g = new Grade();
                g.setId(rs.getInt("gradeid"));
                g.setName(rs.getString("gradeName"));
                g.setType(rs.getString("type"));
                GradeCate cate = new GradeCate();
                cate.setId(rs.getInt("cateid"));
                cate.setName(rs.getString("cateName"));
                g.setCate(cate);

                GradeDetail gd = new GradeDetail();
                gd.setId(rs.getInt("did"));
                gd.setDur(rs.getString("duration"));
                gd.setqType(rs.getString("questionType"));
                gd.setNoQ(rs.getInt("noQuestion"));
                gd.setGrGuide(rs.getString("gradingGuide"));
                gd.setDescr(rs.getString("describe"));
                g.setDetail(gd);

                cg.setGrade(g);

                list.add(cg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<CourseGrade> getCourseGradesByCid(int cid) {
        ArrayList<CourseGrade> grades = new ArrayList<>();
        String sql = "SELECT cid, cateid, gcate.name as cateName ,  gradeid, g.name as gradeName, weight, required, gcate.priority\n"
                + "FROM CourseGrade cg JOIN Grade g ON cg.gradeid = g.id\n"
                + "	JOIN GradeCategories gcate ON g.cateid = gcate.id\n"
                + "WHERE cid = ?\n"
                + "ORDER BY gcate.priority ASC, weight ASC, gradeName ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CourseGrade cg = new CourseGrade();

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                cg.setCourse(c);

                Grade g = new Grade();
                g.setId(rs.getInt("gradeid"));
                g.setName(rs.getString("gradeName"));
                GradeCate cate = new GradeCate();
                cate.setId(rs.getInt("cateid"));
                cate.setName(rs.getString("cateName"));
                g.setCate(cate);
                cg.setGrade(g);

                cg.setWeight(rs.getFloat("weight"));
                cg.setRequired(rs.getInt("required"));
                grades.add(cg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    public ArrayList<GradeCate> getGradeCateByCid(int cid) {
        ArrayList<GradeCate> gradeCates = new ArrayList<>();
        String sql = "SELECT DISTINCT cateid, gcate.name as cateName ,  gcate.priority\n"
                + "FROM CourseGrade cg JOIN Grade g ON cg.gradeid = g.id\n"
                + "	JOIN GradeCategories gcate ON g.cateid = gcate.id\n"
                + "WHERE cid = ?\n"
                + "ORDER BY gcate.priority ASC";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                GradeCate gc = new GradeCate();
                gc.setId(rs.getInt("cateid"));
                gc.setName(rs.getString("cateName"));

                gradeCates.add(gc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return gradeCates;
    }
}
