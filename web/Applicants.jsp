<%-- 
    Document   : Applicants
    Created on : Jun 14, 2017, 11:12:55 AM
    Author     : xmore mmohz
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applicants</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"/>
        <link href="js/css/jquey.css" rel="stylesheet" type="text/css" />
        <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link href="vendor/DataTables/css/DT_bootstrap.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <div id="app">
            <jsp:include page="/WEB-INF/jspf/sidebar.jsp"></jsp:include>
                <!-- / sidebar -->
                <div class="app-content">
                <jsp:include page="/WEB-INF/jspf/header.jsp"></jsp:include>

                    <!-- end: TOP NAVBAR -->
                    <div class="main-content" >
                        <div class="wrap-content container background-light" id="container">
                            <!-- start: DASHBOARD TITLE -->
                            <section id="page-title" class="padding-top-5 padding-bottom-5 ">
                                <div class="row">
                                    <div class="col-sm-7">
                                        <h1 class="mainTitle">Applicants</h1>
                                    </div>

                                </div>
                            </section>

                            <div class="container-fluid container-fullw padding-5 padding-bottom-0 ">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive col-md-12" id="course-table">
                                            <button id="select_applicant" class="btn btn-primary">Applicants</button>  
                                            <table class="table table-striped table-bordered table-condensed table-hover table-full-width" id="">
                                                <thead>
                                                    <tr>
                                                        <th>##</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Course Name</th>
                                                        <th>Intake Name</th>
                                                        <th>Course Type</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="result" items="${intake}">
                                                    <tr>
                                                        <td>${result.firstname}</td>
                                                        <td>${result.lastname}</td>
                                                        <td>${result.courseid}</td>
                                                        <td>${result.intakename}</td>
                                                        <td>${result.course_category}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/perfect-scrollbar.min.js"></script>
    <script src="js/switchery.min.js"></script>
    <script src="js/selectFx.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->

    <script src="js/jquery.smartWizard.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CLIP-TWO JAVASCRIPTS -->

    <script src="js/main.js"></script>
    <script src="js/form-wizard.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/bootbox.min.js"></script>
    <script src="js/App.js"></script>
</html>
