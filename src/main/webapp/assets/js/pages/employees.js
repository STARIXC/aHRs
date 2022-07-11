/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    get_all_staff();
    function get_all_staff() {
        $('#spinner-div').show();
        $.ajax({
            type: "GET",
            url: './ProcessStaff?action=allStaff',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#employee-table-data').empty();
                $.each(data, function (key, value)

                {
                    var status_active = '<span class="label label-success">Active</span>';
                    var status_not_active = '<span class="label label-danger">In Active</span>';
                    if (value.active === 1) {
                        var status = status_active;
                    } else {
                        var status = status_not_active;
                    }


                    var edit_tr = '<div class="d-flex" style="width: 150px;">'
                            + '<a title="Profile" href="employee_view.jsp?employee_id=' + value.emp_no + '" class="btn btn-primary btn-xs btnColor ms-1">'
                            + '<i class="fa fa-th-large" aria-hidden="true"></i>'
                            + '</a>'
                            + ' <a href="update_employee_form.jsp?employee_id=' + value.emp_no + '" class="btn btn-success btn-xs btnColor ms-1">'
                            + '<i class="fa fa-edit" aria-hidden="true"></i>'
                            + ' </a>'
                            + ' <a id="delete_staff" href="javascript:void(0);"  data-emp="' + value.emp_no + '" data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor ms-1"><i class="fa fa-trash"'
                            + '        aria-hidden="true"></i></a>'
                            + ' </div>';
                    $('#employee-table-data').append('<tr><td>' + i++ + '</td><td>' + value.full_name + '</td><td>' + value.emp_no + '</td> <td>' + value.position_name + '</td><td>' + value.phone + '</td><td>' + value.email + '</td><td>' + value.nationality + '</td><td>' + status + '</td><td>' + edit_tr + '  </td></tr>');
                });
            },
            complete: function () {
                $('#employee_table').DataTable(
                        {
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
                $('#spinner-div').hide();//Request is complete so hide spinner
            }
        });
    }


});