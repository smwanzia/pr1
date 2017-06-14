/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ApplicantAccountDB;
import Util.Encrypt;
import business.ApplicantAccount;
import business.PersonalInformation;
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
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hashedpassword = Encrypt.encryptSHA1(password);
        PersonalInformation information;
        ApplicantAccount account = new ApplicantAccount();
        account = ApplicantAccountDB.selectApplicantByUsername(username);

        String message = "";
        String url = "";

        if (account.getUsername() == null) {
            url = "login.jsp";
            message = "<h4>Login Authentication Failure</h4>"
                    + "<p>That User Account was not found.</p>";
            session.setAttribute("Msg", message);
        } else {
            String storedPassword = account.getPassword();

            if (!storedPassword.matches(hashedpassword)) {
                url = "login.jsp";
                message = "<h4 style='color:darkred'>Login Authentication Failure</h4>"
                        + "<p><h5>You entered wrong credentials. Go Back and try again.</h5></p>";
                session.setAttribute("Msg", message);
                session.setAttribute("loggedInUser", account);

            } else {
                information = ApplicantAccountDB.selectApplicantByID(account.getId());
                url = "index.jsp";
                message = "welcome" + account.getUsername() + "";
                session.setAttribute("msg", message);
                session.setAttribute("loggedInUser", account);
                session.setAttribute("UserAccount", information);
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
