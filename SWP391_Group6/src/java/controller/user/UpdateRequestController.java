/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user;

import controller.authorization.BaseAuthController;
import dal.RequestDBContext;
import dal.SkillDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Request;
import model.Skill;
import service.user.UserRequestService;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
public class UpdateRequestController extends BaseAuthController {
   
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
            out.println("<title>Servlet UpdateRequestController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRequestController at " + request.getContextPath () + "</h1>");
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
        String requestId = request.getParameter("id");
        RequestDBContext requestDAO = new RequestDBContext();
        SkillDBContext skillDAO = new SkillDBContext();
        Request userRequest = requestDAO.getById(Integer.parseInt(requestId));
        List<Skill> skills = skillDAO.listByMentor(userRequest.getMentor().getId());
        request.getSession().setAttribute("skills", skills);
        request.setAttribute("userRequest", userRequest);
        request.getRequestDispatcher("WEB-INF/view/user/updaterequest.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
    throws ServletException, IOException {
         UserDataDetail udd = new UserDataDetail();
        UserRequestService userRequestService = new UserRequestService();
        StringBuilder deadlineTime = new StringBuilder();
        String title = request.getParameter("title");
        String deadlineDate = request.getParameter("deadlineDate");
        String deadlineHour = request.getParameter("deadlineHour");
        String content = request.getParameter("content");
        String[] skills = request.getParameterValues("skills");
        deadlineTime.append(deadlineDate).append(" ").append(deadlineHour).append(":00");
        udd.putAttribute("title", title);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date parsedDate = null;
        try {
            parsedDate = dateFormat.parse(deadlineTime.toString());
        } catch (ParseException ex) {
            Logger.getLogger(UpdateRequestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String dd = dateFormat.format(parsedDate);
        udd.putAttribute("deadlineTime", dd);
        udd.putAttribute("content", content);
        if(skills.length > 1){
            request.getSession().setAttribute("err", "You must choose no more than 1 skill");
            response.sendRedirect("list_request");
            return;
        }
        udd.putAttribute("updateSkill", skills[0]);
        userRequestService.processUpdateRequest(udd, request);
        response.sendRedirect("list_request");
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
