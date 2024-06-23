
package controller.admin;

import dal.SkillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Skill;
import util.Util;

public class ManageSkillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SkillDBContext skillDAO = new SkillDBContext();
        ArrayList<Skill> skills = skillDAO.listAllForAdmin();
        
        //phan trang
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
        request.setAttribute("pagedSkills", pagedSkills);
        request.getRequestDispatcher("WEB-INF/view/admin/skills.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SkillDBContext skillDBContext = new SkillDBContext();
        String txtSearch = request.getParameter("valueSearch");
        List<Skill> skills = skillDBContext.getSkillsSearch(txtSearch);
        
        
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
        request.setAttribute("pagedSkills", pagedSkills);
        request.getRequestDispatcher("WEB-INF/view/admin/skills.jsp").forward(request, response);
    }

    

}
