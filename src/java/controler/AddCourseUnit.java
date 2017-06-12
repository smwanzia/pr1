/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CourseDB;
import business.CourseUnits;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xmore mmohz
 */
public class AddCourseUnit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String unitcode = request.getParameter("unitcode");
        String unitname = request.getParameter("unitname");

        CourseUnits unit = new CourseUnits();
        unit.setUnitCode(unitcode);
        unit.setUnitName(unitname);
        int i = CourseDB.AddCourseUnits(unit);
        if (i > 0) {
             response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("success");
        } else {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Error");
        }
    }

}
