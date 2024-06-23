

package controller.manager;

import dal.MentorDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class InactiveMentorController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InactiveMentorController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InactiveMentorController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mentorIdStr = request.getParameter("mid");
        int mentorId = Integer.parseInt(mentorIdStr);
        MentorDBContext mentorDBContext = new MentorDBContext();

        try {
            mentorDBContext.inactiveMentor(mentorId);
            request.getSession().setAttribute("mess", "Mentor inactive successfully.");
        } catch (Exception e) {
            request.getSession().setAttribute("err", "Failed to inactive mentor.");
        }

       
        response.sendRedirect("manageMentor");
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
