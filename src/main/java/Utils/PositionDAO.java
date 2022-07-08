package Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hris.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Position;

import models.Position;

public class PositionDAO {

    private final DatabaseConnection conn;
    private static final String INSERT_POSITION = "REPLACE INTO cadre_positions(carder_category_id,standardized_cadre_id,position_title,cadre_type_id) VALUES (?,?,?,?)";
    private static final String DELETE_POSITION = "DELETE FROM cadre_positions WHERE id= ?";
    private static final String UPDATE_POSITION = "UPDATE cadre_positions SET carder_category_id = ?,standardized_cadre_id = ?,position_title = ?,cadre_type_id = ? WHERE id= ?";
    private static final String SELECT_ALL_POSITIONS = "SELECT p.id as position_id ,p.position_title as position_name,c.standardized_cadre_name as standard_cadre_name FROM hrh.cadre_positions p join standardized_cadre c on c.id=p.standardized_cadre_id";
    private static final String SELECT_POSITION_ID = "SELECT * from cadre_positions where id=?";

    public PositionDAO() {
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    public List<Position> getAllPosition() {
        List<Position> positions = new ArrayList<>();

        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_POSITIONS);
            while (conn.rs.next()) {
                Position position = new Position();
                position.setId(Integer.parseInt(conn.rs.getString("position_id")));
                position.setPosition_title(conn.rs.getString("position_name"));
                positions.add(position);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //System.out.print(positions);
        return positions;
    }

    public void addPosition(Position pos) {

        try {

            conn.pst = conn.conn.prepareStatement(INSERT_POSITION);
            conn.pst.setInt(1, pos.getStandardized_cadre_id());
            conn.pst.setString(2, pos.getPosition_title());
            conn.pst.setInt(3, pos.getCadre_type_id());
            conn.pst.setInt(4, pos.getBasic_pay());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public boolean deletePosition(int typeID) {
        boolean rowDeleted = false;
        try {

            conn.pst = conn.conn.prepareStatement(DELETE_POSITION);
            conn.pst.setInt(1, typeID);
            rowDeleted=conn.pst.executeUpdate() > 0;
        } catch (SQLException e) {
                 e.printStackTrace();
        }
        return rowDeleted;
    }

    public boolean updatePosition(Position pos) throws SQLException {
        boolean rowUpdated = false;
        try {

            conn.pst = conn.conn.prepareStatement(UPDATE_POSITION);
            conn.pst.setInt(1, pos.getCarder_category_id());
            conn.pst.setInt(2, pos.getStandardized_cadre_id());
            conn.pst.setString(3, pos.getPosition_title());
            conn.pst.setInt(4, pos.getCadre_type_id());
            conn.pst.setInt(5, pos.getBasic_pay());
            rowUpdated = conn.pst.executeUpdate() > 0;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rowUpdated;

    }

    public Position getPositionById(int id) {
        Position pos = null;

        try {

            conn.pst = conn.conn.prepareStatement(SELECT_POSITION_ID);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();

            while (conn.rs.next()) {
                int carder_category_id = conn.rs.getInt("carder_category_id");
                int standardized_cadre_id = conn.rs.getInt("standardized_cadre_id");
                String position_title = conn.rs.getString("position_name");
                int cadre_type_id = conn.rs.getInt("position_title");
                int basic_pay = conn.rs.getInt("basic_pay");
                pos = new Position(id, carder_category_id, standardized_cadre_id, position_title, cadre_type_id, basic_pay);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pos;

    }

    public List<Position>  getPositionBySId(String standard_id) {
   List<Position> positions = new ArrayList<>();
   
     try {
            String SELECT_ALL_By_CID = "Select * from cadre_positions WHERE standardized_cadre_id='" + standard_id + "'";
            conn.rs = conn.st.executeQuery(SELECT_ALL_By_CID);
            while (conn.rs.next()) {
                Position pos = new Position();
                pos.setId(Integer.parseInt(conn.rs.getString("id")));
                pos.setPosition_title(conn.rs.getString("position_title"));
                positions.add(pos);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ScarderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
   
   return positions;
    }
 
}
