/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import controller.authorization.BaseAuthController;
import dal.MentorDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Mentor;
import model.Session;
import service.ViewScheduleService;


/**
 *
 * @author Admin
 */
public class ViewScheduleController extends BaseAuthController {

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
            out.println("<title>Servlet ViewScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewScheduleController at " + request.getContextPath() + "</h1>");
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
     * @param account
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        ViewScheduleService viewScheduleService = new ViewScheduleService();
        SessionDBContext sessionDBContext = new SessionDBContext();
        MentorDBContext mentorDBContext = new MentorDBContext();
        Account menAccount = (Account) request.getSession().getAttribute("account");
        Mentor mentor = mentorDBContext.getByAccountId(menAccount.getId());
        if(!mentor.isStatus()){
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "You cannot perform this function due to your CV checking is processing or rejected");
            return;
        }
        ArrayList<Session> sessions = sessionDBContext.listScheduleByMentorId(mentor.getId());
        request.getSession().setAttribute("sessions", sessions);
        viewScheduleService.viewSchedule(request);
        request.getRequestDispatcher("WEB-INF/view/mentor/viewschedule.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @param account
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        ViewScheduleService viewScheduleService = new ViewScheduleService();
        viewScheduleService.viewScheduleByChange(request, response);
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
