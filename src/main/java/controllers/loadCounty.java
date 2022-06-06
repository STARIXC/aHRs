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
 * Servlet implementation class loadCounty
 */
@WebServlet("/loadCounty")
public class loadCounty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loadCounty() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			session = request.getSession();
			String sessioncounty = "";

			if (session.getAttribute("countyid") != null) {

				sessioncounty = session.getAttribute("countyid").toString();
			}

			String county = "";

			DatabaseConnection conn = new DatabaseConnection();
			county = "<option value=\"\">Select County</option>";
			String qr = "SELECT * FROM county where active =1 order by County ASC;";
			conn.rs = conn.st.executeQuery(qr);
			while (conn.rs.next()) {
				if (sessioncounty.equalsIgnoreCase(conn.rs.getString(1))) {

					county += "<option selected value=\"" + conn.rs.getString(1) + "\">" + conn.rs.getString(2)
							+ "</option>";
				}

				else {
					county += "<option value=\"" + conn.rs.getString(1) + "\">" + conn.rs.getString(2) + "</option>";
				}

			}

			PrintWriter out = response.getWriter();
			try {
				out.println(county);
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
