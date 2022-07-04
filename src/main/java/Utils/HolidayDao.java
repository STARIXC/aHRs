package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hris.db.DatabaseConnection;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import models.Holiday;

public class HolidayDao {

    private DatabaseConnection conn;

    public HolidayDao() {
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    public int addHoliday(Holiday holiday) {
        int save = 0;
        try {
            String sql = "INSERT INTO holidays (holiday_name,start_date, end_date,no_of_days,comment) VALUES (?, ?, ?,?,?)";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, holiday.getHoliday_name());
            conn.pst.setDate(2, new java.sql.Date(holiday.getStart_date().getTime()));
            conn.pst.setDate(3, new java.sql.Date(holiday.getEnd_date().getTime()));

            conn.pst.setString(4, holiday.getNo_of_days());
            conn.pst.setString(5, holiday.getComment());
            save = conn.pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return save;
    }

    @SuppressWarnings("static-access")
    public void deleteHoliday(int id) {

        try {
            String sql = "DELETE from holidays where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public List<String> getDaysBetweenDates(String startdate, String enddate) {
        List<String> dates = new ArrayList<>();

        String SELECT_ALL_DATES = " SELECT a.dt as date_field FROM calendar_table a  WHERE cast(a.dt as date) BETWEEN '" + startdate + "' AND '" + enddate + "' ";

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_DATES);
            while (conn.rs.next()) {
                String date=conn.rs.getString("date_field");
                dates.add(date);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return dates;
    }

    @SuppressWarnings("static-access")
    public void updateHoliday(Holiday holiday) {

        try {
            String sql = "update holidays set holiday_name=?,start_date=?, end_date=?,no_of_days=? where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, holiday.getHoliday_name());
            conn.pst.setDate(2, new java.sql.Date(holiday.getStart_date().getTime()));
            conn.pst.setDate(3, new java.sql.Date(holiday.getEnd_date().getTime()));
            conn.pst.setString(4, holiday.getNo_of_days());
            conn.pst.setInt(5, holiday.getId());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public int updateCHoliday(String date, String isHoliday, String holidayDescr) {
        int success = 0;
        try {
            String sql = "update calendar_table set isHoliday='" + isHoliday + "',holidayDescr='" + holidayDescr + "' where dt=cast('"+date+"' AS DATE)";
            conn.pst = conn.conn.prepareStatement(sql);

            success = conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return success;
    }

    @SuppressWarnings("static-access")
    public List<Holiday> getAllHolidays() {
        List<Holiday> holidays = new ArrayList<Holiday>();

        try {
            String sql = "SELECT * FROM hrh.holidays";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                Holiday holiday = new Holiday();
                holiday.setId(conn.rs.getInt("id"));
                holiday.setHoliday_name(conn.rs.getString("holiday_name"));
                holiday.setStart_date(conn.rs.getDate("start_date"));
                holiday.setEnd_date(conn.rs.getDate("end_date"));
                holiday.setNo_of_days(conn.rs.getString("no_of_days"));
                holiday.setComment(conn.rs.getString("comment"));

                holidays.add(holiday);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return holidays;
    }

    @SuppressWarnings("static-access")
    public Holiday getHolidayById(int id) {
        Holiday holiday = new Holiday();

        try {
            String sql = "SELECT id,ifnull(holiday_name,'') as holiday_name,ifnull(start_date,'') as start_date,ifnull(end_date,'') as end_date,ifnull(no_of_days,'') as no_of_days ,ifnull(comment,'') as comment FROM holidays where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {

                holiday.setId(conn.rs.getInt("id"));
                holiday.setHoliday_name(conn.rs.getString("holiday_name"));
                holiday.setStart_date(conn.rs.getDate("start_date"));
                holiday.setEnd_date(conn.rs.getDate("end_date"));
                holiday.setNo_of_days(conn.rs.getString("no_of_days"));
                holiday.setComment(conn.rs.getString("comment"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return holiday;

    }

}
