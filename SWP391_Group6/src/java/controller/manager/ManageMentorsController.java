
package controller.manager;

import dal.MentorDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Mentor;
import util.Util;

public class ManageMentorsController extends HttpServlet {
 
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        MentorDBContext mentorDAO = new MentorDBContext();
        ArrayList<Mentor> mentors = mentorDAO.listAll();
        
        //phan trang
        int size = mentors.size(), numPerPage = 6, page;
        String xPage = request.getParameter("page");
        if (xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        List<Object> pagedMentors = Util.listByPage((List<Object>) (List<?>) mentors, xPage, numPerPage);
        
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("pagedMentors", pagedMentors);
        
        request.getRequestDispatcher("WEB-INF/view/manager/mnmentor.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MentorDBContext mentorDBContext = new MentorDBContext();
        String txtSearch = request.getParameter("valueSearch");
        List<Mentor> mentors = mentorDBContext.getMentorsSearch(txtSearch);

        int size = mentors.size(), numPerPage = 6, page;
        String xPage = request.getParameter("page");
        if (xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        List<Object> pagedMentors = Util.listByPage((List<Object>) (List<?>) mentors, xPage, numPerPage);

        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("pagedMentors", pagedMentors);
        request.getRequestDispatcher("WEB-INF/view/manager/mnmentor.jsp").forward(request, response);
    }

}
