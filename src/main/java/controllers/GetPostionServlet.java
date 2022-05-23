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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	@SuppressWarnings("static-access")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");

			session = request.getSession();

			String sessionPosition = "";

			session.getAttribute("positionid");

			if (session.getAttribute("positionid") != null) {

				sessionPosition = session.getAttribute("positionid").toString();

			}
			System.out.println("current position ___" + sessionPosition);

			String standard_id, current_positions;

			standard_id = request.getParameter("cadre");

			// System.out.println(" County:"+ county_name);
			current_positions = "";

			String positions = "Select * from cadre_positions WHERE standardized_cadre_id='" + standard_id + "'";

			DatabaseConnection conn = new DatabaseConnection();

			conn.rs = conn.st.executeQuery(positions);

			current_positions = "<option value=\"\">Select Employee Designation</option>";

			while (conn.rs.next()) {
				if (sessionPosition.equalsIgnoreCase(conn.rs.getString("id"))) {

					current_positions = current_positions + "<option selected value=\""
							+ conn.rs.getString("id") + "\">" + conn.rs.getString("position_title") + "</option>";

				} else {
					current_positions = current_positions + "<option value=\"" + conn.rs.getString("id") + "\">"
							+ conn.rs.getString("position_title") + "</option>";

				}

			}

			PrintWriter out = response.getWriter();

			try {
				out.println(current_positions);

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
			Logger.getLogger(GetPostionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
