/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.NotificationDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Notification;


/**
 *
 * @author Admin
 */
public class NotificationDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NotificationDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotificationDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("account");
        NotificationDBContext notificationDBContext = new NotificationDBContext();
        String id = request.getParameter("id");
        if (account.getRoleid() == 2) {
            notificationDBContext.updateUserNotificationById(Integer.parseInt(id));
            Notification userNotification = notificationDBContext.getNotificationDetailById(Integer.parseInt(id));
            int numUnread = notificationDBContext.countUserUnreadNotification();
            request.setAttribute("numUnread", numUnread);
            request.setAttribute("notification", userNotification);
        }
        if(account.getRoleid() == 1){
            notificationDBContext.updateMentorNotificationById(Integer.parseInt(id));
            Notification mentorNotification = notificationDBContext.getMentorNotificationDetailById(Integer.parseInt(id));
            int numUnread = notificationDBContext.countMentorUnreadNotification();
            request.setAttribute("numUnread", numUnread);
            request.setAttribute("notification", mentorNotification);
        }
        request.getRequestDispatcher("WEB-INF/view/notificationdetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
