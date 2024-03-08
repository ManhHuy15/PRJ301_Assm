/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Groups;
import model.Instructor;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author HUY
 */
public class SessionsDBContext extends DBContext {

    private int totalSlot() {
        try {
            String sql = "SELECT COUNT([id]) AS numberslot\n"
                    + "  FROM [dbo].[TimeSlot]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("numberslot");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int numberAbsent(int stuid, int cid) {
        int number = 0;
        String sql = "SELECT COUNT(isatt.id) AS numberAbsent\n"
                + "FROM IsAttend isatt JOIN [Sessions] s ON isatt.sesid = s.id\n"
                + "	JOIN Groups g ON s.gid = g.id\n"
                + "WHERE stuid = ? and g.cid = ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stuid);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                number = rs.getInt("numberAbsent");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }

    public int numberCourseSesion(int cid, int term) {
        int number = 0;
        String sql = "SELECT COUNT(s.id) AS numberSession\n"
                + "FROM [Sessions] s JOIN Groups g ON s.gid = g.id\n"
                + "WHERE cid = ? and g.tid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, term);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                number = rs.getInt("numberSession");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }

    public TimeSlot getSlotByID(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[start]\n"
                + "      ,[end]\n"
                + "  FROM [Project_Prj].[dbo].[TimeSlot]\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("id"));
                ts.setStart(rs.getString("start"));
                ts.setEnd(rs.getString("end"));
                return ts;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<TimeSlot> getAllSlot() {

        ArrayList<TimeSlot> ListTs = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[start]\n"
                + "      ,[end]\n"
                + "  FROM [Project_Prj].[dbo].[TimeSlot]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("id"));
                ts.setStart(rs.getString("start"));
                ts.setEnd(rs.getString("end"));
                ListTs.add(ts);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListTs;
    }

    public ArrayList<Session> getSessionsStudentFromTo(int sid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT ses.id , s.code, hg.gid,g.[name] as groupName, g.cid, c.code as course,ses.dateTime, ses.tid as slot, [start], [end],\n"
                + "	ses.rid, r.[name] as room,a.id as aid ,a.status\n"
                + "FROM\n"
                + "	Students s JOIN HasGroup hg ON s.id = hg.[sid]\n"
                + "	JOIN Groups g oN hg.gid = g.id\n"
                + "	JOIN [Sessions] ses ON g.id = ses.gid\n"
                + "	JOIN TimeSlot t ON ses.tid = t.id\n"
                + "	JOIN Rooms r ON ses.rid = r.id\n"
                + "	JOIN Courses c ON g.cid = c.id \n"
                + "	LEFT JOIN IsAttend a ON A.sesid = ses.id AND s.id = a.stuid\n"
                + "WHERE s.id = ? AND ses.dateTime >= ? AND ses.dateTime <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setDate(2, from);
            st.setDate(3, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setId(rs.getInt("id"));
                s.setStatus(rs.getInt("status"));

                Groups g = new Groups();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("groupName"));
                s.setGroup(g);

                // Instructor i = new Instructor();
                //   i.setId(rs.getInt("insid"));
                // s.setIns(i);
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("course"));
                s.setCourse(c);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("slot"));
                ts.setStart(rs.getString("start"));
                ts.setEnd(rs.getString("end"));
                s.setSlot(ts);

                s.setRoom(rs.getString("room"));
                s.setDateTime(rs.getDate("dateTime"));

                if (rs.getInt("aid") != 0) {
                    s.setStatus(rs.getInt("status"));
                }
                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsInsFromTo(int insid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT s.id,s.gid, g.name as groupName, s.insid, i.code as insCode,g.cid,c.code as course,s.dateTime,s.attend, \n"
                + "		s.tid as slot,[start], [end],s.rid, r.name as rooms\n"
                + "FROM Sessions s JOIN Instructors i ON s.insid = i.id\n"
                + "	JOIN Groups g ON s.gid = g.id\n"
                + "	JOIN Courses c ON g.cid = c.id\n"
                + "	JOIN TimeSlot t ON s.tid = t.id\n"
                + "	JOIN Rooms r ON s.rid = r.id\n"
                + "WHERE s.insid = ? AND s.dateTime >= ? AND s.dateTime <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, insid);
            st.setDate(2, from);
            st.setDate(3, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setId(rs.getInt("id"));
                s.setStatus(rs.getInt("attend"));
                Groups g = new Groups();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("groupName"));
                s.setGroup(g);

                Instructor i = new Instructor();
                i.setId(rs.getInt("insid"));
                i.setCode(rs.getString("insCode"));
                s.setIns(i);

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("course"));
                s.setCourse(c);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("slot"));
                ts.setStart(rs.getString("start"));
                ts.setEnd(rs.getString("end"));
                s.setSlot(ts);

                s.setRoom(rs.getString("rooms"));
                s.setDateTime(rs.getDate("dateTime"));
                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public static void main(String[] args) {
        SessionsDBContext sdb = new SessionsDBContext();
        System.out.println((float)sdb.numberAbsent(1, 16)/sdb.numberCourseSesion(16, 4) * 100 );
        System.out.println(sdb.numberCourseSesion(16, 4));
        
    }
}
