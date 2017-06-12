<%-- 
    Document   : Program_Selection
    Created on : May 20, 2017, 11:45:09 AM
    Author     : xmore mmohz
--%>
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
<sql:query dataSource="${myDs}" var="courses">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id 
</sql:query>
<sql:query dataSource="${myDs}" var="bachelors">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name='bachelors'
</sql:query>
<sql:query dataSource="${myDs}" var="Diploma">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name='Diplomas'
</sql:query>
<sql:query dataSource="${myDs}" var="PhD">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name='PHD'
</sql:query>
<sql:query dataSource="${myDs}" var="certificate">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name='certificate'
</sql:query>
<sql:query dataSource="${myDs}" var="masters">
    SELECT id,department_name,school_name,course_name,category_Name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id
    JOIN course_categories c_s ON c.category_id=c_s.category_id WHERE category_name='Masters'
</sql:query>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- start: META -->
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- end: META -->



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
                                    <div class="col-md-9" >
                                        <div id="All_courses_div">
                                            <table class="table table-striped table-bordered table-condensed table-hover"  id="Display_courses_table">
                                                <thead>
                                                    <tr>
                                                        <th>Programme Name</th>
                                                        <th>School/Faculty</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>

                                            </table>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="panel panel-light-grey" id="activities">
                                            <div class="panel-heading border-light">
                                                <h4 class="panel-title text-danger">Course Category</h4>
                                                <paneltool class="panel-tools" tool-collapse="tool-collapse" tool-refresh="load1" tool-dismiss="tool-dismiss"></paneltool>
                                            </div>
                                            <div collapse="activities" class="panel-wrapper">
                                                <div class="panel-body">
                                                    <ul class="timeline-xs">
                                                        <li class="text-center">
                                                            <p><h5><a class="" id="bachelor_Programmes" > Bachelor Programmes</a></h5></p>
                                                        </li>
                                                        <hr>
                                                        <li class="text-white text-center">
                                                            <p><h5><a class="" id="Masters_Programmes">Masters Prograammes</a></h5></p>
                                                        </li>
                                                        <hr>
                                                        <li class="text-center">
                                                            <p><h5><a class="" id="Certificate_Programmes">Certificate And Diploma</a></h5></p>
                                                        </li>
                                                        <hr>
                                                        <li class="text-center">
                                                            <p><h5><a class="" id="PhD_Programmes">PhD Programmes</a></h5></p>
                                                        </li>


                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

                                </div>



                                <div class="row">
                                    <div  class=" col-md-12 table-responsive hidden" id="bachelor_table">
                                        <table class="table table-striped table-bordered table-condensed table-hover table-full-width" id="sample_1">
                                            <thead>
                                            <th>Programme Name</th>
                                            <th>Faculty Name</th>
                                            <th>Duration (year)</th>
                                            <th>Action</th>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="items" items="${bachelors.rows}">
                                                <tr>
                                                    <td><option values=''>${items.course_name}</option></td>
                                            <td> <option values=''>${items.school_name}</option></td>
                                            <td><option values=''>${items.s}</option></td>
                                            <td><a href="#" class="btn btn-success btn-wide">Apply For this Programme</a></td>
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
    <script>
        jQuery(document).ready(function () {
            Main.init();
            FormWizard.init();
            FormValidator.init();
        });
    </script>
    <script>
        $("#Display_courses_table").dataTable({
            // "bJQueryUI": true,
            "pageLength": 10,
            "aLegthMenu": [[10, 15, 20, -1], [10, 15, 20, 'All']],
            "order": [[1, 'desc'], [2, 'asc']]

        });

    </script>

</body>
</html>
