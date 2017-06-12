<%-- 
    Document   : home
    Created on : Apr 27, 2017, 11:14:14 AM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"></jsp:include>
            <link href="vendor/DataTables/css/DT_bootstrap.css" rel="stylesheet" media="screen">
            <link href="js/css/jquery-ui.css" rel="stylesheet" media="screen">
        </head>
        <body>
        <jsp:include page="/WEB-INF/jspf/header.jsp"/>

        <div class="row">
            <div class="col-md-12 col-md-offset-1 col-sm-6 col-xs-4 col-xs-1 margin-top-20 padding-top-10">
                <div class="container">
                    <section>
                        <div class="ImagePreviewBox img-responsive" style="margin-left: -40px">
                            <img src="images/tum7.JPG"  width="1000px" height="240px"> 
                        </div>
                    </section>
                </div>

            </div>
        </div>


        <div class="row">
            <div class="col-md-12 col-md-offset-1 col-sm-10 col-sm-offset-3 col-xs-12 col-xs-offset-1">
                <div class="container">
                    <section >
                        <div class="content" style="margin-left: -40px">
                            <h3 class="over-title margin-bottom-15 margin-top-20"><span class="text-bold">Welcome to the Technical University Of Mombasa Online Course Application Portal</span></h3>
                            <h4>
                                Congratulations on taking the first step towards achieving your educational goals.
                            </h4>
                            <div class="row">
                                <div class="col-md-9">
                                    <p2>
                                        In order to keep track of your application, we need to first set you up with an account. Please use the Register feature to set up your account.
                                        You will be required to enter some basic information, including your email address and to choose a password. We will then send you an email to the address you entered, so that we can validate your account.
                                        When you have clicked on the validation link (sent to you in the email), you will be able to log in to the application system using the "Login" box below
                                        For instructions on how to apply click here
                                    </p2>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-5 col-md-offset-0 col-sm-6 col-sm-offset-2 col-xs-12 col-xs-offset-1 margin-left-10" style="margin-top: 50px"  >
                                    <a href="login.jsp" class="btn btn-azure form-control">Login</a>
                                </div>
                                  <div class="col-md-5 col-md-offset-0 col-sm-6 col-sm-offset-2 col-xs-12 col-xs-offset-1" style="margin-top: 50px">
                                    <a href="Register.jsp" class="btn form-control btn-azure">Register</a>
                                </div>
                            </div>
                            
                            <div class="row">
                                <h4 class="margin-top-20"><a href=""></a></h4>
                                <button type="button" id="course-offered-btn" onclick="showCoursesOffered()" class="btn btn-beige">Check Courses Offered</button>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-10 col-sm-10 col-xs-12" id="program-tab" style="display: none">
                                    <div class="tabbable pills">
                                        <ul id="myTab3" class="nav nav-pills margin-top-30">
                                            <li class="active">
                                                <a href="#myTab3_example1" data-toggle="tab">
                                                    Bachelors
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#myTab3_example2" data-toggle="tab">
                                                    Masters
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#myTab3_example3" data-toggle="tab">
                                                    Doctor Of Philosophy(PhD)
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#myTab3_example3" data-toggle="tab">
                                                    Post Graduate Diploma
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#myTab3_example3" data-toggle="tab">
                                                    Diplomas
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#myTab3_example3" data-toggle="tab">
                                                    Certificates
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="tab-content ">
                                            <div class="tab-pane fade in active" id="myTab3_example1">
                                                <div class="table-responsive col-sm-12 col-md-12 col-xs-12" >
                                                    <table id="program_info" class="display table-bordered table-striped table-hover text-large text-dark" cellspacing="0" width="100%">
                                                        <thead>
                                                            <tr>
                                                                <th>##</th>
                                                                <th>Programme Name</th>
                                                                <th>Schools/Faculties/Institute</th>
                                                                <th>Intake Name</th>
                                                                <th>Academic Year</th>
                                                                <th>Application Deadline</th>
                                                                <th>Reporting Date</th>
                                                                <th>Programme Requirements</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="result" items="${courses.rows}">
                                                            <tr>
                                                                <td>1</td>
                                                                <td>Btech ICT</td>
                                                                <td>school of Engineering</td>
                                                                <td>January intake</td>
                                                                <td>2017</td>
                                                                <td>2/2/2017</td>
                                                                <td>2/2/2017</td>
                                                                <td>view</td>


                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                            <div class="tab-pane fade" id="myTab3_example2">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo.
                                                </p>
                                                <p>
                                                    Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.
                                                </p>
                                            </div>
                                            <div class="tab-pane fade" id="myTab3_example3">
                                                <p>
                                                    Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.
                                                </p>
                                                <p>
                                                    Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
        </div>

        <footer class="margin-top-30 padding-20" style="background: #efefef">
            <div class="row">
                <div class="container">
                    <div class="col-md-4  col-sm-3 col-xs-2">
                        <p>fdgfdgfd</p>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-2">
                        <p>fdgfdgfd</p>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-2">
                        <p>fdgfdgfd</p>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="container" text-align="center">
                    &copy; <span class="current-year"></span><span class="text-bold text-uppercase"> Technical University Of Mombasa</span>. <span>All rights reserved</span>
                </div>
            </div>
        </footer>


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
        <script src="js/jquery/jquery-ui.js"></script>

    </body>
    <script>
        $(document).ready(function () {
            $('#program_info').dataTable({
                //"bJQueryUI": true,
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
       function showCoursesOffered(){
           $("#course-offered-btn").click(function(){
               $("#program-tab").show('slow');
           });
       }
    </script>
</html>
