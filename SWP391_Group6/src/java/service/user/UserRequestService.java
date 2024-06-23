/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.user;

import dal.RequestDBContext;
import dal.SessionDBContext;
import dal.UserDBContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Mentor;
import model.Request;
import model.User;
import service.NotificationService;
import util.UserDataDetail;
import util.Util;

/**
 *
 * @author Admin
 */
public class UserRequestService {

    private final RequestDBContext requestDAO;
    private final UserDBContext userDAO;
    private final SessionDBContext sessionDAO;

    public UserRequestService() {
        requestDAO = new RequestDBContext();
        userDAO = new UserDBContext();
        sessionDAO = new SessionDBContext();
    }

    public void processCreateRequest(UserDataDetail userDataDetail, HttpServletRequest request) throws ParseException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");
        Account account = (Account) request.getSession().getAttribute("account");
        Request newRequest = new Request();
        newRequest.setTitle((String) userDataDetail.getAttribute("title"));
        String deadlineTime = (String) userDataDetail.getAttribute("deadlineTime");
        Date date = sdf.parse(deadlineTime);
        newRequest.setDeadlineTime((new StringBuilder().append(sdf.format(date).split("T")[0]).append(" ").append(sdf.format(date).split("T")[1])).toString());
        String[] skills = (String[]) userDataDetail.getAttribute("skills");
        if (skills.length > 1) {
            request.setAttribute("err", "You must choose no more than 1 skill");
        } else {
            newRequest.setContent((String) userDataDetail.getAttribute("content"));
            newRequest.setSkill(skills[0]);
            Mentor mm = (Mentor) request.getSession().getAttribute("mentor");
            Mentor mentor = new Mentor();
            mentor.setId(mm.getId());
            newRequest.setMentor(mentor);
            User user = userDAO.getUserById(account.getId());
            newRequest.setUser(user);

            String selectedSchedule = (String) request.getSession().getAttribute("selectedSchedule");
            String selectedSchedules[] = selectedSchedule.split(" ");
            ArrayList<String> schedules = new ArrayList<>();
            for (String selectedSchedule1 : selectedSchedules) {
                String sche = sessionDAO.getTimeBySesid(Integer.parseInt(selectedSchedule1));
                schedules.add(sche);
            }
            Date minDate = Util.findMinDate(schedules);
            if (minDate.getTime() - date.getTime() >= 43200000) {
                try {
                    requestDAO.insert(newRequest);
                    Request topRequest = requestDAO.selectTopRequest();
                    for (String selectedSchedule1 : selectedSchedules) {
                        sessionDAO.updateByTempuser(topRequest.getId(), user.getId(), Integer.parseInt(selectedSchedule1));
                    }
                } catch (Exception e) {
                }
                request.setAttribute("success", "Create request successfully");
                NotificationService notificationService = new NotificationService();
                notificationService.sendRequestNotificationForMentor(request, (String) userDataDetail.getAttribute("content"));
            } else {
                request.setAttribute("errr", "Please choose the deadline schedule again! The diffrence between dealine and the minimum of your selected dates must be at least 12 hours. Visit <a href='book_mentor?menid="+mm.getId()+"'>here</a> to choose again");
            }
        }
    }

    public void processUpdateRequest(UserDataDetail userDataDetail, HttpServletRequest request) {
        String requestId_raw = (String) request.getSession().getAttribute("requestid");
        int requestId = Integer.parseInt(requestId_raw);
        Account account = (Account) request.getSession().getAttribute("account");
        Request newRequest = new Request();
        newRequest.setId(requestId);
        newRequest.setTitle((String) userDataDetail.getAttribute("title"));
        String deadlineTime = (String) userDataDetail.getAttribute("deadlineTime");
        newRequest.setDeadlineTime(deadlineTime);
        newRequest.setSkill((String) userDataDetail.getAttribute("updateSkill"));
        newRequest.setContent((String) userDataDetail.getAttribute("content"));
        requestDAO.updateRequestById(newRequest);
        request.getSession().setAttribute("success", "Update request with id " + requestId + " successfully");

    }

}
