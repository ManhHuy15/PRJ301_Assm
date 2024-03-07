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
import model.Role;

/**
 *
 * @author HUY
 */
public class RoleDBContext extends DBContext {

    public ArrayList<Role> getByAccIdAndUrl(int accid, String url) {
        ArrayList<Role> roles = new ArrayList<>();
        String sql = "SELECT role.id,role.roleName\n"
                + "FROM   Accounts JOIN Account_Role ON Accounts.id = Account_Role.accid\n"
                + "INNER JOIN Role ON Account_Role.roleid = Role.id\n"
                + "INNER JOIN Role_Feature ON Role.id = Role_Feature.roleId\n"
                + "INNER JOIN Feature ON Role_Feature.fid = Feature.id\n"
                + "WHERE accid = ? AND url = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accid);
            st.setString(2, url);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("roleName"));
                roles.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return roles;
    }

}
