<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
      <script defer src="assets/fontawesome/js/all.min.js"></script>
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/css/style.css">
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
                     <li class="dropdown">
                        <a href="#" data-bs-toggle="dropdown"
                           class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                           <div class="avatar me-1">
                              <img src="assets/images/admin.png" alt="" srcset="">
                           </div>
                           <div class="d-none d-md-block d-lg-inline-block">Hi, Employee</div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                           <a class="dropdown-item" href="update.jsp"><i data-feather="user"></i> Account</a>
                           <a class="dropdown-item" href="update_password.jsp"><i data-feather="settings"></i> Settings</a>
                           <div class="dropdown-divider"></div>
                           <a class="dropdown-item" href="login.jsp"><i data-feather="log-out"></i> Logout</a>
                        </div>
                     </li>
                  </ul>
                </div>
            </nav>
            
<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Update Password</h3>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp" class="text-success">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Update Password</li>
                    </ol>
                </nav>
            </div>
        </div>

    </div>


    <!-- // Basic multiple Column Form section start -->
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-8">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-12 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">Old Password</label>
                                            <div class="position-relative">
                                                <input type="password" class="form-control" placeholder="old password" id="first-name-icon">
                                                <div class="form-control-icon">
                                                    <i class="fa fa-key"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">New Password</label>
                                            <div class="position-relative">
                                                <input type="password" class="form-control" placeholder="new password" id="first-name-icon">
                                                <div class="form-control-icon">
                                                    <i class="fa fa-key"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">Confirm Password</label>
                                            <div class="position-relative">
                                                <input type="password" class="form-control" placeholder="confirm passsword" id="first-name-icon">
                                                <div class="form-control-icon">
                                                    <i class="fa fa-key"></i>
                                                </div>
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
    </section>
    <!-- // Basic multiple Column Form section end -->
</div>

        </div>
    </div>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script src="assets/js/main.js"></script>
</body>
</html>