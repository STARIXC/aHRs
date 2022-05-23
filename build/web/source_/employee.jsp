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
			<section class="no-padding-bottom">
				<div class="container-fluid">
					<div class="row">
						<!--  table area -->
						<div class="col-sm-12">
							<div class="card card-bd has-shadow">
								<div class="card-header has-shadow">
									<div class="card-title">
										<h4>Manage Employee</h4>
									</div>
								</div>

								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered employeesTbl"
											style="width: 100%" id="Table">
											<thead>
												<tr role="row">
													<th>SL No</th>
													<!-- <th>Photograph</th> -->
													<th>Employee Name</th>
													<th>Employee Id</th>
													<th>Phone</th>
													<th>Email Address</th>
													<th>Status</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody id="mytbl">
												<c:forEach items="${employees}" var="employee">
													<tr>
														<td><c:out value="${employee.id}" /></td>
														<td><c:out
																value="${employee.first_name} ${employee.surname}" /></td>
														<td><c:out value="${employee.emp_no}" /></td>
														<td><c:out value="${employee.phone}" /></td>
														<td><c:out value="${employee.email}" /></td>
														<td><c:out value="${employee.active ==1 ? 'Active' : 'Inactive'}" /></td>

														<td><a class="btn btn-md btn-success"
															href="AllStaffServlet?action=edit&emp_no=<c:out value="${employee.emp_no}"/>">Update</a>
															<a class="btn btn-md btn-danger"
															href="AllStaffServlet?action=delete&emp_no=<c:out value="${employee.emp_no}"/>">Delete</a>
															<a class="btn btn-md btn-info"
															href="AllStaffServlet?action=view&emp_no=<c:out value="${employee.emp_no}"/>">View</a>
														</td>


													</tr>


												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

</div>

	<!-- JavaScript files-->

	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>

	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

	<script src="js/custom_.js"></script>
	<!-- JavaScript files-->

</body>
</html>
