package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import Utils.EmployeesRepo;
import java.sql.SQLException;

/**
 * Servlet implementation class EmployeesController_
 */

public class EmployeesController_ extends HttpServlet {

    private static final long serialVersionUID = 1L;
    PrintWriter out;
    int execute_activity = 0;
    @SuppressWarnings("unused")
    private EmployeesRepo dao;
    Gson gson = new Gson();
    String result, nextPage;
    String username, password, emp_no, first_name, surname, other_name, gender, phone, email,
            dob, home_address, postal_code, nationality, disability, disability_explain,
            national_id, mfl, position, date_started, date_ended, months_worked, current_contract,
            contract_period, contract_end_date, expected_months,
            status, kra_pin, nssf_no, nhif_no,
            cert_good_conduct_no, helb_clearance_no,
            position_name, bank_name, branch, account_name, acount_number;
    int helb_benefitiary, active;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeesController_() {
        super();
        dao = new EmployeesRepo();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings("override")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        username = password = emp_no = first_name = surname = other_name = gender = phone = email
                = dob = home_address = postal_code = nationality = disability = disability_explain
                = national_id = mfl = position = date_started = date_ended = months_worked = current_contract
                = contract_period = contract_end_date = expected_months = status = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = position_name = bank_name = branch = account_name = acount_number = helb_clearance_no = "";
        helb_benefitiary = active = 0;
        emp_no = request.getParameter("txtEmployeeNumber");
        first_name = request.getParameter("txtFirstName");
        surname = request.getParameter("txtSurname");
        other_name = request.getParameter("txtMiddleName");
        gender = request.getParameter("rbtnGender");
        phone = request.getParameter("txtPhone");
        email = request.getParameter("txtEmail");
        dob = request.getParameter("txtBirthDate");
        home_address = request.getParameter("txtHomeAddress");
        postal_code = request.getParameter("txtPostalCode");
        nationality = request.getParameter("txtNationality");
        disability = request.getParameter("date_");
        disability_explain = request.getParameter("date_");
        national_id = request.getParameter("txtNationalID");
        mfl = request.getParameter("date_");
        position = request.getParameter("ddlDesignation");
        date_started = request.getParameter("hiredate");
        date_ended = request.getParameter("terminatedate");
        //            months_worked = request.getParameter("date_");
//            current_contract = request.getParameter("date_");
//            contract_period = request.getParameter("date_");
//            contract_end_date = request.getParameter("date_");
//            expected_months = request.getParameter("date_");
//  status = request.getParameter("date_");
kra_pin = request.getParameter("txtPinCode");
nssf_no = request.getParameter("txtNSSF");
nhif_no = request.getParameter("txtNHIF");
cert_good_conduct_no = request.getParameter("txtGoodConduct");
helb_clearance_no = request.getParameter("txtHelbClearance");
helb_benefitiary = Integer.parseInt(request.getParameter("rbtnHelb"));
// active = Integer.parseInt(request.getParameter("shift"));
position_name = request.getParameter("shift");
bank_name = request.getParameter("txtBankName");
branch = request.getParameter("txtBranchName");
account_name = request.getParameter("txtAccountName");
acount_number = request.getParameter("txtAccountNumber");
username = "";
//  password=md5(national_id);
//                employee bio query
String sql_bio = "REPLACE INTO emp_bio(emp_no,first_name,surname,other_name,national_id,gender,phone,email,dob,home_address,postal_code,nationality) VALUES('" + emp_no + "','" + first_name + "','" + surname + "','"+ other_name + "','" + national_id + "','" + gender + "','" + phone + "','" + email + "','" + dob + "','" + home_address + "','" + postal_code + "','" + nationality + "')";
dao.addEmpBio(sql_bio);
String sql_hist = "REPLACE INTO employee_hist" + "(emp_no, national_id, mfl," + " position, date_started, "
        + "date_ended, months_worked, " + "current_contract, contract_period,"
        + " contract_end_date, expected_months," + " active" + ")" + ""
        + " VALUES('" + emp_no + "','" + national_id + "','" + mfl + "','" + position + "',"
        + "'" + date_started + "','" + date_ended + "','" + months_worked + "','" + current_contract + "',"
        + "'" + contract_period + "','" + contract_end_date + "','" + expected_months + "','" + active + "')";
dao.addEmpHist(sql_hist);
String sql_banking_de = "REPLACE INTO banking_det(employee_no,bank_name,branch,account_name,acount_number)"
        + " VALUES ('" + emp_no + "','" + bank_name + "','" + branch + "',"
        + "'" + account_name + "','" + acount_number + "')";
dao.addEmpBank(sql_banking_de);
String sql_statutory_details = "REPLACE INTO statutory_details(employee_no,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no) "
        + "VALUES ('" + emp_no + "','" + kra_pin + "','" + nssf_no + "','" + nhif_no + "','" + cert_good_conduct_no + "','" + helb_clearance_no + "')";
dao.addEmpStat(sql_statutory_details);
String sql_login = "REPLACE INTO login( emp_no, username, password, is_admin)"
        + "VALUES ('" + emp_no + "',CONCAT( LEFT('" + first_name + "', 1),'" + surname + "'),MD5( '" + password + "'),'" + 0 + "')";
dao.addEmpAuth(sql_login);
out.close();
    }

}
