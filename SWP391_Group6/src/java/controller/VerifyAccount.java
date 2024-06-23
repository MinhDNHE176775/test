
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.UserDataDetail;
import util.Util;

@WebServlet(name = "VerifyAccount", urlPatterns = {"/verify"})
public class VerifyAccount extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDataDetail udd = (UserDataDetail) request.getSession().getAttribute("userDataDetail");
        String email = (String) udd.getAttribute("email");
        String str = "0123456789";
        String pass = Util.generatePassword(str, 6);
        Util.sendEmail(email, "Your passcode confirm is: " + pass);
        request.getSession().setAttribute("passcode", pass);
        request.getRequestDispatcher("WEB-INF/view/verify.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String passcode = (String) request.getSession().getAttribute("passcode");
            String passconfirm = request.getParameter("passconfirm");
            if (!passconfirm.equals(passcode)) {
                request.setAttribute("err", "passcode doesn't match!");
                request.getRequestDispatcher("WEB-INF/view/verify.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("status", "confirm");
                request.getRequestDispatcher("register").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occured. Please try again later!");
        }
    }

    
}