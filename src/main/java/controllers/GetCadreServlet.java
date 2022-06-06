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
 * Servlet implementation class GetCadreServlet
 */
@WebServlet("/GetCadreServlet")
public class GetCadreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCadreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	@SuppressWarnings("static-access")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html;charset=UTF-8");

			session = request.getSession();

			String sessioncadre = "";

			session.getAttribute("cadre_id");

			if (session.getAttribute("cadre_id") != null) {

				sessioncadre = session.getAttribute("subcountyid").toString();

			}
			System.out.println("current cadre ___" + sessioncadre);

			String emp_type_id, current_cadres;

			emp_type_id = request.getParameter("emp_type");

			// System.out.println(" County:"+ county_name);
			current_cadres = "";

			String cadres = "SELECT  * FROM `hrh`.`standardized_cadre` WHERE emp_type='" + emp_type_id + "' ";

			DatabaseConnection conn = new DatabaseConnection();

			conn.rs = conn.st.executeQuery(cadres);

			current_cadres = "<option value=\"\">Select Standard Cadre</option>";

			while (conn.rs.next()) {
				if (sessioncadre.equalsIgnoreCase(conn.rs.getString("id"))) {

					current_cadres = current_cadres + "<option selected value=\""
							+ conn.rs.getString("id") + "\">" + conn.rs.getString("standardized_cadre_name") + "</option>";

				} else {
					current_cadres = current_cadres + "<option value=\"" + conn.rs.getString("id") + "\">"
							+ conn.rs.getString("standardized_cadre_name") + "</option>";

				}

			}

			PrintWriter out = response.getWriter();

			try {
				out.println(current_cadres);

			} finally {
				if (conn.conn != null) {
					conn.conn.close();
				}
				if (conn.rs != null) {
					conn.rs.close();
				}
				if (conn.st != null) {
					conn.st.close();
				}
				out.close();
			}
		} catch (SQLException ex) {
			Logger.getLogger(GetCadreServlet.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
