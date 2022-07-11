// jQuery ajax form submit example, runs when form is submitted
$("#createEmployee").submit(function (e) {
    e.preventDefault(); // prevent actual form submit
    var form = $("#createEmployee");
    let action = "save_employee";
    var data = form.serialize() + "&action=" + action;
    var url = './ProcessStaff'; //get submit url [replace url here if desired]
    //screenLock();
    $.ajax({
        type: "POST",
        url: url,
        data: data, // serializes form input
        beforeSend: function beforeSend() {
            //	startLoader();
            console.log(data);
        },
        success: function (data) {

            console.log(data);
            var url_ = "manage_employee.jsp";
            $(location).attr('href', url_);
        },
        error: function error(result) {

        },
        complete: function complete() {
            //	stopLoader();
            event.preventDefault();
        }
    });
});
// jQuery ajax form submit example, runs when form is submitted
$("#updateEmployee").submit(function (e) {
    e.preventDefault(); // prevent actual form submit
    var form = $("#updateEmployee");
    let action = "update_employee";
    var data = form.serialize() + "&action=" + action;
    var url = './StaffUpdate'; //get submit url [replace url here if desired]
    //screenLock();
    $.ajax({
        type: "POST",
        url: url,
        data: data, // serializes form input
        beforeSend: function beforeSend() {
            //	startLoader();
            console.log(data);
        },
        success: function (data) {

            console.log(data);
            var url_ = "manage_employee.jsp";
            $(location).attr('href', url_);
        },
        error: function error(result) {

        },
        complete: function complete() {
            //	stopLoader();
            event.preventDefault();
        }
    });
});


var i = 1;
get_FY();
function get_FY() {
    $.ajax({
        type: "GET",
        url: './ProcessFinancialYear?action=all',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#ddlFY').empty();
            $('#ddlFY').append('<option value="">--- Select One---</option>');
            $.each(data, function (key, value)
            {
                $('#ddlFY').append('<option value="' + value.id + '">' + value.name + '</option>');
            });

        },
        complete: function () {

        }

    });

}