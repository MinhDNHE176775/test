package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.MentorDBContext;
import dal.SkillDBContext;
import model.Mentor;
import model.Skill;
import util.Util;

public class FilterMentorByYoeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String skillIdStr = request.getParameter("id");
            int skillId = Integer.parseInt(skillIdStr);

            SkillDBContext skillDAO = new SkillDBContext();
            Skill skill = skillDAO.getSkillById(skillId);

            String key = request.getParameter("key");

            // Nhận các giá trị lọc từ request
            String[] experienceFilters = request.getParameterValues("experience");

            MentorDBContext mentorDAO = new MentorDBContext();
            ArrayList<Mentor> mentors = mentorDAO.searchByNameAndExperience(key, skillId, experienceFilters);

            int size = mentors.size(), numPerPage = 6, page;
            String xPage = request.getParameter("page");
            if (xPage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xPage);
            }
            int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
            List<Object> pagedMentors = Util.listByPage((List<Object>) (List<?>) mentors, xPage, numPerPage);

            request.setAttribute("skill", skill);
            request.setAttribute("searchValue", key);
            request.setAttribute("num", num);
            request.setAttribute("page", page);
            request.setAttribute("skillid", skillId);
            request.getSession().setAttribute("pagedMentors", pagedMentors);

            request.getRequestDispatcher("WEB-INF/view/listmentor.jsp").forward(request, response);
        } catch (NumberFormatException | IOException e) {
            e.printStackTrace();
        }
    }
}
