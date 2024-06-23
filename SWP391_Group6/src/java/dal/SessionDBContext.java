/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import model.Account;
import model.Mentor;
import model.Session;
import model.Slot;
import model.User;

/**
 *
 * @author Admin
 */
public class SessionDBContext extends DBContext<Session> {

    @Override
    public ArrayList<Session> listAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
   public void insert(Session entity) {
        try {
            connection.setAutoCommit(false);
            String managerSql = "SELECT TOP 1 * FROM [dbo].[Manager]";
            String sql = "INSERT INTO [Session]([date], slotid, [status], skill, menid, managerid) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            PreparedStatement psManager = connection.prepareStatement(managerSql);
            int managerID = 0;
            ResultSet rsManager = psManager.executeQuery();
            if (rsManager.next()) {
                managerID = rsManager.getInt("id");
            }
            ps.setDate(1, (Date) entity.getDate());
            ps.setInt(2, entity.getSlot().getId());
            ps.setString(3, "Submitted");
            ps.setString(4, entity.getSkill());
            ps.setInt(5, entity.getMentor().getId());
            ps.setInt(6, managerID);
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
    public void update(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean isDuplicatedSession(Date date, int slotid, int menid) throws SQLException {
        try {
            String sql = "SELECT * FROM [Session] s WHERE s.[date] = ? AND s.slotid = ? AND s.menid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setInt(2, slotid);
            ps.setInt(3, menid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean isDuplicatedSessionByUserId(int sesid, int userid) throws SQLException {
        try {
            String sql = "SELECT * FROM [Session] s WHERE s.id = ? AND s.userid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sesid);
            ps.setInt(2, userid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public ArrayList<Session> listByMentorId(int id) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM [dbo].[Session] s LEFT JOIN [dbo].[User]
                         u ON u.[userid] = s.[userid] LEFT JOIN [dbo].[Account] a 
                         ON a.[accid] = u.accid WHERE s.[menid] = ? AND s.[userid]
                         IS NULL AND s.[tempuserid] IS NULL
                         """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("slotid"));
                Mentor mentor = new Mentor();
                mentor.setId(rs.getInt("menid"));
                User user = new User();
                user.setName(rs.getString("Name"));
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setDate(rs.getDate("date"));
                session.setSlot(slot);
                session.setMentor(mentor);
                session.setSkill(rs.getString("skill"));
                session.setUser(user);
                sessions.add(session);
            }
        } catch (SQLException e) {
        }
        return sessions;
    }

    public ArrayList<Session> listScheduleByMentorId(int id) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM [dbo].[Session] s LEFT JOIN [dbo].[User]
                           u ON u.[userid] = s.[userid] LEFT JOIN [dbo].[Account] a 
                          ON a.[accid] = u.accid JOIN [dbo].[Slot] sl ON sl.id = s.slotid WHERE s.[menid] = ?
                         """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setFrom(rs.getTime("from"));
                slot.setTo(rs.getTime("to"));
                slot.setId(rs.getInt("slotid"));
                Mentor mentor = new Mentor();
                mentor.setId(rs.getInt("menid"));
                User user = new User();
                user.setName(rs.getString("Name"));
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setDate(rs.getDate("date"));
                session.setSlot(slot);
                session.setMentor(mentor);
                session.setSkill(rs.getString("skill"));
                session.setUser(user);
                sessions.add(session);
            }
        } catch (SQLException e) {
        }
        return sessions;
    }

    public ArrayList<Session> listScheduleByUserId(int id) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = """
                         SELECT s.id AS sesid, s.[date], s.skill, s.slotid, sl.id, sl.[from], sl.[to], s.[status]
                         FROM [dbo].[Session] s JOIN Slot sl ON sl.id = s.slotid
                         JOIN [dbo].[Mentor] m ON m.id = s.menid
                         WHERE s.[userid] = ?
                         """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setFrom(rs.getTime("from"));
                slot.setTo(rs.getTime("to"));
                slot.setId(rs.getInt("slotid"));
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setDate(rs.getDate("date"));
                session.setSlot(slot);
                session.setSkill(rs.getString("skill"));
                session.setStatus(rs.getString("status"));
                sessions.add(session);
            }
        } catch (SQLException e) {
        }
        return sessions;
    }

    public void updateById(Session entity, int sesid) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Session] SET userid = ?, requestid = ?, temprequestid = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, sesid);
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

    public boolean isSlotAvailable(int id) throws SQLException {
        String sql = "SELECT * FROM [dbo].[Session] s WHERE s.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("tempuserid") == 0;
            }
        } catch (SQLException e) {
            throw new SQLException("An error occured");
        }
        return false;
    }

    public void updateByTempuser(int requestId, int userTempId, int sesid) {
        String sql = "UPDATE [dbo].[Session] SET [requestid] = ?, [tempuserid] = ? WHERE [id] = ?";
        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, requestId);
            ps.setInt(2, userTempId);
            ps.setInt(3, sesid);
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

    public void updateSession(String skill, int userid, int requestid) {
        String sql = "UPDATE [dbo].[Session] SET [skill] = ?, [userid] = ? WHERE [requestid] = ?";
        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, skill);
            ps.setInt(2, userid);
            ps.setInt(3, requestid);
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

    public void removeEmptyScheduleById(int id) {
        String sql = "DELETE FROM [dbo].[Session] WHERE [id] = ?";
        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
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

    public String getTimeBySesid(int sesid) {
        StringBuilder result = new StringBuilder();
        try {
            String sql = "SELECT s.[date], sl.[from]  FROM [dbo].[Session] s JOIN [dbo].[Slot] sl ON sl.id = s.slotid\n"
                    + "WHERE s.[id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sesid);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                result.append(rs.getDate("date")).append(" ").append(rs.getTime("from"));
            }
        } catch (Exception e) {
        }
        return result.toString();
    }
    
     public ArrayList<Session> getSubmittedSessions() {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = """
                         SELECT s.id, s.[date], s.slotid, sl.[from], sl.[to], s.[status], a.username
                         FROM [dbo].[Session] s JOIN [dbo].[Slot] sl ON sl.id = s.slotid JOIN 
                         [dbo].[Mentor] m ON m.id = s.menid JOIN [dbo].[Account] a ON a.accid = m.accid
                         WHERE s.[status] = 'Submitted'
                         """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setDate(rs.getDate("date"));
                Slot slot = new Slot();
                slot.setId(rs.getInt("slotid"));
                slot.setFrom(rs.getTime("from"));
                slot.setTo(rs.getTime("to"));
                session.setStatus(rs.getString("status"));
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                session.setSlot(slot);
                Mentor mentor = new Mentor();
                mentor.setAccount(account);
                session.setMentor(mentor);
                sessions.add(session);
            }
        } catch (Exception e) {
        }
        return sessions;
    }

    public void acceptScheduleById(int id) throws SQLException{
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [dbo].[Session] SET [status] = 'Accepted' WHERE [id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
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
     public void rejectScheduleById(int id) throws SQLException{
        try {
            connection.setAutoCommit(false);
            String sql = "DELETE FROM [dbo].[Session] WHERE [id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
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
