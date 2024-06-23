package controller.mentor;

import controller.authorization.BaseAuthController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Mentor;
import service.mentor.MentorService;
import util.UserDataDetail;

@MultipartConfig
public class ViewProfileController extends BaseAuthController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/mentor/profile_mentor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc)
            throws ServletException, IOException {
        UserDataDetail udd = new UserDataDetail();
        MentorService mentorService = new MentorService();
        try {
            Account updateAcc = new Account();
            Account account = (Account) request.getSession().getAttribute("account");
            Mentor user = (Mentor) request.getSession().getAttribute("mentor");
            String username = request.getParameter("username");
            String fullname = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String address = request.getParameter("add");

            udd.putAttribute("account", account);
            udd.putAttribute("mentor", user);
            udd.putAttribute("username", username);
            udd.putAttribute("fullname", fullname);
            udd.putAttribute("gender", gender);
            udd.putAttribute("dob", dob);
            udd.putAttribute("address", address);

            mentorService.updateProfile(request, response, udd);
        } catch (ServletException | IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occured. Please try again later!");
        }
    }

}
