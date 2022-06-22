
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/vendor/jquery/jquery.min.js"></script>  
        <title></title>
        <script>



            jQuery(document).ready(function () {
                // initiate layout and plugins

                $("ul li").on("click", function () {
                    $("ul li").removeClass("active");
                    $(this).addClass("active");
                });


            });
        </script>
    </head>
    <body>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-item  ">
                    <a href="index.jsp" class='sidebar-link'> <i class="fa fa-home text-success"></i>
                        <span>Dashboard</span>
                    </a></li>
                <li class="sidebar-item  has-sub">
                    <a href="javascript:void(0)" class='sidebar-link'> <i class="fa fa-user text-success"></i>
                        <span>Administration</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="manage_role.jsp"> <i class="fa fa-circle-notch"> </i> Roles</a></li>
                        <li><a href="manage_role_permision.jsp"><i class="fa fa-circle-notch"> </i> Role Permission</a></li>
                        <li><a href="manage_user.jsp"><i class="fa fa-circle-notch"> </i> Users</a></li>
                        <li><a href="update_password.jsp"><i class="fa fa-circle-notch"> </i> Change Password</a></li>

                    </ul>
                </li>

                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="fa fa-users text-success"></i>
                        <span>Employee Management</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="manage_carder_type.jsp"><i class="fa fa-circle-notch"> </i> Carder Type</a></li>
                        <li><a href="manage_carder_category.jsp"><i class="fa fa-circle-notch"> </i> Carder Category</a></li>
                        <li><a href="manage_standardised_carder.jsp"><i class="fa fa-circle-notch"> </i> Standardized Carder</a></li>
                        <li><a href="manage_designation.jsp"><i class="fa fa-circle-notch"> </i>  Positions</a></li>
                        <li><a href="manage_employee.jsp"><i class="fa fa-circle-notch"> </i> Manage Employee</a></li>
                        <li><a href="manage_termination.jsp"><i class="fa fa-circle-notch"> </i> Termination</a></li>
                        <li><a href="manage_warning.jsp"><i class="fa fa-circle-notch"> </i> Warning</a></li>
                    </ul></li>

                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="fa fa-table text-success"></i>
                        <span>Leave Management</span>
                    </a>
                    <ul class="submenu" style="display: block;">
                        <li><a href="manage_holidays.jsp"><i class="fa fa-circle-notch"> </i> Public Holidays</a></li>
                        <li><a href="manage_leave_type.jsp"><i class="fa fa-circle-notch"></i> Manage Leave Type</a></li>
                        <li><a href="earn_leave_config.jsp"><i class="fa fa-circle-notch"></i> Earn Leave Configure</a></li>
                        <li><a href="requested_applications.jsp"><i class="fa fa-circle-notch"></i> Approve Application</a></li>
                        <li><a href="leave_applications.jsp"><i class="fa fa-circle-notch"></i> Requested Application</a>
                        <li><a href="leave_report.jsp"><i class="fa fa-circle-notch"></i> Leave Report</a>
                        <li><a href="leave_summary_report.jsp"><i class="fa fa-circle-notch"></i> Summary Report</a></li>
                    </ul>
                </li>
                <li class="sidebar-item  has-sub"><a href="javascript:void(0)" class='sidebar-link'>
                        <i class="fa fa-user text-success"></i> <span>Attendance</span></i>
                        </span>
                    </a>

                    <ul class="submenu" style="display: block;">
                        <li><a href="manage_shift.jsp"><i class="fa fa-circle-notch"> </i> Manage Shifts</a></li>
                        <li class=""><a href="daily_attendance.jsp"><i class="fa fa-circle-notch"> </i> Daily Attendance</a></li>
                        <li class=""><a href="monthly_manual_attendance.jsp"><i class="fa fa-circle-notch"> </i> Monthly Attendance</a></li>
                        <li class=""><a href="missing_attendance"><i class="fa fa-circle-notch"> </i> Missing Attendance</a></li>
                        <li class=""><a href="att_summary_report.jsp"> <i class="fa fa-circle-notch"> </i> Summary Report</a></li>
                        <li class=""><a href="manual_attendance.jsp"><i class="fa fa-circle-notch"> </i> Manual Attendance</a></li>

                    </ul></li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="fa fa-user text-success"></i>
                        <span>Payroll</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="manage_tax_rule_setup.jsp"> <i class="fa fa-circle-notch"> </i>Tax Rule Setup</a></li>
                        <li><a href="manage_allowance.jsp"> <i class="fa fa-circle-notch"> </i>Allowance</a></li>
                        <li><a href="manage_payment_history.jsp"> <i class="fa fa-circle-notch"> </i>Payment History</a></li>
                        <li><a href="manage_monthly_pay_grade.jsp"> <i class="fa fa-circle-notch"> </i>Monthly Pay Grade</a></li>
                        <li><a href="manage_deduction.jsp"> <i class="fa fa-circle-notch"> </i>Deduction</a></li>
                        <li><a href="manage_approve_work_hour.jsp"> <i class="fa fa-circle-notch"> </i>Approve Work Hour</a></li>
                        <li><a href="manage_hourly_pay_grade.jsp"> <i class="fa fa-circle-notch"> </i>Hourly Pay Grade</a></li>
                        <li><a href="manage_generate_salary_sheet.jsp"> <i class="fa fa-circle-notch"> </i>Generate Salary Sheet</a></li>


                    </ul>
                </li>
                <li class="sidebar-item "><a href="reports.jsp"
                                             class='sidebar-link'> <i class="fa fa-chart-bar text-success"></i>
                        <span>Reports</span>
                    </a></li>
            </ul>
        </div>

    </body>
</html>
