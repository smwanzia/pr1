/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CourseDB;
import business.ApplicantAccount;
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
public class CourseApplied extends HttpServlet {

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
        String username = loggedInUser.getUsername();
        
        int i = CourseDB.InserCourseApplied(username, courseid);
        if (i > 0) {
            response.getWriter().write("success");
            response.setContentType("UTF-8");
        } else {
            response.getWriter().write("error");
            response.setContentType("UTF-8");
        }
    }

}
