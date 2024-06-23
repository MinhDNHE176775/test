/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.manager;

import dal.NotificationDBContext;
import dal.SessionDBContext;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Date;
import model.Notification;
import util.UserDataDetail;
import java.sql.SQLException;
import service.NotificationService;

/**
 *
 * @author Admin
 */
public class ManagerService {
    private SessionDBContext sessionDBContext;

    public ManagerService() {
        sessionDBContext = new SessionDBContext();
    }

    public void processAcceptMentorSchedule(int id, HttpServletRequest request) {
        try {
            sessionDBContext.acceptScheduleById(id);
        } catch (SQLException e) {
        } finally {
            request.getSession().setAttribute("mess", "Operation accept with id " + id + " successfully");
        }
    }

    public void processRejectMentorSchedule(UserDataDetail udd, HttpServletRequest request) {
        NotificationService notificationService = new NotificationService();
        NotificationDBContext notificationDBContext = new NotificationDBContext();
        int id = udd.getIntegerAttribute("sessionID");
        String pickedDate = udd.getStringAttribute("pickedDate");
        try {
            sessionDBContext.rejectScheduleById(id);
            Notification menNotification = new Notification();
            menNotification.setTitle("Manager has been rejected your schedule");
            String content = "Picked date:<br>" + pickedDate + 
                    ", slot " + udd.getIntegerAttribute("pickedSlot") + "<br>Reason:<br>"
                    + udd.getStringAttribute("reason").replaceAll("\n", "<br>");
            menNotification.setContent(content);
            menNotification.setCreatedAt(new Date());
            menNotification.setIsRead(false);
            notificationDBContext.createMentorNotification(menNotification);
        } catch (SQLException e) {
        } finally {
            request.getSession().setAttribute("mess", "Operation reject with id " + id + " successfully");
        }
    }


}
