/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.IntakeDB;
import business.ApplicantAccount;
import business.Program_Intake;
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
public class ProcessIntake extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ApplicantAccount loggedInUser = (ApplicantAccount) session.getAttribute("loggedInUser");

        String intakeName = request.getParameter("intakeName");
        String startdate = request.getParameter("startdate");
        String endDate = request.getParameter("enddate");
        String academicYear = request.getParameter("academicyear");
        String courseid = request.getParameter("courseid");

        Program_Intake intake = new Program_Intake();
        intake.setAcademicyear(academicYear);
        intake.setEnddate(endDate);
        intake.setStartdate(startdate);
        intake.setIntakename(intakeName);
        String url = "";
        String message = "";
        // String userId = loggedInUser.getUsername();
        // intake.setUsername_id(userId);
        int i = IntakeDB.InsertCourseApplied(intake, courseid);
        if (i > 0) {
            url = "payment.jsp";
            //response.getWriter().write("success");
            //response.setContentType("text/html");
        } else {
            url = "Confirm_Course.jsp";
            message = "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                    + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                    + " <strong>Ooops!!An Error Occured try again later...</strong></div>";
            session.setAttribute("pMsg", message);
            //response.getWriter().write("error");
            //response.setContentType("text/html");
        }
        request.getRequestDispatcher(url).forward(request, response);

    }

}
