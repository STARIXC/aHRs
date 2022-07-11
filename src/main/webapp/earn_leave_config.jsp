<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Earn Leave Config</title>
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="assets/css/toggle.css">
        <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">

        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="assets/css/jquery.toast.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>
        <style type="text/css">.jqstooltip {
                position: absolute;
                left: 0px;
                top: 0px;
                visibility: hidden;
                background: rgb(0, 0, 0) transparent;
                background-color: rgba(0,0,0,0.6);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
                color: white;
                font: 10px arial, san serif;
                text-align: left;
                white-space: nowrap;
                padding: 5px;
                border: 1px solid white;
                z-index: 10000;
            }
            .jqsfield {
                color: white;
                font: 10px arial, san serif;
                text-align: left;
            }</style>
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
                                        <li class="breadcrumb-item active" aria-current="page">Earn Leave Configuration</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card text-white">
                                    <div class="card-header bg-info"><i class="fa fa-th-list fa-fw"></i>	Rules of Earn Leave
                                    </div>
                                    <div class="card-wrapper" >
                                        <div class="card-body card-body">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="tr_header">
                                                            <th>S/L</th>
                                                            <th>For Month</th>
                                                            <th>Day of Earn Leave</th>
                                                            <th>Update</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>

                                                                <input type="hidden" class="form-control earn_leave_rule_id" value="1">
                                                                <input type="number" class="form-control for_month" value="1" readonly="" placeholder="For Days EX:(3)">
                                                            </td>
                                                            <td>
                                                                <input type="number" class="form-control day_of_earn_leave" value="2.00" placeholder="Salary Deduction For Day EX:(1)">
                                                            </td>

                                                            <td>
                                                                <button type="button" class="btn btn-sm btn-success updateRule">
                                                                    Update												</button>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
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
        <script src="assets/js/feather-icons/feather.min.js"></script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/vendor/jquery.toast.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/js/main.js"></script>
        <script type="text/javascript">
            jQuery(function () {


                $("body").on("click", ".updateRule", function () {
                    var earn_leave_rule_id = $('.earn_leave_rule_id').val();
                    var for_month = $('.for_month').val();
                    var day_of_earn_leave = $('.day_of_earn_leave').val();

                    var action = "./updateEarnLeaveConfigure?action=updateEarnLeaveConfigure";
                    $.ajax({
                    type: "post",
                            url: action,
                            data: {'earn_leave_rule_id': earn_leave_rule_id, 'for_month': for_month, 'day_of_earn_leave':day_of_earn_leave,
                                    success: function (data) {
                                    if (data == 'success'){
                                    $.toast({
                                    heading: 'success',
                                            text: 'Earn leave rule update successfully!',
                                            position: 'top-right',
                                            loaderBg: '#ff6849',
                                            icon: 'success',
                                            hideAfter: 3000,
                                            stack: 6
                                    });
                                    } else{
                                    $.toast({
                                    heading: 'Problem',
                                            text: 'Something error found !',
                                            position: 'top-right',
                                            loaderBg: '#ff6849',
                                            icon: 'error',
                                            hideAfter: 3000,
                                            stack: 6
                                    });
                                    }

                                    }
                            });
                });
            });
        </script>
    </body>
</html>
