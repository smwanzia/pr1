/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.SchoolDB;
import business.Schools;
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
public class AddSchools extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";
        String url = "";
        HttpSession session = request.getSession();

        String schoolId = request.getParameter("school_id");
        String schoolName = request.getParameter("schoolname");
        String description = request.getParameter("description");
        String campusId = request.getParameter("campus_id");
        

        Schools sc = new Schools();
        sc.setCampusId(campusId);
        sc.setDescription(description);
        sc.setSchoolname(schoolName);
        sc.setSchoolid(schoolId);

        //AdminDb.AddSchool(sc);
        int i = SchoolDB.AddSchoolsDetails(sc);
        if (i > 0) {
            response.setContentType("text/html");
            response.setContentType("");
            response.getWriter().write("success");
            //url = "/view_school.jsp";
            //message = "details successfully sucessfull added";
            //session.setAttribute("msg", message);
        } else {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Error");
            //url = "/view_school.jsp";
            //message = "details successfully sucessfull added";
            //request.setAttribute("msg", message);
        }
    }

}
