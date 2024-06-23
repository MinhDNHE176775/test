/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Mentor;

/**
 *
 * @author Admin
 */
public class CheckTimetableAvailableController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeWeekController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeWeekController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sesid = request.getParameter("sesid");
        Mentor mentor = (Mentor) request.getSession().getAttribute("mentor");
        Map<Integer, Integer> checkSelectedSlots = (Map<Integer, Integer>) request.getSession().getAttribute("selectedSlots");
        SessionDBContext sdc = new SessionDBContext();
        String remove = request.getParameter("remove");
        if (!remove.equals("")) {
            if (checkSelectedSlots != null) {
                checkSelectedSlots.remove(Integer.parseInt(remove));
            }
            request.getSession().setAttribute("selectedSlots", checkSelectedSlots);
            request.getRequestDispatcher("book_mentor?menid=" + mentor.getId()).forward(request, response);
            return;
        }
        try {
            if (sdc.isSlotAvailable(Integer.parseInt(sesid))) {
                if (checkSelectedSlots == null) {
                    checkSelectedSlots = new HashMap<>();
                    checkSelectedSlots.put(Integer.parseInt(sesid), Integer.parseInt(sesid));
                } else {
                    checkSelectedSlots.put(Integer.parseInt(sesid), Integer.parseInt(sesid));
                }
            } else {
                request.setAttribute("err", "This slot is already have a book request");
            }
            request.getSession().setAttribute("selectedSlots", checkSelectedSlots);
            request.getRequestDispatcher("book_mentor?menid=" + mentor.getId()).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckTimetableAvailableController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        processRequest(request, response);
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
