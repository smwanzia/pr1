/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#banking_payment_option").click(function () {
    $("#baking_details").show();
});


//submit intake info details
$("#submit_course_selected").click(function () {
    var courseid = $("#courseid").val();
    var intakename = $("#intake_name").val();
    var startdate = $("#startdate").val();
    var enddate = $("#enddate").val();
    var academicyear = $("#academic_year").val();


    $.ajax({
        method: "Post",
        url: "ProcessIntake",
        data: {
            courseid: courseid,
            academicyear: academicyear,
            enddate: enddate,
            startdate: startdate,
            intakeName: intakename
        },
        success: function (data) {
            if (data == "success") {
                window.setTimeout(function () {
                    $(".MsgDiv").delay(5000);
                    $("#messageDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Success!!database updated successfully...</strong></div>");
                    window.location = "payment.jsp";
                }, 2000);

            } else {
                $("#messageDiv").delay(5000);
                $('.MsgDiv').html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! Occurred,while upadating database,contact system admin..</strong></div>");

            }
        }
    });
});


function FetchAllCourses() {
    $("#All_courses_div").show();
    $.ajax({
        method: "POST",
        url: "Select_All_Courses",
        dataType: "json",
        success: function (responseJson) {
            if (responseJson != null) {
                $("#Display_courses_table").find("tr:gt(0)").remove();
                var table1 = $("#Display_courses_table");
                $.each(responseJson, function (key, value) {
                    var id = value.courseId;
                    var rowNew = $("<tr><td></td><td></td></tr>");
                    //rowNew.children().eq(0).text(value['courseId']);
                    rowNew.children().eq(0).text(value['coursename']);
                    rowNew.children().eq(1).text(value['schoolId']);
                    rowNew.append("<a id='apply_button' class='' href='Process_Course?courseId= " + value.courseId + "'>Apply</a>");
                    rowNew.appendTo(table1);
                    //alert();
                });
            }
        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
}
FetchAllCourses();
$("#bachelor_Programmes").click(function () {
    //$("#bachelor_tables").show();
    $("#All_courses_div").show();
    $.ajax({
        method: "POST",
        url: "Select_Bachelor_Courses",
        dataType: "json",
        success: function (responseJson) {
            if (responseJson != null) {
                $("#Display_courses_table").find("tr:gt(0)").remove();
                var table1 = $("#Display_courses_table");
                $.each(responseJson, function (key, value) {
                    var rowNew = $("<tr><td></td><td></td></tr>");
                    //rowNew.children().eq(0).text(value['']);
                    rowNew.children().eq(0).text(value['coursename']);
                    rowNew.children().eq(1).text(value['schoolId']);
                    rowNew.append("<a class='btn btn-success btn-sm' href='Process_Course?courseId="+value.courseId+"'>Apply</a>");
                    rowNew.appendTo(table1);
                });
                // $("#All_courses_div").hide();

            }


        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
});


$("#PhD_Programmes").click(function () {
    // $("#certificate_tables_div").show()
    //$("#bachelor_tables").show();
    //$("#All_courses_div").show();
    $.ajax({
        method: "POST",
        url: "Select_Masters_Courses",
        dataType: "json",
        success: function (responseJson) {
            if(responseJson != null) {
                $("#Display_courses_table").find("tr:gt(0)").remove();
                var table1 = $("#Display_courses_table");
                $.each(responseJson, function (key, values) {
                    var rowNew = $("<tr><td></td><td></td></tr>");
                    //rowNew.children().eq(0).text(value['']);
                    rowNew.children().eq(0).text(values['coursename']);
                    rowNew.children().eq(1).text(values['schoolId']);
                    rowNew.append("<a id='apply_button' class='' href='Process_Course?courseId=" + values.courseId + "'>Apply</a>");
                    rowNew.appendTo(table1);
                });
            }


        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
});
$("#Masters_Programmes").click(function () {
    // $("#certificate_tables_div").show()
    //$("#bachelor_tables").show();
    //$("#All_courses_div").show();
    $.ajax({
        method: "POST",
        url: "Select_Masters_Courses",
        dataType: "json",
        success: function (responseJson) {
            if(responseJson != null) {
                $("#Display_courses_table").find("tr:gt(0)").remove();
                var table1 = $("#Display_courses_table");
                $.each(responseJson, function (key, values) {
                    var rowNew = $("<tr><td></td><td></td></tr>");
                    //rowNew.children().eq(0).text(value['']);
                    rowNew.children().eq(0).text(values['coursename']);
                    rowNew.children().eq(1).text(values['schoolId']);
                    rowNew.append("<a id='apply_button' class='' href='Process_Course?courseId=" + values.courseId + "'>Apply</a>");
                    rowNew.appendTo(table1);
                });
            }


        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
});
$("#Certificate_Programmes").click(function () {
    // $("#certificate_tables_div").show()
    //$("#bachelor_tables").show();
    //$("#All_courses_div").show();
    $.ajax({
        method: "POST",
        url: "Select_Diploma_Courses",
        dataType: "json",
        success: function (responseJson) {
            if(responseJson != null) {
                $("#Display_courses_table").find("tr:gt(0)").remove();
                var table1 = $("#Display_courses_table");
                $.each(responseJson, function (key, values) {
                    var rowNew = $("<tr><td></td><td></td></tr>");
                    //rowNew.children().eq(0).text(value['']);
                    rowNew.children().eq(0).text(values['coursename']);
                    rowNew.children().eq(1).text(values['schoolId']);
                    rowNew.append("<a id='apply_button' class='' href='Process_Course?courseId=" + values.courseId + "'>Apply</a>");
                    rowNew.appendTo(table1);
                });
            }


        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
});
function confirmDialogBox() {

    $.confirm({
        theme: 'dark',
        title: 'Delete user?',
        content: 'This dialog will automatically trigger \'cancel\' in 6 seconds if you don\'t respond.',
        autoClose: 'cancelAction|8000',
        buttons: {
            deleteUser: {
                text: 'delete user',
                action: function () {
                    $.alert('Deleted the user!');
                }
            },
            cancelAction: function () {
                $.alert('action is canceled');
            }
        }
    });
}

/*
 * 
 * student create account using ajax
 */


function CheckIfUsernameExist(e) {
    $("#username").keyup(function () {
        var username = $(this).val();
        if (username.length >= 3) {
            $.ajax({
                method: "post",
                url: "CheckUserNameExist",
                //dataType:"json",
                data: {
                    username: username
                },
                success: function (result) {
                    var divElement = $("#divElement");
                    if (result == "username Exist") {
                        divElement.text(username + " is already in user,Try another one");
                        divElement.css('color', "red");
                        e.preventDefault();
                    } else {
                        divElement.text();
                        divElement.css('color', "red");
                    }
                },
                error: function (err) {
                    alert(err)
                }
            });
        }
    });
}
CheckIfUsernameExist();
/*
 * 
 * start managing applicant 
 * 
 * 
 */
//applicant create account

$("#applicant_submit_button").click(function () {

    $("#form_register").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                minlength: 5,
                required: true
            },
            password_again: {
                minlegth: 5,
                required: true
            },
            firstname: {
                required: true
            },
            email: {
                required: true
            },
            phoneNumber: {
                required: true
            },
            lastname: {
                required: true
            },
        },
        messages: {
            email: {
                required: "please enter your email address",
            },
            phoneNumber: {
                required: "Enter your phone number",
            },
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
        },
        submitHandler: function (form) {
            $.ajax({
                url: "",
                method: "post",
                beforeSend: function () {
                    $("#displayMsg").html("<h4 style='color:red'>Loading ,please wait</h4>")
                },
                timeout: 1000,
                data: $(forms).serialize(),
                success: function (result) {
                    if (result == "success") {

                        $("#id_email").val("");
                        $("password").val("");
                        window.setTimeout(function () {
                            $("#displayStudentMsg").delay(1000);
                            $("#displayStudentMsg").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Congratulation!! Account was successfully created, wait you will be directed shortly...</strong></div>");
                            window.location = "login.jsp";
                        }, 1500);
                    } else if (result == "no match") {
                        $("#displayStudentMsg").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! password does not match ,use correct password...</strong></div>");
                    }
                    else {
                        $("#id_email").val("");
                        $("password").val("");
                        $("#displayStudentMsg").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! While Creating account ,Try again later...</strong></div>");
                    }
                },
                error: function (jqhr, status, error_thrown) {
                    alert("The following errors Occurred :TextStatus = +status+", "ErrorThrown = +error_thrown+");
                }
            });
        }
    });
});
/*
 * 
 * 
 * end student or applicant create account
 */


/*
 * 
 * start managing Users information
 */
function OnclickAddUserBtn() {
    $("#users-table").hide();
    $("#users-role").hide();
    $("#delete_User_button").hide();
    $("#add_user_button").hide();
    $("#save_user_button").show();
    $("#user-form").show({
    }, 1000);
}

function OnclickAddUserGroupBtn() {
    $("#users-table").hide();
    $("#users-role").hide();
    $("#delete_User_button").hide();
    $("#add_user_button").hide();
    $("#save_user_button").hide();
    $("#user-form").hide();
    $("#delete_User_button").hide();
    $("#userGroup_table_div").hide();
    $("#user_group_form_div").show('slow');
}

function manageUserGroup() {
    $("#delete_User_button").hide();
    $("#add_user_button").hide();
    $("#Add_UserGroup_Button").show();
    $("#users-table").hide();
    $("#user-form").hide();
    $("#userGroup_table_div").show({
    }, 2000);
}
function manageUsers() {
    $("#add_user_button").show();
    $("#Add_UserGroup_Button").hide();
    $("#delete_User_button").show();
    $("#users-table").show();
    $("#AddUserGroupBtn").hide();
    $("#user-form").hide();
    $("#user_group_form_div").hide();
    $("#userGroup_table_div").hide();
}



function fetchUsersAccount() {

    $.ajax({
        method: "POST",
        url: "SelectUsers",
        dataType: "json",
        success: function (responseJson) {
            if (responseJson != null) {
                $("#sample_1").find("tr:gt(0)").remove();
                var table1 = $("#sample_1");
                $.each(responseJson, function (key, value) {
                    var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                    rowNew.children().eq(0).text(value['userId']);
                    rowNew.children().eq(1).text(value['username']);
                    rowNew.children().eq(2).text(value['firstname']);
                    rowNew.children().eq(3).text(value['roles']);
                    rowNew.children().eq(4).text(value['phone_number']);
                    rowNew.children().eq(5).text(value['email_address']);
                    rowNew.append("<a href='#' " + value.userId + "'  id='remove_user' onclick='deleteUserAccount()' class='btn btn-warning btn-sm'>Delete</a>");
                    rowNew.appendTo(table1);
                });
            }


        },
        error: function (Jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus=+status+", "ErrorThrown = +error_thrown+");
        }

    });
}
fetchUsersAccount();
/*
 * 
 * Add user details to database
 */
$("#save_user_button").click(function () {

    $("#form_user").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                minlength: 6,
                required: true
            },
            firstname: {
                required: true
            },
            status: {
                required: true
            },
            role: {
                required: true
            },
            email: {
                required: true
            },
            phoneNumber: {
                required: true
            },
            lastname: {
                required: true
            },
        },
        messages: {
            email: {
                required: "please enter your email address",
            },
            phoneNumber: {
                required: "Enter your phone number",
            },
        },
        submitHandler: function (form) {
            $.ajax({
                method: "post",
                url: "addUser",
                // beforeSend: function () {
                //  $("#MsgDiv").html("<h4 style='color:red'>loading,please wait..</h4>");
                // },
                timeout: 10000,
                data: $(form).serialize(),
                success: function (result) {
                    //clear form field on successfull sending of data
                    $("#username").val("");
                    $("#password").val("");
                    if (result == "success") {

                        $("#showMsgDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Success!! Data Successfully added...</strong></div>");
                        $("#users-table").show();
                        $("#user-form").hide();
                    } else if (result == "validationError") {
                        $("#showMsgDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! Make sure are field are filled..</strong></div>");
                    }
                    else {
                        $("#showMsgDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! Occured  While Updating Database ...Try Again</strong></div>");
                    }
                },
                error: function (Jqhr, TextStatus, ErrorThrown) {
                    alert("The following errors were found with the query: TextStatus =" + TextStatus + ", ErrorThrown = " + ErrorThrown);
                }
            });
        }


    });
});
/* Remove Item */

$("body").on("click", "#remove_user_account", function () {

    var id = $(this).parent("td").data('id');
    var c_obj = $(this).parents("tr");
    $.ajax({
        dataType: 'json',
        type: 'POST',
        url: 'deleteUser',
        data: {id: id}
    }).done(function (data) {
        c_obj.remove();
        toastr.success('Item Deleted Successfully.', 'Success Alert', {timeOut: 5000});
        getPageData();
    });
});
function deleteUserAccount() {
    if (confirm("Are you sure you want to delete this?")) {
        var id = [];
        $(":checkbox:checked").each(function (i) {
            id[i] = $(this).val();
        });
        if (id.length === 0) {//tell if array is empty
            alert("please select atleast one checkbox");
        }
        else {
            $.ajax({
//make ajax call to delete selected item
                url: "DeleteUser",
                method: "post",
                beforeSend: function () {
                    $("#MsgDiv").html("<h4 style='color:red'>loading,please wait..</h4>");
                },
                timeout: 1000,
                data: {
                    id: id
                },
                success: function (result) {
                    if (result == "success") {
                        //show success message and refresh user table
                        $("#showMsgDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Success!! Data Successfully added...</strong></div>");
                    } else {
                        $("#showMsgDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>\n\
                    <strong>Error!! Occured  While Updating Database ...Try Again</strong></div>");
                    }
                },
                error: function (Jqhr, TextStatus, ErrorThrown) {
                    alert("The following errors were found with the query: TextStatus =" + TextStatus + ", ErrorThrown = " + ErrorThrown);
                }
            });
        }
    }

}


/*
 * 
 * End managing users info
 */


/*
 start managing departments,schools and campuses
 */
//on clicking department id to perfom the following action
function manageDepartments() {
    $("#save_campus_button").hide();
    $("#add_school_btn").hide();
    $("#add_campus_btn").hide();
    $("#add_department_btn").show();
    $("#add_campus_btn").hide();
    $("#campus-table").hide();
    $("#department_form_div").hide();
    $("#school_form_div").hide();
    //show department table to to update data
    $("#school_table").hide();
    $("#campus_form_div").hide();
    $("#SaveDeparmenDetails").hide();
    $("#department_table_div").show();
}
//function on click to display deparment table and save data
function onClickShowDepartmetForm() {
    $("#save_campus_button").hide();
    $("#save_school_button").hide();
    $("#save_campus_button").hide();
    $("#add_campus_btn").hide();
    $("#add_school_btn").hide();
    $("#school_table").hide();
    $("#department_table_div").hide();
    $("#campus_table").hide();
    $("#add_department_btn").show();
    $("#SaveDeparmenDetails").show();
    $("#department_table_div").hide();
    $("#department_form_div").show({
//add some animation
    }, 1000);
}

//add new department
$("#Save_department_button").click(function () {

    $("#department_form_info").validate({
        rules: {
            departmentname: {
                required: true
            },
            departmentId: {
                minlength: 4,
                required: true
            },
            description: {
                required: true
            },
            facultyid: {
                required: true
            },
        },
        messages: {
            departmentname: {
                required: "please department name",
            },
            departmentId: {
                required: "please department id required",
            },
        },
        submitHandler: function (form) {
            $.ajax({
                method: "POST",
                url: "AddDepartment",
                data: $(form).serialize(),
                success: function (data) {
                    if (data == "success") {
                        $("#showDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                        $("#department_table_div").show();
                    } else {
                        $("#showDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
                        $("#dept_Id").val("");
                        $("#dept_name").val("");
                        $("#department_form").show();
                    }
                },
                error: function (jqhr, status, error_thrown) {
                    alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
                }
            });
        }
    });
});
/*
 * manage schools 
 */
function manageSchools() {
    $("#add_school_btn").show();
    $("#SaveDeparmenDetails").hide();
    $("#add_campus_btn").hide();
    $("#add_department_btn").hide();
    $("#campus-table").hide();
    $("#school_form_div").hide();
    $("#save_campus_button").hide();
    //show school table to to update data
    $("#school_table").show();
    $("#department_table_div").hide();
    $("#department_form_div").hide();
    $("#save_school_button").hide();
    $("#campus_form_div").hide();
}





function AddSchoolDetails() {
//get form data
    // validateSchoolForm()
    var campusId = $("#camp_id").val();
    var school_id = $("#school_id").val();
    var schoolname = $("#school_name").val();
    var desc = $("#description").val();
    if (campusId != "" || school_id != '' || desc != '' || schoolname != '') {
        $.ajax({
            method: "POST",
            URL: "AddSchools",
            data: {
                "school_id": school_id,
                "campus_id": campusId,
                "description": desc,
                "schoolname": schoolname

            },
            success: function (data) {
                if (data == "success") {
                    $("#showDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                    $("#school_table").show();
                } else {
                    $("#showDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
                }
            },
            error: function (jqhr, status, error_thrown) {
                alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
            }
        });
    } else {
        alert("all field are required");
    }

}
//write a function on click to display form and save data to database

function OnClickSchoolBtn() {
//hide unncessary btn
    $("#add_campus_btn").hide();
    $("#add_department_btn").hide();
    $("save_campus_button").hide();
    $("#save_campus_button").hide();
    $("#save_school_button").hide();
    $("#school_table").hide();
    $("#department_table_div").hide();
    $("#save_school_button").show();
    $("#school_form_div").show({
//add animation
    });
}
/*
 * manage campuses
 */


function manageCampuses() {
    $("#add_school_btn").hide();
    $("#add_campus_btn").hide();
    $("#add_department_btn").hide();
    $("#department_form_div").hide();
    $("#add_campus_btn").show();
    $("#school_form_div").hide();
    //show department table to to update data
    $("#school_table").hide();
    $("#department_table_div").hide();
    $("#campus_form_div").hide();
    $("#save_campus_button").hide();
    $("#campus-table").show({
    }, 1000);
}
// a function that on click  to display campus form
function onClickShowCampusForm() {
//hide all button and show required buttons
    $("#add_school_btn").hide();
    $("#school_table").hide();
    $("#department_table_div").hide();
    $("#campus_table").hide();
    $("#add_department_btn").hide();
    $("#department_table_div").hide();
    $("#campus-table").hide();
    $("#save_campus_button").show();
    $("#save_school_button").hide();
    $("#SaveDeparmenDetails").hide();
    $("#add_campus_btn").show();
    $("#campus_form_div").show({
    }, 1000);
}

$("#save_campus_info_button").click(function () {
    //validate the form before submiting data
    $("#campus_form").validate({
        rules: {
            campusName: {
                required: true
            },
            campusId: {
                minlength: 4,
                required: true
            },
            description: {
                required: true
            },
        },
        messages: {
            campusName: {
                required: "please enter campus name",
            },
            campusId: {
                required: "please campus id is required",
            },
        },
        submitHandler: function (form) {
            $.ajax({
                url: "AddCampus",
                method: "post",
                data: $(form).serialize(),
                success: function (data) {
                    if (data == "success") {
                        $("#showDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                        $("#campus-table").show();
                    } else {
                        $("#showDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
                    }
                },
                error: function (jqhr, status, error_thrown) {
                    alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
                }
            });
        }

    });
});
function AddCampusesDetails() {
    var campusid = $("#campusid").val();
    var campusname = $("#campusname").val();
    var campusDesc = $("#desc").val();
    $.ajax({
        method: "POST",
        url: "AddCampus",
        data: {
            description: campusDesc,
            campusname: campusname,
            campusid: campusid
        }
        ,
        success: function (data) {
            if (data == "success") {
                $("#showDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                $("#campus-table").show();
            } else {
                $("#showDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
            }
        },
        error: function (jqhr, status, error_thrown) {
            alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
        }
    });
}
/*
 * manage course fees
 */

function ManageCourseFees() {
    $("#course-table").hide();
    $("#add-course-btn").hide();
    $("#course-fees_form").hide();
    $("#course-form").hide();
    $("#add-course-fees-btn").show();
    $("#save_course_button").hide();
    $("#course_unit_form").hide();
    $("#course_unit_table").hide();
    $("#course_unit_button").hide();
    $("#save_course_fee_button").hide();
    $("#course_fee_table").show({
    }, 1000);
}




//onclick add fee item btn to display fee form
function OnClickAddFeeItemBtn() {
    $("#course-table").hide();
    $("#add-course-btn").hide();
    $("#course-form").hide();
    $("#add-course-fees-btn").hide();
    $("#course_unit_button").hide();
    $("#course_fee_table").hide();
    $("#save_course_button").hide();
    $("#save_course_fee_button").show();
    $("#course-fees_form").show({
    }, 1000);
}

//function to add course fees to daatabase

$("#Submit_course_fee_button").click(function () {

    $("#course_fee_form").validate({
        rules: {
            itemName: {
                required: true
            },
            itemId: {
                minlength: 4,
                required: true
            },
            amount: {
                required: true
            },
            yrstudy: {
                required: true
            },
            semOfstudy: {
                required: true
            },
        },
        messages: {
            itemName: {
                required: "please enter unit name",
            },
            itemId: {
                required: "please unit code is required",
            },
        },
        submitHandler: function (form) {
            //send using ajax if form is well validated 
            $.ajax({
                url: "AddCourseFees",
                method: "POST",
                data: $(form).serialize(),
                success: function (data) {
                    if (data == "success") {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                        // $("#displayDiv").fadeOut('slow');
                        $("#course_fee_table").show('slow');
                        $("#course-fees_form").hide();
                        //show course table

                    } else if (data == "validate") {
                        alert("plese fill all the fields");
                    }

                    else {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
                    }

                },
                error: function (jqhr, status, error_thrown) {
                    alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
                }
            });
        }
    });
});
/*
 * 
 * starrt a  managing courses 
 * add,delete and update is done here
 * 
 * 
 */
//function onclick manage course btn to display course details
function ManageCourses() {
    $("#course-table").show();
    $("#add-course-btn").show();
    $("#add-course-fees-btn").hide();
    $("#course-form").hide();
    $("#course_fee_table").hide();
    $("#course-fees_form").hide();
    $("#save_course_fee_button").hide();
    $("#save_course_button").hide();
    $("#course_unit_form").hide();
    $("#course_unit_button").hide();
    $("#course_unit_table").hide();
}

//function on click add course btn to display course form

function OnclickaddCourseBtn() {
    $("#course-form").show({
    }, 2000);
    $("#course-table").hide();
    $("#course_unit_button").hide();
    $("#save_course_fee_button").hide();
    $("#save_course_button").show();
}

//on update coursess
$("body").on("click", ".edit-course", function () {
    var id = $(this).parent("td").data('id');
    var coursename = $(this).parent("td").prev("td").text();
    var department = $(this).parent("td").prev("td").prev("td").text();
    var schoolname = $(this).parent("td").prev("td").text();
    var duration = $(this).parent("td").prev("td").text();
    var description = $(this).parent("td").prev("td").prev("td").prev("td").text();
    $("#edit-item").find("input[name='coursename']").val(coursename);
    $("#edit-item").find("textarea[name='description']").val(description);
    $("#edit-item").find("input[name='school']").val(schoolname);
    $("#edit-item").find("input[name='department']").val(department);
    $("#edit-item").find("input[name='id']").val(id);
});
/* Updated courses */

$(".update_course_button").click(function (e) {
    e.preventDefault();
    var form_action = $("#edit-item").find("form").attr("action");
    var courseName = $("#edit-item").find("input[name='coursename']").val();
    var description = $("#edit-item").find("textarea[name='description']").val();
    var courseType = $("#edit-item").find("input[name='coursetype']");
    var department = $("#edit-item").find("input[name='department']");
    var duration = $("#edit-item").find("input[name='duration']");
    var school = $("#edit-item").find("input[name='school']");
    var id = $("#edit-item").find(".edit-id").val();
    if (courseName != '' || description != '' || department != '' || duration != '') {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: 'UpdateCourses',
            data: {courseName: courseName, description: description, id: id}
        }).done(function (data) {
            getPageData();
            $(".modal").modal('hide');
            toastr.success('Item Updated Successfully.', 'Success Alert', {timeOut: 5000});
        });
    } else {
        alert('You are missing title or description.');
    }
});
/* Remove Item */

$("body").on("click", ".remove-course", function () {

    //var id = $(this).parent("td").data('id');
    var id = $(this).data("id");
    var c_obj = $(this).parents("tr");
    bootbox.confirm("Are you sure want to delete this ", function (result) {
        if (result == true) {
            $.ajax({
                dataType: 'json',
                type: 'POST',
                url: url + 'api/delete.php',
                data: {id: id}
            }).done(function (data) {
                c_obj.remove();
                toastr.success('Item Deleted Successfully.', 'Success Alert', {timeOut: 5000});
            });
        } else {
            return false;
        }
    });
});
//a function to delete courses
function deleteCourses() {

    if (confirm("Are you sure you want to delete this?")) {

        var id = [];
        $(":checkbox:checked").each(function () {
            id.push($(this).val()); //get an array of id and loop them
        });
        if (id.length === 0) {
            alert("please select atleast one checkbox");
        } else {
//make an ajax call
            $.ajax({
                method: "POST",
                url: "deleteCourses",
                data: "id=" + JSON.stringify(id),
                success: function (result) {
                    if (result == "success") {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close\n\
                    ' data-dismiss='alert' onclick='closeMsgBox'>$times;</a>\n\
                       <strong>Success!Data was successfully deleted</strong></div>").fadeOut('slow');
                        $("#course-table").show();
                        for (var i = 0; i < id.length; i++) {
                            $('tr#' + id[i] + '').css('background-color', '#ccc');
                            $('tr#' + id[i] + '').fadeOut('slow');
                        }
                    } else {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close\n\
                    ' data-dismiss='alert' onclick='closeMsgBox'>$times;</a>\n\
                       <strong>Error!Occure while updating database,Contact System Administrator</strong></div>").fadeOut('slow');
                    }

                },
                error: function (jqhr, status, error_thrown) {
                    alert("the following error occured, status=" + status + ",error_thrown=" + error_thrown);
                }
            });
        }
    } else {
        return false;
    }
}

//delete course data and remove a row

/*
 * 
 * Add new courses info to db
 */
$("#Submit_courseInfo_button").click(function () {
    //validate the form before submiting data
    $("#course_info_form").validate({
        rules: {
            coursename: {
                required: true
            },
            courseType: {
                required: true
            },
            campusId: {
                required: true
            },
            department: {
                required: true
            },
            schoolid: {
                required: true
            },
            description: {
                required: true
            },
        },
        messages: {
            coursename: {
                required: "please enter course name",
            },
            campusId: {
                required: "please  select campus id ",
            },
        },
        submitHandler: function (form) {
            $.ajax({
                method: "POST",
                url: "CreateCourses",
                data: $(form).serialize(),
                success: function (data) {

                    if (data == "success") {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>").fadeOut('slow');
                        // $("#displayDiv").fadeOut('slow');

                        $("#course-table").show();
                        $("#course-form").hide();
                        //show course table

                    } else if (data == "validate all") {
                        alert("Error: please fill all field");
                    }

                    else {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database..please contact system admin</strong> </div>");
                    }
                },
                error: function (jqhr, status, error_thrown) {
                    alert("The following error occured: status=" + status, "error_thrown=" + error_thrown);
                }
            });
        }

    });
});
/*
 * 
 * end course Adding course info to db
 */



/*
 * 
 * 
 * start course units 
 * onclick managecourseunitbtn to show unit table
 */
function ManageCourseUnits() {
    $("#course_unit_table").show('slow');
    $("#course_unit_button").show();
    $("#course-table").hide();
    $("#add-course-btn").hide();
    $("#add-course-fees-btn").hide();
    $("#course-form").hide();
    $("#course_fee_table").hide();
    $("#course-fees_form").hide();
    $("#save_course_fee_button").hide();
    $("#save_course_button").hide();
    $("#course_unit_form").hide();
    //show required form

}

function ShowCourseUnitForm() {
    $("#course-table").hide;
    $("#add-course-btn").hide();
    $("#add-course-fees-btn").hide();
    $("#course-form").hide();
    $("#course_fee_table").hide();
    $("#course-fees_form").hide();
    $("#save_course_fee_button").hide();
    $("#save_course_button").hide();
    //show required form
    $("#course_unit_form").show();
    $("#course_unit_table").hide();
}


/*
 * 
 * submit course units data
 */

$("#submit_courseUnit_button").click(function () {
    //validate the form before submiting data
    $("#unit_form").validate({
        rules: {
            unitname: {
                required: true
            },
            unitcode: {
                minlength: 4,
                required: true
            },
        },
        messages: {
            unitname: {
                required: "please enter unit name",
            },
            unitcode: {
                required: "please unit code is required",
            },
        },
        submitHandler: function (form) {
            $.ajax({
                url: "AddCourseUnit",
                method: "post",
                data: $(form).serialize(),
                success: function (result) {
                    if (result == "success") {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Success! Data Successfully Added..</strong> </div>");
                        // $("#displayDiv").fadeOut('slow');
                        $("#course_unit_table").show('slow');
                        //show course table
                    } else {
                        $("#displayDiv").html("<div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'\n\
                    data-dismiss='alert' onclick='closeMsgBox'>&times</a>\n\
                <strong>Error! Occured while updating database,please contact system admin</strong> </div>");
                        $("#id_unitname").val("");
                        $("#id_unitcode").val("");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });
        }

    });
});
/*
 * 
 * 
 * End Managing course units
 */