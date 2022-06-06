package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hris.db.DatabaseConnection;

import models.EmployeeType;

public class EmployeeTypeDAO {
	public List <EmployeeType> list() throws SQLException{
		
		List<EmployeeType> listEmpType = new ArrayList<>();
		 try {
			DatabaseConnection conn = new DatabaseConnection();
			String sql ="SELECT * FROM hrh.cadre_type";
			conn.rs_1=conn.st_1.executeQuery(sql);
			while(conn.rs_1.next()) {
				int id = conn.rs_1.getInt("id");
				String cadre_type_name=conn.rs_1.getString("cadre_type_name");
				String hrs_per_week=conn.rs_1.getString("cadre_type_name");
				
				EmployeeType employeeType= new EmployeeType(id, cadre_type_name, hrs_per_week);
				listEmpType.add(employeeType);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return listEmpType;
		
	}

}
