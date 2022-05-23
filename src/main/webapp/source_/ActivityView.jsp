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
								<h4>Activities</h4>
							</div>
							<div class="mr-25">

								<a href="ActivityController?action=insert"
									class="btn btn-primary btn-md"> <i
									class="fa fa-plus-circle" aria-hidden="true"></i> Add More
									Activities
								</a>



							</div>

						</div>

						<div class="card-body">
							<table class="datatable table table-striped table-bordered table-hover">
								<thead>
									<tr role="row">
										<th>SL</th>
										<th>Activity Name</th>
										<th>Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listActivities}" var="activity">
										<tr>
											<td><c:out value="${activity.activity_id}" /></td>
											<td><c:out value="${activity.activity_description}" /></td>

											<td><a class="btn btn-md btn-success"
												href="ActivityController?action=edit&activity_id=<c:out value="${activity.activity_id}"/>">Update</a>
												<a class="btn btn-md btn-danger"
												href="ActivityController?action=delete&activity_id=<c:out value="${activity.activity_id}"/>">Delete</a>
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
