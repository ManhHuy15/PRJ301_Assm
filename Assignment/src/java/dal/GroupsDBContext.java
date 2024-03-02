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

/**
 *
 * @author HUY
 */
public class GroupsDBContext extends DBContext {

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
            while(rs.next()){
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
}
