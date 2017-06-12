/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ApplicantAccountDB;
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
public class SelectApplicantAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        HttpSession session = request.getSession();

        ApplicantAccount account = ApplicantAccountDB.selectApplicantByUsername(username);
        String user_name = account.getUsername();
        if (user_name == username) {
            response.setContentType("UTF-8");
            response.getWriter().write("user exist");
        } else {
            response.setContentType("UTF-8");
            response.getWriter().write("user not exist");
        }

    }

}
