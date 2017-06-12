<%-- 
    Document   : Dashboard
    Created on : May 5, 2017, 5:51:53 PM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"/>
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
                                    <h1 class="mainTitle">Home</h1>
                                </div>

                            </div>
                        </section>

                        <div class="container-fluid container-fullw padding-5 padding-bottom-0 ">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="col-sm-4">
                                        <div class="panel panel-white no-radius text-center">
                                            <div class="panel-body">
                                                <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-smile-o fa-stack-1x fa-inverse"></i> </span>
                                                <h2 class="StepTitle">Manage Users</h2>
                                                <p class="text-small">
                                                    To add users, you need to be signed in as the super user.
                                                </p>
                                                <p class="links cl-effect-1">
                                                    <a href="Users.jsp">
                                                        view more
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="panel panel-white no-radius text-center">
                                            <div class="panel-body">
                                                <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-paperclip fa-stack-1x fa-inverse"></i> </span>
                                                <h2 class="StepTitle">Manage Courses</h2>
                                                <p class="text-small">
                                                    The Manage Courses tool provides a view of all courses.
                                                </p>
                                                <p class="cl-effect-1">
                                                    <a href="courses.jsp">
                                                        view more
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="panel panel-white no-radius text-center">
                                            <div class="panel-body">
                                                <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
                                                <h2 class="StepTitle">Manage Programs</h2>
                                                <p class="text-small">
                                                    The Manage Programs tool provides a view of all programs
                                                </p>
                                                <p class="links cl-effect-1">
                                                    <a href="programs.jsp">
                                                        view more
                                                    </a>
                                                </p>
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
                                                        FormWizard.init();
                                                    });
        </script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.tableTools.js"></script>
    </body>
</html>
