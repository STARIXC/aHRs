/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import Utils.CarderCatDAO;
import Utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import models.CarderCat;

/**
 *
 * @author UTJ
 */
public class CarderCat extends HttpServlet {

    HttpSession session = null;

    private static final long serialVersionUID = 1L;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderCatDAO dao;
    PrintWriter out;

    public CarderCat() {
        super();
        dao = new CarderCatDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
        String carder_category_name = request.getParameter("carder_category_name");
        String id = request.getParameter("id");
        if (action.equalsIgnoreCase("save_carder_cat")) {
            dao.addCarderCat(carder_category_name);
        } else if (action.equalsIgnoreCase("update_carder")) {
            int ccat_id = Integer.parseInt(id);

            dao.updateCarderCat(ccat_id, carder_category_name);
        } else {
            String ccate = json.convert(dao.getAllCarderCat());
            System.out.println(ccate);
            out.println(ccate);
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
