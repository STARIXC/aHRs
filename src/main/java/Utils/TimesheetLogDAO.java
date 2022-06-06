package Utils;

import com.hris.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.TimesheetLog;

public class TimesheetLogDAO {

    private DatabaseConnection conn;

    public TimesheetLogDAO() {
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    public List<TimesheetLog> getActivityByStaffID() {
        List<TimesheetLog> activityLogs = new ArrayList<>();

        try {
            //PreparedStatement pstmt=conn.prepareStatement("Select * from user");
            //ResultSet rs= pstmt.executeQuery();
            String sql = "SELECT DISTINCT a.log_id,a.month,a.year,a.log_no,a.emp_no,a.log_date,a.hours_worked,a.leave_hours,"
                    + "a.holiday_hours,a.extra_hours,a.expected_hours,a.status,  b.monthName ,a.total_hours AS total_hours"
                    + ""
                    + ""
                    + " ROM timesheet_logs a JOIN calendar_table b ON a.month=b.m JOIN emp_bio e ON a.emp_no=e.emp_no ";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                TimesheetLog activityLog = new TimesheetLog();
                activityLog.setLog_id(conn.rs.getInt("log_id"));
                activityLog.setMonth(conn.rs.getInt("month"));
                activityLog.setYear(conn.rs.getInt("year"));
                activityLog.setLog_no(conn.rs.getString("log_no"));
                activityLog.setEmp_no(conn.rs.getString("emp_no"));
                activityLog.setEmp_name(conn.rs.getString("EName"));
                activityLog.setMonthName(conn.rs.getString("monthName"));
                activityLog.setLog_date(conn.rs.getString("log_date"));
                activityLog.setExpected_hrs(conn.rs.getString("expected_hours"));
                activityLog.setHours_worked(conn.rs.getString("hours_worked"));
                activityLog.setOnleave_hours(conn.rs.getString("leave_hours"));
                activityLog.setExtra_hours_worked(conn.rs.getString("extra_hours"));
                activityLog.setHoliday(conn.rs.getString("holiday_hours"));
                activityLog.setThours_worked(conn.rs.getString("total_hours"));

                activityLog.setShift(conn.rs.getInt("status"));

                activityLogs.add(activityLog);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return activityLogs;
    }

  

    @SuppressWarnings("static-access")
    public int addLog(String sql) {
        int rowsAffected = 0;
//		write the insert Query

        try {
            //	prepare statement
            conn.pst = conn.conn.prepareStatement(sql);

            //	execute the satements
            rowsAffected = conn.pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;
    }

    @SuppressWarnings("static-access")
    public int addActivityLog(String Query) {
        int rowsAffected = 0;
        //System.out.println("Activity Codes:"+Arrays.toString(activity_code));

        try {
            conn.pst1 = conn.conn.prepareStatement(Query);
            rowsAffected = conn.pst1.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowsAffected;

    }

    /**
     *
     * @return
     */
    public String log_activities(){
      
        return null;
        
    }

}
