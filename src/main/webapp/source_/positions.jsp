<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Admin-HRMIS</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="robots" content="all,follow" />
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
        <!-- Font Awesome CSS-->
        <link
            rel="stylesheet"
            href="vendor/font-awesome/css/font-awesome.min.css"
            />
        <!-- Fontastic Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css" />
        <!----css3---->
        <link rel="stylesheet" href="css/custom.css" />
        <!----data table css---->
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css"
            />

        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
            rel="stylesheet"
            />
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
    <div class="container-fluid">
        <div class="card">
            <div class="card-header card-aligner has-shadow">
                <div class="card-title">
                    <h4>Position</h4>
                </div>
                <div class="pb-2 mr-25">

                    <button type="button" class="btn btn-primary btn-md" data-target="#add0"
                            data-toggle="modal"><i class="fa fa-plus-circle" aria-hidden="true"></i>
                        Add Positionn</button>
                    <a href="/position_view" class="btn btn-primary">Manage Position</a>


                </div>

            </div>


            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-sm timesheet_missing">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Cadre Category</th>
                                <th>Position Name</th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>


                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>


    </div>
</div>
</div>

</div>
<!-- Modal -->
<div class="modal fade" id="add0" tabindex="-1" role="dialog" aria-labelledby="add0Title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">New Position</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>


                    <div class="form-group">
                        <label for="inputcadrecat">Cadre Category</label>
                        <select id="inputcadrecat" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="inputStandCadre">Standardized Cadre</label>
                        <select id="inputStandCadre" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputPosition">Position</label>
                        <input type="text" class="form-control" id="inputPosition" placeholder="Designation">
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
                </form>
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

<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

</body>

</html>
