/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import dal.MentorDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ActiveMentorController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActiveMentorController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActiveMentorController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mentorIdStr = request.getParameter("mid");
        int mentorId = Integer.parseInt(mentorIdStr);
        MentorDBContext mentorDBContext = new MentorDBContext();
        mentorDBContext.activateMentor(mentorId);

        try {
            mentorDBContext.activateMentor(mentorId);
            request.getSession().setAttribute("mess", "Mentor active successfully.");
        } catch (Exception e) {
            request.getSession().setAttribute("err", "Failed to active mentor.");
        }

        // Redirect lại về trang quản lý CV
        response.sendRedirect("manageMentor");
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
