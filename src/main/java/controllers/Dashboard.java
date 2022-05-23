/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

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
      private static final String GET_ALL_ACTIVE_STAFF = "REPLACE INTO tbl_termination(t_id,emp_no,termination_date,notice_date,termination_reason,voluntary_termination) VALUES (?,?,?,?,?,?);";
   

    public Dashboard() {
        conn = new DatabaseConnection();
    }

    int row;
    int errors;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
//        String emp_no = request.getParameter("emp_no");

        if (action.equalsIgnoreCase("staff")) {
            int staff =get_all_active_staff();
            out.println(staff);
        } else if (action.equalsIgnoreCase("leave")) {
//            String leaves = json.convert(dao.getAllrejected());
//            out.println(leaves);
        } else if (action.equalsIgnoreCase("approvedleaves")) {
//            String leaves = json.convert(dao.getAllrejected());
//            out.println(leaves);
        } else if (action.equalsIgnoreCase("pendingapproval")) {
            getPendingLeaves();
//            String leaves = json.convert(dao.getAllrejected());
//            out.println(leaves);
    }
//else {
//            int total_ever=get_all_staff();
//            out.println(total_ever);
//        }
        try {

            if (conn.rs != null) {
                conn.rs.close();
            }
            if (conn.rs1 != null) {
                conn.rs1.close();
            }
            if (conn.st1 != null) {
                conn.st.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, (String) null, ex);
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

    private int get_all_active_staff() {
        int rowsAffected = 0;
//		write the insert Query

        try {
            String checker_sql = "Select count(emp_no) AS total_active From employee_hist Where active =1";
            conn.rs = conn.st.executeQuery(checker_sql);
            //Retrieving the result
            conn.rs.next();

            rowsAffected =+ conn.rs.getInt("total_active");
          
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    
    }

    private int get_all_staff() {
     int rowsAffected = 0;
//		write the insert Query

        try {
            String checker_sql = "Select count(emp_no) AS total_active From employee_hist";
            conn.rs = conn.st.executeQuery(checker_sql);
            //Retrieving the result
            conn.rs.next();

            rowsAffected =+ conn.rs.getInt("total_active");
          
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    private int get_all_leave() {
            int response = 0;
        try {
            String checker_sql = "Select count(application_id) AS total From tbl_leave_application ";
            conn.rs = conn.st.executeQuery(checker_sql);
            //Retrieving the result
            conn.rs.next();

            response =+ conn.rs.getInt("total");

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return response;
  }

    private void get_upcoming_holidays() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void getPendingLeaves() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
