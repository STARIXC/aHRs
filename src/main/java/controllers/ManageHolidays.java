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
import Utils.JSONConverter;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Holiday;
import org.json.JSONObject;

/**
 * Servlet implementation class ManageHolidays
 */
@WebServlet({"/ManageHolidays", "/Leave/manage_holiday"})
public class ManageHolidays extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private JSONConverter json;
    public HolidayDao dao;
    PrintWriter out;
    String holiday_name, start_date, end_date, no_of_days, comment = "";
    int respond, results = 0;
  
    public ManageHolidays() {
        super();
        dao = new HolidayDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteHoliday(id);

        } else if (action.equalsIgnoreCase("edit")) {
            String hol_id=request.getParameter("id");
            int id = Integer.parseInt(hol_id);
            Holiday holiday = dao.getHolidayById(id);
            String result = JSONConverter.convert(holiday);
            out.println(result);

        } else if (action.equalsIgnoreCase("listHolidays")) {
            String holidays = json.convert(dao.getAllHolidays());
            out.println(holidays);

        } else if (action.equalsIgnoreCase("submit")) {
            Holiday holiday = new Holiday();
            DateFormat formatter;

            formatter = new SimpleDateFormat("dd/MM/yyyy");
            String start = request.getParameter("from_date");
            String end = request.getParameter("to_date");
            String holiday_name = request.getParameter("holiday_name");
           
            Date start_ = new SimpleDateFormat("yyyy-mm-dd").parse(start);
            Date end_ = new SimpleDateFormat("yyyy-mm-dd").parse(end);
            holiday.setEnd_date(end_);
            holiday.setStart_date(start_);
            holiday.setHoliday_name(request.getParameter("holiday_name"));
            holiday.setNo_of_days(request.getParameter("no_of_days"));
            holiday.setComment(request.getParameter("comment"));
            String id = request.getParameter("id");
            String isHoliday = "1";
            if (id == null || id.isEmpty()) {
                List<String> dateList = dao.getDaysBetweenDates(start, end);

                for (int i = 0; i < dateList.size(); i++) {
                    String date=dateList.get(i);
                 dao.updateCHoliday(date, isHoliday, holiday_name);
                }

                respond = dao.addHoliday(holiday);
                JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

                if (respond != 0) {   //check if condition variable "i" not equal to zero after continue

                    obj.put("status", "success");
                    obj.put("message", " Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {

                    obj.put("status", "error");
                    obj.put("message", "Unable to submit request....");   //create json object "status","message" and apply custome messages for "unable to delete data"
                }

                out.print(obj);
            } else {
                holiday.setId(Integer.parseInt(id));
                dao.updateHoliday(holiday);
            }

        } else {
            String holidays = json.convert(dao.getAllHolidays());
            out.println(holidays);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ManageHolidays.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ManageHolidays.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
