
$(document).ready(function () {
    var i = 1;
    $(".datepicker").datepicker();
    $("#txtTerminateDate").datepicker();
    $("#txtRehiredate").datepicker();
    $("#txtBirthDate").datepicker();
    $('#myTable').DataTable({
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
            "url": './Terminations?action=get_all_data',
            "type": "GET",
            dataType: "json",

            "data": function (d) {
                console.log(d);
                $("#termination_data").html(d);
            }
            ,
            dataSrc: ""
        },
        "columns": [
            {
                "render": function (data, type, row, meta) {
                    return i++;
                }
            },
            {
                "data": "emp_name"
            },

            {
                "data": "voluntary_termination"
            },
            {
                "data": "termination_date"
            },
            {
                "data": "termination_date"
            },

            {

                "data": "t_id",
                "render": function (data, type, row, meta) {
                    return 	'<div class="center"><a  title="View Details" href="http://hrms.braintricker.com/termination/8" class="btn btn-primary btn-xs btnColor">'
                            + '<i class="glyphicon glyphicon-th-large" aria-hidden="true"></i></a>'
                            + '<a href="http://hrms.braintricker.com/termination/8/edit"  class="btn btn-success btn-xs btnColor"><i class="fa fa-edit-square-o" aria-hidden="true"></i></a>'
                            + '<a href="http://hrms.braintricker.com/termination/8/delete" data-token="VaYD9VqbyVCwLglfpOe4kkUQweEVF6rWHgGvMO9j" data-id="8" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class=" mdi mdi-trash-can-outline" aria-hidden="true"></i></a> </div>';
                },
            }
        ]


    });

    //   $('.employee_t').select2();
    loademp();
    function loademp() {
        $.ajax({
            url: './AllStaffServlet?action=get_basic',
            type: 'get',
            dataType: '',
            success: function (data) {
                // $('.employee_t');
                var response = eval(data);
                var ddlEmployees = $(".employee_t").select2({
                    placeholder: "---- Please select ----",
                    allowClear: true
                });
                // console.log(response);
                $(response).each(function () {
                    var option = $("<option />");

                    //Set Employee Name in Text part.
                    option.html(this.full_name);
                    //Set Employee EmployeeNo in Value part.
                    option.val(this.emp_no);
                    //Add the Option element to DropDownList.
                    ddlEmployees.append(option);

                });
            }

        });

    }

});


