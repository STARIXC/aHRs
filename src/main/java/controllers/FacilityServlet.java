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
 * Servlet implementation class FacilityServlet
 */
@WebServlet("/FacilityServlet")
public class FacilityServlet extends HttpServlet {
	HttpSession session = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacilityServlet() {
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
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		session = request.getSession();
		DatabaseConnection conn = new DatabaseConnection();
		String facilityonsession = "";

		String subcounty = "";

		subcounty = request.getParameter("subcounty");

		// disttrict is same as subcounty

		if (session.getAttribute("facilityid") != null) {
			facilityonsession = session.getAttribute("facilityid").toString();

		}
		System.out.println("facil on session__" + facilityonsession);

		PrintWriter out = response.getWriter();

		try {
			
			String facils="<option value=''>Select Site</option>";
            String getfacils="";
            
            if(subcounty!=null){
             getfacils="select CentreSanteId,SubPartnerNom from subpartnera where DistrictID='"+subcounty+"' and active =1 order by SubPartnerNom ";
            }
            else {
              getfacils="select CentreSanteId,SubPartnerNom from subpartnera where active =1  order by SubPartnerNom  ";
            
            
            }
            conn.rs=conn.st.executeQuery(getfacils);
            System.out.println(getfacils);
            while(conn.rs.next()){
                //if the current facility on loop is same as the facility on session, then make it selected
                if(facilityonsession.equalsIgnoreCase(conn.rs.getString(1).trim())){
                
            facils+="<option selected value='"+conn.rs.getString(1) +"'> "+conn.rs.getString(2)+" </option>";
                }
                else{
                         facils+="<option value='"+conn.rs.getString(1) +"'> "+conn.rs.getString(2)+" </option>";
                }
               // System.out.println("~~"+conn.rs.getString(2));
            
                                 }
            
             
            out.println(facils);
        } catch (SQLException ex) {
            Logger.getLogger(FacilityServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
               
                conn.rs.close();
                conn.st.close();
              out.close();
            } catch (SQLException ex) {
                Logger.getLogger(FacilityServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
	
	}

}
