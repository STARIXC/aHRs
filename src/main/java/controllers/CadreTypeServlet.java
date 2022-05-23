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
 * Servlet implementation class CadreTypeServlet
 */
@WebServlet("/CadreTypeServlet")
public class CadreTypeServlet extends HttpServlet {
	HttpSession session = null;

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadreTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("static-access")
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
				}

				else {
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
		doGet(request, response);
	}

}
