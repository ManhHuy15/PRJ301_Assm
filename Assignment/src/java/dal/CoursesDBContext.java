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
import model.DetailCourse;

/**
 *
 * @author HUY
 */
public class CoursesDBContext extends DBContext {

    public ArrayList<Course> getCourseByCode(String code) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[code]\n"
                + "      ,[name]\n"
                + "      ,[did]\n"
                + "      ,[detailid]\n"
                + "  FROM [Courses]\n"
                + "  WHERE Code like '%"+code+"%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("name"));

                c.setDid(rs.getInt("did"));
                DetailCourse dc = new DetailCourse();
                dc.setId(rs.getInt("detailid"));
                c.setDetail(dc);

                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public Course getInfor(String code) {
        String sql = "SELECT c.id as courseid,code, name, did,detailid, noCredit,timeStudy\n"
                + "		,preRequisite,description,studentTask,tools\n"
                + "FROM Courses c JOIN DetailCourse dc ON c.detailid = dc.id\n"
                + "WHERE code = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("courseid"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("name"));
                c.setDid(rs.getInt("did"));

                DetailCourse dc = new DetailCourse();
                dc.setId(rs.getInt("detailid"));
                dc.setNoCredit(rs.getInt("noCredit"));
                dc.setTimeStudy(rs.getString("timeStudy"));
                dc.setPreReq(rs.getString("preRequisite"));
                dc.setDescr(rs.getString("description"));
                dc.setTask(rs.getString("studentTask"));
                dc.setTools(rs.getString("tools"));

                c.setDetail(dc);

                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Course getCourseById(int cid) {
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[name]\n"
                + "      ,[did]\n"
                + "      ,[detailid]\n"
                + "  FROM [Courses]\n"
                + "  WHERE id =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("name"));

                c.setDid(rs.getInt("did"));

                DetailCourse dc = new DetailCourse();
                dc.setId(rs.getInt("detailid"));
                c.setDetail(dc);

                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Course> getCoursesByInsAndTerm(int insid, int tid) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT c.[id]\n"
                + "      ,[code]\n"
                + "      ,c.[name]\n"
                + "      ,[did]\n"
                + "      ,[detailid]\n"
                + "  FROM [Courses] c JOIN Groups g ON c.id = g.cid\n"
                + "  WHERE g.insid = ? AND g.tid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, insid);
            st.setInt(2, tid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("name"));

                c.setDid(rs.getInt("did"));
                DetailCourse dc = new DetailCourse();
                dc.setId(rs.getInt("detailid"));
                c.setDetail(dc);

                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
}
