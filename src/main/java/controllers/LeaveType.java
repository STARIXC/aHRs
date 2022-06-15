package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hris.db.DatabaseConnection;

import Utils.JSONConverter;
import Utils.LeaveModel;

/**
 * Servlet implementation class LeaveType
 */
@WebServlet("/LeaveType")
public class LeaveType extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;
    DatabaseConnection conn = new DatabaseConnection();
    Gson gson = new Gson();
    @SuppressWarnings("unused")
    private LeaveModel dao;
    private JSONConverter json;
    int status = 0;
    String message = "";
    PrintWriter out;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveType() {
        super();
        dao = new LeaveModel();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        out = response.getWriter();
        @SuppressWarnings("static-access")
        String leave = json.convert(dao.getAllLeaves());
        out.println(leave);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
