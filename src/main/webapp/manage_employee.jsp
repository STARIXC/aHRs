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
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
            #spinner-div {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                text-align: center;
                background-color: rgba(255, 255, 255, 0.8);
                z-index: 2;
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
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

                    <div class="row  bg-title">
                        <div class="col-md-8 order-md-1 order-last">
                            <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Manage Employees</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-md-4 order-md-2 order-first">
                            <a href="bulk_upload.jsp" class="btn btn-success float-end ms-2 hidden-xs hidden-sm waves-effect waves-light">
                                <i class="fa fa-plus" aria-hidden="true"></i>Bulk Upload</a>

                            <a href="add_employee.jsp" class="btn btn-success float-end ms-2 hidden-xs hidden-sm waves-effect waves-light">
                                <i class="fa fa-plus" aria-hidden="true"></i> Add Employee</a>
                        </div>
                    </div>

                    <div class="row">
                        <div id="spinner-div" class="pt-5">
                            <div class="spinner-border text-primary" role="status">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="card text-white">
                                <div class="card-header bg-info"><i class="fa fa-table fa-fw"></i> Staff List</div>
                                <div class="card-wrapper " aria-expanded="true">
                                    <div class="card-body">
                                        <div class="table-responsive ">
                                            <table width="100%" class="employee_table table table-striped table-bordered table-hover " id="employee_table">
                                                <thead class='mt-3'>
                                                    <tr>
                                                        <th>SL No</th>
                                                        <th>Employee Name</th>
                                                        <th>Employee PF_NO</th>
                                                        <th>Position</th>
                                                        <th>Phone</th>
                                                        <th>Email Address</th>
                                                        <th>Country</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="employee-table-data">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


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
    <script src="assets/js/pages/employees.js"></script>

 <script type="text/javascript">
            $(document).ready(function () {

              
                $(document).on('click', '#delete_staff', function (e) {
                    e.preventDefault();
                    var emp_id = $(this).data('emp');
                    console.log("Type id: " + emp_id);
                    SwalDelete(emp_id);

                });


               
            });
   
            function SwalDelete(typeId) {

                swal({
                    title: 'Are you sure?',
                    text: "It will be deleted permanently",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6', //sweetalert confirm dialouge 
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!',
                    showLoaderOnConfirm: true,

                    preConfirm: function () {
                        return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                            var action = "delete";
                            var data = "deleteId=" + typeId + "&action=" + action;
                            var url = url;
                            $.ajax({
                                url: './ProcessStaff', //ajax codes start for delete data
                                type: 'POST',
                                data: data,
                                dataType: 'JSON'
                            })
                                    .done(function (response) {
                                        swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                        var url_ = "manage_employee.jsp";
                                        $(location).attr('href', url_);
                                        //  readFruit();
                                    })
                                    .fail(function () {
                                        swal('Oops...', 'Something went wrong with ajax !', 'error');    //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                    });
                        });
                    },
                    allowOutsideClick: false
                });
            }
        </script>
</body>

</html>