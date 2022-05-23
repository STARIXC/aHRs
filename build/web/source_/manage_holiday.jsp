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
				<!--  table area -->
				<div class="col-sm-12">

					<div class="card card-bd">

						<div class="card-header card-aligner">
							<div class="card-title">
								<h4>Holiday</h4>
							</div>
							<div class="mr-25">

								<a href="ManageHolidays?action=insert" class="btn btn-primary btn-md"
									>
									<i class="fa fa-plus-circle" aria-hidden="true"></i> Add More
									Holiday
								</a>
								


							</div>

						</div>

						<div class="card-body">
							<table width="100%"
								class="datatable table table-striped table-bordered table-hover">
								<thead>
									<tr role="row">
										<th>SL</th>
										<th>Holiday Name</th>
										<th>From</th>
										<th>To</th>
										<th>Number of Days</th>
										<th>Number of Days</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${holidays}" var="holiday">
										<tr>
											<td><c:out value="${holiday.id}" /></td>
											<td><c:out value="${holiday.holiday_name}" /></td>
											<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${holiday.start_date}" /></td>
											<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${holiday.end_date}" /></td>
											<td><c:out value="${holiday.no_of_days}" /></td>

											<td><a class="btn btn-md btn-success"
												href="ManageHolidays?action=edit&id=<c:out value="${holiday.id}"/>">Update</a>
												<a class="btn btn-md btn-danger"
												href="ManageHolidays?action=delete&id=<c:out value="${holiday.id}"/>">Delete</a>
												</td>
											

										</tr>

										
									</c:forEach>






								</tbody>
							</table>


							<!-- /.table-responsive -->
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

	

</body>
</html>
