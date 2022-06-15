package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import Utils.EmployeesRepo;
import Utils.JSONConverter;
import models.Staff;

/**
 * Servlet implementation class AllStaffServlet
 */
@WebServlet("/AllStaffServlet")
public class AllStaffServlet extends HttpServlet {
//	DatabaseConnection conn = new DatabaseConnection();
	Gson gson = new Gson();
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/create_emp.jsp";
	private static String LIST_STAFF = "/employee.jsp";
	private static String VIEW_STAFF = "/employee_details.jsp";
	private JSONConverter json;
	private EmployeesRepo dao;
	PrintWriter out;
	int status, execute_activity = 0;
	String result,nextPage;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllStaffServlet() {
		super();
		dao = new EmployeesRepo();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		 
		out = response.getWriter();
		@SuppressWarnings("unused")
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			String emp_no = request.getParameter("emp_no");
			dao.deleteStaff(emp_no);
						forward = LIST_STAFF;
			request.setAttribute("employees", dao.findAll());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String emp_no = request.getParameter("emp_no");
			Staff staff = dao.getStaffById(emp_no);
			String details=json.convert(staff);
                        System.out.print(staff);
                        out.println(details);
		} else if (action.equalsIgnoreCase("view")) {
			forward = VIEW_STAFF;
			String emp_no = request.getParameter("emp_no");
			Staff staff = dao.getStaffById(emp_no);
			request.setAttribute("staff", staff);
		} else if (action.equalsIgnoreCase("allStaff")) {
			String employees = json.convert(dao.findAll());
                         System.out.print(employees);
			out.println(employees);
		}else if (action.equalsIgnoreCase("get_basic")) {
			String employees = json.convert(dao.get_basic_All());
                        System.out.println(employees);
			out.println(employees);
                        
		} else {
			forward = INSERT_OR_EDIT;
		}

		/*
		 * RequestDispatcher view = request.getRequestDispatcher(forward);
		 * view.forward(request, response);
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Staff staff = new Staff();

		staff.setEmp_no(request.getParameter("emp_no"));
		staff.setFirst_name(request.getParameter("first_name"));
		staff.setSurname(request.getParameter("surname"));
		staff.setOther_name(request.getParameter("other_name"));
		staff.setNational_id(request.getParameter("national_id"));
		staff.setGender(request.getParameter("gender"));
		staff.setPhone(request.getParameter("phone"));
		staff.setEmail(request.getParameter("email"));
		staff.setDob(request.getParameter("dob"));
		staff.setHome_address(request.getParameter("home_address"));
		staff.setPosition(request.getParameter("postal_code"));
		staff.setNationality(request.getParameter("nationality"));
		staff.setDisability(request.getParameter("disability"));
		staff.setDisability_explain(request.getParameter("disability_explain"));
		// emp_hist
		staff.setMfl(request.getParameter("mfl"));
		staff.setPosition(request.getParameter("position"));
		staff.setDate_started(request.getParameter("date_started"));
		staff.setDate_ended(request.getParameter("date_ended"));
		staff.setMonths_worked(request.getParameter("months_worked"));
		staff.setCurrent_contract(request.getParameter("current_contract"));
		staff.setContract_period(request.getParameter("contract_period"));
		staff.setContract_end_date(request.getParameter("contract_end_date"));
		staff.setExpected_months(request.getParameter("expected_months"));
		staff.setActive(Integer.parseInt(request.getParameter("active")));
		// bank details
		staff.setBank_name(request.getParameter("bank_name"));
		staff.setBranch(request.getParameter("branch"));
		staff.setAccount_name(request.getParameter("account_name"));
		staff.setAcount_number(request.getParameter("acount_number"));
		// statutory
		staff.setKra_pin(request.getParameter("kra_pin"));
		staff.setNssf_no(request.getParameter("nssf_no"));
		staff.setNhif_no(request.getParameter("nhif_no"));
		staff.setCert_good_conduct_no(request.getParameter("cert_good_conduct_no"));
		staff.setHelb_clearance_no(request.getParameter("helb_clearance_no"));
		String staffID = request.getParameter("staffID");
		if (staffID == null || staffID.isEmpty()) {
			dao.addEmployee(staff);

		} else {
			staff.setEmp_no(staffID);
			dao.updateEmployee(staff);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_STAFF);
		request.setAttribute("allStaff", dao.findAll());
		view.forward(request, response);
	}

}
