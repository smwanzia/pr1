/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.Program_Intake;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class IntakeDB {

    public static int AddIntake_Info(Program_Intake intake) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO intake ("
                + "academic_year,"
                + "intake_name,"
                + "start_date,"
                + "end_date)"
                + "VALUES(?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, intake.getAcademicyear());
            ps.setString(2, intake.getIntakename());
            ps.setString(3, intake.getStartdate());
            ps.setString(4, intake.getEnddate());
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

    public static int InsertCourseApplied(Program_Intake intake, String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO  course_applied("
                + "user_id,"
                + "course_id,"
                + "intake_id)"
                + "VALUES(?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, intake.getUser_id());
            ps.setString(2, id);
            ps.setString(3, intake.getIntakename());

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

    public static Program_Intake SelectIntakeById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        //ArrayList<Courses> result = new ArrayList<Courses>();
        String url = "SELECT * FROM intake WHERE intake_id =?";
        try {
            ps = connection.prepareStatement(url);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Program_Intake intake = new Program_Intake();
            if (rs.next()) {
                intake.setAcademicyear(rs.getString("academic_year"));
                intake.setIntakename(rs.getString("intake_name"));
                intake.setStartdate(rs.getString("start_date"));
                intake.setEnddate(rs.getString("end_date"));
                //result.add(course);
            }
            return intake;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
        return null;

    }
}
