/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import Data.CourseDB;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author xmore mmohz
 */
public class deleteCourses extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");

        JSONObject jsonObj = new JSONObject();
        Iterator it = jsonObj.keys(); //get all the keys
        while (it.hasNext()) {
            String key = (String) it.next(); // get key
            Object o = jsonObj.get(key); // get value
            System.out.println(key + " : " + o); // print the key and value
            response.getWriter().write(key + ":" + o);

        }
        int i = CourseDB.DeleteCourses(id);
        if (i > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
