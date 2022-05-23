/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    $('.datatable').DataTable({
        responsive: true,
        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        buttons: [
            {extend: 'copy', className: 'btn-sm'},
            {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'},
            {extend: 'excel', title: 'exportTitle', className: 'btn-sm'},
            {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
            {extend: 'print', className: 'btn-sm'}
        ]
    });
    $('#employee_table').DataTable({
        responsive: true,
        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        buttons: [
            {extend: 'copy', className: 'btn-sm'},
            {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'},
            {extend: 'excel', title: 'exportTitle', className: 'btn-sm'},
            {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
            {extend: 'print', className: 'btn-sm'}
        ],
        "ajax": {
            "url": './AllStaffServlet?action=allStaff',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#termination_data").html(d);
            }
        },
        "columns": [
            {
                "data":null,
                "render": function (data, type, row, meta) {
                    return i++;
                }
            },
            {
                "data": "full_name"
            },
            
            
            {
                "data": "emp_no"
            },
            {
                "data": "position_name"
            },
            {
                "data": "phone"
            },
            {
                "data": "email"
            },
             {
                "data": "nationality"
            },
            {
              
                "data": "active",
                "render": function (data, type, row, meta) {
                    if (data === 1) {
                        return '<div class="toggle-example" ><div class="toggle btn btn-success" data-toggle="toggle" style="width: 89.375px; height: 34px;"><input type="checkbox" checked="" data-toggle="toggle" data-on="Active" data-off="Inactive" data-onstyle="success" data-offstyle="danger"><div class="toggle-group"><label class="btn btn-success toggle-on">Active</label><label class="btn btn-danger active toggle-off">Inactive</label><span class="toggle-handle btn btn-default"></span></div></div></div>';
                    } else {
                        return '<div class="toggle-example" ><div class="toggle btn btn-danger" data-toggle="toggle" style="width: 92px; height: 34px;"><input type="checkbox" checked="" data-toggle="toggle" data-on="Inactive" data-off="Active" data-onstyle="success" data-offstyle="danger"><div class="toggle-group"><label class="btn btn-danger toggle-on">Inactive</label><label class="btn btn-danger active toggle-off">Active</label><span class="toggle-handle btn btn-default"></span></div></div></div>';
                    }
                }
            }, {
               
                "data": "emp_no",
                "render": function (data, type, row, meta) {
                    return 	'<td class="center"><a href="update_employee_form.jsp?employee_id='+data+'" class="btn btn-xs btn-success"><i class="fa fa-pencil"></i></a><a href="Employee/Delete/" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a><a href="/employee/Employees/cv/" class="btn btn-default btn-xs"><i class="fa fa-user"></i></a></td>';
                }
            }]

    });
    /*$.ajax({
     url: './EmployeesController',
     type: 'get',
     dataType: 'html',
     success: function(response) {
     
     
     },
     error: function(e) {
     alert('Error: ' + e);
     }
     
     <tr class="gradeX odd" role="row">
     <td class="sorting_1" tabindex="0">1</td>
     <td><img src="https://newhrm.bdtask.com/hrm_v4.4_demo/./application/modules/employee/assets/images/2021-07-03/fm1.jpg" alt="Image" height="64"></td>
     <td>lorem</td>
     <td>ipsom</td>
     <td>14</td>
     <td>0864515651</td>
     <td>lorem@email.com</td>
     <td>Australia</td>
     <td>No</td>
     <td align="center">
     <div class="toggle-example" onclick="alert('Your Are In Demo Mode')">
     <div class="toggle btn btn-success" data-toggle="toggle" style="width: 90.0977px; height: 34.4922px;"><input type="checkbox" checked="" data-toggle="toggle" data-on="Active" data-off="Inactive" data-onstyle="success" data-offstyle="danger"><div class="toggle-group"><label class="btn btn-success toggle-on">Active</label><label class="btn btn-danger active toggle-off">Inactive</label><span class="toggle-handle btn btn-default"></span></div></div>
     </div>
     </td>
     <td class="center">
     <a href="https://newhrm.bdtask.com/hrm_v4.4_demo/employee/Employees/update_employee_form/14" class="btn btn-xs btn-success"><i class="fa fa-pencil"></i></a> 
     <a onclick="alert('You Are In Demo Mode')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a> 
     <a href="https://newhrm.bdtask.com/hrm_v4.4_demo/employee/Employees/cv/14" class="btn btn-default btn-xs"><i class="fa fa-user"></i></a>
     
     </td>
     </tr>
     });
     */



    // jQuery ajax form submit example, runs when form is submitted
    $("#positionForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#timesheetForm");
        var action = "save_log";
        var data = form.serialize() + "&action=" + action;
        var url = './PositionServlet'; //get submit url [replace url here if desired]
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
                var url_ = "manage_timesheet.jsp";
                $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });

    });

});