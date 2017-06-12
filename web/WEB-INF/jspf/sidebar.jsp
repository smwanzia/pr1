<%-- 
    Document   : sidebar
    Created on : Apr 27, 2017, 6:57:05 AM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- sidebar -->
        <div class="sidebar app-aside" id="sidebar">
            <div class="sidebar-container perfect-scrollbar">
                <nav>
                    <div class="navbar-title">
                        <span>Main Navigation</span>
                    </div>
                    <ul class="main-navigation-menu">
                        <li class="active open">
                            <a href="Dashboard.jsp">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-home"></i>
                                    </div>
                                    <div class="item-inner ">
                                        <span class="title text-bold">Home</span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="active open">
                            <a href="Users.jsp">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-group"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold">Users</span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="active open">
                            <a href="#">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-gear"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold">Settings</span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="active open">
                            <a href="#">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-files-o"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold"> Applications </span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="active open">
                            <a href="programs.jsp">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-money"></i>
                                    </div>
                                    <div class="item-inner fa-hover">
                                        <span class="title text-bold"> Programs</span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li  class="active open">
                            <a href="courses.jsp">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-map-marker"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold">Courses</span><i class="fa fa-arrow-right pull-right"></i>

                                    </div>
                                </div>
                            </a>
                        </li>
                        <li  class="active open">
                            <a href="#">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="fa fa-folder-open"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold">Reports</span><i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li  class="active open">
                            <a href="logout">
                                <div class="item-content">
                                    <div class="item-media">
                                        <i class="glyphicon glyphicon-log-out"></i>
                                    </div>
                                    <div class="item-inner">
                                        <span class="title text-bold">Logout</span> ( ${loggedInUser.email_address} ) <i class="fa fa-arrow-right pull-right"></i>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>
