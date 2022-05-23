<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Admin-HRMIS</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="all,follow" />
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
<link href="vendor/select2/dist/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="vendor/calender/lib/jquery-ui.min.css" />
<link rel="stylesheet"
	href="vendor/calender/lib/bootstrap-datepicker.css" />
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="vendor/font-awesome/css/font-awesome.min.css" />
<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="css/fontastic.css" />
<!----css3---->
<link rel="stylesheet" href="css/custom.css" />
<!----data table css---->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="css/select2.min.css" />
<!--google material icon-->
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" />
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/calender/lib/jquery-ui.min.js"></script>
</head>
<body>
	<script>
/* $(document).ready(function(e) {
	 $('.dp').datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
	  }); */
$(document).ready(function(e) {
    "use strict"; 
/* function holidaycalculation(){   
	  var start = $('#start_date').val();
	    var end = $('#end_date').val();
	    var diff = new Date(end - start);
	    var days = diff/1000/60/60/24;
	    $('#no_of_days').val(days+1);
    } */
    
function showDays() {
    var start = $('#start_date').datepicker('getDate');
    var end = $('#end_date').datepicker('getDate');
    if (!start || !end) return;
    var days = (end - start) / 1000 / 60 / 60 / 24;
    $('#no_of_days').val(days+1);
}

$("#start_date").datepicker({
    dateFormat: 'dd-mm-yy',
    onSelect: showDays
});
$("#end_date").datepicker({
    dateFormat: 'dd-mm-yy',
    onSelect: showDays
});
   // $('#start_date,#end_date').change(holidaycalculation);
});
    </script>
	<div class="wrapper">
		<div class="body-overlay"></div>


		<%@ include file="_includes/header.jsp"%>
		<div class="main-content">


			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="card">

						<div class="card-body">

							<form action="./ActivityController" method="post" accept-charset="utf-8"
								autocomplete="off">
									<input name="activity_id" class="form-control" type="hidden"
									value="<c:out value="${activity.activity_id}" />" id="activity_id" readonly=""
									autocomplete="off">
								<div class="form-group row">
									<label for="activity_description" class="col-sm-3 col-form-label">Activity Description *</label>
									<div class="col-sm-9">
										<input name="activity_description" class="form-control" type="text"
											placeholder="Activity Description" id="activity_description" value="<c:out value="${activity.activity_description}" />"
											autocomplete="off">

									</div>
								</div>
								<div class="form-group row">
									<label for="" class="col-sm-3 col-form-label">Activity Cadre
										Type *</label>
									<div class="col-sm-9">
										<select class="form-control" name="activity_cadre_type" id="activity_cadre_type">
											<option value="">--Select One--</option>
											<option value="1" ${activity.activity_cadre_type == 1 ? 'selected="selected"' : ''}>HRH</option>
											<option value="2" ${activity.activity_cadre_type == 2 ? 'selected="selected"' : ''}>CBWs</option>
										</select>
									</div>
								</div>

								<div class="form-group form-group-margin text-right">
									<button type="submit" class="btn btn-success w-md m-b-5"
										name="save">SET</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- JavaScript files-->

	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>



</body>
</html>

