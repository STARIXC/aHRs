<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Admin-HRMIS</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="robots" content="all,follow" />
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
        <!-- Font Awesome CSS-->
        <link
            rel="stylesheet"
            href="vendor/font-awesome/css/font-awesome.min.css"
            />
        <!-- Fontastic Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css" />
        <!----css3---->
        <link rel="stylesheet" href="css/custom.css" />
        <!----data table css---->
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css"
            />

        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
            rel="stylesheet"
            />
            <link rel="stylesheet" href="css/select2.min.css" />
        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" />
            <script src="vendor/jquery/jquery.min.js"></script>
          
    </head>
    <body>
        <div class="wrapper">
            <div class="body-overlay"></div>

  <!-- Sidebar  -->
 <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><span>Admin-HRMIS</span></h3>
                </div>
                <ul class="list-unstyled components">
                    <li >
                        <a href="/">Dashboard</a>
                    </li>
                    <li>
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Time sheets</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li class="active" >
                                <a href="timesheet.jsp">Timesheet Form</a>
                            </li>
                            <li>
                                <a href="monthly.jsp">Monthly Timesheet</a>
                            </li>
                            <li>
                                <a href="timesheet_missing.jsp">Missing Attendance</a>
                            </li>
                            <li>
                                <a href="timesheet_logs.jsp">Attendance Log</a>
                            </li>
                              <li>
                                <a href="manager_activity.jsp">Activities</a>
                            </li>
                              <li>
                                <a href="manage_department.jsp">Departments</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#employeeSubmenu" data-toggle="collapse" aria-expanded="false"
                           class="dropdown-toggle">Employees</a>
                        <ul class="collapse list-unstyled" id="employeeSubmenu">
                            <li>
                                <a href="positions.jsp">Positions</a>
                            </li>
                            <li>
                                <a href="create_emp.jsp">Add new</a>
                            </li>
                            <li>
                                <a href="ViewStaff.jsp">Manage Employee</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Notice Board</a>
                    </li>
                    <li>
                        <a href="#payrollSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Payroll</a>
                        <ul class="collapse list-unstyled" id="payrollSubmenu">
                            <li>
                                <a href="create_s_setup.jsp">Salary Setup</a>
                            </li>
                            <li>
                                <a href="create_salary_generate.jsp">Salary Generate</a>
                            </li>
                            <li>
                                <a href="emp_payment_view.jsp">Manage Employee Salary</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#leaveSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Leave</a>
                        <ul class="collapse list-unstyled" id="leaveSubmenu">
                            <li>
                                <a href="holiday_view.jsp">Holiday</a>
                            </li>
                            <li>
                                <a href="manage_leaves.jsp">Leave Type</a>
                            </li>
                            <li>
                                <a href="others_leave.jsp">Leave Applications</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#settingsSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Settings</a>
                        <ul class="collapse list-unstyled" id="settingsSubmenu">
                            <li>
                                <a href="#userSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Users</a>
                                <ul class="collapse list-unstyled" id="userSubmenu">
                                    <li>
                                        <a href="add_user.jsp">Add User</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">User List</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#rpSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Role
                                    Permission</a>
                                <ul class="collapse list-unstyled" id="rpSubmenu">
                                    <li>
                                        <a href="add_user.jsp">Permission Setup</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">Add Role</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">Role List</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">User Access Role</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="emp_payment_view.jsp">Application Settings</a>
                            </li>
                            <li>
                                <a href="emp_payment_view.jsp">Backup and Download</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#reportSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Reports</a>
                        <ul class="collapse list-unstyled" id="reportSubmenu">
                            <li>
                                <a href="#userSubmenu" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle">Attendance/Timesheet</a>
                                <ul class="collapse list-unstyled" id="userSubmenu">
                                    <li>
                                        <a href="add_user.jsp">Daily Present</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">Monthly Present</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">Daily Absent</a>
                                    </li>
                                    <li>
                                        <a href="user_list.jsp">Monthly Absent</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#lrpSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Role
                                    Permission</a>
                                <ul class="collapse list-unstyled" id="lrpSubmenu">
                                    <li>
                                        <a href="add_user.jsp">Employee On Leave</a>
                                    </li>
                                    
                                </ul>
                            </li>
                         
                        </ul>
                    </li>
                </ul>
            </nav>
            
   
           <!-- Page Content  -->
            <div id="content">
                <div class="top-navbar">
                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid">
                            <button
                                type="button"
                                id="sidebarCollapse"
                                class="d-xl-block d-lg-block d-md-mone d-none"
                                >
                                <span class="fa fa-angle-left fa-2x"></span>
                            </button>

                            <a class="navbar-brand" href="#"> Dashboard </a>

                            <div
                                class=" collapse navbar-collapse d-lg-block d-xl-block d-sm-none d-md-none d-none"
                                id="navbarSupportedContent"
                                >
                                <ul class="ml-auto nav navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a
                                            id="notifications"
                                            rel="nofollow"
                                            data-target="#"
                                            href="#"
                                            data-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false"
                                            class="nav-link"
                                            >
                                            <i class="fa fa-bell-o"></i
                                            ><span class="badge bg-red badge-corner notification"
                                                   >12</span
                                            ></a
                                        >
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">You have 5 new messages</a>
                                            </li>
                                            <li>
                                                <a href="#">You're now friend with Mike</a>
                                            </li>
                                            <li>
                                                <a href="#">Wish Mary on her birthday!</a>
                                            </li>
                                            <li>
                                                <a href="#">5 warnings in Server Console</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <span class="fa fa-th"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <span class="fa fa-user fa-1x"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <span class="fa fa-cog fa-1x"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>

        <div class="main-content">
          <!-- Dashboard Counts Section-->
          <div class="row">
            <div class="col-sm-12 col-md-12">
              <div class="card">
                <div class="card-header has-shadow">
                  <div class="card-title">
                    <h4>Timesheet Logs</h4>
                  </div>
                </div>
                <div class="card-body">
                  <form action="/create_atten_vol" method="post" accept-charset="utf-8">
                    <div class="row">
                      <div class="col-md-4 col-sm-12">
                        <div class="form-group">
                          <label for="date_start" class="col-form-label">Start Date*</label>
                      
                            <input type="text" name="date_start" id="date_start" placeholder="Date"
                              class="form-control datetimepicker" value="" autocomplete="off" />
                          </div>
                        </div>
    
                        <!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
                        <div class="col-md-4 col-sm-12">
                        <div class="form-group ">
                          <label for="date_end" class="col-form-label">End Date*</label>
                             
                          <input type="text" name="date_end" id="date_end" placeholder="Date"
                          class="form-control datetimepicker" value="" autocomplete="off" />
                          </div>
                        </div>
                        
                    </div>
                 

                    <button type="button"  class="btn btn-success w-md m-b-5"
                    autocomplete="off">
                   Search
                  </button>
                  </form>
                </div>
              </div>
            </div>
         
          </div>
          <div class="row d-none">
            <div class="col-sm-12 col-md-12">
              <div class="card">
                <div class="card-header has-shadow">
                  <div class="card-title">
                    <h4>Incomplete Timesheet</h4>
                  </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">   
                        <table class="table table-striped table-sm timesheet_missing">
                          <thead>
                            <tr>
                              <th>#</th>
                              <th>PF No</th>
                              <th>Name</th>
                              <th>Designation</th>
                              <th>Date</th>
                              <th>Hours expected</th>
                              <th>Hours Missing</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
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

      <!-- Page Footer-->

    </div>

    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>

    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script src="js/custom_.js"></script>

    <!-- JavaScript files-->
  </body>

</html>
