
package Utils;

import com.hris.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.StandardCarder;
import models.StandardCarder;

/**
 *
 * @author UTJ
 */
public class ScarderDAO {
    
    
    private final DatabaseConnection conn;
    public static final String INSERT_S_CARDER = "REPLACE INTO standardized_cadre(carder_category_id, standardized_cadre_name, emp_type) VALUES (?,?,?)";
    public static final String DELETE_S_CARDER = "DELETE FROM standardized_cadre WHERE id= ?";
    public static final String UPDATE_S_CARDER = "UPDATE standardized_cadre SET carder_category_id = ?,SET standardized_cadre_name = ?,SET emp_type = ? WHERE id= ?";
    public static final String SELECT_ALL_S_CARDERS = "SELECT sc.id as carderT_id ,sc.carder_category_id as carder_category_id,sc.emp_type as emp_type,cc.cadre_category_name as carder_category,sc.standardized_cadre_name as standardized_cadre_name,ct.cadre_type_name as ctype FROM hrh.standardized_cadre sc Left JOIN cadre_type ct on sc.emp_type=ct.id LEFT JOIN cadre_category cc on sc.carder_category_id=cc.id ";

    public ScarderDAO() {
        conn = new DatabaseConnection();
    }

    public List<StandardCarder> getAllStandardCarder() {
        List<StandardCarder> carders = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_S_CARDERS);
            while (conn.rs.next()) {
                StandardCarder carderT = new StandardCarder();
                carderT.setId(Integer.parseInt(conn.rs.getString("carderT_id")));
                carderT.setEmp_type(Integer.parseInt(conn.rs.getString("emp_type")));
                carderT.setCarder_category_id(Integer.parseInt(conn.rs.getString("carder_category_id")));
                carderT.setCarder_category_name(conn.rs.getString("carder_category"));
                carderT.setStandardized_cadre_name(conn.rs.getString("standardized_cadre_name"));
                carderT.setEmp_type_name(conn.rs.getString("ctype"));
                carders.add(carderT);
            }
        } catch (SQLException e) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return carders;
    }

    public void addStandardCarder(StandardCarder scarder) {
        try {
            conn.pst = conn.conn.prepareStatement(INSERT_S_CARDER);
            conn.pst.setInt(1, scarder.getCarder_category_id());
            conn.pst.setString(2, scarder.getStandardized_cadre_name());
            conn.pst.setInt(3, scarder.getEmp_type());
           
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateStandardCarder(StandardCarder scarder ) {

        try {
            conn.pst = conn.conn.prepareStatement(UPDATE_S_CARDER);
            conn.pst.setInt(1, scarder.getCarder_category_id());
            conn.pst.setString(1, scarder.getStandardized_cadre_name());
            conn.pst.setInt(2, scarder.getEmp_type());
            conn.pst.setInt(2, scarder.getId());
            conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    public StandardCarder getStandardCarderById(int scarder_id) {
        StandardCarder scarder = new StandardCarder();
        try {
            String SELECT_S_CARDER_ID = "SELECT * from standardized_cadre where id='" + scarder_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_S_CARDER_ID);
            while (conn.rs.next()) {
                scarder.setId(conn.rs.getInt("id"));
                scarder.setCarder_category_id(conn.rs.getInt("carder_category_id"));
                scarder.setStandardized_cadre_name(conn.rs.getString("standardized_cadre_name"));
                scarder.setEmp_type(conn.rs.getInt("emp_type"));
           
            }

        } catch (SQLException ex) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scarder;
    }

    public int deleteStandardCarder(int cat_id) {
             
        int i = 0;
        try {
            String sql = "DELETE from standardized_cadre where id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, cat_id);
            //  conn.pst.executeUpdate();
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;
   }

}
