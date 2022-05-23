/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;


    var i = 1;
    $('#leave_type_table').DataTable({
        "ajax": {
            "url": 'LeaveType',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#leave_type_data").html(d);
            }
        },
        //{"id":2,"carder_category_id":0,"standardized_cadre_id":0,"position_title":"CLINICAL MENTOR","cadre_type_id":0,"basic_pay":0}

        "columns": [
            {
                "data": "leave_type_name"
            },
           
            {
                "data": "leave_type_name"
            },
            {
                "data": "total_days"
            },
            {
                "targets": 0,
                "data": "typeID",
                "render": function (data, type, row, meta) {
                    return '<div class="d-flex"><a href="editDesignation.php"><i class="fa fa-pen text-success"></i></a> <ahref="editDesignation.php"><i class="fa fa-trash text-danger"></i></a></div>';
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