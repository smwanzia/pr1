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
public class ApplicantRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String message = "";
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String confirm_password = request.getParameter("password_again");
        String gender = request.getParameter("gender");

        String hashedpassword = Encrypt.encryptSHA1(password);
        ApplicantAccount account = new ApplicantAccount();

        account.setEmail(email);
        account.setFirstname(firstname);
        account.setPassword(hashedpassword);
        account.setPhonenumber(phonenumber);
        account.setUsername(username);
        account.setLastname(lastname);

        if (!confirm_password.equals(password)) {
           // response.setCharacterEncoding("UTF-8");
            // response.setContentType("text/html");
            // response.getWriter().write("no match");
            url = "Register.jsp";
            message = "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                    + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                    + " <strong>Error! password does not match</strong></div>";
            session.setAttribute("msg",message);

        } else {
            int i = ApplicantAccountDB.CreateApplicantAccount(account);
            if (i > 0) {
                url = "login.jsp";
                message = "<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'"
                        + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                        + " <strong>Congratulation!! Account was successfully created, wait you will be directed shortly...</strong></div>";
                // response.setCharacterEncoding("UTF-8");
                // response.setContentType("text/html");
                // response.getWriter().write("success");
                //url = "login.jsp";
                session.setAttribute("msg", message);
            } else {
                url = "Register.jsp";
                message = "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                    + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                    + " <strong>Error! Occured while creating account</strong></div>";
                session.setAttribute("msg", message);
                //session.setAttribute("mesage", message);
                // response.setCharacterEncoding("UTF-8");
                // response.setContentType("text/html");
                // response.getWriter().write("error");

            }
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

}
