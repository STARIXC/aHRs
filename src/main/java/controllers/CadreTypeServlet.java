package controllers;

import Utils.CarderTypeDAO;
import Utils.JSONConverter;
import com.google.gson.Gson;
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
import java.util.Date;
import java.util.List;
import models.CarderType;

/**
 * Servlet implementation class CadreTypeServlet
 */
@WebServlet("/CadreTypeServlet")
public class CadreTypeServlet extends HttpServlet {

    HttpSession session = null;

    private static final long serialVersionUID = 1L;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderTypeDAO dao;
    PrintWriter out;

    public CadreTypeServlet() {
        super();
        dao = new CarderTypeDAO();
    }

    @SuppressWarnings("static-access")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        //String action = request.getParameter("action");
        // String emp_no = request.getParameter("emp_no");
     
            String ctypes = json.convert(dao.getAllCarderType());
            System.out.println(ctypes);
            out.println(ctypes);
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        // String emp_no = request.getParameter("emp_no");
        if (action.equalsIgnoreCase("save_carder")) {
            CarderType ctype = new CarderType();
            ctype.setCadre_type_name(request.getParameter("carder_name"));
            ctype.setHrs_per_week(request.getParameter("hrs_per_week"));
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                dao.addCarderType(ctype);
            } else {
                ctype.setId(Integer.parseInt(id));
                dao.updateCarderType(ctype);
            }

        } else if (action.equalsIgnoreCase("update_carder")) {

        } else {
            try {
                response.setContentType("text/html;charset=UTF-8");
                session = request.getSession();
                String sessioncadretype = "";

                if (session.getAttribute("cadre_type_id") != null) {

                    sessioncadretype = session.getAttribute("cadre_type_id").toString();
                }

                String cadre_type = "";

                DatabaseConnection conn = new DatabaseConnection();

                String qr = "SELECT * FROM hrh.cadre_category";
                conn.rs = conn.st.executeQuery(qr);
                while (conn.rs.next()) {
                    if (sessioncadretype.equalsIgnoreCase(conn.rs.getString(1))) {

                        cadre_type += "<option selected value=\"" + conn.rs.getInt("id") + "\">"
                                + conn.rs.getString("cadre_category_name") + "</option>";
                    } else {
                        cadre_type += "<option value=\"" + conn.rs.getInt("id") + "\">"
                                + conn.rs.getString("cadre_category_name") + "</option>";
                    }

                }

                PrintWriter out = response.getWriter();
                try {
                    out.println(cadre_type);
                } finally {
                    out.close();
                    if (conn != null)
					try {

                        if (conn.conn != null) {
                            conn.conn.close();
                        }
                        if (conn.rs != null) {
                            conn.rs.close();
                        }
                        if (conn.st != null) {
                            conn.st.close();
                        }

                    } catch (Exception ignore) {
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(CadreTypeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //  doGet(request, response);
    }

}
