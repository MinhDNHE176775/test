/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Role;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class RoleDBContext extends DBContext<Role> {

    @Override
    public ArrayList<Role> listAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Role getRoleByUsernameAndUrl(String username, String url) {
        try {
            String sql = "SELECT r.id, r.[name] FROM Account a JOIN [Role] r ON r.id = a.roleid JOIN Role_Feature rf ON r.id = rf.roleid JOIN\n"
                    + "Feature f ON f.id = rf.feaid WHERE a.username = ? AND f.[url] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, url);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                return r;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
