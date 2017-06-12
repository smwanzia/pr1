/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ApplicantAccountDB;
import Util.Encrypt;
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
public class UserLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username= request.getParameter("username");
        String password = request.getParameter("password");
        String hashedpassword = Encrypt.encryptSHA1(password);

        ApplicantAccount account = new ApplicantAccount();
        account = ApplicantAccountDB.selectApplicantByUsername(username);

        String message = "";
        String url = "";

        if (account.getUsername() == null) {
            url = "login.jsp";
            message = "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                    + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                    + " <strong>Ooops!!That  was not found,use correct username or password ...</strong></div>";
            session.setAttribute("msg", message);
        } else {
            String storedPassword = account.getPassword();

            if (!storedPassword.matches(hashedpassword)) {
                url = "login.jsp";
                message =  "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                    + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                    + " <strong>Ooops!!That user was not found,use correct username or password ...</strong></div>";
                session.setAttribute("msg", message);
              

            } else {
                url = "index.jsp";
                message = "welcome" + account.getUsername() + "";
                session.setAttribute("msg", message);
                  session.setAttribute("loggedInUser", account);
            }

        }
        request.getRequestDispatcher(url).forward(request, response);
    }

}
