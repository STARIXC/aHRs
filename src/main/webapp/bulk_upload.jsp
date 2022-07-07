<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bulk Upload</title>
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
                                    <div class="card-header bg-info"><i class="mdi mdi-clipboard-text fa-fw"></i>	 Bulk Upload
                                    </div>
                                    <div class="card-wrapper" >
                                        <div class="card-body card-body">
                                <form method="POST"  accept-charset="UTF-8" enctype="multipart/form-data" id="employeeForm"><input name="_token" type="hidden" value="8qKunwAdLvt3cv2hZJqn8BFfB3XE7tEYuXEHFpUE">
								<div class="form-body">
									<h3 class="box-title">Employee Account </h3>
									<hr>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label for="exampleInput">CSV file <a href="/uploads/sample.csv">Download Sample</a></label>
										<input type="file" class="form-control" name="upload_file" id="address" placeholder="CSV file">
									</div>
									<div class="form-group">
											<button type="submit" class="btn btn-info btn_style"><i class="fa fa-check"></i> Upload</button>
										</div>
								</div>

								<div class="col-md-9">
									<div class="table-responsive">
										<label class="text-center">Field Evaulation</label>
										<table class="table table-striped">
											<tbody><tr>
                                              <th>Field Name</th>
                                              <th>Required</th>
                                              <th>Value</th>
                                              <th>Default</th>
											</tr>
											<tr>
                                              <td>role_id <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any integer and valid role id form role list</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>user_name <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>unique user name</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>password <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any string or integer</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>first_name <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any name as string</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>last_name</td>
                                              <td>No</td>
                                              <td>any last name as string and it's optional</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>finger_id <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>Must be an integer and have to be unique</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>department_id <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any valid department id from department list</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>designation_id <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any valid Designattion id from Designation list</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>branch_id <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>any valid Branch id from Branch list</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>supervisor_id</td>
                                              <td>No</td>
                                              <td>optional and if you provide have to give any previous Employee Id as supervisor</td>
                                              <td>Null</td>
											</tr>
											<tr>
                                              <td>workshitf_id <span class="text-danger">*</span></td>
                                              <td>No</td>
                                              <td>Workshift id from worshift list</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>pay_grade_id</td>
                                              <td>Required when employee is not hourly based</td>
                                              <td>Monthly paygrade id from paygrade list</td>
                                              <td>0</td>
											</tr>
											<tr>
                                              <td>houlry_salries_id</td>
                                              <td>Required when employee is not monthly based</td>
                                              <td>Hourly paygrade id from hourly paygrade list</td>
                                              <td>0</td>
											</tr>
											<tr>
                                              <td>email</td>
                                              <td>No</td>
                                              <td>optional if you provide you have to provide unique and valid email address</td>
                                              <td>NULL</td>
											</tr>
											<tr>
                                              <td>date_of_birth <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>Date Formmat yyyy-mm-dd as example 1990-01-05</td>
                                              <td>N/A</td>
											</tr>
											<tr>
                                              <td>date_of_joining</td>
                                              <td>No</td>
                                              <td>Date Formmat yyyy-mm-dd as example 2020-01-05</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>date_of_leaving</td>
                                              <td>No</td>
                                              <td>Date Formmat yyyy-mm-dd as example 2020-01-05 (optinal applicable for ex employee)</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>marital_status</td>
                                              <td>No</td>
                                              <td>optional will be Married or Unmarried as value</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>address</td>
                                              <td>No</td>
                                              <td>optional any valid text</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>emergency_contacts</td>
                                              <td>No</td>
                                              <td>optional any valid text</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>gender <span class="text-danger">*</span></td>
                                              <td>Yes</td>
                                              <td>string as Male or Female</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>religion</td>
                                              <td>No</td>
                                              <td>Optinal Any String as islam buddism christian</td>
                                              <td>NUll</td>
											</tr>
											<tr>
                                              <td>phone</td>
                                              <td>No</td>
                                              <td>optinal if given have to be Any valid phone number and must be unique for every user </td>
                                              <td>NUll</td>
											</tr>
										</tbody></table>
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
        <script >
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
