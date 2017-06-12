/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.UserAccountDB;
import Util.Encrypt;
import business.AuditTrail;
import business.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xmore mmohz
 */
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String rawPassword = request.getParameter("password");
        String hashedPassword = Encrypt.encryptSHA1(rawPassword);

        HttpSession session = request.getSession();
        String message = "";
        String url = "";
        Users userAccount = new Users();
        userAccount = UserAccountDB.selectUserByUsername(username);

        if (userAccount.getUsername() == null) {
            url = "error.jsp";
            message = "<h4>Login Authentication Failure</h4>"
                    + "<p>That User Account was not found.</p>";
            session.setAttribute("Msg", message);
        } else {
            String storedPassword =userAccount.getPassword();
            if (!storedPassword.matches(hashedPassword)){
                url = "Admin_Login.jsp";
                message = "<h4 style='color:red'>Wrong username  or password,Try Again</h4>";

                session.setAttribute("Msg", message);

            } else {
                Date curDate = new Date();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String dateTime = df.format(curDate);
                // userAccount.setLoginTime(dateTime);
                AuditTrail auditTrail = new AuditTrail();
                auditTrail.setUserName(username);
                auditTrail.setItemCode(username);
                auditTrail.setAction("Log In From Host:"
                        + request.getRemoteHost() + "|Addr:"
                        + request.getRemoteAddr() + "|port:"
                        + request.getRemotePort());
                //AuditTrailDb.insertAuditTrials(auditTrail);

                session.setAttribute("loggedInUser", userAccount);
                url = "Dashboard.jsp";
            }
        }
        //response.sendRedirect(url);
        request.getRequestDispatcher(url).forward(request, response);

    }

}
