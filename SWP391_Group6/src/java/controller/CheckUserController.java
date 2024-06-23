

package controller;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;


public class CheckUserController extends HttpServlet {
    private AccountDBContext userDAO = new AccountDBContext(); 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        
        boolean usernameExists = userDAO.checkUserNameExist(username);
        boolean emailExists = userDAO.checkEmailExist(email);
        
        JSONObject result = new JSONObject();
        result.put("usernameExists", usernameExists);
        result.put("emailExists", emailExists);
        
        response.setContentType("application/json");
        response.getWriter().write(result.toString());
    }
}


