<%-- 
    Document   : Register
    Created on : Apr 27, 2017, 11:53:52 AM
    Author     : xmore mmohz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"></jsp:include>
        </head>
        <body style="background-color:#666666">
            <div class="row">
                <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                    <div class="logo margin-top-30">

                    </div>
                    <div id="displayMsg"></div>
                    <div id="displayStudentMsg"></div>
                    <!-- start: REGISTER BOX -->
             
                ${msg}
                <div class="box-register">

                    <form class="form-register" id="form_register" method="post" action="ApplicantRegister" class="box-register">

                        <p>
                            Enter your personal details below:
                        </p>
                        <div class="form-group">
                            <span class="input-icon help-block">
                                <input type="text" class="form-control" id="id_firstname" name="firstname" placeholder="First Name">
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" id="id_lastname" name="lastname" placeholder="lastname">
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" id="id_phonnumber" name="phoneNumber" placeholder="Phone Number">
                            </span>
                        </div>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" id="id_username" name="username" placeholder="username">
                            </span>
                        </div>
                        <p>
                            Enter your account details below:
                        </p>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" id="id_email" name="email" placeholder="Email">
                                <i class="fa fa-envelope"></i> </span>
                        </div>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="password" class="form-control" id="id_password" name="password" placeholder="Password">
                                <i class="fa fa-lock"></i> </span>
                        </div>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="password" class="form-control" id="id_password_again" name="password_again" placeholder="Password Again">
                                <i class="fa fa-lock"></i> </span>
                        </div>
                        <div class="form-group">
                            <div class="checkbox clip-check check-primary">
                                <input type="checkbox" id="agree" value="agree" name="">
                                <label for="agree">
                                    I agree
                                </label>
                            </div>
                        </div>
                        <div class="form-actions">
                            <p>
                                Already have an account?
                                <a href="login.jsp">
                                    Log-in
                                </a>
                            </p>
                            <button type="submit"   class="btn btn-primary pull-right">
                                Register <i class="fa fa-arrow-circle-right"></i>
                            </button>

                        </div>
                        </fieldset>
                    </form>
                    <!-- start: COPYRIGHT -->
                    <div class="copyright">
                        &copy; <span class="current-year"></span><span class="text-bold text-uppercase"> Tum 2017</span>. <span>All rights reserved</span>
                    </div>
                    <!-- end: COPYRIGHT -->
                </div>
                <!-- end: REGISTER BOX -->
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


        <script src="js/form-wizard.js"></script>
        <script src="js/App.js"></script>

    </body>
</html>
