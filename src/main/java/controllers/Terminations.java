/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import Utils.JSONConverter;
import Utils.TerminationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBWAHYI
 */
public class Terminations extends HttpServlet {

      PrintWriter out;
    int status, execute_activity = 0;
    private TerminationDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    private JSONConverter json;
      public Terminations() {
          dao = new TerminationDAO();
    }

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
        String emp_no = request.getParameter("emp_no");

        if (action.equalsIgnoreCase("view")) {
            String termination = json.convert(dao.getTerminationModelById(emp_no));
            out.println(termination);
        } 
//        else if (action.equalsIgnoreCase("notapproved")) {
//            String leaves = json.convert(dao.getAllrejected());
//            out.println(leaves);
//        }
        else {
            String termination = json.convert(dao.getAllTerminationModels());
            out.println(termination);
            System.out.println(termination);
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
        processRequest(request, response);
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
