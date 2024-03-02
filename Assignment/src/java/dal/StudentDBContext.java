/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author HUY
 */
public class StudentDBContext extends DBContext {

    public Student getStudentById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[first_name]\n"
                + "      ,[mid_name]\n"
                + "      ,[last_name]\n"
                + "      ,[isGender]\n"
                + "      ,[email]\n"
                + "      ,[image_src]\n"
                + "  FROM [dbo].[Students]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("code"));
                s.setFname(rs.getString("first_name"));
                s.setMname(rs.getString("mid_name"));
                s.setLname(rs.getString("last_name"));
                s.setGender(rs.getBoolean("isGender"));
                s.setEmail(rs.getString("email"));
                s.setImgSrc(rs.getString("image_src"));

                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getStudentBySession(int seid) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT Students.*\n"
                + "FROM     Groups INNER JOIN\n"
                + "                  HasGroup ON Groups.id = HasGroup.gid INNER JOIN\n"
                + "                  Sessions ON Groups.id = Sessions.gid INNER JOIN\n"
                + "                  Students ON HasGroup.sid = Students.id\n"
                + "WHERE Sessions.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("code"));
                s.setFname(rs.getString("first_name"));
                s.setMname(rs.getString("mid_name"));
                s.setLname(rs.getString("last_name"));
                s.setGender(rs.getBoolean("isGender"));
                s.setEmail(rs.getString("email"));
                s.setImgSrc(rs.getString("image_src"));
                
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public static void main(String[] args) {
        StudentDBContext sdb = new StudentDBContext();

    }

}
