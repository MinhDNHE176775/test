/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Account;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class AccountDBContext extends DBContext<Account> {

    @Override
    public ArrayList<Account> listAll() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("accid"));
                a.setUsername(rs.getString("username"));
                accounts.add(a);
            }
        } catch (SQLException e) {
        }
        return accounts;
    }

    @Override
    public void insert(Account entity) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO Account(username, [password], roleid, email, [status]) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getPassword());
            ps.setInt(3, entity.getRoleid());
            ps.setString(4, entity.getEmail());
            ps.setBoolean(5, entity.isStatus());

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
    public void update(Account entity) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account SET username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getUsername());
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

    public void updateById(Account entity, int id) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account SET username = ? WHERE accid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getUsername());
            ps.setInt(2, id);
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
    public void delete(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean checkAccountExist(String username, String email) {
        try {
            String sql = "SELECT * FROM Account a WHERE a.username = ? OR a.email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }
    
        public boolean checkUserNameExist(String username) {
        try {
            String sql = "SELECT * FROM Account a WHERE a.username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        try {
            String sql = "SELECT * FROM Account a WHERE a.email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }


    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT a.accid, a.username, a.email, a.roleid FROM Account a WHERE a.username = ? AND a.[password] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("accid"));
                a.setUsername(rs.getString("username"));
                a.setEmail(rs.getString("email"));
                a.setRoleid(rs.getInt("roleid"));
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByUsernameAndEmail(String username, String email) {
        try {
            String sql = "SELECT * FROM Account a WHERE a.username = ? AND a.email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("accid"));
                account.setUsername(rs.getString("username"));
                account.setEmail(rs.getString("email"));
                return account;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updatePasswordByUsername(String password, String username) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account SET password = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
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

}
