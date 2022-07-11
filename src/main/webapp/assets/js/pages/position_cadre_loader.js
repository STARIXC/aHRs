
function loademptype() {
    $.ajax({
        url: './EmpTypeServlet',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            //pataStandard();

        }

    });

}
function pataStandard() {
    let emp_type = document.getElementById("ddlEmployeeType").value;
    //var county = $('#county').val();
    console.log(emp_type);
    $.ajax({
        url: './GetCadreServlet?emp_type=' + emp_type,
        type: 'post',
        dataType: 'html',
        success: function (data) {
            $("#ddlCadreCategory").html(data);
        }


    });

}
function pataPositions() {
    let cadre = document.getElementById("ddlCadreCategory").value;
    //var county = $('#county').val();
    console.log(cadre);
    $.ajax({
        url: './GetPostionServlet?cadre=' + cadre,
        type: 'GET',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#ddlPos').empty();
            $('#ddlPos').append('<option value="">--- Select One---</option>');
            $.each(data, function (key, value)
            {
                $('#ddlPos').append('<option value="' + value.id + '">' + value.position_title + '</option>');
            });

        },
        complete: function () {

        }
      

    });

}

loademptype();
pataStandard();
//pataPositions();
