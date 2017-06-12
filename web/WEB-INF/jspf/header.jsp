<%-- 
    Document   : header
    Created on : Apr 27, 2017, 6:57:46 AM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!-- start: TOP NAVBAR -->
        <header class="navbar navbar-default navbar-static-top">
            <!-- start: NAVBAR HEADER -->
            <div class="navbar-header">
                <a href="#" class="sidebar-mobile-toggler pull-left hidden-md hidden-lg" class="btn btn-navbar sidebar-toggle" data-toggle-class="app-slide-off" data-toggle-target="#app" data-toggle-click-outside="#sidebar">
                    <i class="ti-align-justify"></i>
                </a>
                <a class="navbar-default" href="#">

                </a>
                <a href="#" class="sidebar-toggler pull-right visible-md visible-lg" data-toggle-class="app-sidebar-closed" data-toggle-target="#app">
                    <i class="ti-align-justify"></i>
                </a>
                <a class="pull-right menu-toggler visible-xs-block" id="menu-toggler" data-toggle="collapse" href=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="ti-view-grid"></i>
                </a>
            </div>
            <!-- end: NAVBAR HEADER -->
            <!-- start: NAVBAR COLLAPSE -->

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-right">
                   
                    <li class="dropdown current-user">
                        <a href class="dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/images/media-user.png" class="img-circle" alt="${loggedInUser.firstname}"> <span class="username">${loggedInUser.username}<i class="fa fa-angle-down fa-4x"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-dark">
                            <li>
                                <a href="#">
                                    My Profile
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Change Password
                                </a>
                            </li>
                          
                            <li>
                                <a href="ApplicantLogout">
                                    Log Out
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- end: USER OPTIONS DROPDOWN -->
                </ul>
                <!-- end: MENU TOGGLER FOR MOBILE DEVICES -->
            </div>
        </header>
    </body>
</html>
