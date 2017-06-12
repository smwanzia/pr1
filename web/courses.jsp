<%-- 
    Document   : courses
    Created on : Apr 27, 2017, 7:48:34 AM
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
<sql:query dataSource="${myDs}" var="courses">
    SELECT id,department_name,school_name,course_name FROM courses c

    JOIN  manage_department m_d ON c.department_id = m_d.department_id
    JOIN manage_schools m_s ON c.school_id = m_s.school_id

</sql:query>
<sql:query dataSource="${myDs}" var="school">
    SELECT school_id ,school_name FROM manage_schools
</sql:query>
<sql:query dataSource="${myDs}" var="dept">
    SELECT department_id,department_name FROM manage_department
</sql:query>
<sql:query dataSource="${myDs}" var="campus">
    SELECT campus_id,campus_name FROM campuses
</sql:query>
<sql:query dataSource="${myDs}" var="type">
    SELECT category_id,category_name FROM course_categories
</sql:query>
<sql:query dataSource="${myDs}" var="fee">
    SELECT * FROM course_fees
</sql:query>
<sql:query dataSource="${myDs}" var="courseUnit">
    SELECT * FROM course_units
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"/>
        <link href="js/css/jquey.css" rel="stylesheet" type="text/css" />
        <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link href="vendor/DataTables/css/DT_bootstrap.css" rel="stylesheet" media="screen">



    </head>
    <body>
        <div id="app" class="app-footer-fixed">
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
                                        <h1 class="mainTitle">Course</h1>
                                    </div>
                                    <div class="values pull-right">
                                        <!-- start: MINI STATS WITH SPARKLINE -->
                                        <ul class="mini-stats pull-right hover">
                                            <li>
                                                <div class="sparkline-1">
                                                    <span ></span>
                                                </div>
                                                <div class="values">
                                                    <a onclick="ManageCourses()" id="manage_courses" class="text-small no-margin">
                                                        Manage Courses
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="values">
                                                    <a onclick=" ManageCourseFees()" id="manage_course_fees" class="text-small no-margin">
                                                        Manage Course Fees
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="values">
                                                    <a onclick="ManageCourseUnits()" id="manage_course_units" class="text-small no-margin">
                                                        Course Units
                                                    </a>
                                                </div>
                                            </li>


                                        </ul>
                                        <!-- end: MINI STATS WITH SPARKLINE -->
                                    </div>
                                </div>
                            </section>

                            <div class="container-fluid container-fullw padding-5 padding-bottom-0 bg-white">
                                <section  id="page-title" class="padding-top-5 padding-bottom-5 ">
                                    <div class="row">
                                        <ul class="pull-right">
                                            <button id="add-course-btn" onclick="OnclickaddCourseBtn()"  class=" btn btn-primary btn-o btn-sm"><i class="fa fa-plus">Add Course</i></button>
                                            <button id="add-course-fees-btn" onclick="OnClickAddFeeItemBtn()" class="btn btn-primary btn-sm glyphicon glyphicon-plus" style="display: none">Add Fee Item</button>
                                            <button id="view-courseStructure" onclick="showRequirementForm()" class="btn btn-grey btn-sm glyphicon glyphicon-user" style="display: none">Course Structure</button>

                                            <button id="course_unit_button" onclick="ShowCourseUnitForm()" class="btn btn-grey btn-sm glyphicon glyphicon-plus" style="display: none">Add Course Unit</button>
                                            <!--start  all save button-->


                                            <!--start delete button-->
                                            <button id="delete_course" onclick="deleteCourses()" class="btn btn-danger btn-sm glyphicon glyphicon-trash"></button>
                                        </ul>
                                    </div>
                                </section>

                                <div id="displayDiv" class="margin-top-10"> </div>
                                <!--start course table-->
                                <div class="table-responsive col-md-12" id="course-table">
                                    <table class="table table-striped table-bordered table-condensed table-hover table-full-width" id="course_info">
                                        <thead>
                                            <tr>
                                                <th>##</th>
                                                <th>Id</th>
                                                <th>Course Name</th>
                                                <th>Department</th>
                                                <th>Schools/Faculties</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="result" items="${courses.rows}">
                                            <tr>
                                                <td><input type="checkbox" id="id_checkbox" name="course_id" value="${result.id}" class="checkbox delete_course clip-check check-lg check-primary checkbox-inline"/></td>
                                                <td>${result.id}</td>
                                                <td><c:out value="${result.course_name}"/></td>
                                                <td><c:out value="${result.department_name}"/></td>
                                                <td><c:out value="${result.school_name}"/></td>
                                                <td><a href="#" class="edit-course" data-toggle="modal" data-target="#edit-item" >Edit</a></td>
                                                <td><a href="#" class="remove-course" value="${result.id}">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!--end course table--> 

                            <div class="col-md-12 col-sm-8 col-xs-4" id="course-form" style="display: none">
                                <fieldset>
                                    <legend>
                                        Add Courses
                                    </legend>

                                    <form action="" method="post"  id="course_info_form" >
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Course Name
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control" id="id_coursename"  placeholder="unit name" name="coursename">
                                                    </span>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Course Type
                                                    </label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <select class="form-control cs-selected" id="course_type"  name="courseType">
                                                                <c:forEach var="items" items="${type.rows}">
                                                                    <option value="${items.category_id}">${items.category_name}</option>
                                                                </c:forEach>
                                                            </select></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Campus Name
                                                    </label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <select class="form-control cs-selected js-example-placeholder-single js-states"  id="campusid" name="campusId">
                                                                <option value=""></option>
                                                                <c:forEach var="items" items="${campus.rows}">
                                                                    <option value="${items.campus_id}">${items.campus_name}</option>
                                                                </c:forEach>
                                                            </select></span>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Department
                                                    </label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <select class="form-control cs-selected" id="departmentid"  name="department" >
                                                                <option value="" disabled selected>Select a department</option>
                                                                <c:forEach var="items" items="${dept.rows}">
                                                                    <option value="${items.department_id}">${items.department_name}</option>
                                                                </c:forEach>
                                                            </select></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        School/Faculty
                                                    </label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <select class="form-control cs-selected"  id="schoolid" name="schoolid">
                                                                <c:forEach var="items" items="${school.rows}">
                                                                    <option value="${items.school_id}">${items.school_name}</option>
                                                                </c:forEach>
                                                            </select></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Course Duration
                                                    </label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <select class="form-control cs-selected"  id="schoolid" name="schoolid">
                                                                <option value="2">two years</option>
                                                                <option value="3">Three years</option>
                                                                <option value="4">four years</option>
                                                                <option value="5">five years</option>
                                                                <option value="7">seven years</option>
                                                            </select></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row col-md-offset-0">
                                            <div class="form-group">
                                                <label>
                                                    Course Description
                                                </label>
                                                <div class="form-group">
                                                    <span class="input-icon">
                                                        <textarea class="form-control" rows="5" name="description"  placeholder="Enter course description" id="course_description"></textarea>
                                                    </span>
                                                </div>
                                            </div>

                                            <!--   <div class="col-md-6">
                                                   <div class="form-group">
                                                       <label>
                                                           Course Description
                                                       </label>
                                                       <div class="form-group">
                                                           <span class="input-icon">
                                                               <textarea class="form-control" rows="5" name="description"  placeholder="Enter course description" id="course_description"></textarea>
                                                           </span>
                                                       </div>
                                                   </div>
                                               </div>-->

                                        </div>


                                        <div class="form-group">
                                            <div class="form-actions">
                                                <button type="submit" id="Submit_courseInfo_button"  class="btn btn-sm btn-azure btn-wide glyphicon glyphicon-saved pull-right  btn-o" >Save</button>
                                            </div>
                                        </div>

                                    </form>
                                </fieldset>

                            </div>
                            <!--end add courses-->



                            <!--start course fees tables-->
                            <div class="table-responsive" id="course_fee_table" style="display:none">
                                <table class="table table-striped table-bordered table-condensed table-hover table-full-width" id="fee_table" >
                                    <thead>
                                        <tr>
                                            <th width="5%">##</th>
                                            <th>Fee Amount</th>
                                            <th>Fee Item Name</th>
                                            <th>Semester of Study</th>
                                            <th>year of Study</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="row" items="${fee.rows}">
                                            <tr>
                                                <td class="hidden"><c:out value="${row.fee_item_id}"/></td>
                                                <td><input type="checkbox" class="checkbox clip-check check-lg check-primary checkbox-inline"/></td>
                                                <td><c:out value="${row.fee_amount}"/></td>
                                                <td><c:out value="${row.fee_item_name}"/></td>
                                                <td><c:out value="${row.semester_of_study}"/></td>
                                                <td><c:out value="${row.year_of_study}"/></td>

                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>

                            <!--end course fees table-->
                            <!--start course fees-->
                            <div id="course-fees_form" style="display: none">
                                <fieldset>
                                    <legend>
                                        Add Course Fees
                                    </legend>
                                    <form action="" id="course_fee_form"  method="POST">
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Fee Item Id
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control"  placeholder="" id="fee_id" name="itemId"></span>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Fee Item Name
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control"   placeholder="" id="itemName" name="itemName"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="amount">
                                                        Fees Amount 
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control" placeholder=""  requiered  id="amount" name="amount"></span>
                                                </div>
                                            </div>

                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Year Of Study
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" placeholder="" id="yrofstudy"  name="yrstudy"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Semester Of Study
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control" placeholder="" id="semodstudy"   name="semOfstudy"></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <button type="submit" id="Submit_course_fee_button" class="btn btn-o btn-sm pull-right btn-primary glyphicon glyphicon-saved ">Save</button>
                                        </div>


                                    </form>
                                </fieldset>

                            </div>

                            <!--end course fees-->
                            <!--start course unit table-->

                            <div id="course_unit_table" style="display: none">
                                <div class="col-md-12 table-responsive"  >
                                    <table class="table table-striped table-bordered table-condensed table-hover table-full-width" id="unit_table" >
                                        <thead>
                                            <tr>
                                                <th width="5%">##</th>
                                                <th>Unit Name</th>
                                                <th>Unit Code</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="row" items="${courseUnit.rows}">

                                                <tr>
                                                    <td><input type="checkbox"  value="${rows.unit_code}" class="checkbox clip-check check-primary check-md"</td>
                                                    <td><c:out value="${row.unit_name}"/></td>
                                                    <td><c:out value="${row.unit_code}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>

                            <div id="course_unit_form" style="display: none">
                                <fieldset>
                                    <legend>
                                        Add Course Units
                                    </legend>
                                    <form action="" method="post"  id="unit_form" >
                                        <div class="row col-md-offset-0">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Unit Name
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control" id="id_unitname"  placeholder="unit name" name="unitname">
                                                    </span>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>
                                                        Unit Code
                                                    </label>
                                                    <span class="input-icon">
                                                        <input type="text" class="form-control"  placeholder="unit code" id="id_unitcode"  name="unitcode" data-minlength="4" >
                                                    </span>
                                                    <div class="help-block">Minimum of 4 characters</div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-sm-offset-1">
                                                <div class="form-actions">
                                                    <!-- <button type="submit"  class="btn btn-azure pull-right btn-o">Submit<i class="fa fa-arrow-circle-o-right"></i></button>-->
                                                    <button type="submit" id="submit_courseUnit_button" class="btn btn-azure pull-right btn-o btn-wide glyphicon glyphicon-saved">Submit</button>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </fieldset>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit Item Modal -->

            <div class="modal fade edit-item" id="edit-item" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title" id="myModalLabel">Update Course Info</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" id="update_courses" method="POST">

                                <input type="" name="id" class="edit-id">
                                <div class="row col-md-offset-0">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                Course Name
                                            </label>
                                            <span class="input-icon">
                                                <input type="text" class="form-control" id="id_coursename"  placeholder="" name="coursename">
                                            </span>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                Course Type
                                            </label>
                                            <div class="form-group">
                                                <span class="input-icon">
                                                    <input type="text" class="form-control" id="id_coursetype"  placeholder="" name="coursetype">
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    <div class="row col-md-offset-0">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    School/Faculty
                                                                </label>
                                                                <span class="input-icon">
                                                                    <input type="text" class="form-control" id="id_school"  placeholder="" name="school">
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Department
                                                                </label>
                                                                <div class="form-group">
                                                                    <span class="input-icon">
                                                                        <input type="text" class="form-control" id="id_department"  placeholder="" name="department">
                                                                        </div>
                                                                        </div>
                                                                        </div>
                                                                        </div>
                                                                        <div class="row col-md-offset-0">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>
                                                                                        Course Description
                                                                                    </label>
                                                                                    <span class="input-icon">
                                                                                        <textarea class="form-control" id="id_description" name="description" rows="3"></textarea>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>
                                                                                        Course Duration
                                                                                    </label>
                                                                                    <div class="form-group">
                                                                                        <span class="input-icon">
                                                                                            <input type="text" class="form-control" id="id_department"  placeholder="" name="duration">
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <button type="submit" class="btn btn-success .update_course_button">Submit</button>
                                                                                            </div>
                                                                                            </form>

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

                                                                <script>
                                                jQuery(document).ready(function () {
                                                    Main.init();
                                                    FormWizard.init();
                                                });
                                                                </script>
                                                                <script src="js/jquery.dataTables.min.js"></script>
                                                                <script src="js/dataTables.tableTools.js"></script>



                                                                </body>
                                                                </html>

                                                                <script>
                                                $(document).ready(function () {
                                                    $('#course_info').dataTable({
                                                        // "bJQueryUI":true,
                                                        "pageLength": 10,
                                                        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "All"]],
                                                        "order": [[1, 'desc'], [2, 'asc']],
                                                        "sDom": 'T<"clear">lfrtip',
                                                        "tableTools": {
                                                            "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
                                                            "aButtons": [
                                                                "print",
                                                                {
                                                                    "sExtends": "collection",
                                                                    "sButtonText": "Save",
                                                                    "aButtons": ["csv", "xls", "pdf"]

                                                                }
                                                            ]
                                                        }
                                                    });
                                                });
                                                                </script>
                                                                <script>
                                                                    $(document).ready(function () {
                                                                        $('#fee_table').dataTable({
                                                                            // "bJQueryUI":true,
                                                                            "pageLength": 5,
                                                                            "aLengthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"]],
                                                                            "order": [[1, 'desc'], [2, 'asc']],
                                                                            "sDom": 'T<"clear">lfrtip',
                                                                            "tableTools": {
                                                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
                                                                                "aButtons": [
                                                                                    "print",
                                                                                    {
                                                                                        "sExtends": "collection",
                                                                                        "sButtonText": "Save",
                                                                                        "aButtons": ["csv", "xls", "pdf"]

                                                                                    }
                                                                                ]
                                                                            }
                                                                        });
                                                                    });


                                                                </script>


                                                                <script>
                                                                    $(document).ready(function () {
                                                                        $('#unit_table').dataTable({
                                                                            // "bJQueryUI":true,
                                                                            "pageLength": 10,
                                                                            "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "All"]],
                                                                            "order": [[1, 'desc'], [2, 'asc']],
                                                                            "sDom": 'T<"clear">lfrtip',
                                                                            "tableTools": {
                                                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
                                                                                "aButtons": [
                                                                                    "print",
                                                                                    {
                                                                                        "sExtends": "collection",
                                                                                        "sButtonText": "Save",
                                                                                        "aButtons": ["csv", "xls", "pdf"]

                                                                                    }
                                                                                ]
                                                                            }
                                                                        });
                                                                    });
                                                                </script>