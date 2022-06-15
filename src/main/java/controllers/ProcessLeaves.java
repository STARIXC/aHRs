/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import Utils.JSONConverter;
import Utils.LeaveDAO;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Leave;
import org.json.JSONObject;

/**
 *
 * @author UTJ
 */
public class ProcessLeaves extends HttpServlet {

    PrintWriter out;
    private static final String INSERT_OR_EDIT = "leave_approval.jsp";
    int status, execute_activity = 0;
    private LeaveDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    private JSONConverter json;

    public ProcessLeaves() {
        super();
        dao = new LeaveDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        Leave leave = new Leave();
        String action = request.getParameter("action");
        String leave_type_name = request.getParameter("leave_name");
        String leave_description = request.getParameter("leave_description");
        String number_days = request.getParameter("number_days_allowed");
        String id = request.getParameter("leave_type_id");
        String deleteId=request.getParameter("deleteId");
        // int number_days_allowed = Integer.parseInt(id);
        if (action.equalsIgnoreCase("save_leave_type")) {

            leave.setLeave_type_name(leave_type_name);
            leave.setLeave_description(leave_description);
            leave.setTotal_days(number_days);
            dao.addLeave(leave);
        } else if (action.equalsIgnoreCase("update_leave_type")) {

            if (id == null || id.isEmpty()) {
                leave.setLeave_type_name(leave_type_name);
                leave.setLeave_description(leave_description);
                leave.setTotal_days(number_days);
                dao.addLeave(leave);
            } else {
                int leave_id = Integer.parseInt(id);
                leave.setTypeID(leave_id);
                leave.setLeave_type_name(leave_type_name);
                leave.setLeave_description(leave_description);
                leave.setTotal_days(number_days);
                dao.updateLeave(leave);
            }

        } else if (action.equalsIgnoreCase("getLeave")) {
            int leave_id = Integer.parseInt(id);
            String leave_ = json.convert(dao.getLeaveById(leave_id));
            out.println(leave_);
        } else if (action.equalsIgnoreCase("delete")) {
            
            int leave_id = Integer.parseInt(deleteId);
            System.out.println(leave_id);
            status = dao.deleteLeave(leave_id);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Leave Type Delete Successfully");    //create json object "status","message" and apply custome messages for "delete data"
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to delete Leave Type....");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }

            out.print(obj); //finally print the "obj" object

        } else {
            String ccate = json.convert(dao.getAllLeaves());
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
