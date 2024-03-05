/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Course;
import model.Grade;
import model.GradeCate;
import model.Student;
import model.Term;

/**
 *
 * @author HUY
 */
public class AssessmentDBContex extends DBContext {

    public void insertAssessment(ArrayList<Assessment> checkAssessments) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Assessment ]\n"
                    + "           ([score]\n"
                    + "           ,[weight]\n"
                    + "           ,[required]\n"
                    + "           ,[sid]\n"
                    + "           ,[insid]\n"
                    + "           ,[gradeid]\n"
                    + "           ,[cid]\n"
                    + "           ,[dateTime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            
            PreparedStatement st = connection.prepareStatement(sql);
            for (Assessment ass : checkAssessments) {
                st.setFloat(1, ass.getScore());
                st.setFloat(2, ass.getWeight());
                st.setString(3, ass.getRequired());
                st.setInt(4, ass.getStudent().getId());
                st.setInt(5, ass.getIns().getId());
                st.setInt(6, ass.getGrade().getId());
                st.setInt(7, ass.getCourse().getId());
                 st.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AssessmentDBContex.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(AssessmentDBContex.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Assessment> getAssBySidCid(int sid, int cid, Term t) {
        ArrayList<Assessment> assessments = new ArrayList<>();
        String sql = "SELECT  a.id, \n"
                + "		a.score, \n"
                + "		a.required, \n"
                + "		a.weight,  \n"
                + "		CONVERT(Date, a.dateTime) AS dateRecord, \n"
                + "		s.id AS sid, \n"
                + "		s.code AS scode, \n"
                + "		a.cid, \n"
                + "		c.code AS courseCode, \n"
                + "		a.gradeid, \n"
                + "		g.name AS gradeName, \n"
                + "		g.cateid, \n"
                + "		gc.name AS gradeCate\n"
                + "FROM [Assessment ] a JOIN Students s ON a.sid = s.id\n"
                + "		JOIN Courses c ON a.cid = c.id\n"
                + "		JOIN Grade g ON a.gradeid = g.id\n"
                + "		JOIN GradeCategories gc ON g.cateid = gc.id\n"
                + "WHERE  sid = ? \n"
                + "    AND cid = ? \n"
                + "    AND CONVERT(Date, a.dateTime) >= ? \n"
                + "    AND CONVERT(Date, a.dateTime) <= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setInt(2, cid);
            st.setDate(3, t.getStart());
            st.setDate(4, t.getEnd());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setId(rs.getInt("id"));
                a.setScore(rs.getFloat("score"));
                a.setRequired(rs.getString("required"));
                a.setWeight(rs.getFloat("weight"));

                a.setDateRecord(rs.getDate("dateRecord"));

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setCode(rs.getString("scode"));
                a.setStudent(s);

                Grade g = new Grade();
                g.setId(rs.getInt("gradeid"));
                g.setName(rs.getString("gradeName"));

                GradeCate gc = new GradeCate();
                gc.setId(rs.getInt("cateid"));
                gc.setName(rs.getString("gradeCate"));
                g.setCate(gc);

                a.setGrade(g);

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("courseCode"));
                a.setCourse(c);

                assessments.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContex.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assessments;
    }

    public ArrayList<Assessment> listAssessmentsbyInsid(int insid, int cid) {
        ArrayList<Assessment> list = new ArrayList();
        String sql = "SELECT [id]\n"
                + "      ,[score]\n"
                + "      ,[weight]\n"
                + "      ,[required]\n"
                + "      ,[sid]\n"
                + "      ,[insid]\n"
                + "      ,[gradeid]\n"
                + "      ,[cid]\n"
                + "      ,[dateTime]\n"
                + "  FROM [dbo].[Assessment ]\n"
                + "  WHERE cid = ? AND insid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, insid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setId(rs.getInt("id"));
                a.setScore(rs.getFloat("score"));
                a.setRequired(rs.getString("required"));
                a.setWeight(rs.getFloat("weight"));
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                a.setStudent(s);

                Grade g = new Grade();
                g.setId(rs.getInt("gradeid"));
                a.setGrade(g);

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                a.setCourse(c);

                list.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContex.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        AssessmentDBContex adb = new AssessmentDBContex();
        Term t = new Term();
        Date date1 = Date.valueOf(String.format("%04d-%02d-%02d", 2024, 1, 2));
        Date date2 = Date.valueOf(String.format("%04d-%02d-%02d", 2024, 4, 30));
        t.setStart(date1);
        t.setEnd(date2);
        System.out.println(adb.getAssBySidCid(1, 1, t).size());
    }
}
