/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ApplicationDB;
import business.ApplicantAccount;
import business.Courses;
import business.EducationBackground;
import business.PersonalInformation;
import business.Sponsor;
import business.WorkingExperience;
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
public class ProcessApplicantData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String url = "";
        String message = "";
        ApplicantAccount loggedInUser = (ApplicantAccount) session.getAttribute("loggedInUser");
        //capture personal infomation from client

        String firstname = request.getParameter("firstname");
        String middlename = request.getParameter("middlename");
        String gender = request.getParameter("gender");
        String DOB = request.getParameter("DOB");
        String nationalId = request.getParameter("idNo");
        String religion = request.getParameter("religion");
        String county = request.getParameter("county");
        String contactAddress = request.getParameter("contactAddress");
        String district = request.getParameter("district");
        String maritalStatus = request.getParameter("maritalStatus");
        String nationality = request.getParameter("nationality");
        String town = request.getParameter("town");

        //capture education background
        String institutionname = request.getParameter("institutionName");
        String indexNo = request.getParameter("indexNo");
        String gradeScored = request.getParameter("qualification");
        String yearFrom = request.getParameter("yearFrom");
        String yearTo = request.getParameter("yearTo");
        String courseStudient = request.getParameter("courseStudient");
        String nameOfCertificate = request.getParameter("certifcateName");
        String physicalChallenge = request.getParameter("physicalChallenge");

        //capture working experience and save to db
        String organisationName = request.getParameter("organisationName");
        String postHeld = request.getParameter("postHeld");
        String to = request.getParameter("to");
        String from = request.getParameter("from");

        //capture sponsorship details and save to db
        String sponsorName = request.getParameter("sponsorName");
        String address = request.getParameter("Address");
        String sponsor_town = request.getParameter("town");
        String phone = request.getParameter("phoneNumber");
        String fax = request.getParameter("fax");

        //update personal personal information
        if (loggedInUser == null) {
            url = "login.jsp";
            session.setAttribute("msg", "session timeout ,login again");
        } else {
            int id = loggedInUser.getId();
            //create applicant accountInfo object and save to database
            PersonalInformation account = new PersonalInformation();
            account.setId(loggedInUser.getId());
            account.setFirstname(firstname);
            account.setNationalId(nationalId);
            account.setReligion(religion);
            account.setCounty(county);
            account.setGender(gender);
            account.setDOB(DOB);
            account.setTown(town);
            account.setMiddlename(middlename);
            account.setMaritalStatus(maritalStatus);
            account.setContactAddress(contactAddress);
            account.setDistrict(district);
            account.setNationality(nationality);
            int i = ApplicationDB.AddPersonal_Info(account);

            if (i == 1) {
                //create education info object and send to database
                EducationBackground info = new EducationBackground();
                info.setUser_id(loggedInUser.getId());
                info.setCourseStudient(courseStudient);
                info.setQualification(gradeScored);
                info.setInstitutionName(institutionname);
                info.setIndexNo(indexNo);
                info.setNameOfCerticate(nameOfCertificate);
                info.setYearFrom(yearFrom);
                info.setYearTo(yearTo);
                info.setPhysicalChallenge(physicalChallenge);

                int ed = ApplicationDB.AddEducation_Info(info);
                if (ed == 1) {

                    WorkingExperience work = new WorkingExperience();
                    work.setUserId(loggedInUser.getId());
                    work.setDate_from(from);
                    work.setDate_to(to);
                    work.setOrganizationName(organisationName);
                    work.setPostHeld(postHeld);
                    work.setTown(town);

                    //insert into db
                    int wk = ApplicationDB.AddWorkingExperience(work);
                    if (wk > 0) {
                        //create sponsorship object  and save to db
                        Sponsor sponsor = new Sponsor();
                        sponsor.setUserId(loggedInUser.getId());
                        sponsor.setAddress(address);
                        sponsor.setFax(fax);
                        sponsor.setName(sponsorName);
                        sponsor.setPhoneNumber(phone);
                        sponsor.setTown(sponsor_town);
                        int s = ApplicationDB.AddSponsorDetails(sponsor);
                        if (s == 1) {
                            url = "Program_Selection.jsp";

                        } else {
                            url = "error.jsp";
                            message = "Error Occured While Adding Sponsor details";
                            session.setAttribute("message", message);
                        }

                    } else {
                        url = "error.jsp";
                        message = "Error Occured While Adding Working details";
                        session.setAttribute("message", message);
                    }

                } else {
                    url = "error.jsp";
                    message = "Error Occured While Adding Education details";
                    session.setAttribute("message", message);
                }

            } else {
                url = "error.jsp";
                message = "Error Occured While Adding personal details";
                session.setAttribute("message", message);
            }
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

}
