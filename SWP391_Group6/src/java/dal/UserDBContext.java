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
import model.Account;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext<User> {

    @Override
    public ArrayList<User> listAll() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User m = new User();
                m.setId(rs.getInt("userid"));
                users.add(m);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    @Override
    public void insert(User entity) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [User]([Name], Gender, Phone, [Address], DateOfBirth, accid) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setBoolean(2, entity.isGender());
            ps.setString(3, entity.getPhone());
            ps.setString(4, entity.getAddress());
            ps.setDate(5, (Date) entity.getDateOfBirth());
            ps.setInt(6, entity.getAccount().getId());
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e3) {
            }
        }
    }

    @Override
    public void update(User entity) {
    }
    
    public void updateById(User entity, int id){
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [User] SET ava = ?, [Name] = ?, DateOfBirth = ?, Gender = ?, [Address] = ? WHERE userid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getAva());
            ps.setString(2, entity.getName());
            ps.setDate(3, (Date) entity.getDateOfBirth());
            ps.setBoolean(4, entity.isGender());
            ps.setString(5, entity.getAddress());
            ps.setInt(6, id);
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e3) {
            }
        }
    }

    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public User getUserById(int id) {
        try {
            String sql = "SELECT u.userid, u.ava, a.username, u.[Name], u.DateOfBirth, a.email, u.gender,  u.[Address]  FROM [Account] a JOIN [User] u ON a.accid = u.accid\n"
                    + "WHERE u.accid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setEmail(rs.getString("email"));
                User user = new User();
                user.setId(rs.getInt("userid"));
                user.setAva(rs.getString("ava"));
                user.setName(rs.getString("Name"));
                user.setDateOfBirth(rs.getDate("DateOfBirth"));
                user.setGender(rs.getBoolean("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setAccount(account);
                return user;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
