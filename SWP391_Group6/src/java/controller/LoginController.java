/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import dal.MentorDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import service.LoginService;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String username = "", password = "", rememberMe = null;
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
                if (cooky.getName().equals("rememberMe")) {
                    rememberMe = cooky.getValue();
                }
            }
        }
        request.setAttribute("user", username);
        request.setAttribute("pass", password);
        request.setAttribute("rememberMe", rememberMe);
        request.getRequestDispatcher("WEB-INF/view/user/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get thong tin nguoi dung nhap
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        LoginService loginService = new LoginService();
        UserDataDetail udd = new UserDataDetail();
        //tim xem co acc phu hop username vs pass ng dung nhap k
        Account account = loginService.getAccount(username, password);
        //acc==null ==> tk hoac mk sai ==> set ve loi==> login.jsp
        //nguoc lai dang nhap thanh cong ==> home.jsp
        udd.putAttribute("username", username);
        udd.putAttribute("password", password);
        udd.putAttribute("rememberMe", rememberMe);
        if (account == null) {
            request.setAttribute("error", "Invalid username or password. Please try again");
            request.getRequestDispatcher("WEB-INF/view/user/login.jsp").forward(request, response);
        } else {
            loginService.saveCookie(response, udd);
            UserDBContext udc = new UserDBContext();
            MentorDBContext mentorDBContext = new MentorDBContext();
         
            if (account.getRoleid() == 4) {
                request.getSession().setAttribute("user", udc.getUserById(account.getId()));
            }
            if (account.getRoleid() == 2) {
                request.getSession().setAttribute("user", udc.getUserById(account.getId()));
            }
            if (account.getRoleid() == 1) {
                request.getSession().setAttribute("mentor", mentorDBContext.getByAccountId(account.getId()));
            }
            request.getSession().setAttribute("account", account);
            response.sendRedirect("home");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
