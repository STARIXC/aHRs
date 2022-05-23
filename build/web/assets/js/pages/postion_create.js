getcardertype();
getcardercat();
function getcardertype() {
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

function getcardercat() {
    $.ajax({
        url: './CadreTypeServlet',
        type: 'post',
        dataType: 'html',
        success: function (data) {
            $("#inputStandCadre").append(data);


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
            $("#inputStandCadre").html(data);
        }


    });

}