<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Employee</title>
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="assets/css/toggle.css">
        <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">
        <link href="assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper ">

                    <!-- BEGIN SIDEBAR MENU -->         
                    <%@include file="/_includes/sidebar_menu.jsp"%>
                    <!-- END SIDEBAR MENU -->
                    <button class="sidebar-toggler btn x">
                        <i data-feather="x"></i>
                    </button>
                </div>
            </div>
            <div id="main">
                <%
                    String id = request.getParameter("employee_id");
                %>
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


                <div class="main-content container-fluid">
                    <div class="row bg-title">
                        <input type="hidden" class="form-control"  id="employee_id" value="<%=id%>">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                            <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                        </div>
                    </div>



                    <!-- Basic Vertical form layout section start -->



                    <div class="row">

                        <div class="col-md-12">
                            <div class="card_">
                                <div class="card-header bg-success text-white">
                                    <i class="mdi mdi-table fa-fw"></i> 
                                    Profile
                                </div>
                                <div class="card-body pt-3 bg-white">
                                    <div class="row">
                                        <div class="col col-12">
                                                 <div class="card">
                                                <div class="card-header resume ">
                                                    <div class="text-center"><img src="assets/img/user_image.png" width="100px;" height="100px;" class="img-circle"></div>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card-content-member_ text-md-center">
                                                        <h4 class=" name">lorem  ipsom</h4>
                                                        <span class="preformancerating"> 

                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star"></span>
                                                            <span class="fa fa-star-half-o"></span>

                                                        </span>
                                                        <h5 >Designation: </h5><span class="designation"></span>
                                                        <p class="phone"><i class="fa fa-mobile" aria-hidden="true"></i>
                                                            0864515651</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                       
                                            <div class="card">
                                                <div class="card-body">
                                                    <h4 class="card-title">Personal Info</h4>
                                                    <div class="card-content-languages-group">

                                                        <table class="table table-hover" width="100%">

                                                            <tbody>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <td class="full_name">lorem ipsom</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Phone</th>
                                                                    <td class="phone">0864515651</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Email Address</th>
                                                                    <td class="email">lorem@email.com</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Country</th>
                                                                    <td class="country">Australia</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>City</th>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Postal Code</th>
                                                                    <td class="postal_code">2456</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>

                                                </div>
                                                <div class="card-body">
                                                    <h4 class="card-title resumecaption">Bio-Graphical Information</h4>
                                                    <div class="card-content-languages-group">
                                                        <table class="table table-hover" width="100%">

                                                            <tbody><tr>
                                                                    <th>Date of Birth</th>
                                                                    <td class="dob">1993-03-18</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Gender</th>
                                                                    <td class="gender">Male</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Marital Status</th>
                                                                    <td class="mstatus">Married</td>
                                                                </tr>

                                                            </tbody></table>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h4 class="card-title resumecaption">Positional Information</h4>
                                                    <table class="table table-hover" width="100%">



                                                        <tbody><tr>
                                                                <th>Carder Category</th>
                                                                <td class="ccat">New Division</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Position</th>
                                                                <td class="position">Engineer </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Carder Type</th>
                                                                <td class="ctype">Full Time</td>
                                                            </tr>

                                                            <tr>
                                                                <th>Hire Date</th>
                                                                <td class="hdate">2020-03-10</td>
                                                            </tr>
                                                            <tr>
                                                                <th>County</th>
                                                                <td class="county">2020-04-01</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Sub County</th>
                                                                <td class="scounty">Salary</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Facility</th>
                                                                <td class="facility">70000</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Supervisor Name</th>
                                                                <td class="supervisor">Self</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Technical Monitor</th>
                                                                <td class="tmonitor">No</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>    
                                                </div>
                                                     <div class="card-body">
                                                    <h4 class="card-title resumecaption">Statutory Information</h4>


                                                 <table class="table table-hover" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <th>Benefit Class code</th>
                                                                <td>456461</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Benefit Description</th>
                                                                <td></td>
                                                            </tr>

                                                            <tr>
                                                                <th>Benefit Accrual Date</th>
                                                                <td>2020-05-01</td>
                                                            </tr>

                                                        </tbody></table>  
                                                </div>
                                           
                                            </div>
                                          
<!--                                            <div class="card">
                                                <div class="card-body">
                                                    <h4 class="card-title resumecaption">Emergency Contact</h4>
                                                    <table class="table table-hover" width="100%">



                                                        <tbody><tr>
                                                                <th>Emergency Contact</th>
                                                                <td>456132468665</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Emergency Home Phone</th>
                                                                <td>4561346531</td>
                                                            </tr>

                                                            <tr>
                                                                <th>Emergency Work Phone</th>
                                                                <td>46531453114</td>
                                                            </tr>
                                                        </tbody></table>   </div>
                                            </div>-->
                                        </div>
                                    </div>

                                </div>



                            </div>

                        </div>
                    </div>
                </div>
                <!-- // Basic Vertical form layout section end -->
            </div>
        </div>
    </div>
</div>
<%@include file="/_includes/footer.jsp"%>

<script src="assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="assets/vendor/DataTables/datatables.js"></script>
<script defer src="assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="assets/js/feather-icons/feather.min.js"></script>
<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script src="assets/js/main.js"></script>
<script src="assets/js/pages/employees_view.js"></script>


</body>

</html>