/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;


import business.ApplicantAccount;
import business.Courses;
import business.EducationBackground;
import business.PersonalInformation;
import business.Sponsor;
import business.WorkingExperience;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class ApplicationDB {


    public static int AddSponsorDetails(Sponsor sponsor) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO sponsor_details("
                + "user_id,"
                + "address,"
                + "phone_number,"
                + "town,"
                + "sponsor_name,"
                + "fax)"
                + "VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, sponsor.getUserId());
            ps.setString(2, sponsor.getAddress());
            ps.setString(3, sponsor.getPhoneNumber());
            ps.setString(4, sponsor.getTown());
            ps.setString(5,sponsor.getName());
            ps.setString(6,sponsor.getFax());
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

    public static int AddEducation_Info(EducationBackground info) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO education_background("
                + "user_id,"
                + "institution_name,"
                + "grade,"
                + "year_from,"
                + "year_to,"
                + "course_studient,"
                + "index_no,"
                + "name_of_certificate,"
                + "physical_challenges)"
                + "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, info.getUser_id());
            ps.setString(2, info.getInstitutionName());
            ps.setString(3, info.getQualification());
            ps.setString(4, info.getYearFrom());
            ps.setString(5, info.getYearTo());
            ps.setString(6, info.getCourseStudient());
            ps.setString(7, info.getIndexNo());
            ps.setString(8, info.getNameOfCerticate());
            ps.setString(9, info.getPhysicalChallenge());

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

    public static int AddWorkingExperience(WorkingExperience work) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO work_experience ("
                + "user_id,"
                + "date_to,"
                + "date_from,"
                + "organization_name,"
                + "post_held)"
                + "VALUES(?,?,?,?,?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, work.getUserId());
            ps.setString(2, work.getDate_to());
            ps.setString(3, work.getDate_from());
            ps.setString(4, work.getOrganizationName());
            ps.setString(5, work.getPostHeld());

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

    public static int AddPersonal_Info(PersonalInformation account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO personal_information("
                + "user_id,"
                + "applicant_Name,"
                + "gender,"
                + "nationality,"
                + "national_Id,"
                + "marital_status,"
                + "religion,"
                + "town,"
                + "county,"
                + "district,"
                + "date_of_birth,"
                + "contact_address)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, account.getId());
            ps.setString(2, account.getFirstname());
            ps.setString(3, account.getGender());
            ps.setString(4, account.getNationality());
            ps.setString(5, account.getNationalId());
            ps.setString(6, account.getMaritalStatus());
            ps.setString(7, account.getReligion());
            ps.setString(8, account.getTown());
            ps.setString(9, account.getCounty());
            ps.setString(10, account.getDistrict());
            ps.setString(11, account.getDOB());
            ps.setString(12, account.getContactAddress());

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

    public static int AddCourseSelected(Courses course) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO course_selected ("
                + "course_name,"
                + "email_id,"
                + "grade,"
                + "year_from,"
                + "year_to)"
                + "VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);

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
