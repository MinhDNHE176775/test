/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Skill;
import java.sql.*;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SkillDBContext extends DBContext<Skill> {

    @Override
    public ArrayList<Skill> listAll() {
        ArrayList<Skill> skills = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Skill where status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setSkillname(rs.getString("skillname"));
                skill.setShortdescription(rs.getString("shortdescription"));
                skill.setAva(rs.getString("image"));
                skills.add(skill);
            }
        } catch (SQLException e) {
        }
        return skills;
    }

    @Override
    public void insert(Skill entity) {
        String sql = "INSERT INTO [dbo].[Skill]([skillname], [status], [description],  [image]) VALUES(?, ?, ?, ?)";
        try {
            connection.setAutoCommit(false);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, entity.getSkillname());
            st.setBoolean(2, true);
            st.setString(3, entity.getDescription());
            st.setString(4, entity.getAva());
            st.executeUpdate();
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
    public void update(Skill entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Skill entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Skill> listByMentor(int id) {
        ArrayList<Skill> skills = new ArrayList<>();
        try {
            String sql = "SELECT s.id, s.skillname FROM Mentor m JOIN Mentor_Skill mt ON m.id = mt.mentorid JOIN Skill s ON s.id = mt.skillid\n"
                    + "WHERE s.[status] = 1 AND m.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setSkillname(rs.getString("skillname"));
                skills.add(skill);
            }
        } catch (SQLException e) {
        }
        return skills;
    }

    public ArrayList<Skill> listAllForAdmin() {
        ArrayList<Skill> skills = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Skill";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setSkillname(rs.getString("skillname"));
                skill.setStatus(rs.getBoolean("status"));
                skill.setDescription(rs.getString("description"));
                skill.setAva(rs.getString("image"));
                skills.add(skill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skills;
    }

    public Skill getSkillById(int id) {
        try {
            String sql = "SELECT * FROM Skill s WHERE s.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setSkillname(rs.getString("skillname"));
                skill.setStatus(rs.getBoolean("status"));
                skill.setShortdescription("shortsescription");
                skill.setDescription(rs.getString("description"));
                skill.setAva(rs.getString("image"));
                return skill;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editSkill(Skill entity) {
        String sql = "UPDATE [dbo].[Skill] SET [skillname] = ?, [status] = ?, [description] = ?, [image] = ? WHERE [id] = ?";
        try {
            connection.setAutoCommit(false);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, entity.getSkillname());
            st.setBoolean(2, entity.isStatus());
            st.setString(3, entity.getDescription());

            st.setString(4, entity.getAva());
            st.setInt(5, entity.getId());

            st.executeUpdate();
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

    public List<Skill> getSkillsSearch(String text) {
        List<Skill> list = new ArrayList<>();
        String sql = "SELECT * FROM Skill WHERE skillname LIKE ? and status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setId(rs.getInt("id"));
                skill.setSkillname(rs.getString("skillname"));
                skill.setStatus(rs.getBoolean("status"));
                skill.setDescription(rs.getString("description"));
                skill.setShortdescription(rs.getString("shortdescription"));
                skill.setAva(rs.getString("image"));
                list.add(skill);
            }
        } catch (SQLException e) {
            // Handle exception
        }
        return list;
    }

    public boolean checkSkillExist(String skillName) {
        String sql = "SELECT COUNT(*) AS count FROM Skill WHERE skillname = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, skillName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void insertMentorSkill(int menid, String skillname){
        String skillSql = "SELECT * FROM Skill s WHERE s.skillname = ?";
        String insertSql = "INSERT INTO [dbo].[Mentor_Skill]([mentorid], [skillid]) VALUES(?, ?)";
        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(skillSql);
            ps.setString(1, skillname);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                PreparedStatement insert = connection.prepareStatement(insertSql);
                insert.setInt(1, menid);
                insert.setInt(2, rs.getInt("id"));
                insert.executeUpdate();
            }
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
