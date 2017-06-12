/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.Campuses;
import business.Schools;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class CampusDB {

    public static int AddCampusDetails(Campuses camp) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO campuses ("
                + "campus_id,"
                + "campus_name,"
                + "campus_desccription)"
                + " VALUES(?,?,?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, camp.getCampusId());
            ps.setString(2, camp.getCampusName());
            ps.setString(3, camp.getDescription());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection);
            DbUtil.closePreparedStatement(ps);
        }
        return 0;

    }
}
