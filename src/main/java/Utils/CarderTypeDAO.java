
package Utils;

import com.hris.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.CarderType;

/**
 *
 * @author STARIXC
 */
public class CarderTypeDAO {
private final DatabaseConnection conn;
    private static final String INSERT_CARDER_TYPE = "REPLACE INTO cadre_type(cadre_type_name,hrs_per_week) VALUES (?,?)";
    private static final String DELETE_CARDER_TYPE = "DELETE FROM cadre_type WHERE id= ?";
    private static final String UPDATE_CARDER_TYPE = "UPDATE cadre_type SET cadre_type_name = ?,hrs_per_week = ? WHERE id= ?";
    private static final String SELECT_ALL_CARDER_TYPES = "SELECT c.id as carderT_id ,c.cadre_type_name as cadre_type_name,c.hrs_per_week as hours_per_week FROM hrh.cadre_type c";
    private static final String SELECT_CARDER_TYPE_ID = "SELECT * from cadre_type where id=?";
    
    public CarderTypeDAO() {
         conn = new DatabaseConnection();
    }
    
      public List<CarderType> getAllCarderType() {
        List<CarderType> carders = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_CARDER_TYPES);
            while (conn.rs.next()) {
                CarderType carderT = new CarderType();
                carderT.setId(Integer.parseInt(conn.rs.getString("carderT_id")));
                carderT.setCadre_type_name(conn.rs.getString("cadre_type_name"));
                carderT.setHrs_per_week(conn.rs.getString("hours_per_week"));
                carders.add(carderT);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //System.out.print(positions);
        return carders;
    }
}
