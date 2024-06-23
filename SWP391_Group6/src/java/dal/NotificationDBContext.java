/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import model.Mentor;
import model.Notification;
import model.User;

/**
 *
 * @author Admin
 */
public class NotificationDBContext extends DBContext<Object> {

    public ArrayList<Notification> listByUserId(int userid) {
        ArrayList<Notification> notifications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Notification] WHERE [userid] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                User user = new User();
                user.setId(rs.getInt("userid"));
                n.setTitle(rs.getString("title"));
                n.setIsRead(rs.getBoolean("isRead"));
                n.setContent(rs.getString("content"));
                StringBuilder sb = new StringBuilder();
                sb.append(rs.getDate("createdAt")).append(" ").append(rs.getTime("createdAt"));
                n.setCreatedAt(sdf.parse(sb.toString()));
                n.setUser(user);
                notifications.add(n);
            }
        } catch (Exception e) {
        }
        return notifications;
    }

    public ArrayList<Notification> listByMenId(int menid) {
        ArrayList<Notification> notifications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Notification] WHERE [menid] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, menid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                Mentor mentor = new Mentor();
                mentor.setId(rs.getInt("menid"));
                n.setTitle(rs.getString("title"));
                n.setIsRead(rs.getBoolean("isRead"));
                n.setContent(rs.getString("content"));
                StringBuilder sb = new StringBuilder();
                sb.append(rs.getDate("createdAt")).append(" ").append(rs.getTime("createdAt"));
                n.setCreatedAt(sdf.parse(sb.toString()));
                n.setMentor(mentor);
                notifications.add(n);
            }
        } catch (Exception e) {
        }
        return notifications;
    }

    public void createMentorNotification(Notification mentorNotification) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Notification]([title], [content], [createdAt], [isRead], [menid]) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, mentorNotification.getTitle());
            ps.setString(2, mentorNotification.getContent());
            ps.setTimestamp(3, new Timestamp(mentorNotification.getCreatedAt().getTime()));
            ps.setBoolean(4, mentorNotification.isIsRead());
            ps.setInt(5, mentorNotification.getMentor().getId());
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
    
     public void createUserNotification(Notification userNotification) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Notification]([title], [content], [createdAt], [isRead], [menid]) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userNotification.getTitle());
            ps.setString(2, userNotification.getContent());
            ps.setTimestamp(3, new Timestamp(userNotification.getCreatedAt().getTime()));
            ps.setBoolean(4, userNotification.isIsRead());
            ps.setInt(5, userNotification.getUser().getId());
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

    public void updateMentorNotification() {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [dbo].[Notification] SET [isRead] = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
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

    public void updateUserNotificationById(int id) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [dbo].[Notification] SET [isRead] = 1 WHERE [id] = ?";
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

    public void updateMentorNotificationById(int id) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [dbo].[Notification] SET [isRead] = 1 WHERE [id] = ?";
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

    public Notification getNotificationDetailById(int id) {
        try {
            String sql = "SELECT * FROM [dbo].[Notification] WHERE [id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Notification userNotification = new Notification();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                userNotification.setId(rs.getInt("id"));
                User user = new User();
                user.setId(rs.getInt("userid"));
                userNotification.setTitle(rs.getString("title"));
                userNotification.setIsRead(rs.getBoolean("isRead"));
                userNotification.setContent(rs.getString("content"));
                StringBuilder sb = new StringBuilder();
                sb.append(rs.getDate("createdAt")).append(" ").append(rs.getTime("createdAt"));
                try {
                    userNotification.setCreatedAt(sdf.parse(sb.toString()));
                } catch (ParseException e) {
                }
                userNotification.setUser(user);
                return userNotification;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Notification getMentorNotificationDetailById(int id) {
        try {
            String sql = "SELECT * FROM [dbo].[Notification] WHERE [id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Notification mentorNotification = new Notification();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                mentorNotification.setId(rs.getInt("id"));
                Mentor mentor = new Mentor();
                mentor.setId(rs.getInt("menid"));
                mentorNotification.setTitle(rs.getString("title"));
                mentorNotification.setIsRead(rs.getBoolean("isRead"));
                mentorNotification.setContent(rs.getString("content"));
                StringBuilder sb = new StringBuilder();
                sb.append(rs.getDate("createdAt")).append(" ").append(rs.getTime("createdAt"));
                try {
                    mentorNotification.setCreatedAt(sdf.parse(sb.toString()));
                } catch (ParseException e) {
                }
                mentorNotification.setMentor(mentor);
                return mentorNotification;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int countUserUnreadNotification() {
        int num = 0;
        try {
            String sql = "SELECT COUNT([isRead]) AS num FROM [dbo].[User_Notification] WHERE [isRead] = 0";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } catch (Exception e) {
        }
        return num;
    }

    public int countMentorUnreadNotification() {
        int num = 0;
        try {
            String sql = "SELECT COUNT([isRead]) AS num FROM [dbo].[Mentor_Notification] WHERE [isRead] = 0";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } catch (Exception e) {
        }
        return num;
    }

    @Override
    public ArrayList<Object> listAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Object entity
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object entity
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object entity
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
