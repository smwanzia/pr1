<%-- 
    Document   : Users
    Created on : Apr 28, 2017, 9:41:17 AM
    Author     : xmore mmohz
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource
    var="myDs" 
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coursemanager"
    user="root"
    password="degraP@55w0rd"
    />
<sql:query dataSource="${myDs}" var="users">
    SELECT user_id,username ,phone,email,first_name FROM user_account ORDER BY user_id
</sql:query>
<sql:query dataSource="${myDs}" var="roles">
    SELECT * FROM usergroups
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"></jsp:include>
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
                                        <h1 class="mainTitle">Users</h1>
                                    </div>
                                    <div class="values pull-right">
                                        <!-- start: MINI STATS WITH SPARKLINE -->
                                        <ul class="mini-stats pull-right hover">
                                            <li>
                                                <div class="sparkline-1">
                                                    <span ></span>
                                                </div>
                                                <div class="values">
                                                    <a onclick="manageUsers()" class="text-small no-margin">
                                                        Manage Users
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="values">
                                                    <a onclick="manageUserGroup()"  class="text-small no-margin">
                                                        User Group
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
                                            <button id="add_user_button" onclick="OnclickAddUserBtn()"  class=" btn btn-o btn-primary btn-sm" ><i class="fa fa-plus">Add User</i></button>
                                            <button id="delete_User_button" onclick="deleteUserAccount()" class="btn btn-default btn-sm glyphicon glyphicon-trash">Delete</button>
                                            <button onclick="OnclickAddUserGroupBtn()" id="Add_UserGroup_Button" class="btn btn-primary btn-wide btn-sm glyphicon glyphicon-user" style="display: none">Add Group</button>

                                            <!--start save buttons-->



                                        </ul>
                                    </div>
                                </section>
                                <!-- divs to display messages-->
                                <div id="MsgDiv">

                                </div>
                                <div id="showMsgDiv">

                                </div>
                                <!--start user table--> 
                                <div  class="table-responsive" id="users-table">
                                    <table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
                                        <thead>

                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>First Name</th>
                                        <th>Designation</th>
                                        <th>Phone Number</th>
                                        <th>Email ID</th>
                                        
                                       
                                        
                                        </thead>
                                    </table>
                                </div>
                                <!--end user table-->

                                <!--start user form-->

                                <div class="col-sm-8 col-md-12" id="user-form" style="display: none">
                                    <fieldset>
                                        <legend>Add User</legend>

                                        <form  id="form_user" method="post">
                                            <div class="col-md-12 col-sm-offset-0">
                                                <div class="row col-md-offset-0">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                First Name
                                                            </label>
                                                            <span class="input-icon">
                                                                <input type="text" class="form-control" placeholder="" id="firstname" name="firstname">
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>
                                                                PassWord
                                                            </label>
                                                            <span class="input-icon">
                                                                <input type="password" class="form-control" placeholder="" id="password" name="password">
                                                            </span>
                                                            <div class="help-block">Minimum of 6 characters</div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row col-md-offset-0">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                UserName 
                                                            </label>
                                                            <span class="input-icon">
                                                                <input type="text" class="form-control" placeholder="" id="username" name="username"></span>
                                                            <div id="divElement"></div>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                User Group 
                                                            </label>
                                                            <span class="input-icon">
                                                                <select name="role" id="role" name="role" class="form-control cs-selected" >
                                                                    <option value="" disabled selected>Select Role</option>
                                                                <c:forEach var="items"  items="${roles.rows}">
                                                                    <option>${items.group_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row col-md-offset-0">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                            Account Status
                                                        </label>
                                                        <div class="form-group">
                                                            <span class="input-icon">
                                                                <select class="js-example-basic-hide-search js-states form-control" name="status" id="status">
                                                                    <option></option>
                                                                    <option value="Active">Active</option>
                                                                    <option value="InActive">InActive</option>
                                                                </select></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                            Email Address 
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" placeholder="" id="email"  name="email">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-0">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Phone
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" id="phone" class="form-control" name="phoneNumber">
                                                        </span>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                            Last Name 
                                                        </label>
                                                        <span class="input-icon">
                                                            <input type="text" class="form-control" placeholder="" id="lastname"  name="lastname">
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-sm-8 col-sm-offset-1">
                                                <div class="form-actions">
                                                    <button type="submit" id="save_user_button" class="btn btn-light-azure btn-o btn-wide pull-right  btn-sm glyphicon glyphicon-saved" >Save</button>
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </fieldset>

                            </div>
                            <!--end users form--> 

                            <!--start usergroups-->
                            <div class="table-responsive" id="userGroup_table_div" style="display: none">
                                <table class="table table-striped table-bordered table-condensed table-hover table-full-width " id="user_group_table">
                                    <thead>
                                        <tr>
                                            <th>Group Id</th>
                                            <th>Group Name</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="group" items="${roles.rows}">
                                            <tr>
                                                <td><input type="checkbox" name="school_id" class="checkbox clip-check check-primary checkbox-inline"/>${group.groupId}</td>
                                                <td>${group.group_name}</td>
                                                <td>${group.status}</td>
                                                <td>Delete </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div  id="user_group_form_div" style="display: none">
                            <form  action="#" method="post"  id="useGroup_form" >
                                <div class="col-md-12 col-sm-offset-0">
                                    <div class="row col-md-offset-0">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>
                                                    Group Id
                                                </label>
                                                <input type="text" class="form-control" placeholder="" id="groupid" name="groupid">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>
                                                    Group Name
                                                </label>
                                                <input type="text" class="form-control" placeholder="" id="groupname" name="groupname">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-0">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>
                                                    Status
                                                </label>
                                                <select class="form-control" name="status" id="status">
                                                    <option><--select status--></option>
                                                    <option>Active</option>
                                                    <option>Inactive</option>

                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-11 col-sm-offset-1">
                                        <div class="form-group">
                                            <button type="submit" name="" value="action" class="btn btn-grey  btn-sm pull-right">Submit</button>

                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>



                        <!--end users role-->


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
            <!-- end: MAIN JAVASCRIPTS -->
            <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
            <script src="vendor/select2/select2.min.js"></script>
            <script src="vendor/DataTables/jquery.dataTables.min.js"></script>
            <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
            <!-- start: CLIP-TWO JAVASCRIPTS -->
            <script src="js/jquery.validate.min.js"></script>
            <script src="assets/js/main.js"></script>
            <!-- start: JavaScript Event Handlers for this page -->
            <script src="assets/js/table-data.js"></script>
            <script src="js/App.js"></script>
            <script src="js/jquery/jquery-confirm.min.js"></script>
            <script src="assets/js/form-elements.js"></script>
            <script>
                                                jQuery(document).ready(function () {
                                                    Main.init();
                                                    TableData.init();
                                                });
            </script>
            <script>
                $("#user_group_table").dataTable({
                    //"bJQueryUI": true,
                    "pageLength": 10,
                    "aLegthMenu": [[ 10, 15, 20, -1], [10, 15, 20, 'All']],
                    "order": [[1, 'desc'], [2, 'asc']]

                });

            </script>
            <script>
                jQuery(document).ready(function () {
                    Main.init();
                    FormElements.init();
                    FormValidator.init();
                });
            </script>


    </body>

</html>
