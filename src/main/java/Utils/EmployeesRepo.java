package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hris.db.DatabaseConnection;

import models.Staff;

public class EmployeesRepo {

    public final DatabaseConnection conn;

    public static final String INSERT_STAFF_LOGIN = "REPLACE INTO login( emp_no, username, password, is_admin, profile_path)VALUES (?,?,?,?)";
    public static final String DELETE_STAFF = "DELETE FROM standardized_cadre WHERE id= ?";
    public static final String UPDATE_STAFF = "UPDATE standardized_cadre SET carder_category_id = ?,SET standardized_cadre_name = ?,SET emp_type = ? WHERE id= ?";
    public static final String SELECT_ALL_STAFFS = "SELECT sc.id as carderT_id ,sc.carder_category_id as carder_category_id,sc.emp_type as emp_type,cc.cadre_category_name as carder_category,sc.standardized_cadre_name as standardized_cadre_name,ct.cadre_type_name as ctype FROM hrh.standardized_cadre sc Left JOIN cadre_type ct on sc.emp_type=ct.id LEFT JOIN cadre_category cc on sc.carder_category_id=cc.id ";

    public EmployeesRepo() {
        conn = new DatabaseConnection();
    }

    public int get_all_active_staff() {
        int rowsAffected = 1;
        try {

            String query = "SELECT COUNT(*) FROM hrh.employee_hist WHERE active ='1'";
            conn.pst = conn.conn.prepareStatement(query);
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                rowsAffected = conn.rs.getInt("count(*)");
                // System.out.println(rowsAffected);
            }
            // conn.rs.close();
            // conn.pst.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return rowsAffected;
    }

    public int get_all_staff() throws SQLException {
        int rowsAffected = 1;

        //Retrieving the data
        conn.rs = conn.st.executeQuery("select count(*) from emp_hist where active =1");
        conn.rs.next();
        //Moving the cursor to the last row
        System.out.println("Table contains " + conn.rs.getInt("count(*)") + " rows");
        rowsAffected = conn.rs.getInt("count(*)");
        return rowsAffected;
    }

    public int get_all_leave() {
        int response = 0;

        return response;
    }

    public void get_upcoming_holidays() {
    }

    public void getPendingLeaves() {
    }

    @SuppressWarnings("static-access")
    public List<Staff> findAll() {
        List<Staff> allStaff = new ArrayList<>();

        try {
            String sql = "select IFNULL(b.id,'-') as emp_id,  IFNULL(b.emp_no,'-') as emp_no,  IFNULL(b.first_name,'') as firstname,"
                    + "  IFNULL(b.surname,'') as surname, IFNULL( b.other_name,'') as other_name,CONCAT(IFNULL(b.first_name,'') , ' ',IFNULL( b.other_name,''), ' ',  IFNULL(b.surname,' ')) as full_name,IFNULL(b.phone,'_') as phone, IFNULL(b.email,'') as email,"
                    + "  IFNULL(b.nationality,'-') as nationality,h.active as status,c.position_title as position "
                    + "from emp_bio b join employee_hist h on h.emp_no =b.emp_no "
                    + "join cadre_positions c on h.position=c.id ";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                Staff staff = new Staff();
                staff.setId(conn.rs.getString("emp_id"));
                staff.setEmp_no(conn.rs.getString("emp_no"));
                staff.setFull_name(conn.rs.getString("full_name"));
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

        }
        return allStaff;

    }

    public Staff getStaffById(String emp_no) {
        Staff staff = new Staff();
        try {
            String sql = "SELECT eb.id as emp_id, IFNULL(eb.emp_no,'') as emp_no, IFNULL(eb.first_name,'') as firstname, IFNULL(eb.surname,'') as surname, IFNULL(eb.other_name,'') as other_name,"
                    + " IFNULL(eb.national_id,'') as national_id, IFNULL(eb.gender,'') as gender, IFNULL(eb.phone,'') as phone, IFNULL(eb.email,'') as email, IFNULL(eb.dob,'0000-00-00') as dob,"
                    + " IFNULL(eb.home_address,'') as home_address, IFNULL(eb.postal_code,'') as postal_code, IFNULL(eb.nationality,'') as nationality,IFNULL(eb.marital_status,'') as marital_status, IFNULL(eb.disability,'') as disability,"
                    + " IFNULL(eb.disability_explain,'') as disability_explain, IFNULL(eb.kra_pin,'') as kra_pin, IFNULL(eb.nssf_no,'') as nssf_no, IFNULL(eb.nhif_no,'') as nhif_no, "
                    + "IFNULL(eb.cert_good_conduct_no,'') as cert_good_conduct_no, IFNULL(eb.helb_clearance_no,'') as helb_clearance_no, IFNULL(eb.helb_benefitiary,'') as helb_benefitiary,"
                    + " IFNULL(eb.bank_name,'') as bank_name, IFNULL(eb.branch,'') as branch, IFNULL(eb.account_name,'') as account_name, IFNULL(eb.acount_number,'') as acount_number, "
                    + "IFNULL(eh.emprecordid,'') as emprecordid, IFNULL(eh.mfl ,'') as mfl,IFNULL(fac.SubPartnerNom,'') as SubPartnerNom,IFNULL(sc.DistrictID,'') as DistrictID, "
                    + "IFNULL(sc.DistrictNom,'') as DistrictNom,IFNULL(cnt.CountyID,'') as CountyID, IFNULL(cnt.County,'') as county,IFNULL(ct.id ,'') as cat_id, "
                    + "IFNULL(ct.cadre_type_name,'') as cadre_type_name, IFNULL(cc.id,'')  as standard_id, IFNULL(cc.standardized_cadre_name,'') as standardized_cadre_name,"
                    + " IFNULL(eh.position,'') as position_id, IFNULL(c.position_title,'') as position_title, IFNULL(eh.date_started,'0000-00-00') as date_started,"
                    + " IFNULL(eh.date_ended,'0000-000-000') as date_ended, IFNULL(eh.financial_year,'2000') as financial_year,fy.id as fy_id, fy.name as fy_name, IFNULL(eh.months_worked,'0') as months_worked,"
                    + " IFNULL(eh.current_contract,'0000-00-00') as current_contract, IFNULL(eh.contract_period,'000') as contract_period, IFNULL(eh.contract_end_date,'0000-00-00') as contract_end_date,"
                    + " IFNULL(eh.expected_months,'12') as expected_months ,IFNULL(eh.active,0) as status FROM hrh.emp_bio eb"
                    + " left Join hrh.employee_hist eh on eb.emp_no =eh.emp_no "
                    + " left join cadre_positions as c on eh.position=c.id "
                    + " left Join hrh.subpartnera as fac on eh.mfl=fac.CentreSanteId"
                    + " left join hrh.district as sc on fac.DistrictID = sc.DistrictID "
                    + " left join hrh.county as cnt on cnt.CountyID = sc.CountyID "
                    + " Left JOIN cadre_type ct on c.cadre_type_id=ct.id "
                    + " LEFT JOIN standardized_cadre cc on ct.id =cc.emp_type"
                    + " Left Join  hrh.tbl_financial_year fy on eh.financial_year=fy.year "
                    + "where eb.emp_no ='" + emp_no + "' and eh.active =1";
            //   System.out.println("Select Query : "+sql);
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                staff.setId(conn.rs.getString("emp_id"));
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
                staff.setPosition(conn.rs.getString("position_id"));
                staff.setNationality(conn.rs.getString("nationality"));
                staff.setMarital_status(conn.rs.getString("marital_status"));
                staff.setDisability(conn.rs.getString("disability"));
                staff.setDisability_explain(conn.rs.getString("disability_explain"));
                staff.setMfl(conn.rs.getString("mfl"));
                staff.setFinancial_year(conn.rs.getString("financial_year"));
                staff.setDate_started(conn.rs.getString("date_started"));
                staff.setDate_ended(conn.rs.getString("date_ended"));
                staff.setMonths_worked(conn.rs.getString("months_worked"));
                staff.setCurrent_contract(conn.rs.getString("current_contract"));
                staff.setContract_period(conn.rs.getString("contract_period"));
                staff.setContract_end_date(conn.rs.getString("contract_end_date"));
                staff.setExpected_months(conn.rs.getString("expected_months"));
                staff.setActive(conn.rs.getInt("status"));
                staff.setBank_name(conn.rs.getString("bank_name"));
                staff.setBranch(conn.rs.getString("branch"));
                staff.setAccount_name(conn.rs.getString("account_name"));
                staff.setAcount_number(conn.rs.getString("acount_number"));
                staff.setKra_pin(conn.rs.getString("kra_pin"));
                staff.setNssf_no(conn.rs.getString("nssf_no"));
                staff.setNhif_no(conn.rs.getString("nhif_no"));
                staff.setCert_good_conduct_no(conn.rs.getString("cert_good_conduct_no"));
                staff.setHelb_clearance_no(conn.rs.getString("helb_clearance_no"));
                staff.setDistrictID(conn.rs.getString("DistrictID"));
                staff.setDistrictNom(conn.rs.getString("DistrictNom"));
                staff.setSubPartnerNom(conn.rs.getString("SubPartnerNom"));
                staff.setCounty(conn.rs.getString("county"));
                staff.setCountyID(conn.rs.getString("CountyID"));
                staff.setCat_id(conn.rs.getString("cat_id"));
                staff.setCadre_type_name(conn.rs.getString("cadre_type_name"));
                staff.setStandard_id(conn.rs.getString("standard_id"));
                staff.setStandardized_cadre_name(conn.rs.getString("standardized_cadre_name"));
                staff.setPosition_id(conn.rs.getString("position_id"));
                staff.setPosition_name(conn.rs.getString("position_title"));
                staff.setFy_id(conn.rs.getString("fy_id"));
                staff.setFy_name(conn.rs.getString("fy_name"));
                // public String   , , , , , , , , , , , , ;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block

        }

        return staff;

    }

    public Staff getProfile(String emp_no) {
        Staff staff = new Staff();
        try {
            String sql = "SELECT eb.id as emp_id, IFNULL(eb.emp_no,'') as emp_no, IFNULL(eb.first_name,'') as firstname, IFNULL(eb.surname,'') as surname, IFNULL(eb.other_name,'') as other_name,"
                    + " IFNULL(eb.national_id,'') as national_id, IFNULL(eb.gender,'') as gender, IFNULL(eb.phone,'') as phone, IFNULL(eb.email,'') as email, IFNULL(eb.dob,'0000-00-00') as dob,"
                    + " IFNULL(eb.home_address,'') as home_address, IFNULL(eb.postal_code,'') as postal_code, IFNULL(eb.nationality,'') as nationality,IFNULL(eb.marital_status,'') as marital_status, IFNULL(eb.disability,'') as disability,"
                    + " IFNULL(eb.disability_explain,'') as disability_explain, IFNULL(eb.kra_pin,'') as kra_pin, IFNULL(eb.nssf_no,'') as nssf_no, IFNULL(eb.nhif_no,'') as nhif_no, "
                    + "IFNULL(eb.cert_good_conduct_no,'') as cert_good_conduct_no, IFNULL(eb.helb_clearance_no,'') as helb_clearance_no, IFNULL(eb.helb_benefitiary,'') as helb_benefitiary,"
                    + " IFNULL(eb.bank_name,'') as bank_name, IFNULL(eb.branch,'') as branch, IFNULL(eb.account_name,'') as account_name, IFNULL(eb.acount_number,'') as acount_number, "
                    + "IFNULL(eh.emprecordid,'') as emprecordid, IFNULL(eh.mfl ,'') as mfl,IFNULL(fac.SubPartnerNom,'') as SubPartnerNom,IFNULL(sc.DistrictID,'') as DistrictID, "
                    + "IFNULL(sc.DistrictNom,'') as DistrictNom,IFNULL(cnt.CountyID,'') as CountyID, IFNULL(cnt.County,'') as county,IFNULL(ct.id ,'') as cat_id, "
                    + "IFNULL(ct.cadre_type_name,'') as cadre_type_name, IFNULL(cc.id,'')  as standard_id, IFNULL(cc.standardized_cadre_name,'') as standardized_cadre_name,"
                    + " IFNULL(eh.position,'') as position_id, IFNULL(c.position_title,'') as position_title, IFNULL(eh.date_started,'0000-00-00') as date_started,"
                    + " IFNULL(eh.date_ended,'0000-000-000') as date_ended, IFNULL(eh.financial_year,'2000') as financial_year,fy.id as fy_id, fy.name as fy_name, IFNULL(eh.months_worked,'0') as months_worked,"
                    + " IFNULL(eh.current_contract,'0000-00-00') as current_contract, IFNULL(eh.contract_period,'000') as contract_period, IFNULL(eh.contract_end_date,'0000-00-00') as contract_end_date,"
                    + " IFNULL(eh.expected_months,'12') as expected_months ,IFNULL(eh.active,0) as status FROM hrh.emp_bio eb"
                    + " left Join hrh.employee_hist eh on eb.emp_no =eh.emp_no "
                    + " left join cadre_positions as c on eh.position=c.id "
                    + " left Join hrh.subpartnera as fac on eh.mfl=fac.CentreSanteId"
                    + " left join hrh.district as sc on fac.DistrictID = sc.DistrictID "
                    + " left join hrh.county as cnt on cnt.CountyID = sc.CountyID "
                    + " Left JOIN cadre_type ct on c.cadre_type_id=ct.id "
                    + " LEFT JOIN standardized_cadre cc on ct.id =cc.emp_type"
                    + " Left Join  hrh.tbl_financial_year fy on eh.financial_year=fy.year "
                    + "where eb.emp_no ='" + emp_no + "' and eh.active =1";
            //   System.out.println("Select Query : "+sql);
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                staff.setId(conn.rs.getString("emp_id"));
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
                staff.setPosition(conn.rs.getString("position_id"));
                staff.setNationality(conn.rs.getString("nationality"));
                staff.setMarital_status(conn.rs.getString("marital_status"));
                staff.setDisability(conn.rs.getString("disability"));
                staff.setDisability_explain(conn.rs.getString("disability_explain"));
                staff.setMfl(conn.rs.getString("mfl"));
                staff.setFinancial_year(conn.rs.getString("financial_year"));
                staff.setDate_started(conn.rs.getString("date_started"));
                staff.setDate_ended(conn.rs.getString("date_ended"));
                staff.setMonths_worked(conn.rs.getString("months_worked"));
                staff.setCurrent_contract(conn.rs.getString("current_contract"));
                staff.setContract_period(conn.rs.getString("contract_period"));
                staff.setContract_end_date(conn.rs.getString("contract_end_date"));
                staff.setExpected_months(conn.rs.getString("expected_months"));
                staff.setActive(conn.rs.getInt("status"));
                staff.setBank_name(conn.rs.getString("bank_name"));
                staff.setBranch(conn.rs.getString("branch"));
                staff.setAccount_name(conn.rs.getString("account_name"));
                staff.setAcount_number(conn.rs.getString("acount_number"));
                staff.setKra_pin(conn.rs.getString("kra_pin"));
                staff.setNssf_no(conn.rs.getString("nssf_no"));
                staff.setNhif_no(conn.rs.getString("nhif_no"));
                staff.setCert_good_conduct_no(conn.rs.getString("cert_good_conduct_no"));
                staff.setHelb_clearance_no(conn.rs.getString("helb_clearance_no"));
                staff.setDistrictID(conn.rs.getString("DistrictID"));
                staff.setDistrictNom(conn.rs.getString("DistrictNom"));
                staff.setSubPartnerNom(conn.rs.getString("SubPartnerNom"));
                staff.setCounty(conn.rs.getString("county"));
                staff.setCountyID(conn.rs.getString("CountyID"));
                staff.setCat_id(conn.rs.getString("cat_id"));
                staff.setCadre_type_name(conn.rs.getString("cadre_type_name"));
                staff.setStandard_id(conn.rs.getString("standard_id"));
                staff.setStandardized_cadre_name(conn.rs.getString("standardized_cadre_name"));
                staff.setPosition_id(conn.rs.getString("position_id"));
                staff.setPosition_name(conn.rs.getString("position_title"));
                staff.setFy_id(conn.rs.getString("fy_id"));
                staff.setFy_name(conn.rs.getString("fy_name"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block

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

            String sql4 = "REPLACE INTO login( emp_no, username, password, is_admin, profile_path)VALUES (?,?,?,?)";
            conn.pst4 = conn.conn.prepareStatement(sql4);
            conn.pst4.setString(1, staff.getEmp_no());
            conn.pst4.setString(2, staff.getEmp_no());
            conn.pst4.setInt(3, 0);
            conn.pst4.setString(4, "");
            conn.pst4.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block

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
                String emp_id = conn.rs.getString("emp_id");
                String emp_no = conn.rs.getString("empl_no");
                String full_name = conn.rs.getString("full_name");
                Staff staff = new Staff(emp_id, emp_no, full_name);

                allStaff.add(staff);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block

        }
        return allStaff;
    }

    public int count_active_satff() {
        int rowsAffected = 0;
        //write the insert Query
        try {
            String sql = "select count(*) from employee_hist where active =1";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
//                int emp_id =conn.rs.get

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block

        }

        return rowsAffected;
    }

}
