jQuery(document).ready(function() {
	var jsonData;

	$('#cadre_table').DataTable({
		"ajax": {
			"url": './AllStaffServlet?action=allStaff',
			"type": "GET",
			dataType: "json",
			dataSrc:"",
			"data": function(d) {
				$("#employee-table-data").html(d);
			}
		},
		"columns" : [ {
		    "data" : "emp_no"
		}, {
		    "data" : null,
		    render: function ( data, type, row ) {
     return row.surname + ' ' + row.first_name+ ' ' + row.other_name;
		}}, {
		    "data" : "position_name"
		}, {
    "targets": 0,
    "data": "active",
    "render": function ( data, type, row, meta ) {
      if(data == 1){
        return '<span class="badge bg-success">Active</span>';
    }else{
        return '<span class="badge bg-danger">In Active</span>';
    }
    }
  } ,  {
    "targets": 0,
    "data": "emp_no",
    "render": function ( data, type, row, meta ) {
      return 	'<div class="d-flex"><a  class="badge bg-success" href="./AllStaffServlet?id='+data+'&action=edit"><i class="fa fa-pen text-white"></i></a><a class="badge bg-primary" href="./AllStaffServlet?id='+data+'&action=view"><i class="fa fa-eye text-white"></i></a> <a class="badge bg-danger" href="./AllStaffServlet?id='+data+'&action=delete"><i class="fa fa-trash text-white"></i></a></div>';
	 }
  } ]
	  
	});
	/*$.ajax({
		url: './EmployeesController',
		type: 'get',
		dataType: 'html',
		success: function(response) {
	 
	 
	},
		error: function(e) {
			alert('Error: ' + e);
		}


	});
*/



	// jQuery ajax form submit example, runs when form is submitted
	$("#positionForm").submit(function(e) {
		e.preventDefault(); // prevent actual form submit
		var form = $("#timesheetForm");
		var action = "save_log";
		var data = form.serialize() + "&action=" + action;
		var url = './PositionServlet'; //get submit url [replace url here if desired]
		// screenLock();
		$.ajax({
			type: "POST",
			url: url,
			data: data, // serializes form input
			beforeSend: function beforeSend() {
				//	startLoader();
				console.log(data);
			},
			success: function(data) {
				var url_ = "manage_timesheet.jsp";
				$(location).attr('href', url_);
			},
			error: function error(result) {

			},
			complete: function complete() {
				//	stopLoader();

			}
		});

	});

});