<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pending</title>
        <link href="assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>

        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <script src="assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
        <!--        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">-->
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header" style="height: 50px;margin-top: -30px">
                        <i class="fa fa-users text-success me-4"></i>
                        <span>HRH</span>
                    </div>
                    <!-- BEGIN SIDEBAR MENU -->         
                    <%@include file="/_includes/sidebar_menu.jsp"%>
                    <!-- END SIDEBAR MENU -->
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
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
                    <div class="row mb-2">
                        <div class="col-md-8 order-md-1 order-last">
                            <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Manage Leave Type</li>
                                </ol>
                            </nav>
                        </div>

                    </div>


                    <!-- Basic Vertical form layout section start -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-success text-white">
                                    <i class="mdi mdi-table fa-fw"></i> 
                                    Manage Leave Applications
                                </div>
                                <div class="card-body pt-3">
                                    <form  id="multiple_leave_approval">
                                        <section class="section">
                                            <div class="leave_section">
                                                <div class=" table-responsive">

                                                    <table class='table table-hover datatable responsive' id="pending_leave_table">
                                                        <thead>
                                                            <tr>
                                                                <th><input type="checkbox" id="checkAl"> Select All</th>
                                                                <th>Name</th>
                                                                <th>Employee Id</th>
                                                                <th>Application Start Date</th>
                                                                <th>Application End date</th>
                                                                <th>Application Date</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="pending_leave_table_data">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </section>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-6 order-md-2 order-last">
                                                    <a data-id="Approve" href="javascript:void(0)" class="btn btn-success float-start m-l-20 hidden-xs hidden-sm waves-effect waves-light" id="all_approved">
                                                        <i class="fa fa-paper-plane" aria-hidden="true"></i> Approve All</a>
                                                </div>
                                                <!--                                                <div class="col-md-6 order-md-2 order-first">
                                                
                                                                                                    <a data-id="Reject" href="javascript:void(0)" class="btn btn-danger float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light" id="reject_all">
                                                                                                        <i class="fa fa-times" aria-hidden="true"></i> Reject All</a>
                                                
                                                                                                </div>-->
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- // Basic Vertical form layout section end -->
                </div>

            </div>
        </div>
        <script src="assets/js/feather-icons/feather.min.js"></script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap-toggle.min.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/vendor/DataTables/datatables.js"></script>


        <script src="assets/js/vendors.js"></script> 
        <script src="assets/js/custom_.js"></script>  

        <script src="assets/js/main.js"></script>
        <script src="assets/js/pages/pending_leave.js"></script>
        <script>
            $(document).ready(function () {

                $("#checkAl").click(function () {
                    $('input:checkbox').not(this).prop('checked', this.checked);
                });
                $(document).on('click', '#all_approved', function (e) {
                    e.preventDefault();
                    var leave = $(this).data('id');
                    console.log("action: " + leave);
                    SwalApprove(leave);
                });
                $(document).on('click', '#reject', function (e) {
                    e.preventDefault();
                    var leave = $(this).data('id');
                    console.log("action: " + leave);
                    SwalReject(leave);
                    //deleteConfirmation(leave);
                });
            });
            function SwalApprove(leave) {


                swal({
                    title: 'Are you sure?',
                    text: "Your Are About to Approve Multiple Applications",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6', //sweetalert confirm dialouge 
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Approve!',
                    showLoaderOnConfirm: true,
                    preConfirm: function () {
                        return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                            var form = $("#multiple_leave_approval");
                            var action = leave;
                            var data = form.serialize() + "&action=" + action;
                            var url = url;
                            $.ajax({
                                url: './ProcessLeaveApplications', //ajax codes start for delete data
                                type: 'POST',
                                data: data,
                                dataType: 'JSON'
                            })
                                    .done(function (response) {
                                        swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                        var url_ = "pending_leave.jsp";
                                        $(location).attr('href', url_);
                                        //  readFruit();
                                    })
                                    .fail(function () {
                                        swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                    });
                        });
                    },
                    allowOutsideClick: false
                });
            }
            function SwalReject(leave) {


                swal({
                    title: "Reason Rejected!",
                    text: "Write something :",
                    html: '<textarea class="swal2-textarea" placeholder="Write something" id="reason"  ></textarea>',
                    showCancelButton: true,
                    confirmButtonText: 'Proceed',
                    showLoaderOnConfirm: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    preConfirm: function () {
                        return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                            var reason = document.getElementById('reason').value;
                            var application_id = leave;
                            var action = "reject";
                            var data = "reason="+reason + "&action=" + action + "&application=" + application_id;
                            var url = './ProcessLeaveApplications';
                            $.ajax({
                                url: url, //ajax codes start for delete data
                                type: 'POST',
                                data: data,
                                dataType: 'JSON'
                            })
                                    .done(function (response) {
                                        swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                        var url_ = "all_leave.jsp";
                                        $(location).attr('href', url_);
                                        //  readFruit();
                                    })
                                    .fail(function () {
                                        swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                    });
                        });
                    },
                    allowOutsideClick: false
                });
            }
            function deleteConfirmation(id) {
                swal({
                    title: "Reason Rejected!",
                    input: 'textarea',
                    inputPlaceholder: "Write something",
                    type: "warning",
                    showCancelButton: !0,
                    confirmButtonText: "Proceed!",
                    cancelButtonText: "No, cancel!",
                    reverseButtons: !0,
                    allowOutsideClick: false
                }).then(function (e) {

                    if (e.value === true) {
                        var reason = e.value;
                        var application_id = id;
                        var action = "reject";
                        var data = reason + "&action=" + action + "&application=" + application_id;
                        var url = url;
                        $.ajax({
                            url: './ProcessLeaveApplications', //ajax codes start for delete data
                            type: 'POST',
                            data: data,
                            dataType: 'JSON'
                        })
                                .done(function (response) {
                                    swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                    var url_ = "pending_leave.jsp";
                                    $(location).attr('href', url_);
                                    //  readFruit();
                                })
                                .fail(function () {
                                    swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                });



                    } else {
                        e.dismiss;
                    }

                }, function (dismiss) {
                    return false;
                })
            }

        </script>
    </body>

</html>