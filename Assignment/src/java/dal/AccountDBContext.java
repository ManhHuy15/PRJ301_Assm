/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HUY
 */
public class AccountDBContext extends DBContext {

    public Account getAccountByUserPass(String user, String pass) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[user_id]\n"
                + "  FROM [dbo].[Accounts]\n"
                + "  WHERE username = ? AND password = ? ";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setUserId(rs.getInt("user_id"));
                
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        AccountDBContext adb = new AccountDBContext();
        
    }
}
