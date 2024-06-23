/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.authorization.BaseAuthController;
import dal.SkillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Skill;
import service.admin.AdminService;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class UpdateSkillController extends BaseAuthController {

    private final AdminService adminService = new AdminService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String id_raw = request.getParameter("sid");
        SkillDBContext sdb = new SkillDBContext();
        int id = Integer.parseInt(id_raw);
        Skill s = sdb.getSkillById(id);
        request.setAttribute("detail", s);
        request.getRequestDispatcher("WEB-INF/view/admin/updateskill.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        UserDataDetail udd = new UserDataDetail();
        String sid_raw = request.getParameter("id");
        String skillName = request.getParameter("skillname");
        String skillImage = request.getParameter("image");
        String status_raw = request.getParameter("status");
        String description = request.getParameter("description");

        udd.putAttribute("id", sid_raw);
        udd.putAttribute("skillname", skillName);
        udd.putAttribute("skillImage", skillImage);
        udd.putAttribute("status", status_raw);
        udd.putAttribute("description", description);

        try {
            this.adminService.handleUpdateSkill(udd, request);
        } catch (ServletException | IOException e) {
            System.out.println(e);
        }
        response.sendRedirect("skills");
    }
}
