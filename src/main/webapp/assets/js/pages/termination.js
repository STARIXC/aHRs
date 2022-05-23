
$(document).ready(function () {
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


