<%-- 
    Document   : Applicant_profile
    Created on : May 28, 2017, 12:29:33 AM
    Author     : xmore mmohz
--%>


<%@page import="business.ApplicantAccount"%>
<%@page import="business.PersonalInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile </title>
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

        <%
            PersonalInformation UserAccount = (PersonalInformation) session.getAttribute("UserAccount");
            ApplicantAccount loggedInUser = (ApplicantAccount) session.getAttribute("loggedInUser");
            if (loggedInUser == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        %>
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
                                        <h1 class="mainTitle padding-bottom-0"> </h1>
                                    </div>
                                </div>
                            </section>

                            <div class="container-fluid container-fullw padding-5 padding-bottom-0 ">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable">
                                            <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#panel_overview">
                                                        My Account
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="#panel_edit_account">
                                                        Personal Information
                                                    </a>
                                                </li>

                                            </ul>
                                            <div class="tab-content">
                                                <div id="panel_overview" class="tab-pane fade in active">
                                                    <div class="row">
                                                        <div class="col-sm-5 col-md-4">
                                                            <div class="user-left">
                                                                <div class="center">
                                                                    <h4> Welcome ${UserAccount.lastname} ${UserAccount.username}</h4>
                                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                                    <div class="user-image">
                                                                        <div class="fileinput-new thumbnail"><img src="assets/images/avatar-1-xl.jpg" alt="">
                                                                        </div>
                                                                        <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                                                        <div class="user-image-buttons">
                                                                            <span class="btn btn-azure btn-file btn-sm"><span class="fileinput-new"><i class="fa fa-pencil"></i></span><span class="fileinput-exists"><i class="fa fa-pencil"></i></span>
                                                                                <input type="file" name="userImage">
                                                                            </span>
                                                                            <a href="#" class="btn fileinput-exists btn-red btn-sm" data-dismiss="fileinput">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div class="social-icons block">
                                                                    <ul>
                                                                        <li data-placement="top" data-original-title="Twitter" class="social-twitter tooltips">
                                                                            <a href="http://www.twitter.com" target="_blank">
                                                                                Twitter
                                                                            </a>
                                                                        </li>
                                                                        <li data-placement="top" data-original-title="Facebook" class="social-facebook tooltips">
                                                                            <a href="http://facebook.com" target="_blank">
                                                                                Facebook
                                                                            </a>
                                                                        </li>
                                                                        <li data-placement="top" data-original-title="Google" class="social-google tooltips">
                                                                            <a href="http://google.com" target="_blank">
                                                                                Google+
                                                                            </a>
                                                                        </li>
                                                                        <li data-placement="top" data-original-title="LinkedIn" class="social-linkedin tooltips">
                                                                            <a href="http://linkedin.com" target="_blank">
                                                                                LinkedIn
                                                                            </a>
                                                                        </li>
                                                                        <li data-placement="top" data-original-title="whatapp" class="social-instagram tooltips">
                                                                            <a href="http://whatapp.com" target="_blank">
                                                                                Instagram
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <hr>
                                                            </div>
                                                            <table class="table table-condensed">
                                                                <thead>
                                                                    <tr>
                                                                        <th colspan="3">Contact Information</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>email:</td>
                                                                        <td>
                                                                            <a href="">
                                                                                ${UserAccount.email}
                                                                            </a></td>
                                                                        <td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>phone:</td>
                                                                        <td>${UserAccount.phonenumber}</td>
                                                                        <td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-7 col-md-8">
                                                        <div class="row space20">
                                                            ${pMsg}
                                                            <div class="col-md-12">
                                                                <fieldset>
                                                                    <legend>
                                                                        Change PassWord
                                                                    </legend>
                                                                    <form action="ChangePassword" method="POST" >
                                                                        <input type="hidden" class="form-control" name="userid"value="${UserAccount.id}"
                                                                               <div class="form-group">
                                                                            <labe>
                                                                                Username
                                                                            </labe>
                                                                            <input type="text" class="form-control" name="username" value="${userAccount.username}" readonly="">
                                                                            <div class="form-group">
                                                                                <label>New PassWord</label>
                                                                                <input type="password" name="password" class="form-control" placeholder="Enter new password" id="password">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Confirm PassWord</label>
                                                                                <input type="password" name="confirmpassword" class="form-control" placeholder="Confirm new password" id="ConfirmPassword">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <button type="submit" class="btn btn-info pull-right">Reset<i class="fa fa-arrow-circle-left"></i></button> 
                                                                            </div>

                                                                    </form>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="panel_edit_account" class="tab-pane fade">
                                                <form action="#" role="form" id="form">
                                                    <div class="row">
                                                        <input type="hidden" placeholder="firstname" value="${userAccount.userId}" class="form-control" id="firstname" name="userId">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    UserName
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Contact Address
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    First Name
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${UserAccount.firstname}" class="form-control" id="firstname" name="firstname">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Last Name
                                                                </label>
                                                                <input type="text" placeholder="lastname"  value="${UserAccount.lastname}" class="form-control" id="lastname" name="lastname">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Email Address
                                                                </label>
                                                                <input type="email" placeholder="simo@example.com" value="${UserAccount.email}" class="form-control" id="email" name="email">
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Phone
                                                                </label>
                                                                <input type="email" placeholder="0714......" value="${UserAccount.phonenumber}" class="form-control" id="phone" name="">
                                                            </div>

                                                        </div>     
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Gender
                                                                </label>
                                                                <div class="clip-radio radio-primary">

                                                                    <input type="radio" value="male" name="gender" id="us-male" checked>
                                                                    <label for="us-male">
                                                                        Male
                                                                    </label>

                                                                    <input type="radio" value="female" name="gender" id="us-female">
                                                                    <label for="us-female">
                                                                        Female
                                                                    </label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    First Name
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Last Name
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname" readonly="" name="userId">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    National Id
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname" name="userId">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Nationality 
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    County
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    District
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Town
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    Marital Status
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">
                                                                    DOB
                                                                </label>
                                                                <input type="text" placeholder="firstname" value="${userAccount.username}" class="form-control" id="firstname"  name="userId">
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <p>
                                                                By clicking UPDATE, you are agreeing to the Policy and Terms &amp; Conditions.
                                                            </p>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <button class="btn btn-primary pull-right" type="submit">
                                                                Update <i class="fa fa-arrow-circle-right"></i>
                                                            </button>
                                                        </div>
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
    <script src="assets/js/main.js"></script>
    <script src="js/App.js"></script>
    <script>
        jQuery(document).ready(function () {
            Main.init();

        });
    </script>
</body>
</html>

