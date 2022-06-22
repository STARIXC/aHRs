$(function () {
    $(".datepicker").datepicker();
    $(".select2").select2();
//     $('#myTable').DataTable();

});
var i = 1;
get_holidays();
function get_holidays() {
    $.ajax({
        type: "GET",
        url: './ManageHolidays?action=listHolidays',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#tbl_holidays').empty();


            $.each(data, function (key, value)
            {
                $('#tbl_holidays').append('<tr><td>' + i++ + '</td><td>' + value.holiday_name + '</td>  <td>' + value.start_date + '</td> <td>' + value.end_date + '</td> <td>' + value.no_of_days + '</td> <td>  <a href="'+value.id+'" class="btn btn-success btn-xs btnColor"> <i class="fa fa-edit" ></i></a> <a href="javascript:void(0);"  data-id="'+value.id+'" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
            });
           
        },
        complete: function () {

        }
    });

}
$(".alert-success").delay(2000).fadeOut("slow");
//   $(".alert-danger").delay(2000).fadeOut("slow");
$(document).on("focus", ".yearPicker", function () {
    $(this).datepicker({
        format: 'yyyy',
        minViewMode: 2
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });
});
$(document).on("focus", ".datepicker", function () {
    $(this).datepicker({
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        clearBtn: true
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });
});
$(document).on("focus", ".timePicker", function () {
    $(this).timepicker({
        showInputs: false,
        minuteStep: 1
    });
});
$(".monthField").datepicker({
    format: "yyyy-mm",
    viewMode: "months",
    minViewMode: "months"
}).on('changeDate', function (e) {
    $(this).datepicker('hide');
});
$("#from_date").datepicker({
    dateFormat: "yy-mm-dd",
    numberOfMonths: 1,
    minDate: 0,
    changeMonth: true,
    changeYear: true,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate());
        $("#to_date").datepicker("option", "minDate", dt);
        $(this).change();
    }

}).on("change", function () {
    showDays();
});
$("#to_date").datepicker({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() - 1);
        $(this).change();
    }
}).on("change", function () {
    showDays();
});

function showDays() {
    var start = $('#from_date').datepicker('getDate');
    var end = $('#to_date').datepicker('getDate');
    if (!start || !end)
        return;
    var days = (end - start) / 1000 / 60 / 60 / 24;
    $('#no_of_days').val(days + 1);

}

// jQuery ajax form submit example, runs when form is submitted
$("#publicHolidayForm").submit(function (e) {
    e.preventDefault(); // prevent actual form submit

    var no_of_days = $("#no_of_days").val();
    var holiday_name = $("#holiday_name").val();
    var from_date = $("#from_date").val();
    var to_date = $("#to_date").val();
    var comment = $("#comment").val();
    var action = "submit";
    var leave_status = 1;
    var data = {
        action: action,
        no_of_days: no_of_days,
        holiday_name: holiday_name,
        from_date: from_date,
        to_date: to_date,
        comment: comment,
    };
    var url = "./ManageHolidays"; //get submit url [replace url here if desired]
    //screenLock();
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "json",
        //if received a response from the server
        success: function (data, textStatus, jqXHR) {
            //our country code was correct so we have some information to display
            if (data.success) {

            }
            //display error message
            else {
                $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
            }
        },
        //If there was no resonse from the server
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Something really bad happened " + textStatus);
            // $("#ajaxResponse").html(jqXHR.responseText);
        },
        //capture the request before it was sent to server
        beforeSend: function (jqXHR, settings) {
            //adding some Dummy data to the request
            settings.data += "&dummyData=whatever";
            //disable the button until we get the response
//                                $('#myButton').attr("disabled", true);
        },
        //this is called after the response or error functions are finsihed
        //so that we can take some action
        complete: function (jqXHR, textStatus) {
            //enable the button 
//                        $('#myButton').attr("disabled", false);
        }
    });
});

