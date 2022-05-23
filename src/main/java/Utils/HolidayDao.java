package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hris.db.DatabaseConnection;

import models.Holiday;

public class HolidayDao {
	private DatabaseConnection conn;

	public HolidayDao() {
		conn = new DatabaseConnection();
	}

	@SuppressWarnings("static-access")
	public void addHoliday(Holiday holiday) {
		try {
			String sql = "INSERT INTO holidays (holiday_name,start_date, end_date,no_of_days) VALUES (?, ?, ?,?)";
			conn.pst = conn.conn.prepareStatement(sql);
			conn.pst.setString(1, holiday.getHoliday_name());
			conn.pst.setDate(2, new java.sql.Date(holiday.getStart_date().getTime()));
			conn.pst.setDate(3, new java.sql.Date(holiday.getEnd_date().getTime()));
			
			conn.pst.setString(4, holiday.getNo_of_days());
			conn.pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
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
			String sql = "SELECT * FROM holidays where id=?";
			conn.pst = conn.conn.prepareStatement(sql);
			conn.pst.setInt(1, id);
			conn.rs = conn.pst.executeQuery();
			if (conn.rs.next()) {

				holiday.setId(conn.rs.getInt("id"));
				holiday.setHoliday_name(conn.rs.getString("holiday_name"));
				holiday.setStart_date(conn.rs.getDate("start_date"));
				holiday.setEnd_date(conn.rs.getDate("end_date"));
				holiday.setNo_of_days(conn.rs.getString("no_of_days"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return holiday;

	}

}
