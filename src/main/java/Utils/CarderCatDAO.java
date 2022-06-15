/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import com.hris.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.CarderCat;

/**
 *
 * @author UTJ
 */
public class CarderCatDAO {

    private final DatabaseConnection conn;
    public static final String INSERT_CARDER_CAT = "REPLACE INTO cadre_category(cadre_category_name) VALUES (?)";
    public static final String DELETE_CARDER_CAT = "DELETE FROM cadre_category WHERE id= ?";
    public static final String UPDATE_CARDER_CAT = "UPDATE cadre_category SET cadre_category_name = ? WHERE id= ?";
    public static final String SELECT_ALL_CARDER_CATS = "SELECT c.id as carderT_id ,c.cadre_category_name as cadre_category_name FROM hrh.cadre_category c";

    public CarderCatDAO() {
        conn = new DatabaseConnection();
    }

    public List<CarderCat> getAllCarderCat() {
        List<CarderCat> carders = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_CARDER_CATS);
            while (conn.rs.next()) {
                CarderCat carderT = new CarderCat();
                carderT.setId(Integer.parseInt(conn.rs.getString("carderT_id")));
                carderT.setCadre_category_name(conn.rs.getString("cadre_category_name"));

                carders.add(carderT);
            }
        } catch (SQLException e) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.print(positions);
        return carders;
    }

    public void addCarderCat(String carder_category_name) {
        try {
            conn.pst = conn.conn.prepareStatement(INSERT_CARDER_CAT);
            conn.pst.setString(1, carder_category_name);
           
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateCarderCat(int ccat_id,String cadre_category_name ) {

        try {
            conn.pst = conn.conn.prepareStatement(UPDATE_CARDER_CAT);
            conn.pst.setString(1, cadre_category_name);
            conn.pst.setInt(2, ccat_id);
            conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public CarderCat getCarderCatById(int carder_id) {
        CarderCat ctype = new CarderCat();
        try {
            String SELECT_CARDER_CAT_ID = "SELECT * from cadre_category where id='" + carder_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_CARDER_CAT_ID);
            while (conn.rs.next()) {
                ctype.setId(conn.rs.getInt("id"));
                ctype.setCadre_category_name(conn.rs.getString("cadre_category_name"));
           
            }

        } catch (SQLException ex) {
            Logger.getLogger(CarderCatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ctype;
    }



 
}
