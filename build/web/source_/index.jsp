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
                    <section class="dashboard-counts no-padding-bottom">
                        <div class="container-fluid">
                            <div class="bg-white row has-shadow">
                                <!-- Item -->
                                <div class="col-xl-3 col-sm-6">
                                    <div class="item d-flex align-items-center">
                                        <div class="icon bg-violet"><i class="icon-user"></i></div>
                                        <div class="title">
                                            <span>New<br />Clients</span>
                                            <div class="progress">
                                                <div
                                                    role="progressbar"
                                                    style="width: 25%; height: 4px"
                                                    aria-valuenow="25"
                                                    aria-valuemin="0"
                                                    aria-valuemax="100"
                                                    class="progress-bar bg-violet"
                                                    ></div>
                                            </div>
                                        </div>
                                        <div class="number"><strong>25</strong></div>
                                    </div>
                                </div>
                                <!-- Item -->
                                <div class="col-xl-3 col-sm-6">
                                    <div class="item d-flex align-items-center">
                                        <div class="icon bg-red"><i class="icon-padnote"></i></div>
                                        <div class="title">
                                            <span>Work<br />Orders</span>
                                            <div class="progress">
                                                <div
                                                    role="progressbar"
                                                    style="width: 70%; height: 4px"
                                                    aria-valuenow="70"
                                                    aria-valuemin="0"
                                                    aria-valuemax="100"
                                                    class="progress-bar bg-red"
                                                    ></div>
                                            </div>
                                        </div>
                                        <div class="number"><strong>70</strong></div>
                                    </div>
                                </div>
                                <!-- Item -->
                                <div class="col-xl-3 col-sm-6">
                                    <div class="item d-flex align-items-center">
                                        <div class="icon bg-green"><i class="icon-bill"></i></div>
                                        <div class="title">
                                            <span>New<br />Invoices</span>
                                            <div class="progress">
                                                <div
                                                    role="progressbar"
                                                    style="width: 40%; height: 4px"
                                                    aria-valuenow="40"
                                                    aria-valuemin="0"
                                                    aria-valuemax="100"
                                                    class="progress-bar bg-green"
                                                    ></div>
                                            </div>
                                        </div>
                                        <div class="number"><strong>40</strong></div>
                                    </div>
                                </div>
                                <!-- Item -->
                                <div class="col-xl-3 col-sm-6">
                                    <div class="item d-flex align-items-center">
                                        <div class="icon bg-orange"><i class="icon-check"></i></div>
                                        <div class="title">
                                            <span>Open<br />Cases</span>
                                            <div class="progress">
                                                <div
                                                    role="progressbar"
                                                    style="width: 50%; height: 4px"
                                                    aria-valuenow="50"
                                                    aria-valuemin="0"
                                                    aria-valuemax="100"
                                                    class="progress-bar bg-orange"
                                                    ></div>
                                            </div>
                                        </div>
                                        <div class="number"><strong>50</strong></div>
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
        <script src="js/custom_.js" type="text/javascript"></script>

        <!-- JavaScript files-->
    </body>
</html>
