/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.PaymentDB;
import business.ApplicantAccount;
import business.BankDetails;
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
public class Payment extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String url = "";
        String message = "";
        
        ApplicantAccount loggedInUser = (ApplicantAccount) session.getAttribute("loggedInUser");
        String action = request.getParameter("paymentMode");
        //get mpesa details
        if (action.equals("banking")) {
            String branch = request.getParameter("branch");
            String bankname = request.getParameter("bankName");
            int accountno = Integer.parseInt(request.getParameter("accountNo"));
            
            BankDetails bank = new BankDetails();
            
            bank.setAccountNumber(accountno);
            //bank.setAccountType(accountno);
            bank.setBankName(bankname);
            bank.setBranch(branch);
            bank.setUser_id("4");
            int i = PaymentDB.AddBank_Info(bank);
            if (i > 0) {
                url = "success.jsp";
                String phone = loggedInUser.getPhonenumber();
                //send notification message to the applicant
                // response.setContentType("text/html");
            } else {
                url = "payment.jsp";
                message = "<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'"
                        + "data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>"
                        + " <strong>Ooops!!An Error Occured try again later...</strong></div>";
                session.setAttribute("pMsg", message);
                //response.setContentType("text/html");
            }
        } else {
            response.getWriter().write("Error");
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }
    
}
