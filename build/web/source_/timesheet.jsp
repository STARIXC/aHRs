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
			<!-- Dashboard Counts Section-->
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="card">
						<div class="card-header has-shadow">
							<div class="card-title">
								<h4>Volunteer Timesheet</h4>
							</div>
						</div>
						<div class="card-body">
							<form action="/create_atten_vol" method="post"
								accept-charset="utf-8">
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label for="date_" class="col-form-label">Date*</label> <input
												type="text" name="date_" id="date_" placeholder="Date"
												class="form-control datetimepicker" value=""
												autocomplete="off" />
										</div>
									</div>

									<!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="activity" class="col-form-label">Activity*</label>

											<input type="text" name="activity" id="activity"
												placeholder="Activity conducted" class="form-control"
												value="" autocomplete="off" />
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="hrsworked" class="col-form-label">Hours
												Worked*</label> <input type="number" name="hrsworked" id="activity"
												placeholder="" class="form-control " value=""
												autocomplete="off" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label for="tst" class="col-form-label">Tested*</label> <input
												type="number" name="tested" id="tested" placeholder="Date"
												class="form-control" value="" autocomplete="off" />
										</div>
									</div>

									<!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
									<div class="col-md-6 col-sm-6">
										<div class="form-group ">
											<label for="positive" class="col-form-label">Positive
												Indentified*</label> <input type="number" name="positive"
												id="positive" placeholder="" class="form-control" value=""
												autocomplete="off" />
										</div>
									</div>
								</div>

								<button type="button" class="btn btn-success w-md m-b-5"
									autocomplete="off">Save and Submit</button>
							</form>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="card">
						<div class="card-header has-shadow">
							<div class="card-title">
								<h4>CBWs Timesheet</h4>
							</div>
						</div>
						<div class="card-body">
							<form action="/create_atten_vol" method="post"
								accept-charset="utf-8">
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label for="date_" class="col-form-label">Date*</label> <input
												type="text" name="date_" id="date_" placeholder="Date"
												class="form-control datetimepicker" value=""
												autocomplete="off" />
										</div>
									</div>

									<!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="activity_cbw" class="col-form-label">Activity*</label>

											<select name="activity_cbw" id="activity_cbw"
												class="form-control">
												<options>---Select One---</options>
												<options></options>
												<options></options>
											</select>
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="hrsworked" class="col-form-label">Hours
												Worked*</label> <input type="number" name="hrsworked" id="activity"
												placeholder="" class="form-control " value=""
												autocomplete="off" />
										</div>
									</div>
								</div>


								<button type="button" class="btn btn-success w-md m-b-5"
									autocomplete="off">Save and Submit</button>
							</form>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="card">
						<div class="card-header has-shadow">
							<div class="card-title">
								<h4>STAFF Timesheet</h4>
							</div>
						</div>
						<div class="card-body">
							<form action="/create_atten_vol" method="post"
								accept-charset="utf-8">
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label for="date_" class="col-form-label">Date*</label> <input
												type="text" name="date_" id="date_" placeholder="Date"
												class="form-control datetimepicker" value=""
												autocomplete="off" />
										</div>
									</div>

									<!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="activity_hrh" class="col-form-label">Activity*</label>

											<select name="activity_hrh" id="activity_hhr"
												class="form-control">
												<options>---Select One---</options>
												<options></options>
												<options></options>
											</select>
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group ">
											<label for="hrsworked" class="col-form-label">Hours
												Worked*</label> <input type="number" name="hrsworked" id="hrsworked"
												placeholder="" class="form-control " value=""
												autocomplete="off" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label for="dpt" class="col-form-label">Department*</label> <select
												name="dpt" id="dpt" class="form-control">
												<options>---Select One---</options>
												<options></options>
												<options></options>
											</select>
										</div>
									</div>

									<!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
									<div class="col-md-4 col-sm-6">
										<div class="form-group">
											<label for="leave" class="col-form-label">Leave*</label> <input
												type="number" name="leave" id="leave" placeholder=""
												class="form-control" value="" autocomplete="off" />
										</div>
									</div>
									<div class="col-md-4 col-sm-6">
										<div class="form-group">
											<label for="leave" class="col-form-label">Public
												Holiday*</label> <input type="number" name="leave" id="leave"
												placeholder="" class="form-control" value=""
												autocomplete="off" />
										</div>
									</div>
								</div>
								<div class="container pt-4">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th class="text-center">Row Number</th>
													<th class="text-center">Remove Row</th>
												</tr>
											</thead>
											<tbody id="tbody">

											</tbody>
										</table>
									</div>
									<button class="btn btn-md btn-primary" id="addBtn"
										type="button">Add new Row</button>
								</div>
								<button type="button" class="btn btn-success w-md m-b-5"
									autocomplete="off">Save and Submit</button>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	</div>


	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="js/custom_.js" type="text/javascript"></script>
	<script>
    $(document).ready(function () {
  
      // Denotes total number of rows
      var rowIdx = 0;
  
      // jQuery button click event to add a row
      $('#addBtn').on('click', function () {
  
        // Adding a row inside the tbody.
        $('#tbody').append(`<tr id="R${rowIdx}">
             <td class="row-index text-center">
             <p>Row ${rowIdx}</p>
             </td>
              <td class="text-center">
                <button class="btn btn-danger remove"
                  type="button">Remove</button>
                </td>
              </tr>`);
      });
  
      // jQuery button click event to remove a row.
      $('#tbody').on('click', '.remove', function () {
  
        // Getting all the rows next to the row
        // containing the clicked button
        var child = $(this).closest('tr').nextAll();
  
        // Iterating across all the rows 
        // obtained to change the index
        child.each(function () {
  
          // Getting <tr> id.
          var id = $(this).attr('id');
  
          // Getting the <p> inside the .row-index class.
          var idx = $(this).children('.row-index').children('p');
  
          // Gets the row number from <tr> id.
          var dig = parseInt(id.substring(1));
  
          // Modifying row index.
          idx.html(`Row ${dig - 1}`);
  
          // Modifying row id.
          $(this).attr('id', `R${dig - 1}`);
        });
  
        // Removing the current row.
        $(this).closest('tr').remove();
  
        // Decreasing total number of rows by 1.
        rowIdx--;
      });
    });
  </script>
	<!-- JavaScript files-->
</body>

</html>
