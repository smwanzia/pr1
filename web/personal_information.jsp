<%-- 
    Document   : personal_information
    Created on : Apr 27, 2017, 7:04:54 AM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="stylesheet" href="assets/css/themes/theme-5.css" />
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.src.js"></script>
        <!-- end: CLIP-TWO CSS -->
        <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
        <!--               <script src="js/jquery/jquery.js" type="text/javascript"></script>
                        <script src="js/ajaxjquey/jquery.js" type="text/javascript"></script>-->
        <link href="js/css/jquey.css" rel="stylesheet" type="text/css" />
        <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
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
                                    <h1 class="mainTitle">Dashboard</h1>
                                </div>
                                <div class="values pull-right">
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="search-classic">
                                                    <form action="StudentSearch" method="POST">
                                                        <div class="input-group">
                                                            <input type="text" autocomplete="off" class="form-control tooltips input-sm" placeholder="Student Search..." id="reg_number" name="reg_number" required="">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-primary btn-sm" type="submit" name="search">
                                                                    <i class="fa fa-search"></i> Search
                                                                </button> </span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </section>

                        <div class="container-fluid container-fullw padding-5 padding-bottom-0 bg-white">
                            <div class="table-responsive col-md-12">
                            <table id="personal_info" class="display table-bordered table-striped text-large text-dark" cellspacing="0" width="100%">
                               <thead>
                                    <tr>
                                        <th>National Id</th>
                                        <th>Applicant Name</th>
                                        <th>Gender</th>
                                        <th>Nationality</th>
                                        <th>Marital Status</th>
                                        <th>State</th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="offer" items="${offers.rows}">
                                <tr>
                                    <td><c:out value="${offer.id}"/></td>
                                <td><c:out value="${offer.category}"/></td>
                                <td><c:out value="${offer.target}"/></td>
                                <td><c:out value="${offer.description}"/></td>
                                <td><c:out value="${offer.period}"/></td>
                                <td><c:out value="${offer.state}"/></td>
                             
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
                                <jsp:include page="/WEB-INF/jspf/footer.jsp"></jsp:include>
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
        $('#personal_info').dataTable({
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