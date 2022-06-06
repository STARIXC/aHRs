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
 * Servlet implementation class GetsubcountyServlet
 */
@WebServlet("/GetsubcountyServlet")
public class GetsubcountyServlet extends HttpServlet {

	HttpSession session = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetsubcountyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("static-access")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html;charset=UTF-8");

			session = request.getSession();

			String sessionSubcounty = "";

			session.getAttribute("subcountyid");

			if (session.getAttribute("subcountyid") != null) {

				sessionSubcounty = session.getAttribute("subcountyid").toString();

			}
			System.out.println("current district ___" + sessionSubcounty);

			String county_id, current_districts;

			county_id = request.getParameter("county");

			// System.out.println(" County:"+ county_name);
			current_districts = "";

			String districts = "Select * from district where CountyID='" + county_id + "' AND active=1";

			DatabaseConnection conn = new DatabaseConnection();

			conn.rs = conn.st.executeQuery(districts);

			current_districts = "<option value=\"\">Select sub-county</option>";

			while (conn.rs.next()) {
				if (sessionSubcounty.equalsIgnoreCase(conn.rs.getString("DistrictID"))) {

					current_districts = current_districts + "<option selected value=\""
							+ conn.rs.getString("DistrictID") + "\">" + conn.rs.getString("DistrictNom") + "</option>";

				} else {
					current_districts = current_districts + "<option value=\"" + conn.rs.getString("DistrictID") + "\">"
							+ conn.rs.getString("DistrictNom") + "</option>";

				}

			}

			PrintWriter out = response.getWriter();

			try {
				out.println(current_districts);

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
			Logger.getLogger(GetsubcountyServlet.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
