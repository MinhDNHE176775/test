/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.CVDBContext;
import dal.MentorDBContext;
import dal.SkillDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CV;
import model.Mentor;
import model.Skill;
import service.mentor.MentorService;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class CVController extends HttpServlet {

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
            out.println("<title>Servlet CVController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CVController at " + request.getContextPath() + "</h1>");
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
        Mentor mentor = (Mentor) request.getSession().getAttribute("mentor");
        SkillDBContext skillDBContext = new SkillDBContext();
        CVDBContext cvDBContext = new CVDBContext();
        CV mentorCV = cvDBContext.getCVByMentor(mentor.getId());
        List<Skill> skills = skillDBContext.listAll();
        if (mentorCV != null) {
            String[] cvSkills = mentorCV.getSkills().split("\n");
            request.setAttribute("cvSkills", cvSkills);
        }
        request.getSession().setAttribute("skills", skills);
        request.getSession().setAttribute("cv", mentorCV);
        request.getRequestDispatcher("WEB-INF/view/mentor/cv.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        UserDataDetail userDataDetail = new UserDataDetail();
        MentorService mentorService = new MentorService();
        String intro = request.getParameter("intro");
        String achivement = request.getParameter("achivement");
        String experience = request.getParameter("experience");
        String certificate = request.getParameter("cert");
        String firstSkill = request.getParameter("first_skill");
        String secondSkill = request.getParameter("second_skill");
        String thirdSkill = request.getParameter("third_skill");

        userDataDetail.putAttribute("intro", intro);
        userDataDetail.putAttribute("achivement", achivement);
        userDataDetail.putAttribute("experience", experience);
        userDataDetail.putAttribute("certificate", certificate);
        userDataDetail.putAttribute("firstSkill", firstSkill);
        userDataDetail.putAttribute("secondSkill", secondSkill);
        userDataDetail.putAttribute("thirdSkill", thirdSkill);
        if (action == null) {
            mentorService.processCreateCV(userDataDetail, request);
        } else {
            mentorService.processUpdateCV(userDataDetail, request);
        }
       response.sendRedirect("mentor_cv");
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
