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
//active: 1
//disability: "0"
//email: "mm2005bs@yahoo.com"
//emp_no: "0179"
//first_name: "MUSOGA"
//gender: "FEMALE"
//helb_benefitiary: 0
//id: 34
//mfl: "15280"
//national_id: "21783412"
//nationality: "Kenyan"
//other_name: "MILKA"
//phone: "0727747818"
//position: "1"
//surname: "OMBATU"
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


