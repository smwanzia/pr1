/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.Schools;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class SchoolDB {

    public static int AddSchoolsDetails(Schools sch) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO manage_schools("
                + "school_id,"
                + "campus_id,"
                + "school_name,"
                + "description)"
                + "VALUES(?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, sch.getSchoolid());
            ps.setString(2, sch.getCampusId());
            ps.setString(3, sch.getSchoolname());
            ps.setString(4, sch.getDescription());

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
