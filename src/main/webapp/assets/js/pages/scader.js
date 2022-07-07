jQuery(document).ready(function () {
    var jsonData;


    var i = 1;
    get_scarder_cat();
    function get_scarder_cat() {
        $.ajax({
            type: "GET",
            url: './StandardizedCarder?action=all',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#s_cadre_data').empty();
                $.each(data, function (key, value)
                {
                    $('#s_cadre_data').append('<tr><td>' + i++ + '</td><td>' + value.emp_type_name + '</td> <td>' + value.carder_category_name + '</td><td>' + value.standardized_cadre_name + '</td><td>  <a  href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a id="delete_scarder" href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
                });

            },
            complete: function () {

            }
        });

    }


//    save carder
    $("#ScarderForm_").submit(function (e) {
        // alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#ScarderForm_");
        var action = "process_Scarder";
        var data = form.serialize() + "&action=" + action;
        var url = './StandardizedCarder';
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
                var url_ = "manage_standardised_carder.jsp";
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
// 
    function loademptype() {
        $.ajax({
            url: './EmpTypeServlet',
            type: 'post',
            dataType: 'html',
            success: function (data) {

                $("#emp_type").html(data);
                //pataStandard();

            }
        });

    }
  pataCarder();

    function pataCarder() {
     $.ajax({
        type: "GET",
        url: './CarderCat?action=all',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#carder_category_id').empty();
            $('#carder_category_id').append('<option value="">--- Select One---</option>');
            $.each(data, function (key, value)
            {
                $('#carder_category_id').append('<option value="' + value.id + '">'+ value.cadre_category_name + '</option>');
            });

        },
        complete: function () {

        }

    });
    }


    loademptype();
});