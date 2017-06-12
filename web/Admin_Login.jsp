<%-- 
    Document   : Admin_Login
    Created on : May 17, 2017, 2:43:40 PM
    Author     : xmore mmohz
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:include page="/WEB-INF/jspf/quick_Links.jsp"></jsp:include>
        </head>
        <body style="background-color:#666666" >
            <!-- start: LOGIN -->
            <div class="row text-dark">
                <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">


                    <!-- start: LOGIN BOX -->
                    <div class="box-login text-dark">
                        <div class="row">
                            <div class="login-image col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-md-offset-4">
                                <!--   <img src="images/tum2.jpg" alt="Technical University Of Mombasa" height="120px" width="130px"/>-->

                            </div>
                            <!--  <div class=" col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 margin-top-20">
                                  <h3 class="text-dark text-capitalize text-large">Welcome ! Please Sign In </h3> <br>
                                  <p>Online Course Application</p>
                              </div>-->

                        </div>
                        <div class="row">
                            <div class="error margin-left-20">
                            ${Msg}
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-dark">
                            <form role="form" action="AdminLogin" method="POST" id="login_Form">
                                <div class="form-group form-actions">

                                    <div class="col-sm-10 col-md-offset-1">
                                        <span class="input-icon">
                                            <input type="text" placeholder="Username" id="username" name="username" class="form-control ">
                                            <i class="fa fa-user"></i> 
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-10 col-md-offset-1">
                                        <span class="input-icon">
                                            <input type="password" placeholder="Password" id="password" name="password" class="form-control ">
                                            <i class="fa fa-lock"></i>
                                        </span>

                                    </div>
                                </div>

                                <div class="form-actions">
                                    <!--  <div class="checkbox clip-check check-primary margin-top-5 col-md-offset-1">
                                          <input type="checkbox" id="remember" value="1">
                                          <label for="remember">
                                              Keep me signed in
                                          </label>
                                      </div>-->
                                    <button type="submit"  id="login" class="btn btn-primary pull-right">
                                        Login <i class="fa fa-arrow-circle-right"></i>
                                    </button>
                                </div>

                            </form>
                        </div>
                    </div>
                    <!-- start: COPYRIGHT -->
                    <div class="copyright">
                        &copy; <span class="current-year"></span><span class="text-bold text-capitalize"> Tum ,</span>. <span>All rights reserved</span>
                    </div>
                    <!-- end: COPYRIGHT -->
                </div>
                <!-- end: LOGIN BOX -->
            </div>
        </div>

        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- start: MAIN JAVASCRIPTS -->
        <!-- end: LOGIN -->
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

        <script>
            $('#login_Form').validate({
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        minlength: 5,
                        required: true
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                errorPlacement: function (error, element) {
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        </script>
    </body>


</html>
