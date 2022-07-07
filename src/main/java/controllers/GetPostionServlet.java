package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hris.db.DatabaseConnection;

/**
 * Servlet implementation class GetPostionServlet
 */
@WebServlet("/GetPostionServlet")
public class GetPostionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;
    public DatabaseConnection conn;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostionServlet() {
        super();
       conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        session = request.getSession();
        String positiononsession = "";
        String standard_id = "";
        standard_id = request.getParameter("standard_id");
        //disttrict is same as subcounty
        if (session.getAttribute("positionid") != null) {
            positiononsession = session.getAttribute("positionid").toString();
        }
        System.out.println("position on session__" + positiononsession);
        PrintWriter out = response.getWriter();
        try {

            String pos = "<option value=''>Select Position</option>";
            String getpos = "";

            if (standard_id != null) {
                getpos = "Select * from cadre_positions WHERE standardized_cadre_id='" + standard_id + "'";
            } else {
                getpos = "select id,position_title from cadre_positions  order by position_title ";

            }
            conn.rs = conn.st.executeQuery(getpos);
            System.out.println(getpos);
            while (conn.rs.next()) {
                //if the current position on loop is same as the position on session, then make it selected
                if (positiononsession.equalsIgnoreCase(conn.rs.getString(1).trim())) {

                    pos += "<option selected value='" + conn.rs.getString(1) + "'> " + conn.rs.getString(2) + " </option>";
                } else {
                    pos += "<option value='" + conn.rs.getString(1) + "'> " + conn.rs.getString(2) + " </option>";
                }
                // System.out.println("~~"+conn.rs.getString(2));

            }

            out.println(pos);
        } catch (SQLException ex) {
            Logger.getLogger(GetPostionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.conn.close();
                conn.rs.close();
                conn.st.close();
                out.close();
            } catch (SQLException ex) {
                Logger.getLogger(GetPostionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
