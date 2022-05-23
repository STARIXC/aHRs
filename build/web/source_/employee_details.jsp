
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>HRMIS : Home</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="all,follow" />
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="vendor/font-awesome/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Material+Icons"
	rel="stylesheet">
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
	<%
	String id = (String) session.getAttribute("userid");
	if (id != null) {
	%>
	<div class="wrapper">
		<div class="body-overlay"></div>


		<%@ include file="_includes/header.jsp"%>
		<div class="main-content">

			<section class="no-padding-bottom">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">

								<div class="card-header d-flex align-items-center has-shadow">
									<h3 class="h4">National ID Information</h3>
								</div>
								<div class="card-body">


									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Nationality</label>
										<div class="col-sm-9">
											<input id="inputHorizontalSuccess" type="text"
												class="form-control form-control-success" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">National ID /Pass</label>
										<div class="col-sm-9">
											<input id="inputHorizontalWarning" type="text"
												class="form-control form-control-warning" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>


								</div>
							</div>
						
									<div class="card">

								<div class="card-header d-flex align-items-center has-shadow">
									<h3 class="h4">National ID Information</h3>
								</div>
								<div class="card-body">


									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Nationality</label>
										<div class="col-sm-9">
											<input id="inputHorizontalSuccess" type="text"
												class="form-control form-control-success" value="<c:out value="${staff.nationality}" />" readonly>


										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Password</label>
										<div class="col-sm-9">
											<input id="inputHorizontalWarning" type="text"
												class="form-control form-control-warning" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>


								</div>
							</div>
									<div class="card">

								<div class="card-header d-flex align-items-center has-shadow">
									<h3 class="h4">Horizontal Form</h3>
								</div>
								<div class="card-body">


									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Email</label>
										<div class="col-sm-9">
											<input id="inputHorizontalSuccess" type="text"
												class="form-control form-control-success" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Password</label>
										<div class="col-sm-9">
											<input id="inputHorizontalWarning" type="text"
												class="form-control form-control-warning" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>


								</div>
							</div>
									<div class="card">

								<div class="card-header d-flex align-items-center has-shadow">
									<h3 class="h4">Horizontal Form</h3>
								</div>
								<div class="card-body">


									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Email</label>
										<div class="col-sm-9">
											<input id="inputHorizontalSuccess" type="text"
												class="form-control form-control-success" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 form-control-label">Password</label>
										<div class="col-sm-9">
											<input id="inputHorizontalWarning" type="text"
												class="form-control form-control-warning" value="<c:out value="${staff.nationality}" />"  readonly>


										</div>
									</div>


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
	<script src="js/emp_details.js" type="text/javascript"></script>


	<!-- JavaScript files-->
	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>


