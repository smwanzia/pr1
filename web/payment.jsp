<%-- 
    Document   : payment
    Created on : May 20, 2017, 12:57:50 PM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>payment</title>
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
                                        <fieldset>
                                            <legend>Select payment option</legend>
                                            <div class="row">
                                                <p>The application fee is non-refudable of 2500/= for PhD <br> 1500/= for Masters ,1000/= for Bachelors and , <br>
                                                    500/= for Diploma and Certificates courses <br>
                                                    Fees must be paid in accordance with fee schedule through the below bank account or Mpesa</p>
                                                <hr>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                    ${pMsg}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <a href="#" id="banking_payment_option"><h4>Banking Details</h4></a> 
                                                <div id="baking_details" style="display: none">
                                                    <fieldset>
                                                        <legend>
                                                            banking details
                                                        </legend>
                                                        <form action="Payment" method="Post">
                                                            <input type="hidden" name="paymentMode" value="banking">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>
                                                                            Bank Name<span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="bank name" class="form-control" name="bankName"/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label">
                                                                            Branch <span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="" class="form-control" name="branch"/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>
                                                                            Account number<span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="" class="form-control" name="accountNo"/>
                                                                    </div>

                                                                </div>
                                                                <div class="form-group">
                                                                    <button class="btn btn-azure btn-wide btn-o pull-right">Pay</button>
                                                                </div>
                                                            </div>
                                                        </form>


                                                    </fieldset>
                                                </div>

                                            </div>
                                            <div class="col-md-6">
                                                <a href=""><h4>Mpesa Payment Option</h4></a> 
                                                <div id="baking_details">
                                                    <fieldset>
                                                        <legend>
                                                            Mpesa Details
                                                        </legend>
                                                        <form action="Payment" method="Post">
                                                            <input type="hidden" name="paymentMode" value="mpesa">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>
                                                                            Phone Number<span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="" class="form-control" name="phoneNumber"/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label">
                                                                            Amount <span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="your branch" class="form-control" name="amount"/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>
                                                                            Business Number<span class="symbol required"></span>
                                                                        </label>
                                                                        <input type="text" placeholder="" class="form-control" name="businessNumber"/>
                                                                    </div>

                                                                </div>
                                                                <div class="form-group">
                                                                    <button class="btn btn-azure btn-wide btn-o pull-right">Pay</button>
                                                                </div>
                                                            </div>

                                                        </form>

                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

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
