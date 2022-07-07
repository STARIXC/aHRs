<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
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
        <script src="assets/js/pages/dashboard.js"></script>
        <script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
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
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
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

                <div class="main-content">



                    <div class="container-fluid">

                        <div class="row bg-title">
                            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                <ol class="breadcrumb">
                                    <li class="active breadcrumbColor"><a href="#"><i class="fa fa-home"></i> Dashboards</a></li>
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
        

    </body>
</html>
