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

<script src="js/form_.js"></script>
<script src="js/front.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="body-overlay"></div>


		<%@ include file="_includes/header.jsp"%>

		<div class="main-content">
			<div class="container-fluid">
				<form method="POST" autocomplete="off" id="form_data">
					<div class="card card-default">
						<div class="card-header card-aligner has-shadow">
							<div class="card-title">
								<h4>New Employee</h4>
							</div>
							<div class="pb-2 mr-25">


								<a href="employee.jsp" class="btn btn-primary">Manage
									Employees</a>


							</div>

						</div>
						<div class="card-body">

							<div class="card box">
								<div class="card-header has-shadow">
									<div class="headingOftabel">
										<h4>
											Basic <span>Information</span>
										</h4>
									</div>
								</div>
								<div class="card-content">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">


											<div class="card-content">
												<div class="row">
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Surname
																Name <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtSurname" type="text" value=""
																	maxlength="50" id="txtSurname"
																	class="form-control input-width-xlarge" /> <span
																	id="rfvSurname" class="required" style="display: none">Please
																	enter Last Name.</span>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group efirst">
															<label class="col-md-12 control-label"> First
																Name <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtFirstName" type="text" value=""
																	maxlength="50" id="txtFirstName"
																	class="form-control input-width-xlarge" />
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Middle
																Name </label>
															<div class="col-md-12">
																<input name="txtMiddleName" type="text" value=""
																	maxlength="50" id="txtMiddleName"
																	class="form-control input-width-xlarge" />
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Home
																Address <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtHomeAddress" type="text" value=""
																	maxlength="50" id="txtSurname"
																	class="form-control input-width-xlarge" /> <span
																	id="rfvHomeAddress" class="required"
																	style="display: none">Please enter Home Address.</span>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Postal
																Code <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtPostalCode" type="text" value=""
																	maxlength="50" id="txtPostalCode"
																	class="form-control input-width-xlarge" /> <span
																	id="rfvPostalCode" class="required"
																	style="display: none">Please enter Home Address.</span>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label">
																Nationality <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtNationality" type="text" value=""
																	maxlength="50" id="txtNationality"
																	class="form-control input-width-xlarge" /> <span
																	id="rfvPostalCode" class="required"
																	style="display: none">Please enter Home Address.</span>
															</div>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Date of
																Birth <span class="required">*</span>
															</label>
															<div class="col-md-12 date-select">
																<input name="txtBirthDate" type="text" id="txtBirthDate"
																	class=" form-control input-width-xlarge txtBirthDate"
																	value="" />
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Gender <span
																class="required">*</span>
															</label>
															<div class="col-md-12">
																<label class="radio-inline"> <input
																	id="rbtnMale" type="radio" name="rbtnGender"
																	value="Male" /><label for="rbtnMale">Male</label>
																</label> <label class="radio-inline"> <input
																	id="rbtnFeMale" type="radio" name="rbtnGender"
																	value="Female" /><label for="rbtnFeMale">FeMale</label>
																</label>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Maratial
																Status <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<select name="ddlMaratialStatus" id="ddlMaratialStatus"
																	class="form-control input-width-xlarge">
																	<option value="">-- Select --</option>
																	<option value="Single">SINGLE</option>
																	<option value="Married">MARRIED</option>
																	<option value="Widowed">WIDOWED</option>
																	<option value="Divorced">DIVORCED</option>
																</select> <span id="rfvMaratialStatus" class="required"
																	style="display: none">Please select Maratial
																	Status.</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Email
																Address <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtEmail" type="email" value=""
																	id="txtEmail" class="form-control input-width-xlarge" />
																<span id="rfvEmail" class="required"
																	style="display: none">Please enter Email
																	Address.</span>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> Phone
																Number <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtPhone" type="text" value=""
																	maxlength="50" id="txtPhone"
																	class="form-control input-width-xlarge" /> <span
																	id="rfvPhone" class="required" style="display: none">Please
																	enter Phone Number.</span>
															</div>
														</div>
													</div>
													<div class="col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="col-md-12 control-label"> National
																ID/Passport Number <span class="required">*</span>
															</label>
															<div class="col-md-12">
																<input name="txtNationalID" type="text" value=""
																	maxlength="50" id="txtNationalID"
																	class="form-control input-width-xlarge" /> <span
																	id="rfNationalID" class="required"
																	style="display: none">Please enter National ID
																	or Passport Number.</span>
															</div>
														</div>
													</div>
												</div>
											</div>



										</div>

									</div>
								</div>
							</div>
							<div class="card box">
								<div class="card-header has-shadow">
									<div class="headingOftabel">
										<h4>
											Official <span>Information</span>
										</h4>
									</div>
								</div>
								<div class="card-content">
									<div class="row">
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group efirst">
												<label class="col-md-12 control-label"> County <span
													class="required">*</span>
												</label>
												<div class="col-md-12">
													<select class="form-control" onchange="patasubcounty();"
														name='ddlCounty' id='ddlCounty'>


													</select>

												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Sub County<span
													class="required">*</span>
												</label>
												<div class="col-md-12">
													<select class="form-control" onchange='patafacility();'
														name='ddlSubcounty' id='ddlSubcounty'>

													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Duty Station
													/ Facility <span class="required">*</span>
												</label>
												<div class="col-md-12">
													<select class="form-control" name='ddlFacility'
														id='ddlFacility'>

													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group efirst">
												<label class="col-md-12 control-label"> Employee
													Type <span class="required">*</span>
												</label>
												<div class="col-md-12">
													<select name="ddlEmployeeType" id="ddlEmployeeType"
														class="form-control input-width-xlarge" onchange="getPosition();">

													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Cadre
													Category<span class="required">*</span>
												</label>
												<div class="col-md-12">
													<select class="form-control" name='ddlCadreCategory'
														id='ddlCadreCategory' onchange="getPosition();">

													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Designation
													/ Position <span class="required">*</span>
												</label>
												<div class="col-md-12">
													<select name="ddlDesignation" id="ddlDesignation"
														class="form-control input-width-xlarge">

													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Employee No
													<span class="required">*</span>
												</label>
												<div class="col-md-12">
													<input name="txtEmployeeNumber" type="text" value=""
														maxlength="50" id="txtEmployeeNumber"
														class="form-control input-width-xlarge" />
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-md-12 control-label"> Join Date <span
													class="required">*</span>
												</label>
												<div class="col-md-12 date-select">
													<input name="txtJoinDate" type="text" id="txtJoinDate"
														class=" form-control input-width-xlarge txtJoinDate"
														value="" />
												</div>
											</div>
										</div>


									</div>

								</div>

							</div>

							<div class="card box">
								<div class="card-header has-shadow">
									<div class="headingOftabel">
										<h4>
											Statutory <span>Information</span>
										</h4>
									</div>
								</div>

								<div class="card-content">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="row">
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> KRA Pin
															Code <span class="required">*</span>
														</label>
														<div class="col-md-12">
															<input name="txtPinCode" type="text" value=""
																maxlength="10" id="txtPinCode"
																class=" form-control input-width-xlarge txtNumber" /> <span
																id="rfvPinCode" class="required" style="display: none">Please
																enter Pin Code.</span>
														</div>
													</div>
												</div>
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> NSSF
															Number <span class="required">*</span>
														</label>
														<div class="col-md-12">
															<input name="txtNSSF" type="text" value="" maxlength="15"
																id="txtNSSF"
																class=" form-control input-width-xlarge txtNumber" /> <span
																id="rfvNSSF" class="required" style="display: none">Please
																enter Mobile.</span>
														</div>
													</div>
												</div>
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> NHIF
															Number <span class="required">*</span>
														</label>
														<div class="col-md-12">
															<input name="txtNHIF" type="text" value="" maxlength="15"
																id="txtNHIF"
																class=" form-control input-width-xlarge txtNumber" /> <span
																id="rfvNSSF" class="required" style="display: none">Please
																enter Mobile.</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label">
															Certificate of Good Conduct No </label>
														<div class="col-md-12">
															<input name="txtGoodConduct" type="text" maxlength="15"
																id="txtGoodConduct"
																class=" form-control input-width-xlarge txtGoodConduct" />
														</div>
													</div>
												</div>
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> HELB
															Benefitiary <span class="required">*</span>
														</label>
														<div class="col-md-12">
															<label class="radio-inline"> <input id="rbtnHelb"
																type="radio" name="rbtnHelb" value="1" checked="checked" /><label
																for="rbtnHelb">Yes</label>
															</label> <label class="radio-inline"> <input
																id="rbtnHelb_no" type="radio" name="rbtnHelb" value="0" />
																<label
																for="rbtnHelb_no">No</label>
															</label>
														</div>
													</div>
												</div>
												<div class="col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> HELB
															Clearance Certificate Number <span class="required">*</span>
														</label>
														<div class="col-md-12">
															<input name="txtHelbClearance" type="text" value=""
																maxlength="200" id="txtHelbClearance"
																class="form-control input-width-xlarge" /> <span
																id="rfvHelbClearance" class="required"
																style="display: none">Please enter Helb Clearance
																Certificate Number.</span> <br />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>




								</div>
							</div>

							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">


									<div class="card box">
										<div class="card-header has-shadow">
											<div class="headingOftabel">
												<h4>
													Banking <span>Information</span>
												</h4>
											</div>
										</div>
										<div class="card-content">
											<div class="row">
												<div class="col-md-6 col-sm-6 co-xs-12">
													<div class="form-group efirst">
														<label class="col-md-12 control-label"> Bank Name
														</label>
														<div class="col-md-12">
															<input name="txtBankName" type="text" value=""
																maxlength="50" id="txtBankName"
																class="form-control input-width-xlarge" />
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-6 co-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> Branch
															Name </label>
														<div class="col-md-12">
															<input name="txtBranchName" type="text" maxlength="50"
																id="txtBranchName"
																class="form-control input-width-xlarge" />
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6 col-sm-6 co-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> Account
															Holder Name </label>
														<div class="col-md-12">
															<input name="txtAccountName" type="text" maxlength="150"
																id="txtAccountName"
																class="form-control input-width-xlarge" />
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-6 co-xs-12">
													<div class="form-group">
														<label class="col-md-12 control-label"> Account
															Number </label>
														<div class="col-md-12">
															<input name="txtAccountNumber" type="text" value=""
																maxlength="50" id="txtAccountNumber"
																class=" form-control input-width-xlarge txtNumber" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<input type="submit" id="save_data" name="save_data" value="Save"
								class="btn btn-primary">
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- JavaScript files-->

	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>

	<script src="vendor/select2/dist/js/select2.min.js"></script>
	<!-- JavaScript files-->
	<script>
		$(document).ready(function() {

			$("#txtJoinDate").datepicker();
			$("#txtTerminateDate").datepicker();
			$("#txtRehiredate").datepicker();
			$("#txtBirthDate").datepicker();

		});
	</script>
	<script src="js/save.js"></script>
</body>


</html>
