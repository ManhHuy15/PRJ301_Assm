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

/**
 *
 * @author HUY
 */
public class CoursesDBContext extends DBContext {

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
                c.setDetailid(rs.getInt("detailid"));

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
                c.setDetailid(rs.getInt("detailid"));
                
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
}
