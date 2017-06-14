/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CourseDB;
import business.Courses;
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
public class CreateCourses extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String coursename = request.getParameter("coursename");
        String schoolId = request.getParameter("schoolid");
        String campusId = request.getParameter("campusid");
        String categoryId = request.getParameter("courseType");
        String departmentId = request.getParameter("department");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        
        Courses course = new Courses();
        Courses storedcourses;
        
        course.setCampusId(campusId);
        course.setCategoryId(categoryId);
        course.setDepartmentId(departmentId);
        course.setSchoolId(schoolId);
        course.setCoursename(coursename);
        course.setDescription(description);
        if (coursename == "" || schoolId == "" || campusId == "" || categoryId == "" || departmentId == "" || description == "") {
            response.getWriter().write("validate all");
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            
        } else {
            //sent to db
            storedcourses = CourseDB.SelectCourseByName(coursename);
            if (storedcourses.getCoursename().matches(coursename)) {
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("duplicate");
            } else {
                int i = CourseDB.AddCourses(course, duration);
                if (i == 1) {
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
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
}
