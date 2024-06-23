package controller;

import dal.MentorDBContext;
import dal.SkillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Mentor;
import model.Skill;
import util.Util;

public class ListMentorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String skillIdStr = request.getParameter("id");
            int skillId = Integer.parseInt(skillIdStr);

            SkillDBContext skillDAO = new SkillDBContext();
            Skill skill = skillDAO.getSkillById(skillId);

            MentorDBContext mentorDAO = new MentorDBContext();
            ArrayList<Mentor> mentors = mentorDAO.listBySkill(skillId);

            int size = mentors.size(), numPerPage = 6, page;
            String xPage = request.getParameter("page");
            if (xPage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xPage);
            }
            int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / 7) + 1));
            List<Object> pagedMentors = Util.listByPage((List<Object>) (List<?>) mentors, xPage, numPerPage);

            request.setAttribute("skill", skill);
            request.setAttribute("num", num);
            request.setAttribute("page", page);
            request.setAttribute("skillid", skillId);
            request.getSession().setAttribute("pagedMentors", pagedMentors);

            request.getRequestDispatcher("WEB-INF/view/listmentor.jsp").forward(request, response);
        } catch (NumberFormatException | ServletException | IOException e) {
        }

    }

    

}
