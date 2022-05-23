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
                  <form action="/create_atten_vol" method="post" accept-charset="utf-8">
                    <div class="row">
                      <div class="col-md-4 col-sm-12">
                        <div class="form-group">
                          <label for="date_start" class="col-form-label">Start Date*</label>
                      
                            <input type="text" name="date_start" id="date_start" placeholder="Date"
                              class="form-control datetimepicker" value="" autocomplete="off" />
                          </div>
                        </div>
    
                        <!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
                        <div class="col-md-4 col-sm-12">
                        <div class="form-group ">
                          <label for="date_end" class="col-form-label">End Date*</label>
                             
                          <input type="text" name="date_end" id="date_end" placeholder="Date"
                          class="form-control datetimepicker" value="" autocomplete="off" />
                          </div>
                        </div>
                        
                    </div>
                 

                    <button type="button"  class="btn btn-success w-md m-b-5"
                    autocomplete="off">
                   Search
                  </button>
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
                    <h4>Incomplete Timesheet</h4>
                  </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">   
                        <table class="table table-striped table-sm timesheet_missing">
                          <thead>
                            <tr>
                              <th>#</th>
                              <th>PF No</th>
                              <th>Name</th>
                              <th>Designation</th>
                              <th>Date</th>
                              <th>Hours expected</th>
                              <th>Hours Missing</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
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
    <script src="js/custom_.js"></script>

    <!-- JavaScript files-->
  </body>

</html>
