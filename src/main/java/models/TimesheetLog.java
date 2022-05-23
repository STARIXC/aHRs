package models;


public class TimesheetLog {
 private int log_id, shift, year, month;

  private String log_no, emp_no, log_date, hours_worked, tested, pos,emp_name;

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }
  private String onleave_hours;
  private String holiday;
  private String extra_hours_worked;
  private String Thours_worked;
  private String expected_hrs;
  private String monthName;

  public String getMonthName() {
    return monthName;
  }

  public void setMonthName(String monthName) {
    this.monthName = monthName;
  }

  public String getOnleave_hours() {
    return onleave_hours;
  }

  public int getYear() {
    return year;
  }

  public void setYear(int year) {
    this.year = year;
  }

  public int getMonth() {
    return month;
  }

  public void setMonth(int month) {
    this.month = month;
  }

  public void setOnleave_hours(String onleave_hours) {
    this.onleave_hours = onleave_hours;
  }

  public String getHoliday() {
    return holiday;
  }

  public void setHoliday(String holiday) {
    this.holiday = holiday;
  }

  public String getExtra_hours_worked() {
    return extra_hours_worked;
  }

  public void setExtra_hours_worked(String extra_hours_worked) {
    this.extra_hours_worked = extra_hours_worked;
  }

  public String getThours_worked() {
    return Thours_worked;
  }

  public void setThours_worked(String Thours_worked) {
    this.Thours_worked = Thours_worked;
  }

  public String getExpected_hrs() {
    return expected_hrs;
  }

  public void setExpected_hrs(String expected_hrs) {
    this.expected_hrs = expected_hrs;
  }

  public int getLog_id() {
    return log_id;
  }

  public void setLog_id(int log_id) {
    this.log_id = log_id;
  }

  public int getShift() {
    return shift;
  }

  public void setShift(int shift) {
    this.shift = shift;
  }

  public String getLog_no() {
    return log_no;
  }

  public void setLog_no(String log_no) {
    this.log_no = log_no;
  }

  public String getEmp_no() {
    return emp_no;
  }

  public void setEmp_no(String emp_no) {
    this.emp_no = emp_no;
  }

  public String getLog_date() {
    return log_date;
  }

  public void setLog_date(String log_date) {
    this.log_date = log_date;
  }

  public String getHours_worked() {
    return hours_worked;
  }

  public void setHours_worked(String hours_worked) {
    this.hours_worked = hours_worked;
  }

  public String getTested() {
    return tested;
  }

  public void setTested(String tested) {
    this.tested = tested;
  }

  public String getPos() {
    return pos;
  }

  public void setPos(String pos) {
    this.pos = pos;
  }

  public TimesheetLog(int log_id, int shift, String log_no, String emp_no, String log_date, String hours_worked,
          String tested, String pos) {
    super();
    this.log_id = log_id;
    this.shift = shift;
    this.log_no = log_no;
    this.emp_no = emp_no;
    this.log_date = log_date;
    this.hours_worked = hours_worked;
    this.tested = tested;
    this.pos = pos;

  }

  public TimesheetLog(int shift, String log_no, String emp_no, String log_date, String hours_worked) {
    this.shift = shift;
    this.log_no = log_no;
    this.emp_no = emp_no;
    this.log_date = log_date;
    this.hours_worked = hours_worked;
  }

  public TimesheetLog() {
    super();

  }
 
}
