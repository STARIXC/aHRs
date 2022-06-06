package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hris.db.DatabaseConnection;

import models.Leave;

public class LeaveModel {
	private final DatabaseConnection conn;
private static final String INSERT_LEAVE_TYPE="INSERT INTO tbl_leave_type( leave_name,number_days_allowed, designation)VALUES (?, ?, ?)";
private static final String DELETE_LEAVE_TYPE = "DELETE from tbl_leave_type where leave_type_id=?";
private static final String UPDATE_LEAVE_TYPE = "update tbl_leave_type set leave_name=?,number_days_allowed=?, designation=? where leave_type_id=?";
private static final String SELECT_ALL_LEAVE_TYPE = "SELECT * FROM tbl_leave_type";
private static final String SELECT_LEAVE_TYPE_BY_ID = "SELECT * FROM tbl_leave_type where leave_type_id=?";
public LeaveModel() {
		conn= new DatabaseConnection();
	}
	
	@SuppressWarnings("static-access")
	public void addLeave(Leave leave) {
	
		try {
			
			conn.pst = conn.conn.prepareStatement(INSERT_LEAVE_TYPE);
//			declare parameters starting with 1
			conn.pst.setString(1, leave.getLeave_type_name());
			conn.pst.setString(2, leave.getTotal_days());
			conn.pst.setString(3, leave.getEmp_type());
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("static-access")
	public void deleteLeave(int typeID) {
		try {
		
			conn.pst = conn.conn.prepareStatement(DELETE_LEAVE_TYPE);
			conn.pst.setInt(1, typeID);
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@SuppressWarnings("static-access")
	public void updateLeave(Leave leave) {
	
		try {
			
			conn.pst = conn.conn.prepareStatement(UPDATE_LEAVE_TYPE);
			conn.pst.setString(1,leave.getLeave_type_name());
			conn.pst.setString(2, leave.getTotal_days());
			conn.pst.setString(3,leave.getEmp_type());
			conn.pst.setInt(4, leave.getTypeID());
			conn.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@SuppressWarnings("static-access")
	public List<Leave> getAllLeaves(){
		List<Leave> leaves = new ArrayList<>();
		
		try {
			
			conn.rs = conn.st.executeQuery(SELECT_ALL_LEAVE_TYPE);
			
			while (conn.rs.next()) {
		
				Leave leave = new Leave();
				leave.setTypeID(conn.rs.getInt("leave_type_id"));
				leave.setLeave_type_name(conn.rs.getString("leave_name"));
				leave.setTotal_days(conn.rs.getString("number_days_allowed"));
				leave.setEmp_type(conn.rs.getString("designation"));
				

				leaves.add(leave);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return leaves;
	}
	@SuppressWarnings("static-access")
	public Leave getLeaveById(int id) {
		Leave leave = new Leave();
		
		try {
			
			conn.pst = conn.conn.prepareStatement(SELECT_LEAVE_TYPE_BY_ID);
			conn.pst.setInt(1, id);
			conn.rs = conn.pst.executeQuery();
			if (conn.rs.next()) {

				leave.setTypeID(id);
				leave.setLeave_type_name(conn.rs.getString("leave_name"));
				leave.setTotal_days(conn.rs.getString("number_days_allowed"));
				leave.setEmp_type(conn.rs.getString("designation"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return leave;

	}
}
