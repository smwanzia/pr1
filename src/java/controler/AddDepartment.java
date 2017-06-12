/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.DepartmentDB;
import business.Departments;
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
public class AddDepartment extends HttpServlet {

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
        String departmentId = request.getParameter("deptId");
        String departmentName = request.getParameter("deptname");
        String description = request.getParameter("description");
        String facultyId = request.getParameter("facultyId");

        Departments dpt = new Departments();

        dpt.setDepartmentId(departmentId);
        dpt.setDepartmentName(departmentName);
        dpt.setDescription(description);
        dpt.setFacultyId(facultyId);

        int i = DepartmentDB.AddDepartmentDetails(dpt);
        if (i > 0) {
            response.setContentType("text/html");
            response.getWriter().write("success");
            // message = "details  sucessfull Added";
            // request.setAttribute("msg", message);
        } else {
            response.setContentType("text/html");
            response.getWriter().write("Error");
            // url = "/ManageDepartment.jsp";
            // message = "Error occured,Try again";
            // request.setAttribute("msg", message);
        }

    }

}
