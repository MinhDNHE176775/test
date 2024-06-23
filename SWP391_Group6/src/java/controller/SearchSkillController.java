package controller;

import dal.SkillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Skill;
import util.Util;

public class SearchSkillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String key = request.getParameter("key");
        SkillDBContext sdc = new SkillDBContext();
        List<Skill> skills = sdc.getSkillsSearch(key);
        int skillid = Integer.parseInt(request.getParameter("id"));

        if (skills.isEmpty()) {
            request.setAttribute("noResults", true);
        }

        
        int size = skills.size(), numPerPage = 6, page;
        String xPage = request.getParameter("page");
        if (xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        List<Object> pagedSkills = Util.listByPage((List<Object>) (List<?>) skills, xPage, numPerPage);
        
        
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.getSession().setAttribute("pagedSkills", pagedSkills);
        request.setAttribute("key", key);
        request.setAttribute("skillid", skillid);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
