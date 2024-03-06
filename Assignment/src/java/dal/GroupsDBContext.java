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
import model.Term;
import model.Groups;
import model.Student;

/**
 *
 * @author HUY
 */
public class GroupsDBContext extends DBContext {

    public ArrayList<Groups> getGroupsByTermAndIns(Term T, int insid, int cid) {
        ArrayList<Groups> groupses = new ArrayList<>();
        String sql = "SELECT g.[id]\n"
                + "      ,g.[name] as groupName\n"
                + "      ,[cid]\n"
                + "      ,[insid]\n"
                + "      ,[tid], c.code,c.name as courseName\n"
                + "  FROM [dbo].[Groups] g JOIN Courses c ON g.cid = c.id \n"
                + "  WHERE insid = ? AND tid = ? AND cid = ?" ;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, insid);
            st.setInt(2, T.getId());
            st.setInt(3,cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Groups g = new Groups();
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("groupName"));

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("courseName"));
                g.setCouse(c);
                g.setTerm(T);

                groupses.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groupses;
    }

    public ArrayList<Groups> getGroupsByTermAndSID(Term T, int sid) {
        ArrayList<Groups> groupses = new ArrayList<>();
        String sql = "SELECT hg.gid, g.name as groupName, g.cid, c.code as courseCode, c.name as courseName\n"
                + "FROM Students s JOIN HasGroup hg ON s.id = hg.sid\n"
                + "	JOIN Groups g ON hg.gid = g.id\n"
                + "	JOIN Courses c ON g.cid = c.id\n"
                + "	JOIN Terms t ON g.tid = t.id\n"
                + "WHERE s.id =? AND t.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setInt(2, T.getId());

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Groups g = new Groups();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("groupName"));

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("courseCode"));
                c.setName(rs.getString("courseName"));
                g.setCouse(c);
                g.setTerm(T);

                groupses.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groupses;
    }

    public Groups getGroupsById(int gid) {
        Groups g = new Groups();
        g.setId(gid);

        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT g.id, g.name, g.cid,c.code as courseCode, c.name as courseName , hg.sid, s.code, s.first_name,s.mid_name,s.last_name,s.isGender,s.email\n"
                + "FROM Groups g JOIN HasGroup hg ON g.id = hg.gid\n"
                + "	JOIN Courses c ON g.cid = c.id\n"
                + "	JOIN Students s ON hg.sid = s.id\n"
                + "WHERE g.id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, gid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                g.setName(rs.getString("name"));

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("courseCode"));
                c.setName(rs.getString("courseName"));
                g.setCouse(c);

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setCode(rs.getString("code"));
                s.setFname(rs.getString("first_name"));
                s.setMname(rs.getString("mid_name"));
                s.setLname(rs.getString("last_name"));
                s.setGender(rs.getBoolean("isGender"));
                s.setEmail(rs.getString("email"));
                students.add(s);
            }
            g.setListStudent(students);
        } catch (SQLException ex) {
            Logger.getLogger(GroupsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return g;
    }
}
