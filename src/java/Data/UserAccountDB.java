/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author xmore mmohz
 */
public class UserAccountDB {
    
    public static Users selectUserById(int id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM users WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Users userAccount = new Users();
            if (rs.next()) {
                userAccount.setUserId(rs.getInt("user_id"));
                userAccount.setUsername(rs.getString("username"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setRoles(rs.getString("role"));
                userAccount.setAccountState(rs.getString("state"));
                userAccount.setEmail_address(rs.getString("email"));
                userAccount.setPhone_number(rs.getString("phone_number"));
                
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
    
    public static Users selectUserByUsername(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM user_account WHERE username =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            Users userAccount = new Users();
            if (rs.next()) {
                userAccount.setUserId(rs.getInt("user_id"));
                userAccount.setUsername(rs.getString("username"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setRecord_creator(rs.getString("record_creator"));
                userAccount.setRoles(rs.getString("role"));
                userAccount.setPhone_number(rs.getString("phone"));
                userAccount.setEmail_address(rs.getString("email"));
                userAccount.setFirstname(rs.getString("first_name"));
                userAccount.setLastname(rs.getString("last_name"));
                userAccount.setAccountState(rs.getString("account_status"));
                
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
    
    public static ArrayList<Users> selectAllUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Users> result = new ArrayList<Users>();
        String query = "SELECT user_id,username,role,phone,email,first_name,"
                + "last_name,account_status FROM user_account ORDER BY user_id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setRoles(rs.getString("role"));
                user.setPhone_number(rs.getString("phone"));
                user.setEmail_address(rs.getString("email"));
                user.setFirstname(rs.getString("first_name"));
                user.setLastname(rs.getString("last_name"));
                user.setAccountState(rs.getString("account_status"));
                result.add(user);
                
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
    
    public static int AddUsers(Users account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO user_account ("
                + "username,"
                + "password,"
                + "record_creator,"
                + "role,"
                + "phone,"
                + "email,"
                + "first_name,"
                + "last_name,"
                + "account_status)"
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getRecord_creator());
            ps.setString(4, account.getRoles());
            ps.setString(5, account.getPhone_number());
            ps.setString(6, account.getEmail_address());
            ps.setString(7, account.getFirstname());
            ps.setString(8, account.getLastname());
            ps.setString(9, account.getAccountState());
            
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            
        }
        
    }
    
    public static int UpdateUsers(Users account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE user_account set "
                + "username =?,"
                + "password =?,"
                + "record_creator =?,"
                + "role =?,"
                + "phone =?,"
                + "email =?,"
                + "first_name =?,"
                + "last_name =?,"
                + "account_status =?"
                + "WHERE user_id = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(5, account.getRoles());
            ps.setString(6, account.getAccountState());
            ps.setString(7, account.getEmail_address());
            ps.setString(8, account.getPhone_number());
            ps.setInt(9, account.getUserId());
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            
        }
    }
    
    public static int ResetUserPassword(Users account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " Update users SET password = ? WHERE username = ? ";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getPassword());
            ps.setString(2, account.getUsername());
            
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            
        }
    }
    
    public static boolean checkUsernameExist(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM user_account WHERE username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            
        }
        return false;
    }
    
    public static int DeleteUsers(String user_id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "delete FROM users WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user_id);
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            
        }
    }
    
}
