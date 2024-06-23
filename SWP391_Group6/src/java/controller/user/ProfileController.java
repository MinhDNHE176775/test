
package controller.user;

import controller.authorization.BaseAuthController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.User;
import service.user.UserService;
import util.UserDataDetail;

@MultipartConfig
public class ProfileController extends BaseAuthController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/user/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc)
            throws ServletException, IOException {
        UserDataDetail udd = new UserDataDetail();
        UserService userProfileService = new UserService();
        try {
            Account updateAcc = new Account();
            Account account = (Account) request.getSession().getAttribute("account");
            User user = (User) request.getSession().getAttribute("user");
            String username = request.getParameter("username");
            String fullname = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String address = request.getParameter("add");

            udd.putAttribute("account", account);
            udd.putAttribute("user", user);
            udd.putAttribute("username", username);
            udd.putAttribute("fullname", fullname);
            udd.putAttribute("gender", gender);
            udd.putAttribute("dob", dob);
            udd.putAttribute("address", address);
            
            userProfileService.updateProfile(request, response, udd);
        } catch (ServletException | IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occured. Please try again later!");
        }
    }

}
