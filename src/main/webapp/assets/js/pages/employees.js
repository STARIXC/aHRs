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
                "data": null,
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
                        return '<span class="label label-success">Active</span>';
                    } else {
                        return '<span class="label label-danger">In Active</span>';
                    }
                }
            }, {

                "data": "emp_no",
                "render": function (data, type, row, meta) {
                    var edit_tr = '<div class="d-flex" style="width: 150px;">'
                            + '<a title="Profile" href="employee_view.jsp?id=' + data + '" class="btn btn-primary btn-xs btnColor ms-1">'
                            + '<i class="fa fa-th-large" aria-hidden="true"></i>'
                            + '</a>'
                            + ' <a href="update_employee_form.jsp?employee_id='+data+'" class="btn btn-success btn-xs btnColor ms-1">'
                            + '<i class="fa fa-edit" aria-hidden="true"></i>'
                            + ' </a>'
                            + ' <a href="javascript:void(0);"  data-id="' + data + '" class="delete btn btn-danger btn-xs deleteBtn btnColor ms-1"><i class="fa fa-trash"'
                            + '        aria-hidden="true"></i></a>'
                            + ' </div>';
                    return 	edit_tr;
                }
            }]

    });
 



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