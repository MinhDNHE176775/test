/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dal.AccountDBContext;
import dal.MentorDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import model.Account;
import model.Mentor;
import model.User;
import util.UserDataDetail;
import util.Util;

/**
 *
 * @author Admin
 */
public class SignUpService {

    private AccountDBContext accountDAO;
    private UserDBContext userDAO;
    private MentorDBContext mentorDAO;

    public SignUpService() {
        accountDAO = new AccountDBContext();
        userDAO = new UserDBContext();
        mentorDAO = new MentorDBContext();
    }

    public void processSendEmail(HttpServletRequest request, HttpServletResponse response, UserDataDetail userDataDetail) throws ServletException, IOException {
        String username = (String) userDataDetail.getAttribute("username");
        String email = (String) userDataDetail.getAttribute("email");
//        if (accountDAO.checkAccountExist(username, email)) {
//            request.setAttribute("err", "Username or email are existed. Please try again!");
//            request.getRequestDispatcher("WEB-INF/view/user/signup.jsp").forward(request, response);
//            return;
//        }
        String pass = Util.generatePassword("0123456789", 6);
        Util.sendEmail((String) userDataDetail.getAttribute("email"), "Your passcode confirm is: " + pass);
        request.getSession().setAttribute("userDataDetail", userDataDetail);
        request.getSession().setAttribute("passcode", pass);
        request.getSession().setAttribute("email", email);
        request.getRequestDispatcher("WEB-INF/view/verify.jsp").forward(request, response);
    }

    public boolean isVerifyEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String passcode = (String) request.getSession().getAttribute("passcode");
        String passconfirm = request.getParameter("passconfirm");
        if (!passconfirm.equals(passcode)) {
            request.setAttribute("err", "passcode doesn't match!");
            return false;
        }
        return true;
    }

    public void registerUser(UserDataDetail userDataDetail) {
        Account newAcc = new Account();
        newAcc.setUsername((String) userDataDetail.getAttribute("username"));
        newAcc.setEmail((String) userDataDetail.getAttribute("email"));
        newAcc.setPassword((String) userDataDetail.getAttribute("pass"));
        newAcc.setStatus(true);
        if (userDataDetail.getAttribute("role").equals("Mentee")) {
            newAcc.setRoleid(2);
            accountDAO.insert(newAcc);
            User newMen = new User();
            newMen.setName((String) userDataDetail.getAttribute("name"));
            newMen.setGender("Male".equals(userDataDetail.getAttribute("gender")));
            newMen.setPhone((String) userDataDetail.getAttribute("phone"));
            newMen.setAddress((String) userDataDetail.getAttribute("address"));
            newMen.setDateOfBirth(java.sql.Date.valueOf((String) userDataDetail.getAttribute("dob")));
            Account account = accountDAO.getAccount((String) userDataDetail.getAttribute("username"), (String) userDataDetail.getAttribute("pass"));
            if (account != null) {
                newMen.setAccount(account);
                userDAO.insert(newMen);
            }
        } else {
            newAcc.setRoleid(1);
            accountDAO.insert(newAcc);
            Mentor newMentor = new Mentor();
            newMentor.setName((String) userDataDetail.getAttribute("name"));
            newMentor.setGender("Male".equals(userDataDetail.getAttribute("gender")));
            newMentor.setPhone((String) userDataDetail.getAttribute("phone"));
            newMentor.setAddress((String) userDataDetail.getAttribute("address"));
            newMentor.setDateOfBirth(java.sql.Date.valueOf((String) userDataDetail.getAttribute("dob")));
            newMentor.setStatus(false);
            Account account = accountDAO.getAccount((String) userDataDetail.getAttribute("username"), (String) userDataDetail.getAttribute("pass"));
            if (account != null) {
                newMentor.setAccount(account);
                mentorDAO.insertDefault(newMentor);
            }
        }
    }

}
