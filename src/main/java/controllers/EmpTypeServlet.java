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
 * Servlet implementation class EmpTypeServlet
 */
@WebServlet("/EmpTypeServlet")
public class EmpTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			session = request.getSession();
			String sessionemptype = "";

			if (session.getAttribute("emp_type_id") != null) {

				sessionemptype = session.getAttribute("emp_type_id").toString();
			}

			String emp_type = "";

			DatabaseConnection conn = new DatabaseConnection();
			emp_type = "<option value=\"\">Select Employee Type</option>";
			String qr = "SELECT * FROM cadre_type";
			conn.rs = conn.st.executeQuery(qr);
			while (conn.rs.next()) {
				if (sessionemptype.equalsIgnoreCase(conn.rs.getString(1))) {

					emp_type += "<option selected value=\"" + conn.rs.getInt("id") + "\">" + conn.rs.getString("cadre_type_name")
					+ "</option>";
				}

				else {
					emp_type += "<option value=\"" + conn.rs.getInt("id") + "\">" + conn.rs.getString("cadre_type_name") + "</option>";
				}

			}

			PrintWriter out = response.getWriter();
			try {
				out.println(emp_type);
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
			Logger.getLogger(loadCounty.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
