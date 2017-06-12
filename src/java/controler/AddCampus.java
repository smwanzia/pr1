/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CampusDB;
import business.Campuses;
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
public class AddCampus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath = request.getServletPath();
        String url = "";
        String message = "";
        HttpSession session = request.getSession();

        String campId = request.getParameter("campusId");
        String campusName = request.getParameter("campusName");
        String description = request.getParameter("description");

        Campuses camp = new Campuses();
        camp.setCampusId(campId);
        camp.setCampusName(campusName);
        camp.setDescription(description);
        int i = CampusDB.AddCampusDetails(camp);

        if (i > 0) {
            response.setContentType("text/html");
            response.getWriter().write("success");
            // url = "view_Campus.jsp";
            // message = "done sucessfull...";
            //session.setAttribute("mesg", message);
        } else {
            response.setContentType("text/html");
            response.getWriter().write("Error");
            // url = "error.jsp";
            //message = "error occured,try again";
            // session.setAttribute("errormsg", message);
        }

    }

}
