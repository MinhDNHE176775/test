/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.CV;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class CVDBContext extends DBContext<CV> {

    @Override
    public ArrayList<CV> listAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(CV entity) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[CV]([avatar], [intro], [achievement], [experience], [certificate], [skills], [menid]) VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getAvatar());
            ps.setString(2, entity.getIntro());
            ps.setString(3, entity.getAchievement());
            ps.setString(4, entity.getExperience());
            ps.setString(5, entity.getCertificate());
            ps.setString(6, entity.getSkills());
            ps.setInt(7, entity.getMentor().getId());
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
    public void update(CV entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(CV entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CV getCVByMentor(int id) {
        try {
            String sql = "SELECT * FROM [dbo].[CV] cv JOIN [dbo].[Mentor] m ON m.id = cv.menid WHERE m.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CV cv = new CV();
                cv.setId(rs.getInt("id"));
                cv.setAvatar(rs.getString("avatar"));
                cv.setIntro(rs.getString("intro"));
                cv.setAchievement(rs.getString("achievement"));
                cv.setExperience(rs.getString("experience"));
                cv.setCertificate(rs.getString("certificate"));
                cv.setSkills(rs.getString("skills"));
                return cv;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateCV(CV entity) {
        try {
            connection.setAutoCommit(false);
            String sql = """
                         UPDATE [dbo].[CV]
                         SET [avatar] = ?, [intro] = ?,
                         [achievement] = ?, [experience] = ?,
                         [certificate] = ?, [skills] = ?
                         WHERE [id] = ?
                         """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getAvatar());
            ps.setString(2, entity.getIntro());
            ps.setString(3, entity.getAchievement());
            ps.setString(4, entity.getExperience());
            ps.setString(5, entity.getCertificate());
            ps.setString(6, entity.getSkills());
            ps.setInt(7, entity.getId());
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
