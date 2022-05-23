// jQuery ajax form submit example, runs when form is submitted
$("#createEmployee").submit(function (e) {
    e.preventDefault(); // prevent actual form submit
    var form = $("#createEmployee");
    let action = "save_employee";
    var data = form.serialize() + "&action=" + action;
    var url = './Employee/create_employee'; //get submit url [replace url here if desired]
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
            //var url_ = "manage_employee.jsp";
            //$(location).attr('href', url_);
        },
        error: function error(result) {

        },
        complete: function complete() {
            //	stopLoader();
            event.preventDefault();
        }
    });
});

