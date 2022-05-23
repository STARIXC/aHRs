

function getNoStaff() {
    $.ajax({
        url: './Dashboard?action=staff',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#employees").html(data);
            //pataStandard();

        }

    });
}
;
function getTotalleave() {
    $.ajax({
        url: './Dashboard?action=leave',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            //pataStandard();

        }

    });
}
;
function getApprovedLeaves() {
    $.ajax({
        url: './Dashboard?action=approvedleaves',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            //pataStandard();

        }

    });
}
;
function getPendingLeaves() {
    $.ajax({
        url: './Dashboard?action=pendingapproval',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            //pataStandard();

        }

    });
}
;
function getRejectedLeaves() {
    $.ajax({
        url: './Dashboard?action=notapproved',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            //pataStandard();

        }

    });
}
;
