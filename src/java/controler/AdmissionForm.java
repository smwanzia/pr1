/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.ConnectionPool;
import business.ApplicantAccount;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author xmore mmohz
 */
public class AdmissionForm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String url = "";

        ApplicantAccount loggedInUser = (ApplicantAccount) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            url = "login.jsp";
        }
        Date timestamp = new Date();
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String title = "Report" + df.format(timestamp);
        //get parameter from user
        String subject = request.getParameter("subject");
        

        String filename = "/Reports/ReportPerSubject.jrxml";
        ConnectionPool Pool = null;
        Connection connection = null;

        String jasperReport = filename;
        //get real path of the file
        ServletContext sc = this.getServletConfig().getServletContext();
        try {
            String reportFileName = JasperCompileManager.compileReportToFile(sc.getRealPath(jasperReport));
            File ReportFile = new File(reportFileName);
            java.util.Map parameters = new java.util.HashMap();
            parameters.put("subjects", subject);
            if (!ReportFile.exists()) {

                throw new JRRuntimeException("File WebappReport.jasper not. found The report design must be compiled first.");
            }
            Pool = ConnectionPool.getInstance();
            connection = Pool.getConnection();
            JasperPrint jasperprint = JasperFillManager.fillReport(reportFileName, parameters, connection);
            JasperExportManager.exportReportToPdfFile(jasperprint, sc.getRealPath("/Reports") + "/" + title + ".pdf");
            File f = new File(sc.getRealPath("/Reports") + "/" + title + ".pdf");
            FileInputStream fn = new FileInputStream(f);
            ServletOutputStream outstream = response.getOutputStream();

            //set mime type
            response.setContentType("application/pdf");

            //set content disposition to attachment in with file name
            //render on screen
            response.setHeader("Content-Disposition", "inline; filename='" + title + ".pdf");
            byte[] buffer = new byte[1024];
            int n = 0;
            while ((n = fn.read(buffer)) != -1) {
                outstream.write(buffer, 0, n);
            }

            outstream.flush();
            fn.close();
            outstream.close();
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (Pool != null) {
                Pool.freeConnection(connection);
            }
        }

    }

}
