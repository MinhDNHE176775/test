
package controller.manager;

import controller.authorization.BaseAuthController;
import dal.MentorDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Mentor;

public class ManageCVController extends BaseAuthController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        MentorDBContext mentorinfo = new MentorDBContext();
        ArrayList<Mentor> listinformentor = mentorinfo.getInfoMentor();
        request.setAttribute("mentors", listinformentor);
        request.getRequestDispatcher("WEB-INF/view/manager/managercv.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

  

}
