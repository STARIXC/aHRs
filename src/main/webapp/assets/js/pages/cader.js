jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    $('#cadre_category_table').DataTable({
        "ajax": {
            "url": './CarderCat?action=all',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#cadre_category_data").html(d);
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
                "data": "cadre_category_name"
            },
            {
                "targets": 0,
                "data": "id",
                "render": function (data, type, row, meta) {
                    return 	'<div class="d-flex m-2"><a  class="btn btn-sm bg-success" href="edit_carder_category.jsp?id=' + data + '&action=edit"><i class="fa fa-pen text-white"></i></a><a class="btn btn-sm bg-danger" href="./CarderCat?id=' + data + '&action=delete"><i class="fa fa-trash text-white"></i></a></div>';
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
//        carder pype
    $('#cadre_type_table').DataTable({
        "ajax": {
            "url": './CadreTypeServlet',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#carder-table-data").html(d);
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
                "data": "cadre_type_name"
            }, {
                "data": "hrs_per_week"
            },
            {
                "targets": 0,
                "data": "id",
                "render": function (data, type, row, meta) {
                    return 	'<div class="d-flex m-2"><a  class="btn btn-sm bg-success" href="edit_carder_type.jsp?id=' + data + '&action=edit"><i class="fa fa-pen text-white"></i></a><a class="btn btn-sm bg-danger" href="./CarderTypeServlet?id=' + data + '&action=delete"><i class="fa fa-trash text-white"></i></a></div>';
                }
            }]

    });

//    save carder
    $("#carderForm_").submit(function (e) {
        alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#carderForm_");
        var action = "save_carder";
        var data = form.serialize() + "&action=" + action;
        var url = './CadreTypeServlet';
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_carder_type.jsp";
                $(location).attr('href', url_);
                console.log(data);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });
    });
//    save carder
    $("#carder_cat_Form_").submit(function (e) {
      //  alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#carder_cat_Form_");
        var action = "save_carder_cat";
        var data = form.serialize() + "&action=" + action;
        var url = './CarderCat';
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_carder_category.jsp";
                $(location).attr('href', url_);
                console.log(data);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });
    });
   
});