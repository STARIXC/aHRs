getEmpDet();
"use strict";
function getEmpDet() {

    var emp_no = $("#employee_id").val();
    ;

    $.ajax({
        url: "AllStaffServlet?action=edit",
        method: 'GET',
        dataType: 'json',
        data: {
            'emp_no': emp_no
        },
        success: function (data) {
            console.log(data);

            document.getElementById('txtSurname').value = data.surname;
            document.getElementById('txtFirstName').value = data.first_name;
            document.getElementById('txtMiddleName').value = data.other_name;
            document.getElementById('txtHomeAddress').value = data.home_address;
            document.getElementById('txtPostalCode').value = data.postal_code;
            document.getElementById('txtNationality').value = data.nationality;
            document.getElementById('txtBirthDate').value = data.dob;
            document.getElementById('txtEmail').value = data.email;
            document.getElementById('txtPhone').value = data.phone;
            document.getElementById('txtNationalID').value = data.national_id;
            document.getElementById('txtEmployeeNumber').value = data.emp_no;
            document.getElementById('hiredate').value = data.emp_no;
            document.getElementById('ddlFacility').value = data.emp_no;
            document.getElementById('ddlDesignation').value = data.emp_no;
            document.getElementById('txtEmployeeNumber').value = data.emp_no;
            document.getElementById('txtPinCode').value = data.emp_no;
            document.getElementById('txtNSSF').value = data.emp_no;
            document.getElementById('txtNHIF').value = data.emp_no;
            document.getElementById('rbtnHelb').value = data.emp_no;
            document.getElementById('txtHelbClearance').value = data.emp_no;
            document.getElementById('txtGoodConduct').value = data.emp_no;

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }

    });
}
;


