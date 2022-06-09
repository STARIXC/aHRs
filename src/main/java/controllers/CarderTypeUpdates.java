/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import Utils.CarderTypeDAO;
import Utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CarderType;

/**
 *
 * @author STARIXC
 */
public class CarderTypeUpdates extends HttpServlet {

    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderTypeDAO dao;
    PrintWriter out;

    public CarderTypeUpdates() {
        super();
        dao = new CarderTypeDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
       
        if (action.equalsIgnoreCase("delete")) {
        } else if (action.equalsIgnoreCase("edit")) {
            String id =request.getParameter("ctype_id");
             int carder_id =Integer.parseInt(id);
            CarderType ctype = dao.getCarderTypeById(carder_id);
            String details = JSONConverter.convert(ctype);
            System.out.print(ctype);
            out.println(details);
        } else if (action.equalsIgnoreCase("update_carder")) {
            
            CarderType ctype = new CarderType();
            ctype.setCadre_type_name(request.getParameter("carder_name"));
            ctype.setHrs_per_week(request.getParameter("hrs_per_week"));
            String id = request.getParameter("carder_id");
            if (id == null || id.isEmpty()) {
                dao.addCarderType(ctype);
            } else {
                ctype.setId(Integer.parseInt(id));
                dao.updateCarderType(ctype);
            }
        } else {

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
