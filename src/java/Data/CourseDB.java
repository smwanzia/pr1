/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import business.CourseFees;
import business.CourseUnits;
import business.Courses;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author xmore mmohz
 */
public class CourseDB {

    public static int AddCourses(Courses course) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO courses ("
                + "department_id,"
                + "school_id,"
                + "campus_id,"
                + "course_name,"
                + "category_id,"
                + "course_description)"
                + "VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, course.getDepartmentId());
            ps.setString(2, course.getSchoolId());
            ps.setString(3, course.getCampusId());
            ps.setString(4, course.getCoursename());
            ps.setString(5, course.getCategoryId());
            ps.setString(6, course.getDescription());
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

    public static int InserCourseApplied(String username, String course) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO course_applied("
                + "username_id,"
                + "course_id)"
                + "VALUES(?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, course);

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

    public static int DeleteCourses(String course_id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM courses WHERE id =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, course_id);
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
    }

    public static int AddCourseFees(CourseFees course) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO course_fees ("
                + "fee_item_id,"
                + "fee_item_name,"
                + "fee_amount,"
                + "year_of_study,"
                + "semester_of_study)"
                + "VALUES(?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, course.getFeeitemId());
            ps.setString(2, course.getFeeitemname());
            ps.setDouble(3, course.getAmount());
            ps.setString(4, course.getYearofstudy());
            ps.setString(5, course.getSemOfstudy());

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

    public static int AddCourseUnits(CourseUnits units) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO course_units ("
                + "unit_code,"
                + "unit_name,"
                + "VALUES(?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, units.getUnitCode());
            ps.setString(2, units.getUnitName());

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

    public static ArrayList<Courses> SelectBachelorCourses() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Courses> result = new ArrayList<Courses>();
        String url = "  SELECT id,department_name,school_name,course_name,category_Name FROM courses c \n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_Name='bachelors'";
        try {
            ps = connection.prepareStatement(url);
            rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses();
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                result.add(course);

            }
            return result;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
        return null;

    }

    public static ArrayList<Courses> SelectMasterCourses() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Courses> result = new ArrayList<Courses>();
        String url = "  SELECT id,department_name,school_name,course_name,category_Name FROM courses c \n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_Name='Masters'";
        try {
            ps = connection.prepareStatement(url);
            rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses();
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                result.add(course);

            }
            return result;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
        return null;

    }

    public static ArrayList<Courses> SelectPhDCourses() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Courses> result = new ArrayList<Courses>();
        String url = "  SELECT id,department_name,school_name,course_name,category_Name FROM courses c \n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_Name='PHD'";
        try {
            ps = connection.prepareStatement(url);
            rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses();
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                result.add(course);

            }
            return result;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
        return null;

    }

    public static ArrayList<Courses> SelectDiplomaAndCertificate() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Courses> result = new ArrayList<Courses>();
        String url = " SELECT id,department_name,school_name,course_name,category_Name FROM courses c\n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name IN('Diplomas','Certificate')";
        try {
            ps = connection.prepareStatement(url);
            rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses();
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                result.add(course);

            }
            return result;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;

    }

    public static Courses SelectCourseById(String courseId) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String url = " SELECT id,department_name,school_name,course_name,category_Name,course_description,"
                + "course_duration,requirement_id FROM courses c\n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE id=?";
        try {
            ps = connection.prepareStatement(url);
            ps.setString(1, courseId);
            rs = ps.executeQuery();
            Courses course = new Courses();
            if (rs.next()) {
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                course.setDescription(rs.getString("course_description"));
                course.setDuration(rs.getString("course_duration"));
                course.setRequirement_id(rs.getInt("requirement_id"));
            }
            return course;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;

    }

    public static ArrayList<Courses> SelectAllCourses() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Courses> result = new ArrayList<Courses>();
        String url = " SELECT id,department_name,school_name,course_name,category_Name FROM courses c\n"
                + "\n"
                + "    JOIN  manage_department m_d ON c.department_id = m_d.department_id\n"
                + "    JOIN manage_schools m_s ON c.school_id = m_s.school_id\n"
                + "    JOIN course_categories c_s ON c.category_id=c_s.category_id ";
        try {
            ps = connection.prepareStatement(url);
            rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses();
                course.setCourseId(rs.getString("id"));
                course.setDepartmentId(rs.getString("department_name"));
                course.setSchoolId(rs.getString("school_name"));
                course.setCoursename(rs.getString("course_name"));
                course.setCategoryId(rs.getString("category_Name"));
                result.add(course);

            }
            return result;
        } catch (SQLException e) {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;

    }

}
