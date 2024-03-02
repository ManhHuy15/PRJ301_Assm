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
import model.Term;

/**
 *
 * @author HUY
 */
public class TermDBContext extends DBContext {

    public ArrayList<Term> getAllTermsBySID(int sid) {
        ArrayList<Term> terms = new ArrayList<>();
        String sql = "Select t.id, t.name, t.start, t.[end]\n"
                + "FROM Students s JOIN  HasGroup hg On s.id = hg.sid\n"
                + "	JOIN Groups g ON hg.gid = g.id  \n"
                + "	JOIN Terms t ON g.tid = g.id\n"
                + "WHERE s.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Term t = new Term();

                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setStart(rs.getDate("start"));
                t.setEnd(rs.getDate("end"));

                terms.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TermDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return terms;
    }

    public Term getTermByDate(Date d) {
        String sql = "SELECT *\n"
                + "FROM Terms\n"
                + "WHERE [start] <= ?  AND [end] >= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, d);
            st.setDate(2, d);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Term t = new Term();

                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setStart(rs.getDate("start"));
                t.setEnd(rs.getDate("end"));

                return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TermDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Term getTermById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[start]\n"
                + "      ,[end]\n"
                + "  FROM [dbo].[Terms]\n"
                + "  WhERE id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                  Term t = new Term();

                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setStart(rs.getDate("start"));
                t.setEnd(rs.getDate("end"));

                return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TermDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
