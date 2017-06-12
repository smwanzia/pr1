/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.BankDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class PaymentDB {

    public static int AddBank_Info(BankDetails info) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO payment("
                + "user_id,"
                + "bank_name,"
                + "account_no,"
                + "branch)"
                + "VALUES(?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, info.getUser_id());
            ps.setString(2, info.getBankName());
            ps.setInt(3, info.getAccountNumber());
            ps.setString(4, info.getBranch());

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
        }
        return 0;
    }
}
