/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ApplicantAccountDB;
import business.ApplicantAccount;
import business.PersonalInformation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xmore mmohz
 */
public class UpdateApplicant extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = "";
        String url = "";
        HttpSession session = request.getSession();

        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String gender = request.getParameter("gender");
        String phonenumber = request.getParameter("phonenumber");
        String username = request.getParameter("username");
        String nationality = request.getParameter("nationality");
        String nationalId = request.getParameter("nationalid");
        String maritalStatus = request.getParameter("status");
        String religion = request.getParameter("religion");
        String county = request.getParameter("county");
        String DOB = request.getParameter("DOB");
        String district = request.getParameter("district");
        String contactAddress = request.getParameter("address");
        String town = request.getParameter("town");

        response.setContentType("text/html");

        PersonalInformation pf = new PersonalInformation();
        pf.setContactAddress(contactAddress);
        pf.setCounty(county);
        pf.setDOB(DOB);
        pf.setDistrict(district);
        pf.setGender(gender);
        pf.setMaritalStatus(maritalStatus);
        pf.setNationalId(nationalId);
        pf.setNationality(nationality);
        pf.setTown(town);
        pf.setReligion(religion);

        ApplicantAccount Ap = new ApplicantAccount();
        Ap.setEmail(url);
        Ap.setFirstname(firstname);
        Ap.setPhonenumber(phonenumber);
        Ap.setUsername(username);
        int i = ApplicantAccountDB.UpdateApplicantAccount(Ap);
        if (i > 0) {

            int c = ApplicantAccountDB.UpdateApplicantPersonalInfo(pf);
            if (c == 1) {
                response.getWriter().write("success");

            } else {
                response.getWriter().write("Error in PInfo");
            }
        } else {
            response.getWriter().write("Error in account");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

}
