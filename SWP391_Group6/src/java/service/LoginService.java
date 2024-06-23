/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dal.AccountDBContext;
import dal.UserDBContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
public class LoginService {
    private AccountDBContext accountDAO;
    private UserDBContext userDAO;

    public LoginService() {
        accountDAO = new AccountDBContext();
        userDAO = new UserDBContext();
    }
    
    public Account getAccount(String username, String password){
        return accountDAO.getAccount(username, password);
    }
    
    public void saveCookie(HttpServletResponse response, UserDataDetail userDataDetail){
        Cookie c_user = new Cookie("username", (String) userDataDetail.getAttribute("username"));
            Cookie c_pass = new Cookie("password", (String) userDataDetail.getAttribute("password"));
            Cookie c_remember = new Cookie("rememberMe", (String) userDataDetail.getAttribute("rememberMe"));
            if (userDataDetail.getAttribute("rememberMe") != null) {

                c_user.setMaxAge(3600 * 24 * 7);
                c_pass.setMaxAge(3600 * 24 * 7);
                c_remember.setMaxAge(3600 * 24 * 7);
            } else {
                c_user.setMaxAge(0);
                c_pass.setMaxAge(0);
                c_remember.setMaxAge(0);
            }
            response.addCookie(c_user);
            response.addCookie(c_pass);
            response.addCookie(c_remember);
    }
}
