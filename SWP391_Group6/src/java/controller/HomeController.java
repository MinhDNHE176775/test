

package controller;

import dal.NotificationDBContext;
import dal.SkillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Mentor;
import model.Notification;
import model.Skill;
import model.User;
import util.Util;


public class HomeController extends HttpServlet {
   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SkillDBContext sdc = new SkillDBContext();
        Account account = (Account) request.getSession().getAttribute("account");
        List<Skill> skills = sdc.listAll();
        
        
        int size = skills.size(), numPerPage = 6, page;
        String xPage = request.getParameter("page");
        if (xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        List<Object> pagedSkills = Util.listByPage((List<Object>)(List<?>)skills, xPage, numPerPage);
        
        
        if(account != null && account.getRoleid() == 2){
            NotificationDBContext notificationDBContext = new NotificationDBContext();
            User user = (User) request.getSession().getAttribute("user");
            ArrayList<Notification> notifications = notificationDBContext.listByUserId(user.getId());
            int numUnread = notificationDBContext.countUserUnreadNotification();
            request.setAttribute("numUnread", numUnread);
            request.setAttribute("notifications", notifications);
        }
        if(account != null && account.getRoleid() == 1){
            NotificationDBContext notificationDBContext = new NotificationDBContext();
            Mentor mentor = (Mentor) request.getSession().getAttribute("mentor");
            ArrayList<Notification> notifications = notificationDBContext.listByMenId(mentor.getId());
            int numUnread = notificationDBContext.countMentorUnreadNotification();
            request.setAttribute("numUnread", numUnread);
            request.setAttribute("notifications", notifications);
        }
        
        
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.getSession().setAttribute("pagedSkills", pagedSkills);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

   

}
