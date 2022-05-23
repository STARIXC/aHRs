package controllers;

import Utils.EmployeesRepo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBWAHYI
 */
public class ProcessEmployee extends HttpServlet {

    PrintWriter out;
    int insert_bio, insert_hist, insert_stat, insert_banking, insert_login = 0;
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

    public ProcessEmployee() {
        super();
        dao = new EmployeesRepo();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
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
            String sql_bio = "REPLACE INTO emp_bio" + "(emp_no,first_name,surname,"
                    + "other_name,national_id,"
                    + "gender,phone,email,dob,home_address," + "postal_code,nationality,"
                    + ")"
                    + " VALUES('" + emp_no + "','" + first_name + "','" + surname + "','"
                    + other_name + "','" + national_id + "','" + gender + "','" + phone + "',"
                    + "'" + email + "','" + dob + "','" + home_address + "','" + postal_code + "',"
                    + "'" + nationality + "')";

            String sql_hist = "REPLACE INTO employee_hist" + "(emp_no, national_id, mfl," + " position, date_started, "
                    + "date_ended, months_worked, " + "current_contract, contract_period,"
                    + " contract_end_date, expected_months," + " active" + ")" + ""
                    + " VALUES('" + emp_no + "','" + national_id + "','" + mfl + "','" + position + "',"
                    + "'" + date_started + "','" + date_ended + "','" + months_worked + "','" + current_contract + "',"
                    + "'" + contract_period + "','" + contract_end_date + "','" + expected_months + "','" + active + "')";

            String sql_banking_de = "REPLACE INTO banking_det(employee_no,bank_name,branch,account_name,acount_number)"
                    + " VALUES ('" + emp_no + "','" + bank_name + "','" + branch + "',"
                    + "'" + account_name + "','" + acount_number + "')";

            String sql_statutory_details = "REPLACE INTO statutory_details(employee_no,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no) "
                    + "VALUES ('" + emp_no + "','" + kra_pin + "','" + nssf_no + "','" + nhif_no + "','" + cert_good_conduct_no + "','" + helb_clearance_no + "')";

            String sql_login = "REPLACE INTO login( emp_no, username, password, is_admin)"
                    + "VALUES ('" + emp_no + "',CONCAT( LEFT('" + first_name + "', 1),'" + surname + "'),MD5( '" + password + "'),'" + 0 + "')";

            insert_bio = dao.addEmpBio(sql_bio);

            if (insert_bio == 1) {
                insert_hist = dao.addEmpHist(sql_hist);
                insert_stat = dao.addEmpStat(sql_statutory_details);
                insert_banking = dao.addEmpBank(sql_banking_de);
                insert_login = dao.addEmpAuth(sql_login);

            } else {
                System.out.println("Log entry failled");
            }
        } catch (IOException | NumberFormatException e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
