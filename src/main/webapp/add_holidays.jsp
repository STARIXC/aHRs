<%-- 
    Document   : manage_notification
    Created on : May 24, 2022, 12:31:23 AM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Holidays</title>

        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>
        <!--        <link rel="stylesheet" href="vendor/calender/lib/jquery-ui.min.css" />
                <link rel="stylesheet" href="vendor/calender/lib/bootstrap-datepicker.css" />-->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <link href="assets/vendor/select2/dist/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet"
              href="assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="assets/css/select2.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header" style="height: 50px;margin-top: -30px">
                        <i class="fa fa-users text-success me-4"></i>
                        <span>HRH</span>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-item  "><a href="index.jsp"
                                                          class='sidebar-link'> <i class="fa fa-home text-success"></i>
                                    <span>Dashboard</span>
                                </a></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-building text-success"></i>
                                    <span>Department</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_department.jsp">Add Department</a></li>
                                    <li><a href="./DepartmentController?action=all">Manage Department</a></li>
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
                            <li class="sidebar-item  has-sub active"><a href="#"
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
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Manage Holidays</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                <a href="http://hrms.braintricker.com/publicHoliday" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i>  View Public Holiday</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card panel panel-info">
                                    <div class="panel-heading"><i class="mdi mdi-clipboard-text fa-fw"></i>	Add Public Holiday
                                    </div>
                                    <div class="panel-wrapper" >
                                        <div class="card-body panel-body">
                                            <form method="POST"  enctype="multipart/form-data" id="publicHolidayForm" class="form-horizontal" autocomplete="off">

                                                <div class="form-body">
                                                    <div class="row">
                                                        <div class="col-md-offset-2 col-md-6">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">Holy Day Name<span class="validateRq">*</span></label>
                                                                <div class="col-md-8">
                                                                    <input class="form-control required " id="no_of_days"   name="no_of_days" type="hidden">
                                                                    <input class="form-control required " id="holiday_name"  placeholder="Holiday Name" name="holiday_name" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">From Date<span class="validateRq">*</span></label>
                                                                <div class="col-md-8">
                                                                    <input class="form-control required datepicker" id="from_date" readonly="readonly" placeholder="From Date" name="from_date" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">To Date<span class="validateRq">*</span></label>
                                                                <div class="col-md-8">
                                                                    <input class="form-control required datepicker dateField" id="to_date" readonly="readonly" placeholder="To Date" name="to_date" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="control-label col-md-4">Comment</label>
                                                                <div class="col-md-8">
                                                                    <textarea class="form-control comment" id="comment" placeholder="Comment" cols="30" rows="2" name="comment"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="row">
                                                                <div class="col-md-offset-4 col-md-8">
                                                                    <button type="submit" class="btn btn-info btn_style"><i class="fa fa-check"></i> Save</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <script src="assets/vendor/jquery/jquery.min.js"></script>
                <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="assets/js/feather-icons/feather.min.js"></script>
                <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                <script src="assets/js/app.js"></script>
                <script src="assets/js/pages/holiday.js"></script>
                <script src="assets/js/main.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

                              </body>
                </html>

