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
import model.Attendant;
import model.Groups;
import model.Instructor;
import model.Session;
import model.Student;
import model.TimeSlot;

/**
 *
 * @author HUY
 */
public class AttendantDBContext extends DBContext {

    public void checkAttendBySession(int sesid, ArrayList<Attendant> attendance) {
        ArrayList<Attendant> sqlAtt = getAttendant(sesid);
        //System.out.println(sqlAtt.size());
        for (Attendant attend : attendance) {
            if (sqlAtt.isEmpty()) {
                //System.out.println(attend.getStudent().getId() + " insert");
                insertAttend(attend);
            } else {
                for (Attendant sqlatt : sqlAtt) {
                    //System.out.println("asdasd");
                    if (attend.getStudent().getId() == sqlatt.getStudent().getId()) {

                        //System.out.println(attend.getStudent().getId() + " update");
                        updateAttend(attend, sesid, attend.getStudent().getId());
                        sqlAtt.remove(sqlatt);
                        break;
                    } else {

                        // System.out.println(attend.getStudent().getId() + " insert");
                        insertAttend(attend);
                        sqlAtt.remove(sqlatt);
                        break;
                    }
                }
            }
        }
        AttendSession(sesid);
    }

    private void insertAttend(Attendant att) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[IsAttend]\n"
                    + "           ([status]\n"
                    + "           ,[stuid]\n"
                    + "           ,[sesid]\n"
                    + "           ,[recordTime]\n"
                    + "           ,[comment])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE()\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, att.getStatus());
            st.setInt(2, att.getStudent().getId());
            st.setInt(3, att.getSession().getId());
            st.setString(4, att.getComment());
            st.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void updateAttend(Attendant att, int sesid, int stuid) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [IsAttend]\n"
                    + "   SET [status] = ?\n"
                    + "      ,[stuid] = ?\n"
                    + "      ,[sesid] = ?\n"
                    + "      ,[recordTime] = GETDATE()\n"
                    + "      ,[comment] = ?\n"
                    + " WHERE sesid = ? AND stuid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, att.getStatus());
            st.setInt(2, stuid);
            st.setInt(3, sesid);
            st.setString(4, att.getComment());
            st.setInt(5, sesid);
            st.setInt(6, stuid);
            st.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void AttendSession(int sesid) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Sessions]\n"
                    + "   SET [attend] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 2);
            st.setInt(2, sesid);
            st.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Attendant> getAttendant(int sesid) {
        ArrayList<Attendant> atts = new ArrayList<>();
        String sql = "SELECT id, status, stuid,sesid,recordTime,comment \n"
                + "FROM IsAttend\n"
                + "WHERE sesid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sesid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Attendant att = new Attendant();

                att.setId(rs.getInt("id"));

                Session ses = new Session();
                ses.setId(sesid);
                att.setSession(ses);

                Student s = new Student();
                s.setId(rs.getInt("stuid"));
                att.setStudent(s);

                att.setStatus(rs.getInt("status"));
                att.setRecordTime(rs.getTimestamp("recordTime"));
                att.setComment(rs.getString("comment"));

                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return atts;
    }

    public ArrayList<Attendant> getAttendantBySesID(int sesid) {
        ArrayList<Attendant> atts = new ArrayList<>();
        String sql = "SELECT ses.id ,s.id as sid,s.code,s.first_name, s.mid_name, s.last_name, hg.gid,g.[name] as groupName,ses.dateTime, a.id as attID,a.status, a.recordTime,\n"
                + "	a.comment\n"
                + "FROM\n"
                + "	Students s JOIN HasGroup hg ON s.id = hg.[sid]\n"
                + "	JOIN Groups g oN hg.gid = g.id\n"
                + "	JOIN [Sessions] ses ON g.id = ses.gid\n"
                + "	LEFT JOIN IsAttend a ON A.sesid = ses.id AND s.id = a.stuid\n"
                + "WHERE ses.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sesid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Attendant att = new Attendant();
                Session ses = new Session();
                ses.setId(rs.getInt("id"));
                att.setSession(ses);

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setCode(rs.getString("code"));
                s.setFname(rs.getString("first_name"));
                s.setMname(rs.getString("mid_name"));
                s.setLname(rs.getString("last_name"));
                att.setStudent(s);

                att.setId(rs.getInt("attID"));
                if (rs.getInt("attID") != 0) {
                    att.setStatus(rs.getInt("status"));
                    att.setRecordTime(rs.getTimestamp("recordTime"));
                    att.setComment(rs.getString("comment"));
                }

                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    //student id, term id , course id
    public ArrayList<Attendant> getAllAttendBySid(int sid, int tid, int cid) {
        ArrayList<Attendant> list = new ArrayList<>();
        String sql = "SELECT hg.gid, g.name AS gname, sess.insid,i.code, sess.id, sess.tid, tl.[start], tl.[end]\n"
                + "		,sess.rid, r.name as room, dateTime, a.id as attid, a.status, a.recordTime, a.comment\n"
                + "FROM Students s JOIN HasGroup hg ON s.id = hg.sid\n"
                + "	JOIN Groups g ON hg.gid = g.id \n"
                + "	JOIN Sessions sess ON g.id = sess.gid\n"
                + "	JOIN TimeSlot tl ON sess.tid = tl.id\n"
                + "	JOIN Rooms r ON sess.rid = r.id\n"
                + "	JOIN Instructors i ON sess.insid = i.id\n"
                + "	LEFT JOIN IsAttend a ON a.stuid =s.id AND a.sesid = sess.id \n"
                + "WHERE s.id = ? AND g.tid = ? AND g.cid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setInt(2, tid);
            st.setInt(3, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Attendant attendant = new Attendant();

                Groups g = new Groups();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                
                
                Instructor i = new Instructor();
                i.setId(rs.getInt("insid"));
                i.setCode(rs.getString("code"));

                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setRoom(rs.getString("room"));
                session.setDateTime(rs.getDate("dateTime"));
                
                
                TimeSlot slot = new TimeSlot();
                slot.setId(rs.getInt("tid"));
                slot.setStart(rs.getString("start"));
                slot.setEnd(rs.getString("end"));
                
                session.setGroup(g);
                session.setIns(i);
                session.setSlot(slot);
                
                attendant.setSession(session);
                attendant.setId(rs.getInt("attid"));
                attendant.setStatus(rs.getInt("status"));
                attendant.setRecordTime(rs.getTimestamp("recordTime"));
                attendant.setComment(rs.getString("comment"));
                list.add(attendant);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendantDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static void main(String[] args) {
        AttendantDBContext a = new AttendantDBContext();
        System.out.println(a.getAttendantBySesID(1).size());
    }
}
