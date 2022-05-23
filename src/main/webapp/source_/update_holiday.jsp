<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Admin-HRMIS</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="all,follow" />
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
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

</head>
<body>
	<div class="wrapper">
		<div class="body-overlay"></div>


		<%@ include file="_includes/header.jsp"%>
		<div class="main-content">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="panel panel-bd lobidrag">
						<div class="panel-heading">
							<div class="panel-title">
								<h4>Update</h4>
							</div>
						</div>
						<div class="panel-body">

							<form
								action="https://newhrm.bdtask.com/hrm_v4.4_demo/leave/Leave/update_holiday_form/3"
								method="post" accept-charset="utf-8">


								<input name="payrl_holi_id" type="hidden" value="3"
									autocomplete="off">

								<div class="form-group row">
									<label for="holiday_name" class="col-sm-3 col-form-label">Holiday
										Name *</label>
									<div class="col-sm-9">
										<input type="text" name="holiday_name" class="form-control"
											id="holiday_name" value="Eid " autocomplete="off">
									</div>
								</div>

								<div class="form-group row">
									<label for="start_date" class="col-sm-3 col-form-label">From
										*</label>
									<div class="col-sm-9">
										<input type="text" name="start_date"
											class="dp form-control hasDatepicker" id="start_date"
											value="2020-05-27" autocomplete="off">
									</div>
								</div>

								<div class="form-group row">
									<label for="end_date" class="col-sm-3 col-form-label">To
										*</label>
									<div class="col-sm-9">
										<input type="text" name="end_date"
											class="dp form-control hasDatepicker" id="end_date"
											value="2020-05-31" autocomplete="off">
									</div>
								</div>
								<div class="form-group row">
									<label for="no_of_days" class="col-sm-3 col-form-label">Number
										of Days *</label>
									<div class="col-sm-9">
										<input type="text" name="no_of_days" class="form-control"
											id="no_of_days" value="3" readonly="" autocomplete="off">
									</div>
								</div>



								<div class="form-group form-group-margin text-right">

									<button type="button" onclick="alert('You Are In Demo Mode')"
										class="btn btn-success w-md m-b-5" autocomplete="off">Update</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="js/leave.js"></script>

	<!-- JavaScript files-->
</body>
</html>
