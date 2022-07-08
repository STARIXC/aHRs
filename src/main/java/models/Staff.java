package models;

public class Staff {

    private String id;
    private String emp_no;
    private String full_name;
    private String first_name;
    private String surname;
    private String other_name;
    private String national_id;
    private String gender;
    private String phone;
    private String email;
    private String dob;
    private String home_address;
    private String postal_code;
    private String nationality;
    private String disability;
    private String disability_explain;
    private String kra_pin;
    private String nssf_no;
    private String nhif_no;
    private String cert_good_conduct_no;
    private String helb_clearance_no;
    private int helb_benefitiary;
    private String bank_name, branch, account_name, acount_number;
//    emp_history
    private String emprecordid;
    private String mfl;
    private String position;
    private String date_started;
    private String date_ended;
    private String months_worked;
    private String current_contract;
    private String contract_period;
    private String contract_end_date;
    private String expected_months;
    private String status;

    
    private int active;
    private String position_name;
    

    public Staff() {
        super();
   }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getOther_name() {
        return other_name;
    }

    public void setOther_name(String other_name) {
        this.other_name = other_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getHome_address() {
        return home_address;
    }

    public void setHome_address(String home_address) {
        this.home_address = home_address;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getDisability() {
        return disability;
    }

    public void setDisability(String disability) {
        this.disability = disability;
    }

    public String getDisability_explain() {
        return disability_explain;
    }

    public void setDisability_explain(String disability_explain) {
        this.disability_explain = disability_explain;
    }

    public String getNational_id() {
        return national_id;
    }

    public void setNational_id(String national_id) {
        this.national_id = national_id;
    }

    public String getMfl() {
        return mfl;
    }

    public void setMfl(String mfl) {
        this.mfl = mfl;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDate_started() {
        return date_started;
    }

    public void setDate_started(String date_started) {
        this.date_started = date_started;
    }

    public String getDate_ended() {
        return date_ended;
    }

    public void setDate_ended(String date_ended) {
        this.date_ended = date_ended;
    }

    public String getMonths_worked() {
        return months_worked;
    }

    public void setMonths_worked(String months_worked) {
        this.months_worked = months_worked;
    }

    public String getCurrent_contract() {
        return current_contract;
    }

    public void setCurrent_contract(String current_contract) {
        this.current_contract = current_contract;
    }

    public String getContract_period() {
        return contract_period;
    }

    public void setContract_period(String contract_period) {
        this.contract_period = contract_period;
    }

    public String getContract_end_date() {
        return contract_end_date;
    }

    public void setContract_end_date(String contract_end_date) {
        this.contract_end_date = contract_end_date;
    }

    public String getExpected_months() {
        return expected_months;
    }

    public void setExpected_months(String expected_months) {
        this.expected_months = expected_months;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getKra_pin() {
        return kra_pin;
    }

    public void setKra_pin(String kra_pin) {
        this.kra_pin = kra_pin;
    }

    public String getNssf_no() {
        return nssf_no;
    }

    public void setNssf_no(String nssf_no) {
        this.nssf_no = nssf_no;
    }

    public String getNhif_no() {
        return nhif_no;
    }

    public void setNhif_no(String nhif_no) {
        this.nhif_no = nhif_no;
    }

    public String getCert_good_conduct_no() {
        return cert_good_conduct_no;
    }

    public void setCert_good_conduct_no(String cert_good_conduct_no) {
        this.cert_good_conduct_no = cert_good_conduct_no;
    }

    public String getHelb_clearance_no() {
        return helb_clearance_no;
    }

    public void setHelb_clearance_no(String helb_clearance_no) {
        this.helb_clearance_no = helb_clearance_no;
    }

    public int getHelb_benefitiary() {
        return helb_benefitiary;
    }

    public void setHelb_benefitiary(int helb_benefitiary) {
        this.helb_benefitiary = helb_benefitiary;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getAcount_number() {
        return acount_number;
    }

    public void setAcount_number(String acount_number) {
        this.acount_number = acount_number;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public Staff(String id, String emp_no, String full_name) {
        this.id = id;
        this.emp_no = emp_no;
        this.full_name = full_name;
    }

}
