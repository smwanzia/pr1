/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.UserAccountDB;
import Util.Encrypt;
import business.Users;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author xmore mmohz
 */
public class addUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String message = "";
        String url = "";

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("username");
        String firstName = request.getParameter("firstname");
        String rolesName = request.getParameter("role");
        String accountState = request.getParameter("status");
        String emailAddress = request.getParameter("email");
        String PhoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String lastname = request.getParameter("lastname");
        
        String rawPassword = Encrypt.encryptSHA1(password);

        Users user = new Users();

        user.setAccountState(accountState);
        user.setEmail_address(emailAddress);
        user.setPassword(rawPassword);
        user.setRoles(rolesName);
        user.setUsername(userName);
        user.setFirstname(firstName);
        user.setLastname(lastname);
        user.setPhone_number(PhoneNumber);
        user.setRecord_creator("mumo");
        if (password == "" || emailAddress == "" || PhoneNumber == "" || lastname == "" || accountState == "" || userName == "" || rolesName == "") {
            response.getWriter().write("validationError");
            response.setContentType("text/html");
        } else {
            //add user account
            int i = UserAccountDB.AddUsers(user);
            if (i > 0) {
                response.getWriter().write("success");
                //url = "/manageUsers.jsp";

            } else {
                response.getWriter().write("Error");
                // session.setAttribute("message", message);
            }
        }

    }
}
