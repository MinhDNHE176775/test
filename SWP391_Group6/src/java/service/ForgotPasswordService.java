/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import util.Message;
import util.UserDataDetail;
import util.Util;

/**
 *
 * @author Admin
 */
public class ForgotPasswordService {

    private AccountDBContext accountDAO;

    public ForgotPasswordService() {
        accountDAO = new AccountDBContext();
    }

    public Account getAccountByUsernameAndEmail(String username, String email) {
        return accountDAO.getAccountByUsernameAndEmail(username, email);
    }

    public void updatePasswordByUsername(String password, String username) {
        accountDAO.updatePasswordByUsername(password, username);
    }

    public String generatePassword() {
        return Util.generatePassword(Message.GENERATION_PASSWORD, 8);
    }

    public void sendEmail(String email, String text) {
        Util.sendEmail(email, text);
    }

    public void processForgotPasswordRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session, UserDataDetail userDataDetail) throws ServletException, IOException {
        String username = (String) userDataDetail.getAttribute("username");
        String email = (String) userDataDetail.getAttribute("email");
        Account a = accountDAO.getAccountByUsernameAndEmail(username, email);
        if (a == null) {
            request.setAttribute("err", "Unable to find your account! Please try again");
            request.getRequestDispatcher("WEB-INF/view/forgotpassword.jsp").forward(request, response);
        } else {
            String defaultPassword = (String) session.getAttribute("defaultPass");
            if (defaultPassword != null) {
                request.setAttribute("err", "Default pass is sent to your email. Please check your mail and click <a href = 'defaultpass'>here</a> to enter");
                request.getRequestDispatcher("WEB-INF/view/forgotpassword.jsp").forward(request, response);
                return;
            }
            String defaultPass = Util.generatePassword(Message.GENERATION_PASSWORD, 6);
            String text = "Your default password is: " + defaultPass + " Default password has been set in the session and session timeout is set to 1 minute.";
            Util.sendEmail(email, text);
            userDataDetail.putAttribute("defaultPass", defaultPass);
            session.setAttribute("userDataDetail", userDataDetail);
         
            request.getRequestDispatcher("WEB-INF/view/defaultpass.jsp").forward(request, response);
        }
    }

    public void processProgressStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDataDetail udd = (UserDataDetail) request.getSession().getAttribute("userDataDetail");
        String defaultPassword = (String) udd.getAttribute("defaultPass");
        String verifyPass = request.getParameter("de-pass");
        if (!verifyPass.equals(defaultPassword)) {
            request.setAttribute("err", "Default password isn't correct. Please try again!");
            request.getRequestDispatcher("WEB-INF/view/defaultpass.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/view/resetpass.jsp").forward(request, response);
        }
    }

    public void processResetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDataDetail udd = (UserDataDetail) request.getSession().getAttribute("userDataDetail");
        String username = (String) udd.getAttribute("username");
        String password = request.getParameter("pass");
        accountDAO.updatePasswordByUsername(password, username);
        request.getSession().invalidate();
        request.setAttribute("reset_success", "Reset password successfully. You can login to our system!");
        request.getRequestDispatcher("WEB-INF/view/user/login.jsp").forward(request, response);
    }
}
