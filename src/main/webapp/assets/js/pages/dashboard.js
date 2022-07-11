
jQuery(document).ready(function () {
    // counter

    function getData() {
        $.ajax({
            type: 'GET',
            url: './Dashboard?action=staff',
            dataType: 'json',
            success: function (data)
            {
             //   alert(data.staff);
                var container = $('#counter_emp');
                container.html(data.staff);
            }

        });
    }
    getData();
    getTotalOnLeave();
    getPendingLeaves();
    getApprovedLeaves();
    function getTotalOnLeave() {
        $.ajax({
            url: './Dashboard?action=leave',
            type: 'post',
            dataType: 'html',
            success: function (data) {

                //  $("#ddlEmployeeType").html(data);
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
//
                //  $("#ddlEmployeeType").html(data);
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

                //     $("#ddlEmployeeType").html(data);
                //pataStandard();

            }

        });
    }
    ;
    function getRejectedLeaves() {
        $.ajax({
            url: './Dashboard',
            type: 'post',
            dataType: 'html',
            success: function (data) {

                //    $("#ddlEmployeeType").html(data);
                //pataStandard();

            }

        });
    }
    ;
});