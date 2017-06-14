<%-- 
    Document   : programs
    Created on : Apr 28, 2017, 9:26:25 AM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<sql:setDataSource
    var="myDs"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coursemanager"
    user="root"
    password="degraP@55w0rd"

    />
<sql:query dataSource="${myDs}" var="school" >
    SELECT * FROM manage_schools
</sql:query>
<sql:query dataSource="${myDs}" var="dept" >
    SELECT * FROM manage_department
</sql:query>
<sql:query dataSource="${myDs}" var="camp" >
    SELECT * FROM campuses
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>programs</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"></jsp:include>
            <link href="js/css/jquey.css" rel="stylesheet" type="text/css" />
            <link href="vendor/DataTables/css/DT_bootstrap.css" rel="stylesheet" media="screen">
            <script src="js/jquery/jquery-confirm.min.css"></script>
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
                                        <h1 class="mainTitle">Programs</h1>
                                    </div>
                                    <div class="values pull-right">
                                        <!-- start: MINI STATS WITH SPARKLINE -->
                                        <style>
                                            .mini-stats a:hover{
                                                background-color:#efefef;
                                                padding:10px 2px 5px 5px;
                                                color:#1B1E24;
                                            } 
                                        </style>
                                        <ul class="mini-stats pull-right">
                                            <li>
                                                <div class="sparkline-1">
                                                    <span ></span>
                                                </div>
                                                <div class="values">
                                                    <a  onclick="manageSchools()" class="text-small no-margin">
                                                        Manage Schools
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="values">

                                                    <a  onclick="manageDepartments()"  class="text-small no-margin">
                                                        Manage Departments
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="values">

                                                    <a  onclick="manageCampuses()" class="text-small no-margin">
                                                        Manage Campus
                                                    </a>
                                                </div>
                                            </li>

                                        </ul>
                                        <!-- end: MINI STATS WITH SPARKLINE -->
                                    </div>

                                </div>
                            </section>

                            <div class="container-fluid container-fullw padding-5 padding-bottom-0 ">
                                <section  id="page-title" class="padding-top-5 padding-bottom-5 ">

                                    <div class="row">
                                        <ul class="pull-right">
                                            <button class=" btn btn-primary btn-o btn-sm" onclick="OnClickSchoolBtn()" id="add_school_btn"><i class="fa fa-plus">Add School</i></button>
                                            <button id="add_department_btn" onclick="onClickShowDepartmetForm()" class="btn btn-o btn-primary btn-sm " style="display: none">Add Department</button>
                                            <button onclick="onClickShowCampusForm()" id="add_campus_btn" class="btn btn-o btn-primary btn-sm glyphicon glyphicon-plus" style="display: none">Add Campuses</button>

                                            <!--all save buttons-->


                                            <button type="button" onclick="" id="save_school_button" style="display:none" class="btn btn-o  btn-primary btn-sm  glyphicon glyphicon-save">Save</button>

                                            <!--start all delete buttons-->

                                        </ul>
                                    </div>
                                </section>

                                <div class="row">
                                    <div id="col-md-12">
                                        <div id="showDiv"></div>
                                    </div>

                                </div>
                                <!--manage schools-->
                                <div class="row">
                                    <div class="col-md-12 margin-top-10 table-responsive" id="school_table">
                                        <table class="table table-striped table-bordered table-hover table-full-width" id="falculty_sample_1">
                                            <thead>
                                                <tr class="text-large">
                                                    <th>School Id</th>
                                                    <th>School Name</th>
                                                    <th>Campus Id</th>
                                                    <th>Description</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="items" items="${school.rows}">
                                                <tr>
                                                    <td>${items.school_id}</td>
                                                    <td>${items.school_name}</td>
                                                    <td>${items.campus_id}</td>
                                                    <td>${items.description}</td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- end: End school  Table -->
                            <!--
                            start school form
                            -->
                            <style>
                                .input-icon{
                                    color:red;
                                }
                            </style>

                            <div class="row">
                                <div class="col-md-12" id="school_form_div" style="display: none">

                                    <fieldset>
                                        <legend>Add Schools Info</legend>
                                        <form id="faculty_form"  method="POST" action="">
                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="camp_id">
                                                            Campus ID
                                                        </label>
                                                        <select class="form-control selected" id="camp_id" name="campusId">
                                                            <option>select campus id</option>
                                                            <c:forEach var="item" items="${camp.rows}" >
                                                                <option value="${item.campus_id}">${item.campus_name}</option>
                                                            </c:forEach>

                                                        </select>
                                                        <!-- <input type="text" class="form-control" id="campus_id" placeholder="campus id"name="campusId">-->
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="school_id">
                                                            School Id
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" id="school_id"  placeholder="school id" name="schoolId">
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="school_name">
                                                            School Name
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" id="school_name"  placeholder="School Name"name="schoolName">
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="description">
                                                            School Description
                                                        </label>
                                                        <span class="input-icon">
                                                            <textarea class="form-control" name="description" id="description"  placeholder=" description" rows="5"></textarea>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-sm-offset-1">
                                                <div class="form-group">
                                                    <button type="submit"  id="submit_faculty_button" class="btn  btn-primary btn-sm pull-right">Submit</button>

                                                </div>
                                            </div>

                                        </form>
                                    </fieldset>
                                </div>
                            </div>
                            <!--end school form -->

                            <!--to start departments  table-->
                            <div id="department_table_div" style="display: none">
                                <div class="row">
                                    <div class="table-responsive col-md-12 margin-top-10" >
                                        <table class="table  table-bordered table-hover " id="department_table" >
                                            <thead class="text-large">
                                                <tr>
                                                    <th>Department ID</th>
                                                    <th>Department Name</th>
                                                    <th>Description</th>
                                                    <th>Faculty Id</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="items" items="${dept.rows}">
                                                    <tr>
                                                        <td>${items.department_id}</td>
                                                        <td>${items.department_name}</td>
                                                        <td>${items.description}</td>
                                                        <td>${items.faculty_id}</td>
                                                    </tr>
                                                </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- end: End Department Table -->
                            <!--start department form-->

                            <div class="col-md-12 col-md-offset-0" >
                                <div id="department_form_div" style="display:none">
                                    <fieldset>
                                        <legend>
                                            Add Department Details
                                        </legend>
                                        <form  id="department_form_info" action="" method="post" >

                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Department Id 
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" id="dept_id" placeholder="department id" name="departmentId">
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Department Name  
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" id="dept_name" placeholder="department Name"name="departmentname">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Description 
                                                        </label>
                                                        <span class="input-icon">
                                                            <textarea class="form-control" id="dept_desc" placeholder="department description" name="description" rows="5"></textarea>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="row col-md-offset-0">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>
                                                                Faculty Id 
                                                            </label>
                                                            <select class="form-control selected" name="facultyId" id="faculty_id">

                                                                <c:forEach var="result" items="${school.rows}">
                                                                    <option value="${result.school_id}">${result.school_name}</option>
                                                                </c:forEach>
                                                            </select>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-sm-offset-1">
                                                <div class="form-group">
                                                    <button type="submit" id="Save_department_button" class="btn btn-primary btn-sm pull-right">Submit
                                                        <i class="fa fa-arrow-circle-right"></i>
                                                    </button>

                                                </div>
                                            </div>
                                        </form>
                                    </fieldset>
                                </div>
                            </div>


                            <!--start campus table-->
                            <div class="row">
                                <div class="col-md-12 col-sm-8 col-xs-12" id="campus-table" style="display: none">
                                    <table class="table table-striped table-bordered table-hover table-full-width" id="campuses" >
                                        <thead class="text-large">
                                            <tr>
                                                <th> Campus Id</th>
                                                <th>Campus Name</th>
                                                <th>Description</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="row" items="${camp.rows}">
                                                <tr ondblclick="document.location = 'viewCampus?id=${row.campus_id}'"; data-toggle="tooltip" data-placement="top" title="click to update table information">
                                                    <td><c:out value="${row.campus_id}"/></td>
                                                    <td><c:out value="${row.campus_name}"/></td>
                                                    <td><c:out value="${row.campus_desccription}"/></td>
                                                    <td><a href="deleteCampus?id=${row.campus_id}" class="btn btn-danger" id="delete-btn" ><i class="fa fa-trash"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- end: End campus Table -->

                            <!start campus form-->
                            <div id="campus_form_div" style="display:none" >
                                <fieldset>
                                    <legend>
                                        Campus Details
                                    </legend>
                                    <form method="post" id="campus_form" class="">
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Campus ID
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" id="campusId" class="form-control" placeholder="campus id" name="campusId">
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Campus Name
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" id="campusname" class="form-control" placeholder="campus Name"name="campusName">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Campus Description
                                                    </label>
                                                    <span class="input-icon">
                                                        <textarea class="form-control" id="description" name="description" placeholder="campus description" rows="5"></textarea>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-8 col-sm-offset-1">
                                            <div class="form-group">
                                                <button type="Submit" id="save_campus_info_button" class="btn btn-primary pull-right glyphicon glyphicon-plus">Save</button>

                                            </div>
                                        </div>
                                    </form>

                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- start: MAIN JAVASCRIPTS -->

        <script src="js/jquery.min.js"></script>

        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.js"></script>
        <script src="js/jquery.cookie.js"></script>
        <script src="js/perfect-scrollbar.min.js"></script>
        <script src="js/switchery.min.js"></script>
        <script src="js/selectFx.js"></script>
        <script src="js/classie.js"></script>
        <<script src="js/jquery.validate.min.js"></script>
        <!-- end: MAIN JAVASCRIPTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->

        <script src="js/jquery.smartWizard.js"></script>
        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <!-- start: CLIP-TWO JAVASCRIPTS -->

        <script src="js/main.js"></script>
        <script src="js/form-wizard.js"></script>
        <script src="js/jquery.dataTables.js"></script>

        <script src="js/App.js"></script>
        <script>
                                                    jQuery(document).ready(function () {
                                                        Main.init();
                                                        TableData.init();
                                                        FormElements.init();
                                                        // FormValidator.init();
                                                    });
        </script>
        <script>
            $("#falculty_sample_1").dataTable({
                // "bJQueryUI": true,
                "pageLength": 5,
                "aLegthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, 'All']],
                "order": [[1, 'desc'], [2, 'asc']]

            });

        </script>
        <script>
            $("#department_table").dataTable({
                "bJQueryUI": true,
                "pageLength": 5,
                "aLegthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, 'All']],
                "order": [[1, 'desc'], [2, 'asc']]

            });

        </script>



    </body>
</html>
