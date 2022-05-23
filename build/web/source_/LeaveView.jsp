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
<script src="vendor/calender/lib/jquery-ui.min.js"></script>

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

										<a href="ManageLeave?action=insert" class="btn btn-primary btn-md"
									>
									<i class="fa fa-plus-circle" aria-hidden="true"></i> Add More
									Leave Type
								</a>

							</div>

						</div>

						<div class="card-body">
							<table class="datatable table table-striped table-bordered table-hover">
								<thead>
									<tr role="row">
										<th>ID</th>
										<th>Leave Name</th>
										<th>Number of Days</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="leave" items="${listLeave}">
										<tr>
											<td><c:out value="${leave.typeID}" /></td>
											<td><c:out value="${leave.leave_type_name}" /></td>
											<td><c:out value="${leave.total_days}" /></td>
											<td><a
												href="./ManageLeave/edit?typeID=<c:out value='${leave.typeID}' />">Edit</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="/delete?typeID=<c:out value='${leave.typeID}' />">Delete</a></td>
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

	<!-- JavaScript files-->
	<script src="js/leave.js"></script>
</body>
</html>
