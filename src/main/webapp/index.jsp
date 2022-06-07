<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HRH Management System</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="assets/vendors/chartjs/Chart.min.css">
        <link rel="stylesheet"
              href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
            /*for yellow bg*/

            .bg-title .breadcrumb {
                background: 0 0;
                margin-bottom: 0;
                float: none;
                padding: 0;
                margin-bottom: 9px;
                font-weight: 700;
                color: #777;
            }

            .select2-container .select2-selection--single .select2-selection__rendered {
                height: auto;
                margin-top: -6px;
                padding-left: 0;
                padding-right: 0;
            }

            .select2-container .select2-selection--single {
                box-sizing: border-box;
                cursor: pointer;
                display: block;
                height: 35px;
            }

            .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
                border: 1px solid #d2d6de;
                border-radius: 0;
                padding: 8px 11px;
            }

            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: 26px;
                position: absolute;
                top: 4px;
                right: 1px;
                width: 20px;
            }

            .breadcrumbColor a {
                color: #41b3f9 !important;
            }

            tr td {
                color: black !important;
            }

            .tr_header {
                background-color: #EDF1F5;
            }

            table.dataTable thead th, table.dataTable thead td {
                padding: 10px 18px;
                border-bottom: 1px solid #e4e7ea;
            }

            .btnColor {
                color: #fff !important;
            }

            .validateRq {
                color: red;
            }

            .panel .panel-heading {
                border-radius: 0;
                font-weight: 500;
                font-size: 16px;
                padding: 10px 25px;
            }

            .btn_style {
                width: 106px;
            }

            .error {
                color: red;
            }

            .dash_image {


                width: 60px !important;
            }

            .noticeBord {
                overflow-x: hidden;
                height: 210px;
            }

          
        </style>
    </head>
    <body>

        <!-- ============================================================== -->
        <!-- Preloader -->
        <!-- ============================================================== -->
        <!--        <div class="preloader">
                    <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
                    </svg>
                </div>-->
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header" style="height: 50px; margin-top: -30px">
                        <i class="fa fa-users text-success me-4"></i> <span>HRH MS</span>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-item active "><a href="index.jsp"
                                                                class='sidebar-link'> <i class="fa fa-home text-success"></i>
                                    <span>Dashboard</span>
                                </a></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-building text-success"></i>
                                    <span>Department</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_department.jsp">Add Department</a></li>
                                    <li><a href="./PositionTypeController/new">Manage Department</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Designation</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_designation.jsp">Add Designation</a></li>
                                    <li><a href="manage_designation.jsp">Manage Designation</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-users text-success"></i>
                                    <span>Employees</span>
                                </a>
                                <ul class="submenu ">

                                    <li><a href="add_employee.jsp">Add Employee</a></li>
                                    <li><a href="manage_employee.jsp">Manage Employee</a></li>
                                    <li><a href="manage_termination.jsp">Termination</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Type</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_leave_type.jsp">Add Leave Type</a></li>
                                    <li><a href="manage_leave_type.jsp">Manage Leave Type</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Management</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="all_leave.jsp">All Leaves</a></li>
                                    <li><a href="pending_leave.jsp">Pending Leaves</a></li>
                                    <li><a href="approve_leave.jsp">Approve Leaves</a></li>
                                    <li><a href="not_approve_leave.jsp">Not Approve Leaves</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="javascript:void(0)" class='sidebar-link'>
                                    <i class="fa fa-user text-success"></i> <span>Attendance</span></i>
                                    </span>
                                </a>

                                <ul class="submenu" style="display: block;">
                                    <li class=""><a
                                            href="monthly_manual_attendance.jsp">Monthly
                                            Attendance</a></li>

                                    <li class=""><a
                                            href="missing_attendance">Missing
                                            Attendance</a></li>


                                    <!-- single level menu/link -->
                                    <li class=""><a
                                            href="att_log_report">Attendance
                                            Log</a></li>

                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-user text-success"></i>
                                    <span>Users</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_user.jsp">Add User</a></li>
                                    <li><a href="manage_user.jsp">Manage Users</a></li>
                                </ul></li>
                            <li class="sidebar-item "><a href="reports.jsp"
                                                         class='sidebar-link'> <i class="fa fa-chart-bar text-success"></i>
                                    <span>Reports</span>
                                </a></li>
                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x">
                        <i data-feather="x"></i>
                    </button>
                </div>
            </div>
            <div id="main">
                <nav class="navbar navbar-header navbar-expand navbar-light">
                    <a class="sidebar-toggler" href="#"><span
                            class="navbar-toggler-icon"></span></a>
                    <button class="btn navbar-toggler" type="button"
                            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul
                            class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                            <li class="dropdown nav-icon"><a href="#"
                                                             data-bs-toggle="dropdown"
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
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>John
                                                            Doe</h6>
                                                        <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                                </div>
                                                <div class="col-md-12 notif">
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>Jane
                                                            Doe</h6>
                                                        <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div></li>
                            <li class="dropdown"><a href="#" data-bs-toggle="dropdown"
                                                    class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                    <div class="avatar me-1">
                                        <img src="assets/images/admin.png" alt="" srcset="">
                                    </div>
                                    <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="#"><i data-feather="user"></i>
                                        Account</a> <a class="dropdown-item" href="#"><i
                                            data-feather="settings"></i> Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.jsp"><i
                                            data-feather="log-out"></i> Logout</a>
                                </div></li>
                        </ul>
                    </div>
                </nav>
                <div class="main-content">



                    <div class="container-fluid">

                        <div class="row bg-title">
                            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                <ol class="breadcrumb">
                                    <li class="active breadcrumbColor"><a href="#"><i class="fa fa-home"></i> Dashboard</a></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-sm-6 col-xs-12">
                                <div class="white-box card analytics-info">
                                    <h3 class="box-title"> Total Employee </h3>
                                    <ul class="list-group list-group-horizontal-sm two-part">
                                        <li class="list-group-item border-0">
                                            <img class="dash_image" src="assets/img/employee.png">
                                        </li>
                                        <li class="text-end list-group-item border-0"><i class="ti-arrow-up text-success"></i> <span class="counter text-success" id="counter_emp">49</span></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6 col-xs-12">
                                <div class="white-box card analytics-info">
                                    <h3 class="box-title">Department</h3>
                                    <ul class="list-group list-group-horizontal-sm two-part">
                                        <li class="list-group-item border-0">
                                            <img class="dash_image" src="assets/img/department.png">
                                        </li>
                                        <li class="text-end list-group-item border-0"><i class="ti-arrow-up text-purple"></i> <span class="counter text-purple">20</span></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6 col-xs-12">
                                <div class="white-box card analytics-info">
                                    <h3 class="box-title">Present</h3>
                                    <ul class="list-group list-group-horizontal-sm two-part">
                                        <li class="list-group-item border-0">
                                            <img class="dash_image" src="assets/img/present.png">
                                        </li>
                                        <li class="text-end list-group-item border-0"><i class="ti-arrow-up text-info"></i> <span class="counter text-info">0</span></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6 col-xs-12">
                                <div class="white-box card analytics-info">
                                    <h3 class="box-title">absent</h3>
                                    <ul class="list-group list-group-horizontal-sm two-part">
                                        <li class="list-group-item border-0">
                                            <img class="dash_image" src="assets/img/absent.png">
                                        </li>
                                        <li class="text-end list-group-item border-0"><i class="ti-arrow-down text-danger"></i> <span class="counter text-danger">49</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header"> Today Attendance </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover manage-u-table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th>Photo</th>
                                                    <th>Name</th>
                                                    <th>In time</th>
                                                    <th>Out Time</th>
                                                    <th>Late</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="8">No data available</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <!-- employe attendance  -->
                            <div class="col-md-6">
                                <div class="white-box card">
                                    <h3 class="box-title">Upcoming Holidays</h3>
                                    <hr>
                                    <div class="noticeBord">
                                    </div>
                                </div>
                            </div>

                            <!-- end attendance  -->



                            <div class="col-md-6">
                                <div class="white-box card">
                                    <h3 class="box-title">Notice Board</h3>
                                    <hr>
                                    <div class="noticeBord">
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">testttcs..</h5><span class="time">Published Date:  23 Mar 2022 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: gthnbhtn..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/7" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">Hi..</h5><span class="time">Published Date:  13 Dec 2021 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: 12..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/6" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">General Circular..</h5><span class="time">Published Date:  06 Dec 2021 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: Must Wear Employment Card in the office..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/5" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">test..</h5><span class="time">Published Date:  26 Nov 2021 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: test<br>..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/4" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">tes..</h5><span class="time">Published Date:  28 Jul 2021 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: test..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/3" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-center p-t-10">
                                            <div class="comment-body">

                                                <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                <div class="mail-contnet">
                                                    <h5 class="text-danger">Soluta iure porro ut..</h5><span class="time">Published Date:  26 May 2021 </span>
                                                    <br /><span class="mail-desc">
                                                        Publish By: SKT sdfsd<br>
                                                        Description: zbcb..
                                                    </span>
                                                    <a href="http://hrms.braintricker.com/notice/2" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- /.container-fluid -->

                </div>
            </div>
        </div>

        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/pages/dashboard.js"></script>
        <script src="assets/vendor/select2/dist/js/select2.min.js"></script>
        <script src="assets/js/feather-icons/feather.min.js"></script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/js/main.js"></script>
    </body>
=======
                width: 60px;
            }

            .noticeBord {
                overflow-x: hidden;
                height: 210px;
            }


        </style>
    </head>
    <body>

        <!-- ============================================================== -->
        <!-- Preloader -->
        <!-- ============================================================== -->
<!--        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
            </svg>
        </div>-->
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header" style="height: 50px; margin-top: -30px">
                        <i class="fa fa-users text-success me-4"></i> <span>HRH MS</span>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-item active "><a href="index.jsp"
                                                                class='sidebar-link'> <i class="fa fa-home text-success"></i>
                                    <span>Dashboard</span>
                                </a></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-building text-success"></i>
                                    <span>Department</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_department.jsp">Add Department</a></li>
                                    <li><a href="./PositionTypeController/new">Manage Department</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Designation</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_designation.jsp">Add Designation</a></li>
                                    <li><a href="manage_designation.jsp">Manage Designation</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-users text-success"></i>
                                    <span>Employees</span>
                                </a>
                                <ul class="submenu ">

                                    <li><a href="add_employee.jsp">Add Employee</a></li>
                                    <li><a href="manage_employee.jsp">Manage Employee</a></li>
                                    <li><a href="manage_termination.jsp">Termination</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Type</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_leave_type.jsp">Add Leave Type</a></li>
                                    <li><a href="manage_leave_type.jsp">Manage Leave Type</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Management</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="all_leave.jsp">All Leaves</a></li>
                                    <li><a href="pending_leave.jsp">Pending Leaves</a></li>
                                    <li><a href="approve_leave.jsp">Approve Leaves</a></li>
                                    <li><a href="not_approve_leave.jsp">Not Approve Leaves</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="javascript:void(0)" class='sidebar-link'>
                                    <i class="fa fa-user text-success"></i> <span>Attendance</span></i>
                                    </span>
                                </a>

                                <ul class="submenu" style="display: block;">
                                    <li class=""><a
                                            href="monthly_manual_attendance.jsp">Monthly
                                            Attendance</a></li>

                                    <li class=""><a
                                            href="missing_attendance">Missing
                                            Attendance</a></li>


                                    <!-- single level menu/link -->
                                    <li class=""><a
                                            href="att_log_report">Attendance
                                            Log</a></li>

                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-user text-success"></i>
                                    <span>Users</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_user.jsp">Add User</a></li>
                                    <li><a href="manage_user.jsp">Manage Users</a></li>
                                </ul></li>
                            <li class="sidebar-item "><a href="reports.jsp"
                                                         class='sidebar-link'> <i class="fa fa-chart-bar text-success"></i>
                                    <span>Reports</span>
                                </a></li>
                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x">
                        <i data-feather="x"></i>
                    </button>
                </div>
            </div>
            <div id="main">
                <nav class="navbar navbar-header navbar-expand navbar-light">
                    <a class="sidebar-toggler" href="#"><span
                            class="navbar-toggler-icon"></span></a>
                    <button class="btn navbar-toggler" type="button"
                            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul
                            class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                            <li class="dropdown nav-icon"><a href="#"
                                                             data-bs-toggle="dropdown"
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
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>John
                                                            Doe</h6>
                                                        <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                                </div>
                                                <div class="col-md-12 notif">
                                                    <a href="leave_details.jsp"><h6 class='text-bold'>Jane
                                                            Doe</h6>
                                                        <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div></li>
                            <li class="dropdown"><a href="#" data-bs-toggle="dropdown"
                                                    class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                    <div class="avatar me-1">
                                        <img src="assets/images/admin.png" alt="" srcset="">
                                    </div>
                                    <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="#"><i data-feather="user"></i>
                                        Account</a> <a class="dropdown-item" href="#"><i
                                            data-feather="settings"></i> Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.jsp"><i
                                            data-feather="log-out"></i> Logout</a>
                                </div></li>
                        </ul>
                    </div>
                </nav>
                <div class="main-content">
                   
             

                        <div class="container-fluid">
                          
                            <div class="row bg-title">
                                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                    <ol class="breadcrumb">
                                        <li class="active breadcrumbColor"><a href="#"><i class="fa fa-home"></i> Dashboard</a></li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-sm-6 col-xs-12">
                                    <div class="white-box card analytics-info">
                                        <h3 class="box-title"> Total Employee </h3>
                                        <ul class="list-inline two-part">
                                            <li>
                                                <img class="dash_image" src="http://hrms.braintricker.com/admin_assets/img/employee.png">
                                            </li>
                                            <li class="text-right"><i class="ti-arrow-up text-success"></i> <span class="counter text-success" id="counter_emp">49</span></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-sm-6 col-xs-12">
                                    <div class="white-box card analytics-info">
                                        <h3 class="box-title">Department</h3>
                                        <ul class="list-inline two-part">
                                            <li>
                                                <img class="dash_image" src="http://hrms.braintricker.com/admin_assets/img/department.png">
                                            </li>
                                            <li class="text-right"><i class="ti-arrow-up text-purple"></i> <span class="counter text-purple">20</span></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-sm-6 col-xs-12">
                                    <div class="white-box card analytics-info">
                                        <h3 class="box-title">Present</h3>
                                        <ul class="list-inline two-part">
                                            <li>
                                                <img class="dash_image" src="http://hrms.braintricker.com/admin_assets/img/present.png">
                                            </li>
                                            <li class="text-right"><i class="ti-arrow-up text-info"></i> <span class="counter text-info">0</span></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-sm-6 col-xs-12">
                                    <div class="white-box card analytics-info">
                                        <h3 class="box-title">absent</h3>
                                        <ul class="list-inline two-part">
                                            <li>
                                                <img class="dash_image" src="http://hrms.braintricker.com/admin_assets/img/absent.png">
                                            </li>
                                            <li class="text-right"><i class="ti-arrow-down text-danger"></i> <span class="counter text-danger">49</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12 col-sm-12">
                                    <div class="card">
                                        <div class="card-header"> Today Attendance </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover manage-u-table">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th>Photo</th>
                                                        <th>Name</th>
                                                        <th>In time</th>
                                                        <th>Out Time</th>
                                                        <th>Late</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="8">No data available</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <!-- employe attendance  -->
                                <div class="col-md-6">
                                    <div class="white-box card">
                                        <h3 class="box-title">Upcoming Holidays</h3>
                                        <hr>
                                        <div class="noticeBord">
                                        </div>
                                    </div>
                                </div>

                                <!-- end attendance  -->



                                <div class="col-md-6">
                                    <div class="white-box card">
                                        <h3 class="box-title">Notice Board</h3>
                                        <hr>
                                        <div class="noticeBord">
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">testttcs..</h5><span class="time">Published Date:  23 Mar 2022 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: gthnbhtn..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/7" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">Hi..</h5><span class="time">Published Date:  13 Dec 2021 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: 12..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/6" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">General Circular..</h5><span class="time">Published Date:  06 Dec 2021 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: Must Wear Employment Card in the office..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/5" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">test..</h5><span class="time">Published Date:  26 Nov 2021 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: test<br>..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/4" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">tes..</h5><span class="time">Published Date:  28 Jul 2021 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: test..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/3" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-center p-t-10">
                                                <div class="comment-body">

                                                    <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                                    <div class="mail-contnet">
                                                        <h5 class="text-danger">Soluta iure porro ut..</h5><span class="time">Published Date:  26 May 2021 </span>
                                                        <br /><span class="mail-desc">
                                                            Publish By: SKT sdfsd<br>
                                                            Description: zbcb..
                                                        </span>
                                                        <a href="http://hrms.braintricker.com/notice/2" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
</div>
                        </div>

               
                <!-- /.container-fluid -->
              
            </div>
        </div>
    </div>

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
    <script src="assets/vendor/select2/dist/js/select2.min.js"></script>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>

    <script src="assets/js/main.js"></script>
</body>
>>>>>>> origin/main
</html>