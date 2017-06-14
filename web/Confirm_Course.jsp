<%-- 
    Document   : Confirm_Course
    Created on : Jun 6, 2017, 9:30:15 PM
    Author     : xmore mmohz
--%>
<%-- 
    Document   : payment
    Created on : May 20, 2017, 12:57:50 PM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource 
    var="myDs"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coursemanager"
    user="root"
    password="degraP@55w0rd"       
    />
<sql:query dataSource="${myDs}" var="intake">
    SELECT intake_id, academic_year,intake_name FROM intake
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>courses</title>
        <!-- start: MAIN CSS -->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
        <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
        <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="css/preloader.css"/>
        <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.css"></script>
        <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css"></script>
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">


        <!-- end: MAIN CSS -->
        <!-- start: CLIP-TWO CSS -->
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/themes/theme-4.css" />
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.src.js"></script>

        <link href="js/css/jquey.css" rel="stylesheet" type="text/css" />
        <link href="vendor/DataTables/css/DT_bootstrap.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <div id="app">
            <jsp:include page="/WEB-INF/jspf/SideNav.jspf"></jsp:include>
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
                                        <h1 class="mainTitle"></h1>
                                    </div>

                                </div>
                            </section>

                            <div class="container-fluid container-fullw padding-5 padding-bottom-0 ">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="MsgDiv">

                                        </div>

                                        <div id="intake_div">
                                            <form action="ProcessIntake" method="Post" id="intake_form" >
                                                <fieldset>
                                                    <legend>Select Program Intake</legend>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Intake Name
                                                                </label>
                                                                <select class="form-control selected" id="intake_name"  name="intakeName">
                                                                    <option></option>
                                                                <c:forEach var="result" items="${intake.rows}">
                                                                    <option value="${result.intake_id}">${result.intake_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                                <div id="msg"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>
                                                                Academic Year
                                                            </label>
                                                            <select class="form-control selected" id="academic_year" name="academicyear">
                                                                <option></option>
                                                                <option value="2016-2017">2016-2017</option>
                                                                <option value="2018-2019">2018-2019</option>
                                                            </select>

                                                        </div>
                                                    </div> 
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>
                                                                Start Date
                                                            </label>
                                                            <input type="text" placeholder="" id="startdate" class="form-control" name="startdate"/>
                                                        </div> 
                                                        <div class="form-group">
                                                            <label>
                                                                End Date
                                                            </label>
                                                            <input type="text" placeholder=""  id="enddate" class="form-control" value="" name="enddate"/>
                                                        </div> 
                                                    </div>

                                                </div>

                                            </fieldset>


                                            <div class="course_confirmation">
                                                <fieldset>
                                                    <legend>
                                                        Confirm Course Selection
                                                    </legend>
                                                    <input type="hidden" placeholder="" id="courseid" value="${course.courseId}" readonly="" class="form-control" name="courseid"/>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Course Name
                                                                </label>
                                                                <input type="text" placeholder="" value="${course.coursename}" readonly="" class="form-control" name="coursename"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Course Requirement<span class="symbol required"></span>
                                                                </label>
                                                                <table class="table">
                                                                    <tr>
                                                                        <td>${course.requirement_id}</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div> 

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Course Category
                                                                </label>
                                                                <input type="text" placeholder="" value="${course.categoryId}"  readonly="" class="form-control"  name=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>
                                                                    Course Duration
                                                                </label>
                                                                <input type="text" placeholder="" value="${course.duration}" readonly="" class="form-control" name=""/>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <button class="btn btn-azure glyphicon  pull-right glyphicon-saved" id="submit_cours_selected">Submit</button>
                                                    </div>

                                                    <div class="row">
                                                        <a href="Program_Selection.jsp"><p class="text-azure col-md-offset-1">Do you want to drop this course?</p> </a>
                                                    </div>
                                                </fieldset>
                                            </div>

                                        </form>


                                    </div>



                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- start: MAIN JAVASCRIPTS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/modernizr/modernizr.js"></script>
        <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="vendor/switchery/switchery.min.js"></script>
        <script src="vendor/selectFx/classie.js"></script>
        <script src="vendor/selectFx/selectFx.js"></script>
        <!-- end: MAIN JAVASCRIPTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="vendor/jquery-smart-wizard/jquery.smartWizard.js"></script>
        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <!-- start: CLIP-TWO JAVASCRIPTS -->
        <script src="assets/js/main.js"></script>
        <!-- start: JavaScript Event Handlers for this page -->
        <script src="assets/js/form-wizard.js"></script>
        <script src="assets/js/form-validation.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/App.js"></script>
        
     
        
    </body>
</html>
