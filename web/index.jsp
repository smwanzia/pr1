<%-- 
    Document   : index
    Created on : Apr 8, 2016, 5:02:06 PM
    Author     : Geoffrey
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
    <!--<![endif]-->
    <!-- start: HEAD -->
    <head>
        <title></title>
        <!-- start: META -->
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
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


        <script src="vendor/bootstrap-datepicker/bootstrap-datepicker3.min.css"></script>
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

    </head>

</head>
<!-- end: HEAD -->
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
                        <!-- start: WIZARD FORM -->
                        <div class="row">
                            <div class="col-md-12">
                                <!-- start: WIZARD FORM -->
                                <form action="ProcessApplicantData" role="form" class="smart-wizard" id="form" method="post">
                                    <div id="wizard" class="swMain">
                                        <!-- start: WIZARD SEPS -->
                                        <ul style="margin-top:-10px">
                                            <li>
                                                <a href="#step-1">
                                                    <div class="stepNumber">
                                                        1
                                                    </div>
                                                    <span class="stepDesc"><small>Personal Information </small></span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#step-2">
                                                    <div class="stepNumber">
                                                        2
                                                    </div>
                                                    <span class="stepDesc"> <small> Education Background </small></span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#step-3">
                                                    <div class="stepNumber">
                                                        3
                                                    </div>
                                                    <span class="stepDesc"> <small> Working Experience </small> </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-4">
                                                    <div class="stepNumber">
                                                        4
                                                    </div>
                                                    <span class="stepDesc"> <small> SponsorShip</small> </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-5">
                                                    <div class="stepNumber">
                                                        5
                                                    </div>
                                                    <span class="stepDesc"> <small> Complete </small> </span>
                                                </a>
                                            </li>

                                        </ul>

                                        <!-- end: WIZARD STEPS -->
                                        <!-- start: WIZARD STEP 1 -->
                                        <div id="step-1">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>Personal Information</legend>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        First Name <span class="symbol required"></span>
                                                                    </label>
                                                                    <span class="input-icon">
                                                                        <input type="text" value="${loggedInUser.firstname}" class="form-control" name="firstname"/></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="control-label">
                                                                        Middle Name <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" value="${loggedInUser.lastname}" class="form-control" name="middlename"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="block">
                                                                        Gender
                                                                    </label>
                                                                    <div class="clip-radio radio-primary">
                                                                        <input type="radio" id="wz-female" name="gender" value="female">
                                                                        <label for="wz-female">
                                                                            Female
                                                                        </label>
                                                                        <input type="radio" id="wz-male" name="gender" value="male">
                                                                        <label for="wz-male">
                                                                            Male
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        D.O.B <span class="symbol required"></span>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="text" value="" class="form-control" name="DOB"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        ID/Passport No: <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" value="" class="form-control" name="idNo"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Marital Status <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="maritalStatus"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="control-label">
                                                                        Religion <span class="symbol required"></span>
                                                                    </label>
                                                                    <div class="form-group">
                                                                        <select class="cs-selected form-control" name="religion">
                                                                            <option></option>
                                                                            <option value="cristianity">Christianity</option>
                                                                            <option value="Muslim"> Muslim</option>
                                                                            <option value="Budhaism">Budhaism</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Contact Address <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="Enter your phone no:" class="form-control" name="contactAddress"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Choose your County
                                                                    </label>
                                                                    <input type="text" placeholder="Enter your county:" class="form-control" name="county"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <p>
                                                            <a href="javascript:void(0)" data-content="Your personal information is not required for unlawful purposes, but only in order to verify your course application " data-title="Don't worry!" data-placement="top" data-toggle="popover">
                                                                Why do you need my personal information?
                                                            </a>
                                                        </p>

                                                        <div class="row">

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Nationality
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="nationality"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Town <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="town"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        District
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="district"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-o next-step btn-wide pull-right">
                                                                Next <i class="fa fa-arrow-circle-right"></i>
                                                            </button>
                                                        </div>
                                                    </fieldset>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end wizard step 1-->
                                        <div id="step-2">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            Education Details
                                                        </legend>

                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Institution Attended<span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="Institution name" class="form-control" name="institutionName"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="control-label">
                                                                        Qualification/Attained <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="grade scored" class="form-control" name="qualification"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Index No/Old RegNo:<span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="indexNo"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Year From<span class="symbol required"></span>
                                                                    </label>
                                                                    <div class="form-group">
                                                                        <select class="cs-selected form-control" name="yearFrom">
                                                                            <option value="">&nbsp;</option>
                                                                            <option value="2015">2015</option>
                                                                            <option value="2014">2014</option>
                                                                            <option value="2013">2013</option>
                                                                            <option value="2012">2012</option>
                                                                            <option value="2011">2011</option>
                                                                            <option value="2010">2010</option>
                                                                            <option value="CT">2009</option>
                                                                            <option value="DE">2008</option>
                                                                            <option value="FL">2007</option>
                                                                            <option value="GA">2006</option>
                                                                            <option value="HI">2005</option>
                                                                            <option value="ID">2004</option>
                                                                            <option value="IL">2003</option>
                                                                            <option value="IN">2002</option>
                                                                            <option value="IA">2001</option>
                                                                            <option value="KS">2000</option>
                                                                            <option value="KY">1999</option>
                                                                            <option value="LA">1998</option>
                                                                            <option value="ME">1997</option>
                                                                            <option value="MD">1996</option>
                                                                            <option value="MA">1995</option>
                                                                            <option value="MI">1994</option>
                                                                            <option value="MN">1993</option>
                                                                            <option value="MS">1992</option>
                                                                            <option value="MO">1991</option>
                                                                            <option value="MT">1990</option>
                                                                            <option value="NE">1989</option>
                                                                            <option value="NV">1988</option>
                                                                            <option value="NH">1987</option>
                                                                            <option value="NJ">1986 </option>
                                                                            <option value="NM">1985</option>
                                                                            <option value="NY">1984</option>
                                                                            <option value="NC">1983</option>
                                                                            <option value="ND">1982</option>
                                                                            <option value="OH">1981</option>
                                                                            <option value="OK">1980</option>
                                                                            <option value="OR">1979</option>
                                                                            <option value="PA">1978</option>
                                                                            <option value="RI">1977</option>
                                                                            <option value="SC">1976</option>
                                                                            <option value="SD">1975</option>
                                                                            <option value="TN">1974</option>
                                                                            <option value="TX">1973</option>
                                                                            <option value="UT">1972</option>
                                                                            <option value="VT">1971</option>
                                                                            <option value="VA">1970</option>
                                                                            <option value="WA">1969</option>
                                                                            <option value="WV">1968</option>
                                                                            <option value="WI">1967</option>
                                                                            <option value="WY">1966</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Year To
                                                                    </label>
                                                                    <select class="form-control" name="yearTo">
                                                                        <option value="">&nbsp;</option>
                                                                        <option value="2015">2015</option>
                                                                        <option value="2014">2014</option>
                                                                        <option value="2013">2013</option>
                                                                        <option value="2012">2012</option>
                                                                        <option value="2011">2011</option>
                                                                        <option value="2010">2010</option>
                                                                        <option value="CT">2009</option>
                                                                        <option value="DE">2008</option>
                                                                        <option value="FL">2007</option>
                                                                        <option value="GA">2006</option>
                                                                        <option value="HI">2005</option>
                                                                        <option value="ID">2004</option>
                                                                        <option value="IL">2003</option>
                                                                        <option value="IN">2002</option>
                                                                        <option value="IA">2001</option>
                                                                        <option value="KS">2000</option>
                                                                        <option value="KY">1999</option>
                                                                        <option value="LA">1998</option>
                                                                        <option value="ME">1997</option>
                                                                        <option value="MD">1996</option>
                                                                        <option value="MA">1995</option>
                                                                        <option value="MI">1994</option>
                                                                        <option value="MN">1993</option>
                                                                        <option value="MS">1992</option>
                                                                        <option value="MO">1991</option>
                                                                        <option value="MT">1990</option>
                                                                        <option value="NE">1989</option>
                                                                        <option value="NV">1988</option>
                                                                        <option value="NH">1987</option>
                                                                        <option value="NJ">1986 </option>
                                                                        <option value="NM">1985</option>
                                                                        <option value="NY">1984</option>
                                                                        <option value="NC">1983</option>
                                                                        <option value="ND">1982</option>
                                                                        <option value="OH">1981</option>
                                                                        <option value="OK">1980</option>
                                                                        <option value="OR">1979</option>
                                                                        <option value="PA">1978</option>
                                                                        <option value="RI">1977</option>
                                                                        <option value="SC">1976</option>
                                                                        <option value="SD">1975</option>
                                                                        <option value="TN">1974</option>
                                                                        <option value="TX">1973</option>
                                                                        <option value="UT">1972</option>
                                                                        <option value="VT">1971</option>
                                                                        <option value="VA">1970</option>
                                                                        <option value="WA">1969</option>
                                                                        <option value="WV">1968</option>
                                                                        <option value="WI">1967</option>
                                                                        <option value="WY">1966</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Course Studient<span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="courseStudient"/>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Name Of Certificate<span class="symbol required"></span>
                                                                    </label>
                                                                </div>
                                                                <input type="text" class="form-control" name="certifcateName" placeholde="kcse certificate,kasneb,knec">
                                                            </div>

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label class="block">
                                                                        Do you Have Any physical Challenge
                                                                    </label>
                                                                    <div class="checkbox clip-check check-primary checkbox-inline">
                                                                        <input type="checkbox" id="checkbox4" value="Yes" name="physicalChallenge" checked="">
                                                                        <label for="checkbox4">
                                                                            Yes
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox clip-check check-primary checkbox-inline">
                                                                        <input type="checkbox" id="checkbox5" value="No" name="physicalChallenge">
                                                                        <label for="checkbox5">
                                                                            No
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Upload Kcse Certificate<span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="file" placeholder="scanned copy of kcse certificate" class="form-control" name=""/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Birth Certificate<span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="file" placeholder="" class="form-control" name=""/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </fieldset>
                                                    <div class="form-group">
                                                        <button class="btn btn-primary btn-o back-step btn-wide pull-left">
                                                            <i class="fa fa-circle-arrow-left"></i> Back
                                                        </button>
                                                        <button class="btn btn-primary btn-o next-step btn-wide pull-right">
                                                            Next <i class="fa fa-arrow-circle-right"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end: WIZARD STEP 2 -->
                                        <!--end wizard step 3-->
                                        <div id="step-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            Working Experience
                                                        </legend>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Name Of Organization <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="organisationName"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>
                                                                        Post Held <span class="symbol required"></span>
                                                                    </label>
                                                                    <input type="text" placeholder="" class="form-control" name="postHeld"/>
                                                                </div>
                                                            </div>
                                                        </div>   
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>From  <span class="symbol required"></span>
                                                                    </label>
                                                                </div>  
                                                                <input type="Date" id="from_date" name="from" class="form-control">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>To <span class="symbol required"></span>
                                                                    </label>
                                                                </div>  
                                                                <input type="Date" id="to_date" name="To" class="form-control">
                                                            </div>


                                                        </div>
                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-o back-step btn-wide pull-left">
                                                                <i class="fa fa-circle-arrow-left"></i> Back
                                                            </button>
                                                            <button  action="submit" class="btn  btn-o next-step btn-primary btn-o  pull-right" >
                                                                Next
                                                            </button>
                                                        </div>

                                                    </fieldset>


                                                </div>

                                            </div>
                                        </div>

                                        <!--endwizard step -3-->

                                        <!--start wizard step -4-->
                                        <div id="step-4">
                                            <div class="row">
                                                <fieldset>
                                                    <legend>
                                                        SPONSORSHIP
                                                    </legend>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Name Of Sponsor <span class="symbol required"></span>
                                                                </label>
                                                                <input type="text" placeholder="" class="form-control" name="sponsorName"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Address of Sponsor <span class="symbol required"></span>
                                                                </label>
                                                                <input type="text" placeholder="" class="form-control" name="Address"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Town<span class="symbol required"></span>
                                                                </label>
                                                                <input type="text" placeholder="" class="form-control" name="town"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Phone Number
                                                                </label>
                                                                <input type="text" placeholder="" class="form-control" name="phoneNumber"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>
                                                                    Fax<span class="symbol required"></span>
                                                                </label>
                                                                <input type="text" placeholder="" class="form-control" name="fax"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <button class="btn btn-primary btn-o back-step btn-wide pull-left">
                                                            <i class="fa fa-circle-arrow-left"></i> Back
                                                        </button>
                                                        <button  action="submit" class="btn btn-primary btn-o  pull-right" >
                                                            submit 
                                                        </button>
                                                    </div>
                                                </fieldset>

                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- end: WIZARD STEPS -->

                <!-- end: WIZARD FORM -->
            </div>
        </div>
    </div>






    <!-- start: MAIN JAVASCRIPTS -->
    <script src="js/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="js/jquery.validate.min.js"></script>
    <script src="vendor/jquery-smart-wizard/jquery.smartWizard.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CLIP-TWO JAVASCRIPTS -->
    <script src="assets/js/main.js"></script>
    <!-- start: JavaScript Event Handlers for this page -->
    <script src="assets/js/form-wizard.js"></script>
    <script src="assets/js/form-validation.js"></script>
    <script>
        jQuery(document).ready(function () {
            Main.init();
            FormWizard.init();

            $("#from_date").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: 365,
                mindate: -3650,
                dateFormat: "MM dd, yy",
                numberOfMonths: 1
            });
            $("#to_date").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: 365,
                mindate: -3650,
                dateFormat: "MM dd, yy",
                numberOfMonths: 1
            });

        });
    </script>



</body>
</html>

