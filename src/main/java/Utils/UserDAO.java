/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import com.hris.db.DatabaseConnection;
import java.security.MessageDigest;
import java.sql.SQLException;

/**
 *
 * @author UTJ
 */
public class UserDAO {

    public DatabaseConnection conn;
    String found;
    MessageDigest m;
    String fname, mname, lname, username, password, pass, level, userid, fullname;

    public UserDAO() {
        conn = new DatabaseConnection();
    }

    public int addUser() {
        int save = 0;
        try {
            String sql = "INSERT INTO `hrh`.`tbl_user`(`userid`,`fname`,`mname`,`lname`,`username`,`email`,`phone`,`password`,`level`,`facility`)VALUES(?,?,?,?,?,?,?,?,?,?)";

            save = conn.pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return save;
    }
}
