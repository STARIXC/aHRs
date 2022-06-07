/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import Utils.EmployeesRepo;
import Utils.JSONConverter;
import com.hris.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBWAHYI
 */
public class Dashboard extends HttpServlet {

    //HttpSession session;
    String query;
    private final DatabaseConnection conn;
    String message;
    PrintWriter out;
    private JSONConverter json;
    private EmployeesRepo dao;

    int active_staff,onleave,pending_leave_applications,approvedleaves, execute_activity = 0;

    public Dashboard() {
        conn = new DatabaseConnection();
    }

    int row;
    int errors;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();

        response.setContentType("application/json");
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("staff")) {
          // active_staff=dao.get_all_active_staff();
           active_staff=+1;
          System.out.println(active_staff);
            out.println(active_staff);
        } else if (action.equalsIgnoreCase("leave")) {

        } else if (action.equalsIgnoreCase("approvedleaves")) {

        } else if (action.equalsIgnoreCase("pendingapproval")) {
            // getPendingLeaves();

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
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
