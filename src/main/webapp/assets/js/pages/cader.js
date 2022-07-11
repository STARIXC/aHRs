jQuery(document).ready(function () {
    var jsonData;

    
    var i = 1;
get_carder_cat();
function get_carder_cat() {
    $.ajax({
        type: "GET",
        url: './CarderCat?action=all',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#cadre_category_data').empty();
            $.each(data, function (key, value)
            {
                $('#cadre_category_data').append('<tr><td>' + i++ + '</td><td>' + value.cadre_category_name + '</td> <td>  <a  href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a id="delete_carder_cat" href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
            });

        },
        complete: function () {

        }
    });

}
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
    

//    save carder
    $("#carderForm_").submit(function (e) {
        alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#carderForm_");
        var action = "update_carder";
        var data = form.serialize() + "&action=" + action;
        var url = './CarderTypeUpdates';
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
        var action = "update_carder_cat";
        var data = form.serialize() + "&action=" + action;
        var url = './CarderCatUpdate';
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