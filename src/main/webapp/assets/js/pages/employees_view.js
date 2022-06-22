getEmpDet();
"use strict";
function getEmpDet() {

    var emp_no = $("#employee_id").val();
    
 console.log("emp_no:" + emp_no);
    $.ajax({
        url: "AllStaffServlet?action=get_details",
        method: 'GET',
        dataType: 'json',
        data: {
            'emp_no': emp_no
        },
        success: function (data) {
//          console.log(eval(data));
          var respond=eval(data);
          console.log(respond);
            $(".name").text(respond.surname +" "+respond.first_name);
            $(".full_name").text(respond.full_name);
            $(".designation").text(respond.position);
            $(".email").text(respond.email);
            $(".phone").text(respond.phone);
            $(".postal_code").text(respond.postal_code);
            $(".country").text(respond.nationality);


        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }

    });
}
;

