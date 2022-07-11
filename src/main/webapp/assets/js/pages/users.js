

var i = 1;
get_users();
function get_users() {
    $.ajax({
        type: "GET",
        url: './ManageUsers?action=listHolidays',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#tbl_holidays').empty();


            $.each(data, function (key, value)
            {
                $('#tbl_holidays').append('<tr><td>' + i++ + '</td><td>' + value.holiday_name + '</td>  <td>' + value.start_date + '</td> <td>' + value.end_date + '</td> <td>' + value.no_of_days + '</td> <td>  <a href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
            });

        },
        complete: function () {

        }
    });

}

