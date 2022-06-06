
jQuery(document).ready(function () {
function getData() {
    $.ajax({
        type: 'GET',
        url: './Dashboard?action=staff',
        dataType: 'html',
        success: function (pdata) {

            var container = $('#counter_emp');

            container.html(
                    pdata
                    );
        },
        error: function () {
            // richiesta fallita
            alert("ERROR!");
        }
    });
}
getData();
getTotalOnLeave();
function getTotalOnLeave() {
    $.ajax({
        url: './Dashboard?action=onleave',
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
});