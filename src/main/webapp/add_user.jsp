<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add User</title>
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="assets/css/toggle.css">
        <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">
        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/js/jquery.waypoints.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <!--        <script src="assets/js/pages/users.js"></script>-->
        <script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>
        <script type="text/javascript">
            function checkPasswords() {
                var password = document.getElementById('txtPassword');
                var conf_password = document.getElementById('txtrPassword');

                if (password.value !== conf_password.value) {
                    conf_password.setCustomValidity('Passwords do not match');
                } else {
                    conf_password.setCustomValidity('');
                }
            }

        </script> 
    </head>
    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">

                    <!-- BEGIN SIDEBAR MENU -->         
                    <%@include file="/_includes/sidebar_menu.jsp"%>
                    <!-- END SIDEBAR MENU -->		
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <nav class="navbar navbar-header navbar-expand navbar-light">
                    <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
                    <button class="btn navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                            <li class="dropdown nav-icon">
                                <a href="#" data-bs-toggle="dropdown"
                                   class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                    <div class="d-lg-inline-block">
                                        <i data-feather="bell"></i><span class="badge bg-info">2</span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-menu-large">
                                    <h6 class='py-2 px-4'>Notifications</h6>
                                    <ul class="list-group rounded-none">
                                        <li class="list-group-item border-0 align-items-start">
                                            <div class="row mb-2">
                                                <div class="col-md-12 notif">
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>John Doe</h6>
                                                        <p class='text-xs'>
                                                            applied for leave at 05-21-2021
                                                        </p></a>
                                                </div>
                                                <div class="col-md-12 notif">
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>Jane Doe</h6>
                                                        <p class='text-xs'>
                                                            applied for leave at 05-21-2021
                                                        </p></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-bs-toggle="dropdown"
                                   class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                    <div class="avatar me-1">
                                        <img src="assets/images/admin.png" alt="" srcset="">
                                    </div>
                                    <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                                    <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.jsp"><i data-feather="log-out"></i> Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <div class="main-content container-fluid">
                    <div class="container-fluid">
                        <div class="row bg-title">
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Users</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                <a href="manage_user.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i>  View Users</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card text-white">
                                    <div class="card-header bg-info"><i class="mdi mdi-clipboard-text fa-fw"></i>	Add User
                                    </div>
                                    <div class="card-wrapper" >
                                        <div class="card-body card-body">
                                            <form class="form"  id="addUserForm" autocomplete="off">
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                Surname <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtSurname" type="text" value=""
                                                                       maxlength="50" id="txtSurname"
                                                                       class="form-control input-width-xlarge"  /> <span
                                                                       id="rfvSurname" class="required"
                                                                       style="display: none">Please enter Last
                                                                    Name.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group efirst">
                                                            <label class="col-md-12 control-label">
                                                                First Name <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtFirstName" type="text" value=""
                                                                       maxlength="50" id="txtFirstName"
                                                                       class="form-control input-width-xlarge" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                Middle Name </label>
                                                            <div class="col-md-12">
                                                                <input name="txtMiddleName" type="text" value=""
                                                                       maxlength="50" id="txtMiddleName"
                                                                       class="form-control input-width-xlarge" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">Contact</label>
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="contact" id="txtPhone" name="txtPhone">
                                                                <div class="form-control-icon">
                                                                    <i class="fa fa-phone"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div><div class="col-md-6 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">Email</label>
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="contact" id="txtEmail" name="txtEmail">
                                                                <div class="form-control-icon">
                                                                    <i class="fa fa-envelope"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">Username</label>
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="username" id="txtUsername" name="txtUsername" >
                                                                <div class="form-control-icon">
                                                                    <i class="fa fa-user"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">Password</label>
                                                            <div class="position-relative">
                                                                <input type="password" class="form-control" placeholder="password" id="txtPassword" name="txtPassword" oninput="checkPasswords()">
                                                                <div class="form-control-icon">
                                                                    <i class="fa fa-key"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">Repeat password</label>
                                                            <div class="position-relative">
                                                                <input type="password" class="form-control" placeholder="password" id="txtrPassword" name="txtrPassword" oninput="checkPasswords()">
                                                                <div class="form-control-icon">
                                                                    <i class="fa fa-key"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">User Category</label>
                                                            <div class="position-relative">
                                                                <fieldset class="form-group">
                                                                    <select class="form-select" id="ddlLevel" name="ddlLevel">
                                                                        <option>Admin</option>
                                                                        <option>Staff</option>
                                                                    </select>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">County</label>
                                                            <div class="position-relative">
                                                                <fieldset class="form-group">
                                                                    <select class="form-control" onchange="patasubcounty();" name='ddlCounty' id='ddlCounty'>
                                                                    </select>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">User Subcounty</label>
                                                            <div class="position-relative">
                                                                <fieldset class="form-group">
                                                                    <select class="form-control" onchange='patafacility();' name='ddlSubcounty' id='ddlSubcounty'>
                                                                    </select>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-12">
                                                        <div class="form-group has-icon-left">
                                                            <label for="first-name-icon">User Facility</label>
                                                            <div class="position-relative">
                                                                <fieldset class="form-group">

                                                                    <select class="form-control form-select" name='ddlFacility' id='ddlFacility'>

                                                                    </select>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 d-flex justify-content-end">
                                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- // Basic multiple Column Form section start -->

                </div>

            </div>
        </div>
        <script src="assets/vendor/DataTables/datatables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/feather-icons/feather.min.js"></script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>

        <script src="assets/js/custom_.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/sidebar-nav.min.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script >
                                                                        $.ajax({
                                                                            url: 'FacilityServlet',
                                                                            type: 'post',
                                                                            dataType: 'html',
                                                                            success: function (data) {
                                                                                $("#ddlFacility").html(data);
                                                                                if (document.getElementById("ddlFacility").value !== '') {
                                                                                    updatefacilsession();
                                                                                    $('#ddlFacility').select2();
                                                                                }
                                                                            }


                                                                        });
                                                                        loadcounty();

                                                                        function loadcounty() {
                                                                            $.ajax({
                                                                                url: 'loadCounty',
                                                                                type: 'post',
                                                                                dataType: 'html',
                                                                                success: function (data) {
                                                                                    $("#ddlCounty").html(data);
                                                                                    patasubcounty();
                                                                                }
                                                                            });
                                                                        }

                                                                        function patasubcounty() {
                                                                            var county = document.getElementById("ddlCounty").value;
                                                                            //var county = $('#county').val();

                                                                            $.ajax({
                                                                                url: 'GetsubcountyServlet?county=' + county,
                                                                                type: 'post',
                                                                                dataType: 'html',
                                                                                success: function (data) {
                                                                                    $("#ddlSubcounty").html(data);
                                                                                    patafacility();

                                                                                    //  App.init();   
                                                                                }


                                                                            });

                                                                        }

                                                                        function patafacility() {

                                                                            var subcounty = document.getElementById("ddlSubcounty").value;
                                                                            $.ajax({
                                                                                url: './FacilityServlet?subcounty=' + subcounty,
                                                                                type: 'post',
                                                                                dataType: 'html',
                                                                                success: function (data) {
                                                                                    $("#ddlFacility").html(data.replace("<option value=''>Select facility</option>", ""));
                                                                                    var select = document.getElementById('ddlFacility');
                                                                                    // select.size = select.length;
                                                                                    //$('#ddlFacility').select2();
                                                                                }
                                                                            });
                                                                        }
                                                                        get_roles();
                                                                        function get_roles() {
                                                                            $.ajax({
                                                                                type: "GET",
                                                                                url: './Roles?action=all',
                                                                                contentType: "application/json; charset-utf-8",
                                                                                dataType: "json",
                                                                                success: function (data) {
                                                                                    $('#ddlLevel').empty();
                                                                                    $('#ddlLevel').append("<option value=''>--- Please Select ---</option>");
                                                                                    $.each(data, function (i, item) {
                                                                                        var selecting = '';
                                                                                        $('#ddlLevel').append('<option ' + selecting + ' value="' + data[i].id + '">' + data[i].role_name + '</optoin>');
                                                                                    });
                                                                                },
                                                                                complete: function () {

                                                                                }
                                                                            });

                                                                        }

                                                                        $("#addUserForm").submit(function (e) {
                                                                            e.preventDefault(); // prevent actual form submit
                                                                            var form = $("#addUserForm");
                                                                            var action = "add_user";
                                                                            var data = form.serialize() + "&action=" + action;
                                                                            var url = './ManageUsers'; //get submit url [replace url here if desired]
                                                                            // screenLock();
                                                                            $.ajax({
                                                                                type: "POST",
                                                                                url: url,
                                                                                data: data, // serializes form input
                                                                                beforeSend: function beforeSend() {
                                                                                    //	startLoader();
                                                                                    console.log(data);
                                                                                },
                                                                                success: function (data) {
                                                                                    var url_ = "manage_user.jsp";
                                                                                    $(location).attr('href', url_);
                                                                                },
                                                                                error: function error(result) {

                                                                                },
                                                                                complete: function complete() {
                                                                                    //	stopLoader();

                                                                                }
                                                                            });
                                                                        });






        </script>
    </body>
</html>
