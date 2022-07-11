<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage User</title>
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
        <script src="assets/js/pages/users.js"></script>
        <script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">

                    <!-- BEGIN SIDEBAR MENU -->         
                    <%@include file="/_includes/sidebar_menu.jsp"%>
                    <!-- END SIDEBAR MENU --><button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <nav class="navbar navbar-header navbar-expand navbar-light">
                    <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
                    <button class="btn navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
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
                                        <li class="breadcrumb-item active" aria-current="page">Manage Users</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                <a href="add_user.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-plus" aria-hidden="true"></i>  New User</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card text-white">
                                    <div class="card-header bg-info"><i class="fa fa-list-ul fa-fw"></i>  User List
                                    </div>
                                    <div class="card-wrapper" >
                                        <div class="card-body card-body">
                                            <div class="card-body">
                                                <table class='table' id="table1">
                                                    <thead>
                                                        <tr>
                                                            <th>Full Name</th>
                                                            <th>Contact</th>
                                                            <th>Category</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Admin Admin</td>
                                                            <td>09123456789</td>
                                                            <td>Admin</td>
                                                            <td><span class="badge bg-success">Active</span></td>
                                                            <td><a href="editDesignation.php"><i class="fa fa-pen text-success"></i></a>   <a href="editDesignation.php"><i class="fa fa-trash text-danger"></i></a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>John Doe</td>
                                                            <td>09123456789</td>
                                                            <td>Staff</td>
                                                            <td><span class="badge bg-success">Active</span></td>
                                                            <td><a href="editDesignation.php"><i class="fa fa-pen text-success"></i></a>   <a href="editDesignation.php"><i class="fa fa-trash text-danger"></i></a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Jane Doe</td>
                                                            <td>09123456789</td>
                                                            <td>Staff</td>
                                                            <td><span class="badge bg-danger">Deactivated</span></td>
                                                            <td><a href="editDesignation.php"><i class="fa fa-pen text-success"></i></a>   <a href="editDesignation.php"><i class="fa fa-trash text-danger"></i></a></td>
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
                    <%@include file="/_includes/footer.jsp"%>
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