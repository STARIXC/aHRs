package controllers;

import Utils.IdGen;
import Utils.UserDAO;
import Utils.JSONConverter;
import com.hris.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author UTJ
 */
public class ManageUsers extends HttpServlet {

    private JSONConverter json;
    public UserDAO dao;
    PrintWriter out;
    HttpSession session;
    String fname, mname, lname, username, password, pass, level, userid, fullname, email, phone, county, subcounty, facility;
    String found;
    MessageDigest m;
    DatabaseConnection conn = new DatabaseConnection();

    public ManageUsers() {
        super();
        dao = new UserDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("add_user")) {
            session = request.getSession();
            fname = request.getParameter("txtFirstName").toUpperCase();
            mname = request.getParameter("txtMiddleName").toUpperCase();
            lname = request.getParameter("txtSurname").toUpperCase();
            username = request.getParameter("txtUsername");
            email = request.getParameter("txtEmail");
            phone = request.getParameter("txtPhone");
            pass = request.getParameter("txtPassword");
            level = request.getParameter("ddlLevel");

            if (!level.equalsIgnoreCase("1") || !level.equalsIgnoreCase("3") || !level.equalsIgnoreCase("4")) {
                subcounty = request.getParameter("ddlSubcounty");
                facility = request.getParameter("ddlFacility");
               
            }else{
                 subcounty = "All";
                facility = "All";
            }
            IdGen IG = new IdGen();
            userid = IG.current_id();
            m = MessageDigest.getInstance("MD5");
            m.update(pass.getBytes(), 0, pass.length());
            password = new BigInteger(1, m.digest()).toString(16);
            String checker = "SELECT userid FROM tbl_user WHERE (fname=? && mname=? && lname=?) || username=? || userid=?";
            conn.pst = conn.conn.prepareStatement(checker);
            conn.pst.setString(1, fname);
            conn.pst.setString(2, mname);
            conn.pst.setString(3, lname);
            conn.pst.setString(4, username);
            conn.pst.setString(5, userid);

            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next() == true) {

                out.println("User Already Exists");
            } else {
//     ADD THE USER
                String inserter = "INSERT INTO `hrh`.`tbl_user`(`userid`,`fname`,`mname`,`lname`,`username`,`email`,`phone`,`password`,`level`,`facility`,`scounty`)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                conn.pst = conn.conn.prepareStatement(inserter);
                conn.pst.setString(1, userid);
                conn.pst.setString(2, fname);
                conn.pst.setString(3, mname);
                conn.pst.setString(4, lname);
                conn.pst.setString(5, username);
                conn.pst.setString(6, email);
                conn.pst.setString(7, phone);
                conn.pst.setString(8, password);
                conn.pst.setString(9, level);
                conn.pst.setString(10, facility);
                conn.pst.setString(11, subcounty);
                conn.pst.executeUpdate();
                 fullname = fname + " " + mname + " " + lname;
            }
           
                out.println(fullname);

        } else if (action.equalsIgnoreCase("update_role")) {

        } else if (action.equalsIgnoreCase("all")) {

        } else if (action.equalsIgnoreCase("edit")) {

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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
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
