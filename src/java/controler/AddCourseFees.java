/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CourseDB;
import business.CourseFees;
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
public class AddCourseFees extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String itemName = request.getParameter("itemName");
        String yearOfStudy = request.getParameter("yrstudy");
        String semOfstudy = request.getParameter("semOfstudy");
        String itemId = request.getParameter("itemId");
        double amount = Double.parseDouble(request.getParameter("amount"));

        String message;
        String url;
        CourseFees fee = new CourseFees();

        fee.setAmount(amount);
        fee.setFeeitemId(itemId);
        fee.setFeeitemname(itemName);
        fee.setSemOfstudy(semOfstudy);
        fee.setYearofstudy(yearOfStudy);
        
        if (itemName == "" || yearOfStudy == "" || semOfstudy == "" || itemId == "") {
            response.getWriter().write("validate");
        } else {
            int i = CourseDB.AddCourseFees(fee);
            if (i > 0) {
            // message = " details successfully updated";
                // url = "ManageCourseFees.jsp";
                //session.setAttribute("msg", message);
                response.getWriter().write("success");
                response.setContentType("text/html");
                session.setAttribute("course", fee);
            } else {
            //message = "error occured adding course fee details";
                //url = "error.jsp";
                response.getWriter().write("Error");
                response.setContentType("text/html");
                //session.setAttribute("msg", message);
            }
        }

    }
}
