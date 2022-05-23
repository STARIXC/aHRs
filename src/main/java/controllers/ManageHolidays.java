package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.HolidayDao;
import models.Holiday;

/**
 * Servlet implementation class ManageHolidays
 */
@WebServlet({ "/ManageHolidays", "/Leave/manage_holiday" })
public class ManageHolidays extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static String INSERT_OR_EDIT = "/create_holiday.jsp";
	private static String LIST_Holiday = "/manage_holiday.jsp";
	private HolidayDao dao;

	public ManageHolidays() {
		super();
		dao = new HolidayDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			dao.deleteHoliday(id);
			forward = LIST_Holiday;
			request.setAttribute("holidays", dao.getAllHolidays());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int id = Integer.parseInt(request.getParameter("id"));
			Holiday holiday = dao.getHolidayById(id);
			request.setAttribute("holiday", holiday);
		} else if (action.equalsIgnoreCase("listHolidays")) {
			forward = LIST_Holiday;
			request.setAttribute("holidays", dao.getAllHolidays());
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Holiday holiday = new Holiday();
		try {
	
			Date start_ = new SimpleDateFormat("dd-mm-yy").parse(request.getParameter("start_date"));
			Date end_ = new SimpleDateFormat("dd-mm-yy").parse(request.getParameter("end_date"));
			holiday.setEnd_date(end_);
			holiday.setStart_date(start_);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		holiday.setHoliday_name(request.getParameter("holiday_name"));

		holiday.setNo_of_days(request.getParameter("no_of_days"));
		String id=request.getParameter("id");
		if(id==null || id.isEmpty()) {
			dao.addHoliday(holiday);
		}else {
			holiday.setId(Integer.parseInt(id));
			dao.updateHoliday(holiday);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_Holiday);
        request.setAttribute("holidays", dao.getAllHolidays());
        view.forward(request, response);
	}

}
