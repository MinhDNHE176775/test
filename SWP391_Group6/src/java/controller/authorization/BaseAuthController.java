/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authorization;

import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;
import model.Mentor;

/**
 *
 * @author Admin
 */
public abstract class BaseAuthController extends HttpServlet {

    private void printError(HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        response.setContentType("text/html; charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head><title>403 Forbidden</title></head>");
            out.println("<body>");
            out.println("<h1>You are not authorized to access this page</h1>");
            out.println("Back to <a href='home'>home</a> page");
            out.println("</body>");
            out.println("</html>");
            out.close();
        } catch (IOException e) {
        }
    }

    private Account getAuthentication(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");
        return account;
    }

    private boolean isAuthenticated(HttpServletRequest req) {
        Account account = getAuthentication(req);
        RoleDBContext rdc = new RoleDBContext();
        return account != null && rdc.getRoleByUsernameAndUrl(account.getUsername(), req.getServletPath()) != null;
    }

    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (isAuthenticated(req)) {
                doGet(req, resp, getAuthentication(req));
            } else {
                resp.sendRedirect("login");
            }
        } catch (ServletException | IOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occured. Please try again later!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (isAuthenticated(req)) {
                doPost(req, resp, getAuthentication(req));
            } else {
                resp.sendRedirect("login");
            }
        } catch (ServletException | IOException e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occured. Please try again later!");
        }
    }
}
