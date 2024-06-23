/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import controller.authorization.BaseAuthController;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Session;
import service.manager.ManagerService;
import util.UserDataDetail;

/**
 *
 * @author ADMIN
 */
public class ManageScheduleController extends BaseAuthController {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ManageScheduleController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageScheduleController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        SessionDBContext sessionDBContext = new SessionDBContext();
        ArrayList<Session> sessions = sessionDBContext.getSubmittedSessions();
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("WEB-INF/view/manager/manageschedule.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String sessionId = request.getParameter("sesid");
        ManagerService managerService = new ManagerService();
        switch (action) {
            case "accept":
                managerService.processAcceptMentorSchedule(Integer.parseInt(sessionId), request);
                response.sendRedirect("manage_schedule");
                break;
            default:
                UserDataDetail userDataDetail = new UserDataDetail();
                String pickedSlot = request.getParameter("pickedSlot");
                String pickedDate = request.getParameter("pickedDate");
                String reason = request.getParameter("reason");
                userDataDetail.putAttribute("reason", reason);
                userDataDetail.putAttribute("pickedSlot", Integer.parseInt(pickedSlot));
                userDataDetail.putAttribute("pickedDate", pickedDate);
                userDataDetail.putAttribute("sessionID", Integer.parseInt(sessionId));
                managerService.processRejectMentorSchedule(userDataDetail, request);
                response.sendRedirect("manage_schedule");
        }
    }



    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
