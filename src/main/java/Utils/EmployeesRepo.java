package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hris.db.DatabaseConnection;

import models.Staff;

public class EmployeesRepo {

    private DatabaseConnection conn;

    public EmployeesRepo() {
        conn = new DatabaseConnection();
    }

    //sql_bio,sql_hist ,,,	
    public int addEmpBio(String sql_bio) {
        int rowsAffected = 0;
        //write the insert Query
        try {
            //	prepare statement
            conn.pst = conn.conn.prepareStatement(sql_bio);
            //	execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }

    public int addEmpHist(String sql_hist) {
        int rowsAffected = 0;
        //write the insert Query
        try {
            //	prepare statement
            conn.pst = conn.conn.prepareStatement(sql_hist);
            //	execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }

    public int addEmpBank(String sql_banking_det) {
        int rowsAffected = 0;
        //write the insert Query
        try {
            // prepare statement
            conn.pst = conn.conn.prepareStatement(sql_banking_det);
            // execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
        }
        return rowsAffected;
    }

    public int addEmpStat(String sql_statutory_details) {
        int rowsAffected = 0;
        //write the insert Query

        try {
            //	prepare statement
            conn.pst = conn.conn.prepareStatement(sql_statutory_details);

            //	execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
        }

        return rowsAffected;
    }

    public int addEmpAuth(String sql_login) {
        int rowsAffected = 0;
        //write the insert Query

        try {
            //	prepare statement
            conn.pst = conn.conn.prepareStatement(sql_login);

            //	execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
        }

        return rowsAffected;
    }

    @SuppressWarnings({"static-access", "unused"})
    public void addEmployee(Staff staff) {

        try {
            String sql = "REPLACE INTO emp_bio" + "(emp_no,first_name,surname," + "other_name,national_id,"
                    + "gender,phone,email,dob,home_address," + "postal_code,nationality,"
                    + "disability,disability_explain)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, staff.getEmp_no());
            conn.pst.setString(2, staff.getFirst_name());
            conn.pst.setString(3, staff.getSurname());
            conn.pst.setString(4, staff.getOther_name());
            conn.pst.setString(5, staff.getNational_id());
            conn.pst.setString(6, staff.getGender());
            conn.pst.setString(7, staff.getPhone());
            conn.pst.setString(8, staff.getEmail());
            conn.pst.setString(9, staff.getDob());
            conn.pst.setString(10, staff.getHome_address());
            conn.pst.setString(11, staff.getPosition());
            conn.pst.setString(12, staff.getNationality());
            conn.pst.setString(13, staff.getDisability());
            conn.pst.setString(14, staff.getDisability_explain());

            conn.pst.executeUpdate();
            String sql1 = "REPLACE INTO employee_hist" + "(emp_no, national_id, mfl," + " position, date_started, "
                    + "date_ended, months_worked, " + "current_contract, contract_period,"
                    + " contract_end_date, expected_months," + " active" + ")" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn.pst1 = conn.conn.prepareStatement(sql1);
            conn.pst1.setString(1, staff.getEmp_no());
            conn.pst1.setString(2, staff.getNational_id());
            conn.pst1.setString(3, staff.getMfl());
            conn.pst1.setString(4, staff.getPosition());
            conn.pst1.setString(5, staff.getDate_started());
            conn.pst1.setString(6, staff.getDate_ended());
            conn.pst1.setString(7, staff.getMonths_worked());
            conn.pst1.setString(8, staff.getCurrent_contract());
            conn.pst1.setString(9, staff.getContract_period());
            conn.pst1.setString(10, staff.getContract_end_date());
            conn.pst1.setString(11, staff.getExpected_months());
            conn.pst1.setInt(12, staff.getActive());
            conn.pst1.executeUpdate();
            String sql2 = "REPLACE INTO banking_det(employee_no,bank_name,branch,account_name,acount_number) VALUES (?,?,?,?,?)";
            conn.pst2 = conn.conn.prepareStatement(sql2);
            conn.pst2.setString(1, staff.getEmp_no());
            conn.pst2.setString(2, staff.getBank_name());
            conn.pst2.setString(3, staff.getBranch());
            conn.pst2.setString(4, staff.getAccount_name());
            conn.pst2.setString(5, staff.getAcount_number());
            conn.pst2.executeUpdate();
            String sql3 = "REPLACE INTO statutory_details(employee_no,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no) VALUES (?,?,?,?,?,?)";
            conn.pst3 = conn.conn.prepareStatement(sql3);
            conn.pst3.setString(1, staff.getEmp_no());
            conn.pst3.setString(2, staff.getKra_pin());
            conn.pst3.setString(3, staff.getNssf_no());
            conn.pst3.setString(4, staff.getNhif_no());
            conn.pst3.setString(5, staff.getCert_good_conduct_no());
            conn.pst3.setString(6, staff.getHelb_clearance_no());
            conn.pst3.executeUpdate();
            String sql4 = "REPLACE INTO login( emp_no, username, password, is_admin, profile_path)VALUES (?,?,?,?)";
            conn.pst4 = conn.conn.prepareStatement(sql4);
            conn.pst4.setString(1, staff.getEmp_no());
            conn.pst4.setString(2, staff.getEmp_no());
            conn.pst4.setInt(3, 0);
            conn.pst4.setString(4, "");
            conn.pst4.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @SuppressWarnings("static-access")
    public void deleteStaff(String emp_no) {

        try {
            String sql = "DELETE from emp_bio where emp_no=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, emp_no);
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @SuppressWarnings("static-access")
    public List<Staff> findAll() {
        List<Staff> allStaff = new ArrayList<>();

        try {
            String sql = "select IFNULL(b.id,'-') as emp_id,  IFNULL(b.emp_no,'-') as emp_no,  IFNULL(b.first_name,'') as firstname,"
                    + "  IFNULL(b.surname,'') as surname, IFNULL( b.other_name,'') as other_name,IFNULL(b.phone,'_') as phone, IFNULL(b.email,'') as email,"
                    + "  IFNULL(b.nationality,'-') as nationality,h.active as status,c.position_title as position "
                    + "from emp_bio b join employee_hist h on h.emp_no =b.emp_no "
                    + "join cadre_positions c on h.position=c.id ";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                Staff staff = new Staff();
                staff.setId(conn.rs.getInt("emp_id"));
                staff.setEmp_no(conn.rs.getString("emp_no"));
                staff.setFirst_name(conn.rs.getString("firstname"));
                staff.setSurname(conn.rs.getString("surname"));
                staff.setOther_name(conn.rs.getString("other_name"));
                staff.setPhone(conn.rs.getString("phone"));
                staff.setEmail(conn.rs.getString("email"));
                staff.setNationality(conn.rs.getString("nationality"));
                staff.setPosition_name(conn.rs.getString("position"));
                staff.setActive(conn.rs.getInt("status"));
                allStaff.add(staff);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return allStaff;

    }

    public Staff getStaffById(String emp_no) {
        Staff staff = new Staff();
//int emp_no_ = Integer.parseInt(emp_no);
        try {
//String sql = "SELECT b.id,b.emp_no, b.first_name,b.surname,
//b.other_name,b.national_id,b.gender,b.phone,b.email,b.dob,
//b.home_address,b.postal_code,b.nationality,b.disability,b.disability_explain,h.mfl,h.position,h.date_started,h.date_ended,
//h.financial_year,c.carder_category_id,c.standardized_cadre_id,c.position_title,c.cadre_type_id,c.basic_pay
//,bk.bank_name,bk.branch,bk.account_name,bk.acount_number,st.kra_pin,st.nssf_no,st.nhif_no,st.cert_good_conduct_no,st.helb_clearance_no,st.helb_benefitiary,lg.username  from emp_bio b JOIN  employee_hist h on h.emp_no =b.emp_no JOIN  cadre_positions c on h.position=c.id JOIN banking_det bk ON b.emp_no = bk.employee_no JOIN statutory_details st ON b.emp_no =st.employee_no JOIN login lg ON b.emp_no=lg.emp_no WHERE b.emp_no ='"+emp_no+"' and h.active=1" ;

            String sql = "select IFNULL(b.id,'-') as emp_id,  IFNULL(b.emp_no,'-') as emp_no,"
                    + "IFNULL(b.first_name,'') as firstname,"
                    + "IFNULL(b.surname,'') as surname, IFNULL( b.other_name,'') as other_name,"
                    + "IFNULL(b.phone,'_') as phone,"
                    + " IFNULL(b.email,'') as email,"
                    + "IFNULL(b.dob,'') as dob,"
                    + "IFNULL(b.national_id,'') as national_id,"
                    + "IFNULL(b.gender,'') as gender,"
                    + "IFNULL(b.home_address,'') as home_address,"
                    + "IFNULL(b.postal_code,'') as postal_code,"
                    + "IFNULL(b.nationality,'-') as nationality,"
                    + "IFNULL(b.disability,'') as disability,"
                    + "IFNULL(b.disability_explain,'')as disability_explain,"
                    + "h.active as status,"
                    + "IFNULL(h.mfl,'') as mfl,"
                    + "IFNULL(h.position,0) as position,"
                    + "IFNULL(h.date_started,'') as date_started,"
                    + "IFNULL(h.date_ended,'') as date_ended,"
                    + "IFNULL(h.financial_year,'') as financial_year,"
                    + "h.months_worked,"
                    + "h.current_contract, h.contract_period, h.contract_end_date,"
                    + "IFNULL(c.position_title,'') as position,"
                    + "IFNULL(c.carder_category_id,'') as carder_category_id,"
                    + "IFNULL(c.standardized_cadre_id,'') as standardized_cadre_id,"
                    + "IFNULL(c.cadre_type_id,'') as cadre_type_id,"
                    + "IFNULL(c.basic_pay,'') as basic_pay "
                    + "from emp_bio as b join employee_hist as h on h.emp_no =b.emp_no "
                    + "join cadre_positions as c on h.position=c.id "
                    + "join banking_det as bk ON bk.employee_no = b.emp_no "

                    + "where b.emp_no ='" + emp_no + "' and h.active =1";
            System.out.println(sql);
//conn.pst = conn.conn.prepareStatement(sql);
//conn.pst.setString(1, emp_no);
//Staff [id=1, emp_no=0004, first_name=ESTHER,
//surname=ARENCHI, other_name=NYANGARA, gender=FEMALE, 
//phone=0711564042, email=arenchiesther@gmail.com, dob=, home_address=, postal_code=, nationality=Kenyan, disability=0, disability_explain=, national_id=27456435, mfl=15212, position=6,
//date_started=2018-10-01, date_ended=, months_worked=null, current_contract=null, contract_period=null, contract_end_date=null,
//expected_months=null, status=null, kra_pin=null, nssf_no=null, nhif_no=null, cert_good_conduct_no=null, helb_clearance_no=null, helb_benefitiary=0, active=1, bank_name=null, branch=null, account_name=null, acount_number=null]current district ___

            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                staff.setId(conn.rs.getInt("emp_id"));
                staff.setEmp_no(conn.rs.getString("emp_no"));
                staff.setFirst_name(conn.rs.getString("firstname"));
                staff.setSurname(conn.rs.getString("surname"));
                staff.setOther_name(conn.rs.getString("other_name"));
                staff.setNational_id(conn.rs.getString("national_id"));
                staff.setGender(conn.rs.getString("gender"));
                staff.setPhone(conn.rs.getString("phone"));
                staff.setEmail(conn.rs.getString("email"));
                staff.setDob(conn.rs.getString("dob"));
                staff.setHome_address(conn.rs.getString("home_address"));
                staff.setPostal_code(conn.rs.getString("postal_code"));
                staff.setPosition(conn.rs.getString("position"));
                staff.setNationality(conn.rs.getString("nationality"));
                staff.setDisability(conn.rs.getString("disability"));
                staff.setDisability_explain(conn.rs.getString("disability_explain"));
                staff.setMfl(conn.rs.getString("mfl"));
                staff.setDate_started(conn.rs.getString("date_started"));
                staff.setDate_ended(conn.rs.getString("date_ended"));
//                staff.setMonths_worked(conn.rs.getString("firstname"));
//                staff.setCurrent_contract(conn.rs.getString("firstname"));
//                staff.setContract_period(conn.rs.getString("firstname"));
//                staff.setContract_end_date(conn.rs.getString("firstname"));
//                staff.setExpected_months(conn.rs.getString("firstname"));
                staff.setActive(conn.rs.getInt("status"));
//                staff.setEmp_no(conn.rs.getString("firstname"));
//                staff.setBank_name(conn.rs.getString("firstname"));
//                staff.setBranch(conn.rs.getString("firstname"));
//                staff.setAccount_name(conn.rs.getString("firstname"));
//                staff.setAcount_number(conn.rs.getString("firstname"));
//                staff.setEmp_no(conn.rs.getString("firstname"));
//                staff.setKra_pin(conn.rs.getString("firstname"));
//                staff.setNssf_no(conn.rs.getString("firstname"));
//                staff.setNhif_no(conn.rs.getString("firstname"));
//                staff.setCert_good_conduct_no(conn.rs.getString("firstname"));
//                staff.setHelb_clearance_no(conn.rs.getString("firstname"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return staff;

    }

    @SuppressWarnings("static-access")
    public void updateEmployee(Staff staff) {
        try {
            String sql = "REPLACE INTO emp_bio" + "(emp_no,first_name,surname," + "other_name,national_id,"
                    + "gender,phone,email,dob,home_address," + "postal_code,nationality,"
                    + "disability,disability_explain)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, staff.getEmp_no());
            conn.pst.setString(2, staff.getFirst_name());
            conn.pst.setString(3, staff.getSurname());
            conn.pst.setString(4, staff.getOther_name());
            conn.pst.setString(5, staff.getNational_id());
            conn.pst.setString(6, staff.getGender());
            conn.pst.setString(7, staff.getPhone());
            conn.pst.setString(8, staff.getEmail());
            conn.pst.setString(9, staff.getDob());
            conn.pst.setString(10, staff.getHome_address());
            conn.pst.setString(11, staff.getPosition());
            conn.pst.setString(12, staff.getNationality());
            conn.pst.setString(13, staff.getDisability());
            conn.pst.setString(14, staff.getDisability_explain());

            conn.pst.executeUpdate();
            String sql1 = "REPLACE INTO employee_hist" + "(emp_no, national_id, mfl," + " position, date_started, "
                    + "date_ended, months_worked, " + "current_contract, contract_period,"
                    + " contract_end_date, expected_months," + " active" + ")" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn.pst1 = conn.conn.prepareStatement(sql1);
            conn.pst1.setString(1, staff.getEmp_no());
            conn.pst1.setString(2, staff.getNational_id());
            conn.pst1.setString(3, staff.getMfl());
            conn.pst1.setString(4, staff.getPosition());
            conn.pst1.setString(5, staff.getDate_started());
            conn.pst1.setString(6, staff.getDate_ended());
            conn.pst1.setString(7, staff.getMonths_worked());
            conn.pst1.setString(8, staff.getCurrent_contract());
            conn.pst1.setString(9, staff.getContract_period());
            conn.pst1.setString(10, staff.getContract_end_date());
            conn.pst1.setString(11, staff.getExpected_months());
            conn.pst1.setInt(12, staff.getActive());
            conn.pst1.executeUpdate();
            String sql2 = "REPLACE INTO banking_det(employee_no,bank_name,branch,account_name,acount_number) VALUES (?,?,?,?,?)";
            conn.pst2 = conn.conn.prepareStatement(sql2);
            conn.pst2.setString(1, staff.getEmp_no());
            conn.pst2.setString(2, staff.getBank_name());
            conn.pst2.setString(3, staff.getBranch());
            conn.pst2.setString(4, staff.getAccount_name());
            conn.pst2.setString(5, staff.getAcount_number());
            conn.pst2.executeUpdate();
            String sql3 = "REPLACE INTO statutory_details(employee_no,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no) VALUES (?,?,?,?,?,?)";
            conn.pst3 = conn.conn.prepareStatement(sql3);
            conn.pst3.setString(1, staff.getEmp_no());
            conn.pst3.setString(2, staff.getKra_pin());
            conn.pst3.setString(3, staff.getNssf_no());
            conn.pst3.setString(4, staff.getNhif_no());
            conn.pst3.setString(5, staff.getCert_good_conduct_no());
            conn.pst3.setString(6, staff.getHelb_clearance_no());
            conn.pst3.executeUpdate();
            String sql4 = "REPLACE INTO login( emp_no, username, password, is_admin, profile_path)VALUES (?,?,?,?)";
            conn.pst4 = conn.conn.prepareStatement(sql4);
            conn.pst4.setString(1, staff.getEmp_no());
            conn.pst4.setString(2, staff.getEmp_no());
            conn.pst4.setInt(3, 0);
            conn.pst4.setString(4, "");
            conn.pst4.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public List<Staff> get_basic_All() {
     List<Staff> allStaff = new ArrayList<>();

        try {
            String sql = "select IFNULL(b.id,'-') as emp_id,IFNULL(b.emp_no,' ') as empl_no,"
                    + "CONCAT(IFNULL(b.first_name,'') , ' ',IFNULL( b.other_name,''), ' ',  IFNULL(b.surname,' ')) as full_name"
                    + " from emp_bio b join employee_hist h on h.emp_no =b.emp_no WHERE h.active=1";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                int emp_id = conn.rs.getInt("emp_id");
                String emp_no =conn.rs.getString("empl_no");
                String full_name=conn.rs.getString("full_name");
                Staff staff = new Staff(emp_id,emp_no,full_name);
               
                allStaff.add(staff);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return allStaff;
    }

}