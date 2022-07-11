package controllers;

import Utils.EmployeesRepo;
import Utils.IdGen;
import Utils.JSONConverter;
import com.google.gson.Gson;
import com.hris.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Staff;
import org.json.JSONObject;

/**
 *
 * @author UTJ
 */
public class ProcessStaff extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;
    public final DatabaseConnection conn;
    public EmployeesRepo dao;
    public JSONConverter json;
    public Staff staff;
    Gson gson = new Gson();
    String result, nextPage;
    String userid, username, password, pass, emp_no, full_name, first_name, surname, other_name, gender, phone, email,
            dob, home_address, postal_code, nationality, disability, disability_explain,
            national_id, mfl, position, emprecordid, date_started, date_ended, months_worked, financial_year, current_contract,
            contract_period, contract_end_date, expected_months,
            status, kra_pin, nssf_no, nhif_no,
            cert_good_conduct_no, helb_clearance_no,
            position_name, bank_name, branch, account_name, acount_number;
    int helb_benefitiary, active, isAdmin;
    String t_id, t_emp_no, termination_date, notice_date, voluntary_termination, termination_reason, termination_by;

    public ProcessStaff() {
        super();
        conn = new DatabaseConnection();
        dao = new EmployeesRepo();
        staff = new Staff();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
        
        JSONObject obj = new JSONObject();
        IdGen IG = new IdGen();//create globally JSONObject and name is "obj"
        username = password = pass = emp_no = full_name = first_name = surname = other_name = gender = phone = email
                = dob = home_address = postal_code = nationality = disability = disability_explain
                = national_id = emprecordid = mfl = position = date_started = date_ended = months_worked = financial_year = current_contract
                = contract_period = contract_end_date = expected_months = status = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = position_name = bank_name = branch = account_name = acount_number = helb_clearance_no = "";
        helb_benefitiary = active = isAdmin = 0;

        String action = request.getParameter("action");
        String deleteId = request.getParameter("deleteId");
        if (action.equalsIgnoreCase("delete")) {
            int deleted = deletebio(deleteId);
            if (deleted > 0) {
                int delete_h = deletehist(deleteId);
                if (delete_h != 0) {
                    obj.put("status", "success");
                    obj.put("message", "Staff Records deleted successfull");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable To Delete the Record.....");    //create json object "status","message" and apply custome messages for "delete data"
                }
            } else {
                obj.put("status", "error");
                obj.put("message", "Unable To Delete the Record....");    //create json object "status","message" and apply custome messages for "delete data"
            }
            out.print(obj);

        } else if (action.equalsIgnoreCase("save_employee")) {
            // form variables
            emp_no = request.getParameter("txtEmployeeNumber");
            first_name = request.getParameter("txtFirstName");
            surname = request.getParameter("txtSurname");
            other_name = request.getParameter("txtMiddleName");
            full_name = surname + " " + first_name + " " + other_name;
            gender = request.getParameter("rbtnGender");
            phone = request.getParameter("txtPhone");
            email = request.getParameter("txtEmail");
            dob = request.getParameter("txtBirthDate");
            home_address = request.getParameter("txtHomeAddress");
            postal_code = request.getParameter("txtPostalCode");
            nationality = request.getParameter("txtNationality");
            disability = request.getParameter("rbtnDisability");
            disability_explain = request.getParameter("txtDisabilityExplain");
            national_id = request.getParameter("txtNationalID");
            mfl = request.getParameter("ddlFacility");
            position = request.getParameter("ddlPos");
            date_started = request.getParameter("hiredate");
            financial_year = request.getParameter("year");
            current_contract = request.getParameter("start_date");
            contract_period = request.getParameter("contract_period");
            contract_end_date = request.getParameter("end_date");
            expected_months = request.getParameter("contract_no_months");
            kra_pin = request.getParameter("txtPinCode");
            nssf_no = request.getParameter("txtNSSF");
            nhif_no = request.getParameter("txtNHIF");
            cert_good_conduct_no = request.getParameter("txtGoodConduct");
            helb_clearance_no = request.getParameter("txtHelbClearance");
            helb_benefitiary = Integer.parseInt(request.getParameter("rbtnHelb"));
            // position_name = request.getParameter("ddlPos");
            bank_name = request.getParameter("txtBankName");
            branch = request.getParameter("txtBranchName");
            account_name = request.getParameter("txtAccountName");
            acount_number = request.getParameter("txtAccountNumber");
            active = 1;
            emprecordid = emp_no + "_" + mfl + "_" + position + "_" + financial_year;
            username = "";
            if (national_id == null) {
                pass = "123456";
            } else {
                pass = national_id;
            }

            userid = IG.current_id();
            m = MessageDigest.getInstance("MD5");
            m.update(pass.getBytes(), 0, pass.length());
            password = new BigInteger(1, m.digest()).toString(16);
            String checker = "SELECT id FROM emp_bio WHERE (first_name=? && surname=? && other_name=?) || emp_no=? || national_id=?";
            conn.pst = conn.conn.prepareStatement(checker);
            conn.pst.setString(1, first_name);
            conn.pst.setString(2, surname);
            conn.pst.setString(3, other_name);
            conn.pst.setString(4, emp_no);
            conn.pst.setString(5, national_id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next() == true) {
                String checker_hist = "SELECT emprecordid FROM employee_hist WHERE (nationalid=? && mfl=? && position=? && financial_year=? ) || emp_no=? || emprecordid=? and active=1";
                conn.pst = conn.conn.prepareStatement(checker_hist);
                conn.pst.setString(1, national_id);
                conn.pst.setString(2, mfl);
                conn.pst.setString(3, position);
                conn.pst.setString(4, financial_year);
                conn.pst.setString(5, emp_no);
                conn.pst.setString(6, emprecordid);
                conn.rs = conn.pst.executeQuery();
                if (conn.rs.next() == true) {
                    obj.put("status", "error");
                    obj.put("message", "The above person is available....");
                } else {
                    //     ADD STAFF EMPLOYEEMENT DETAILS
                    int saverecord = insert_hist(emprecordid, emp_no, national_id, mfl, position, date_started, financial_year, current_contract, contract_period, contract_end_date, expected_months, active);

                    if (saverecord != 0) {
                        obj.put("status", "success");
                        obj.put("message", "Staff exists, Employeement record added successfull");    //create json object "status","message" and apply custome messages for "delete data"
                    } else {
                        obj.put("status", "error");
                        obj.put("message", "Unable to add " + full_name + " To the Record....");    //create json object "status","message" and apply custome messages for "delete data"
                    }
                }
            } else {
                String inserter = "REPLACE INTO emp_bio(id,emp_no,first_name,surname,other_name,national_id,"
                        + "gender,phone,email,dob,home_address,postal_code,nationality,"
                        + "disability,disability_explain,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no,helb_benefitiary,bank_name,branch,account_name,acount_number)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                conn.pst = conn.conn.prepareStatement(inserter);
                conn.pst.setString(1, userid);
                conn.pst.setString(2, emp_no);
                conn.pst.setString(3, first_name);
                conn.pst.setString(4, surname);
                conn.pst.setString(5, other_name);
                conn.pst.setString(6, national_id);
                conn.pst.setString(7, gender);
                conn.pst.setString(8, phone);
                conn.pst.setString(9, email);
                conn.pst.setString(10, dob);
                conn.pst.setString(11, home_address);
                conn.pst.setString(12, postal_code);
                conn.pst.setString(13, nationality);
                conn.pst.setString(14, disability);
                conn.pst.setString(15, disability_explain);
                conn.pst.setString(16, kra_pin);
                conn.pst.setString(17, nssf_no);
                conn.pst.setString(18, nhif_no);
                conn.pst.setString(19, cert_good_conduct_no);
                conn.pst.setString(20, helb_clearance_no);
                conn.pst.setInt(21, helb_benefitiary);
                conn.pst.setString(22, bank_name);
                conn.pst.setString(23, branch);
                conn.pst.setString(24, account_name);
                conn.pst.setString(25, acount_number);

                if (conn.pst.executeUpdate() > 0) {
                    addlogin(emp_no, first_name, surname, isAdmin, password);
                    //     ADD STAFF EMPLOYEEMENT DETAILS
                    insert_hist(emprecordid, emp_no, national_id, mfl, position, date_started, financial_year, current_contract, contract_period, contract_end_date, expected_months, active);

                    obj.put("status", "success");
                    obj.put("message", "Record for" + full_name + "Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"

                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable to add " + full_name + " To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

                }

            }
            out.print(obj); //finally print the "obj" object
        } else if (action.equalsIgnoreCase("edit")) {
             emp_no = request.getParameter("emp_no");
            staff = dao.getStaffById(emp_no);
            String details = JSONConverter.convert(staff);
//                        System.out.print(details);
            out.println(details);
        } else if (action.equalsIgnoreCase("get_details")) {
            emp_no = request.getParameter("emp_no");
            staff = dao.getProfile(emp_no);
            String details = JSONConverter.convert(staff);
            //  System.out.print(details);
            out.println(details);
        } else if (action.equalsIgnoreCase("view")) {

            emp_no = request.getParameter("emp_no");
            staff = dao.getStaffById(emp_no);
            request.setAttribute("staff", staff);
        } else if (action.equalsIgnoreCase("allStaff")) {
            String employees = JSONConverter.convert(dao.findAll());
            //  System.out.print(employees);
            out.println(employees);
        } else if (action.equalsIgnoreCase("get_basic")) {
            String employees = JSONConverter.convert(dao.get_basic_All());
            // System.out.println(employees);
            out.println(employees);

        } else if (action.equalsIgnoreCase("terminate")) {

            t_emp_no = request.getParameter("employee_t");
            t_id = t_emp_no + "" + IG.t_current_id();
            termination_date = request.getParameter("terminatedate");
            notice_date = request.getParameter("noticedate");
            voluntary_termination = request.getParameter("volunt_termination");
            termination_reason = request.getParameter("termreason");
            termination_by = request.getParameter("terminationby");
            String terminating = "INSERT INTO `hrh`.`tbl_termination`(`t_id`,`emp_no`,`termination_date`,`notice_date`,`voluntary_termination`,`termination_reason`,`termination_by`) values(?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(terminating);
            conn.pst.setString(1, t_id);
            conn.pst.setString(2, t_emp_no);
            conn.pst.setString(3, termination_date);
            conn.pst.setString(4, notice_date);
            conn.pst.setString(5, voluntary_termination);
            conn.pst.setString(6, termination_reason);
            conn.pst.setString(7, termination_by);

            if (conn.pst.executeUpdate() > 0) {
                String deactivate = "UPDATE `hrh`.`employee_hist` SET active ='0' WHERE `emp_no` ='"+t_emp_no+"' and `active`='1'";
                conn.pst = conn.conn.prepareStatement(deactivate);
               // conn.pst.setString(1, t_emp_no);
                int execute=conn.pst.executeUpdate();
                if ( execute > 0) {
                    obj.put("status", "success");
                    obj.put("message", "Record Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Still active....");   //create json object "status","message" and apply custome messages for "unable to delete data"}
                }
            } else {
                obj.put("status", "error");
                obj.put("message", "Unable to add the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

            }
            out.print(obj);

        } else {
            String employees = JSONConverter.convert(dao.findAll());
            System.out.print(employees);
            out.println(employees);
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ProcessStaff.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProcessStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ProcessStaff.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProcessStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private void addlogin(String emp_no, String first_name, String surname, int admin, String password) throws SQLException {
        String sql_login = "REPLACE INTO login( emp_no, username, password, is_admin)"
                + "VALUES ('" + emp_no + "',CONCAT( LEFT('" + first_name + "', 1),'" + surname + "'),MD5( '" + password + "'),'" + admin + "')";
        conn.pst = conn.conn.prepareStatement(sql_login);
        conn.pst.executeUpdate();

    }

    private int insert_hist(String emprecordid, String emp_no, String national_id, String mfl, String position, String date_started, String financial_year, String current_contract, String contract_period, String contract_end_date, String expected_months, int active) throws SQLException {
        int success = 0;
        String date_fmt = "%m/%d/%Y";
        String dt_fmt = "%d-%m-%Y";
        String inserter_hist = "REPLACE INTO employee_hist(emprecordid, emp_no,nationalid, mfl, position,date_started,financial_year,current_contract,contract_period, contract_end_date,expected_months, active)"
                + "VALUES ('" + emprecordid + "','" + emp_no + "','" + national_id + "','" + mfl + "','" + position + "',STR_TO_DATE('" + date_started + "', '" + date_fmt + "'),'" + financial_year + "',STR_TO_DATE('" + current_contract + "', '" + dt_fmt + "'),'" + contract_period + "',STR_TO_DATE('" + contract_end_date + "', '" + dt_fmt + "'),'" + expected_months + "','" + active + "')";
        conn.pst = conn.conn.prepareStatement(inserter_hist);

        if (conn.pst.executeUpdate() > 0) {
            success += 1;
        } else {
            success = 0;
        }

        return success;
    }

    private int deletebio(String deleteId) throws SQLException {
        int deleted = 0;
        String delete = "DELETE FROM `hrh`.`emp_bio` WHERE emp_no='" + deleteId + "'";
        conn.pst = conn.conn.prepareStatement(delete);
        if (conn.pst.executeUpdate() > 0) {
            deleted += 1;
        } else {
            deleted = 0;
        }
        return deleted;

    }

    private int deletehist(String deleteId) throws SQLException {
        int deleted = 0;
        String delete = "DELETE FROM `hrh`.`employee_hist` WHERE emp_no='" + deleteId + "'";
        conn.pst = conn.conn.prepareStatement(delete);
        if (conn.pst.executeUpdate() > 0) {
            deleted += 1;
        } else {
            deleted = 0;
        }
        return deleted;
    }

}
