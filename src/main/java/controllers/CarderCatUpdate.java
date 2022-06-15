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
import models.CarderCat;

/**
 *
 * @author UTJ
 */
public class CarderCatUpdate extends HttpServlet {

     HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderCatDAO dao;
    PrintWriter out;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String action = request.getParameter("action");
            if (action.equalsIgnoreCase("delete")) {
        } else if (action.equalsIgnoreCase("edit")) {
            String id =request.getParameter("ctype_id");
             int carder_id =Integer.parseInt(id);
            CarderCat ctype = dao.getCarderCatById(carder_id);
            String details = JSONConverter.convert(ctype);
            System.out.print(ctype);
            out.println(details);
        } else if (action.equalsIgnoreCase("update_carder")) {
            
           // CarderCat ctype = new CarderCat();
           String cadre_category_name=request.getParameter("carder_category_name");
          
            String id = request.getParameter("carder_cat_id");
            if (id == null || id.isEmpty()) {
                dao.addCarderCat(cadre_category_name);
            } else {
               int carder_id =Integer.parseInt(id);
                dao.updateCarderCat(carder_id,cadre_category_name);
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
