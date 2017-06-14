/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.ApplicantAccount;
import business.PersonalInformation;
import business.StudentAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author xmore mmohz
 */
public class ApplicantAccountDB {

    public static int CreateApplicantAccount(ApplicantAccount acc) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO credential("
                + "user_name,"
                + "last_name,"
                + "first_name,"
                + "password,"
                + "phone_number,"
                + "email_address)"
                + "VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getLastname());
            ps.setString(3, acc.getFirstname());
            ps.setString(4, acc.getPassword());
            ps.setString(5, acc.getPhonenumber());
            ps.setString(6, acc.getEmail());

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

    public static int UpdateApplicantAccount(ApplicantAccount acc) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "UPDATE  credential SET"
                + "user_name =?,"
                + "last_name =?,"
                + "first_name =?,"
                + "phone_number =?,"
                + "WHERE email_address =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getLastname());
            ps.setString(3, acc.getFirstname());
            ps.setString(4, acc.getPhonenumber());
            ps.setString(5, acc.getEmail());

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

    public static int UpdateApplicantPersonalInfo(PersonalInformation acc) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "UPDATE  credential SET"
                + "applicant_name =?,"
                + "gender =?,"
                + "nationality =?,"
                + "national_Id =?,"
                + "marital_status =?,"
                + "religion =?,"
                + "town =?,"
                + "county =?,"
                + "district =?."
                + "date_of_birth =?,"
                + "contact_address =?"
                + "WHERE email_address =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, acc.getFirstname());
            ps.setString(2, acc.getGender());
            ps.setString(3, acc.getNationality());
            ps.setString(4, acc.getNationalId());
            ps.setString(5, acc.getMaritalStatus());
            ps.setString(6, acc.getReligion());
            ps.setString(7, acc.getTown());
            ps.setString(8, acc.getCounty());
            ps.setString(9, acc.getDistrict());
            ps.setString(10, acc.getDOB());
            ps.setString(11, acc.getContactAddress());

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

    public static ArrayList<ApplicantAccount> SelectApplicatAccount() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ApplicantAccount> result = new ArrayList<ApplicantAccount>();
        String query = "SELECT * FROM student_account";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ApplicantAccount acc = new ApplicantAccount();
                acc.setUsername(rs.getString("user_Name"));
                acc.setLastname(rs.getString("last_Name"));
                acc.setFirstname(rs.getString("first_Name"));
                acc.setEmail(rs.getString("email_Id"));
                acc.setPhonenumber(rs.getString("phone_Number"));
                result.add(acc);
            }
            return result;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();
            return null;

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }

    }

    public static ApplicantAccount selectApplicantByUsername(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM credential WHERE user_name =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            ApplicantAccount userAccount = new ApplicantAccount();
            if (rs.next()) {
                userAccount.setId(rs.getInt("user_id"));
                userAccount.setUsername(rs.getString("user_name"));
                userAccount.setLastname(rs.getString("last_name"));
                userAccount.setFirstname(rs.getString("first_name"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setPhonenumber(rs.getString("phone_number"));
                userAccount.setEmail(rs.getString("email_address"));
            }
            return userAccount;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }

    public static PersonalInformation selectApplicantByID(int user_id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM credential c INNER JOIN personal_information p ON "
                + "c.user_id=p.user_id HAVING user_id =?;";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);

            rs = ps.executeQuery();
           PersonalInformation userAccount = new PersonalInformation();
            if (rs.next()) {
                userAccount.setId(rs.getInt("user_id"));
                userAccount.setUsername(rs.getString("user_name"));
                userAccount.setLastname(rs.getString("last_name"));
                userAccount.setFirstname(rs.getString("first_name"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setPhonenumber(rs.getString("phone_number"));
                userAccount.setEmail(rs.getString("email_address"));
                userAccount.setGender(rs.getString("gender"));
                userAccount.setNationality(rs.getString("nationality"));
                userAccount.setNationalId(rs.getString("national_Id"));
                userAccount.setMaritalStatus(rs.getString("marital_status"));
                userAccount.setReligion(rs.getString("religion"));
                userAccount.setTown(rs.getString("town"));
                userAccount.setCounty(rs.getString("county"));
                userAccount.setDistrict(rs.getString("district"));
                userAccount.setDOB(rs.getString("date_of_birth"));
                userAccount.setContactAddress(rs.getString("contact_address"));

            }
            return userAccount;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }

    public static boolean checkUser(String username, String password) {
        boolean st = false;
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();

            PreparedStatement ps = connection.prepareStatement("select * from student_account where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            st = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return st;
    }

    public static boolean emailExists(String emailaddress) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT email_Id FROM student_account WHERE email_Id = ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, emailaddress);
            rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean usernameExists(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT username FROM credential WHERE username = ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

}
