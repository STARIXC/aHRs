/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;


    var i = 1;
    $('#position_table').DataTable({
        "ajax": {
            "url": 'PositionServlet',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#position_table_data").html(d);
            }
        },
        //{"id":2,"carder_category_id":0,"standardized_cadre_id":0,"position_title":"CLINICAL MENTOR","cadre_type_id":0,"basic_pay":0}

        "columns": [{
                "render": function (data, type, full, meta) {
                    return i++;
                }
            }, {
                "data": "position_title"
            }, {
                "targets": 0,
                "data": "id",
                "render": function (data, type, row, meta) {
                    return '<div class="d-flex"><a id="edit-hols" data-id="' + data + '" href="javascript:void(0)" class="edit-hols btn btn-md btn-success ms-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="fa fa-pen text-white"></i></a> <a id="delete_leave_type" data-id="' + data + '" href="javascript:void(0)" class="btn btn-md btn-danger ms-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="fa fa-trash text-white"></i></a></div>';
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