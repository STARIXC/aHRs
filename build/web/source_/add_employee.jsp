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

          
  <%@ include file = "_includes/header.jsp" %>  
                <div class="main-content">
                    <!-- Dashboard Counts Section-->
                    <section class="no-padding-bottom">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card has-shadow">
                                        <div
                                            class="card-header d-flex align-items-center has-shadow"
                                            >
                                            <h3 class="h4">Employee Details</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                               
                                                <div class="empform">
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item"><a data-toggle="tab" href="#basicdata" aria-expanded="false">Basic Info</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu1" aria-expanded="false">Positional Information</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu2" aria-expanded="false">Benefit</a></li>
                                                        <li class=""><a data-toggle="tab" href="#classmenu" aria-expanded="false">Class</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu3" aria-expanded="false">Supervisor</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu4" aria-expanded="false">Biographical Info</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu5" aria-expanded="false">Additional Address</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu6" aria-expanded="false">Emergency Contact</a></li>
                                                        <li class=""><a data-toggle="tab" href="#menu7" aria-expanded="false">Custom</a></li>
                                                        <li class="active"><a data-toggle="tab" href="#menu8" aria-expanded="true">Login Info</a></li>
                                                    </ul>

                                                    <div class="tab-content">
                                                        <div id="basicdata" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <form action="https://newhrm.bdtask.com/hrm_v4.4_demo/employee/Employees/create_employee" id="emp_form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
                                                                                <div class="row">
                                                                                    <div class="col-sm-3">
                                                                                        <div class="form-group">
                                                                                            <label for="first_name">First Name<sup class="color-red ">*</sup></label>
                                                                                            <input id="first_name" name="first_name" type="text" class="form-control" placeholder="First Name" autocomplete="off" style="border-color: green;">
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                        <div class="form-group">
                                                                                            <label for="l_name">Middle Name </label>
                                                                                            <input type="text" class="form-control" id="middle_name" name="middle_name" placeholder="Your Middle Name" autocomplete="off">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                        <div class="form-group">
                                                                                            <label for="l_name">Last Name<sup class="color-red ">*</sup></label>

                                                                                            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Your Last Name" autocomplete="off" style="border-color: green;">

                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="l_name">Maiden Name </label>
                                                                                            <input type="text" class="form-control" id="maiden_name" name="maiden_name" placeholder="Your Maiden Name" autocomplete="off">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group">
                                                                                            <label for="email">Email Address <sup class="color-red ">*</sup></label>
                                                                                            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" oninput="setuseemail()" autocomplete="off" style="border-color: green;">
                                                                                            <span id="email_v_message"></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group">
                                                                                            <label for="phone">Phone  <sup class="color-red ">*</sup></label>
                                                                                            <input type="number" class="form-control" id="phone" name="phone" placeholder="Your Phone Number" autocomplete="off" style="border-color: green;">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="phone">Alternative Phone <sup class="color-red "></sup></label>
                                                                                            <input type="number" class="form-control" name="alter_phone" id="phone" placeholder="Your Phone Number" autocomplete="off">
                                                                                        </div>
                                                                                    </div>

                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group">
                                                                                            <label for="state">Country</label>
                                                                                            <select name="state" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true" autocomplete="off">
                                                                                                <option value="Afghanistan">Afghanistan</option>
                                                                                                <option value="Albania">Albania</option>
                                                                                                <option value="Algeria">Algeria</option>
                                                                                                <option value="Andorra">Andorra</option>
                                                                                                <option value="Angola">Angola</option>
                                                                                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                                                                <option value="Argentina">Argentina</option>
                                                                                                <option value="Armenia">Armenia</option>
                                                                                                <option value="Australia">Australia</option>
                                                                                                <option value="Austria">Austria</option>
                                                                                                <option value="Azerbaijan">Azerbaijan</option>
                                                                                                <option value="Bahamas">Bahamas</option>
                                                                                                <option value="Bahrain">Bahrain</option>
                                                                                                <option value="Bangladesh">Bangladesh</option>
                                                                                                <option value="Barbados">Barbados</option>
                                                                                                <option value="Belarus">Belarus</option>
                                                                                                <option value="Belgium">Belgium</option>
                                                                                                <option value="Belize">Belize</option>
                                                                                                <option value="Benin">Benin</option>
                                                                                                <option value="Bhutan">Bhutan</option>
                                                                                                <option value="Bolivia">Bolivia</option>
                                                                                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                                                                <option value="Botswana">Botswana</option>
                                                                                                <option value="Brazil">Brazil</option>
                                                                                                <option value="Brunei">Brunei</option>
                                                                                                <option value="Bulgaria">Bulgaria</option>
                                                                                                <option value="Burkina Faso">Burkina Faso</option>
                                                                                                <option value="Burundi">Burundi</option>
                                                                                                <option value="Cambodia">Cambodia</option>
                                                                                                <option value="Cameroon">Cameroon</option>
                                                                                                <option value="Canada">Canada</option>
                                                                                                <option value="Cape Verde">Cape Verde</option>
                                                                                                <option value="Central African Republic">Central African Republic</option>
                                                                                                <option value="Chad">Chad</option>
                                                                                                <option value="Chile">Chile</option>
                                                                                                <option value="China">China</option>
                                                                                                <option value="Colombi">Colombi</option>
                                                                                                <option value="Comoros">Comoros</option>
                                                                                                <option value="Congo (Brazzaville)">Congo (Brazzaville)</option>
                                                                                                <option value="Congo">Congo</option>
                                                                                                <option value="Costa Rica">Costa Rica</option>
                                                                                                <option value="Cote d'Ivoire">Cote d'Ivoire</option>
                                                                                                <option value="Croatia">Croatia</option>
                                                                                                <option value="Cuba">Cuba</option>
                                                                                                <option value="Cyprus">Cyprus</option>
                                                                                                <option value="Czech Republic">Czech Republic</option>
                                                                                                <option value="Denmark">Denmark</option>
                                                                                                <option value="Djibouti">Djibouti</option>
                                                                                                <option value="Dominica">Dominica</option>
                                                                                                <option value="Dominican Republic">Dominican Republic</option>
                                                                                                <option value="East Timor (Timor Timur)">East Timor (Timor Timur)</option>
                                                                                                <option value="Ecuador">Ecuador</option>
                                                                                                <option value="Egypt">Egypt</option>
                                                                                                <option value="El Salvador">El Salvador</option>
                                                                                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                                                                <option value="Eritrea">Eritrea</option>
                                                                                                <option value="Estonia">Estonia</option>
                                                                                                <option value="Ethiopia">Ethiopia</option>
                                                                                                <option value="Fiji">Fiji</option>
                                                                                                <option value="Finland">Finland</option>
                                                                                                <option value="France">France</option>
                                                                                                <option value="Gabon">Gabon</option>
                                                                                                <option value="Gambia, The">Gambia, The</option>
                                                                                                <option value="Georgia">Georgia</option>
                                                                                                <option value="Germany">Germany</option>
                                                                                                <option value="Ghana">Ghana</option>
                                                                                                <option value="Greece">Greece</option>
                                                                                                <option value="Grenada">Grenada</option>
                                                                                                <option value="Guatemala">Guatemala</option>
                                                                                                <option value="Guinea">Guinea</option>
                                                                                                <option value="Guinea-Bissau">Guinea-Bissau</option>
                                                                                                <option value="Guyana">Guyana</option>
                                                                                                <option value="Haiti">Haiti</option>
                                                                                                <option value="Honduras">Honduras</option>
                                                                                                <option value="Hungary">Hungary</option>
                                                                                                <option value="Iceland">Iceland</option>
                                                                                                <option value="India">India</option>
                                                                                                <option value="Indonesia">Indonesia</option>
                                                                                                <option value="Iran">Iran</option>
                                                                                                <option value="Iraq">Iraq</option>
                                                                                                <option value="Ireland">Ireland</option>
                                                                                                <option value="Israel">Israel</option>
                                                                                                <option value="Italy">Italy</option>
                                                                                                <option value="Jamaica">Jamaica</option>
                                                                                                <option value="Japan">Japan</option>
                                                                                                <option value="Jordan">Jordan</option>
                                                                                                <option value="Kazakhstan">Kazakhstan</option>
                                                                                                <option value="Kenya">Kenya</option>
                                                                                                <option value="Kiribati">Kiribati</option>
                                                                                                <option value="Korea, North">Korea, North</option>
                                                                                                <option value="Korea, South">Korea, South</option>
                                                                                                <option value="Kuwait">Kuwait</option>
                                                                                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                                                                <option value="Laos">Laos</option>
                                                                                                <option value="Latvia">Latvia</option>
                                                                                                <option value="Lebanon">Lebanon</option>
                                                                                                <option value="Lesotho">Lesotho</option>
                                                                                                <option value="Liberia">Liberia</option>
                                                                                                <option value="Libya">Libya</option>
                                                                                                <option value="Liechtenstein">Liechtenstein</option>
                                                                                                <option value="Lithuania">Lithuania</option>
                                                                                                <option value="Luxembourg">Luxembourg</option>
                                                                                                <option value="Macedonia">Macedonia</option>
                                                                                                <option value="Madagascar">Madagascar</option>
                                                                                                <option value="Malawi">Malawi</option>
                                                                                                <option value="Malaysia">Malaysia</option>
                                                                                                <option value="Maldives">Maldives</option>
                                                                                                <option value="Mali">Mali</option>
                                                                                                <option value="Malta">Malta</option>
                                                                                                <option value="Marshall Islands">Marshall Islands</option>
                                                                                                <option value="Mauritania">Mauritania</option>
                                                                                                <option value="Mauritius">Mauritius</option>
                                                                                                <option value="Mexico">Mexico</option>
                                                                                                <option value="Micronesia">Micronesia</option>
                                                                                                <option value="Moldova">Moldova</option>
                                                                                                <option value="Monaco">Monaco</option>
                                                                                                <option value="Mongolia">Mongolia</option>
                                                                                                <option value="Morocco">Morocco</option>
                                                                                                <option value="Mozambique">Mozambique</option>
                                                                                                <option value="Myanmar">Myanmar</option>
                                                                                                <option value="Namibia">Namibia</option>
                                                                                                <option value="Nauru">Nauru</option>
                                                                                                <option value="Nepal">Nepal</option>
                                                                                                <option value="Netherlands">Netherlands</option>
                                                                                                <option value="New Zealand">New Zealand</option>
                                                                                                <option value="Nicaragua">Nicaragua</option>
                                                                                                <option value="Niger">Niger</option>
                                                                                                <option value="Nigeria">Nigeria</option>
                                                                                                <option value="Norway">Norway</option>
                                                                                                <option value="Oman">Oman</option>
                                                                                                <option value="Pakistan">Pakistan</option>
                                                                                                <option value="Palau">Palau</option>
                                                                                                <option value="Panama">Panama</option>
                                                                                                <option value="Papua New Guinea">Papua New Guinea</option>
                                                                                                <option value="Paraguay">Paraguay</option>
                                                                                                <option value="Peru">Peru</option>
                                                                                                <option value="Philippines">Philippines</option>
                                                                                                <option value="Poland">Poland</option>
                                                                                                <option value="Portugal">Portugal</option>
                                                                                                <option value="Qatar">Qatar</option>
                                                                                                <option value="Romania">Romania</option>
                                                                                                <option value="Russia">Russia</option>
                                                                                                <option value="Rwanda">Rwanda</option>
                                                                                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                                                                <option value="Saint Lucia">Saint Lucia</option>
                                                                                                <option value="Saint Vincent">Saint Vincent</option>
                                                                                                <option value="Samoa">Samoa</option>
                                                                                                <option value="San Marino">San Marino</option>
                                                                                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                                                                <option value="Saudi Arabia">Saudi Arabia</option>
                                                                                                <option value="Senegal">Senegal</option>
                                                                                                <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                                                                                                <option value="Seychelles">Seychelles</option>
                                                                                                <option value="Sierra Leone">Sierra Leone</option>
                                                                                                <option value="Singapore">Singapore</option>
                                                                                                <option value="Slovakia">Slovakia</option>
                                                                                                <option value="Slovenia">Slovenia</option>
                                                                                                <option value="Solomon Islands">Solomon Islands</option>
                                                                                                <option value="Somalia">Somalia</option>
                                                                                                <option value="South Africa">South Africa</option>
                                                                                                <option value="Spain">Spain</option>
                                                                                                <option value="Sri Lanka">Sri Lanka</option>
                                                                                                <option value="Sudan">Sudan</option>
                                                                                                <option value="Suriname">Suriname</option>
                                                                                                <option value="Swaziland">Swaziland</option>
                                                                                                <option value="Sweden">Sweden</option>
                                                                                                <option value="Switzerland">Switzerland</option>
                                                                                                <option value="Syria">Syria</option>
                                                                                                <option value="Taiwan">Taiwan</option>
                                                                                                <option value="Tajikistan">Tajikistan</option>
                                                                                                <option value="Tanzania">Tanzania</option>
                                                                                                <option value="Thailand">Thailand</option>
                                                                                                <option value="Togo">Togo</option>
                                                                                                <option value="Tonga">Tonga</option>
                                                                                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                                                                <option value="Tunisia">Tunisia</option>
                                                                                                <option value="Turkey">Turkey</option>
                                                                                                <option value="Turkmenistan">Turkmenistan</option>
                                                                                                <option value="Tuvalu">Tuvalu</option>
                                                                                                <option value="Uganda">Uganda</option>
                                                                                                <option value="Ukraine">Ukraine</option>
                                                                                                <option value="United Arab Emirates">United Arab Emirates</option>
                                                                                                <option value="United Kingdom">United Kingdom</option>
                                                                                                <option value="United States">United States</option>
                                                                                                <option value="Uruguay">Uruguay</option>
                                                                                                <option value="Uzbekistan">Uzbekistan</option>
                                                                                                <option value="Vanuatu">Vanuatu</option>
                                                                                                <option value="Vatican City">Vatican City</option>
                                                                                                <option value="Venezuela">Venezuela</option>
                                                                                                <option value="Vietnam">Vietnam</option>
                                                                                                <option value="Yemen">Yemen</option>
                                                                                                <option value="Zambia">Zambia</option>
                                                                                                <option value="Zimbabwe">Zimbabwe</option>
                                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 567.844px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-state-32-container"><span class="select2-selection__rendered" id="select2-state-32-container" title="Kenya"><span class="select2-selection__clear">×</span>Kenya</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group">
                                                                                            <label for="city">City </label>
                                                                                            <input type="text" class="form-control" id="city" name="city" placeholder="City" autocomplete="off">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="zip_code">Zip Code</label>
                                                                                            <input type="number" class="form-control" id="zip_code" name="zip_code" placeholder="Your Zip Code" autocomplete="off">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group form-group-margin text-right">
                                                                                    <input type="button" class="btn btn-primary btnNext" onclick="valid_inf()" value="NEXT" autocomplete="off">

                                                                                </div>


                                                                            </form></div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu1" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="dept_id">Division <sup class="color-red ">*</sup></label><br>

                                                                                        <select name="division" id="division" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value=""> Select Division</option>
                                                                                            <optgroup label="Administration "><option value="6">Accounts </option><option value="8">Admin</option></optgroup><optgroup label="HRM"><option value="10">Recruitment </option></optgroup><optgroup label="IT"><option value="5">Support</option><option value="7">Development </option><option value="18">R&amp;D</option><option value="22">Asi</option></optgroup><optgroup label="Marketing "><option value="9">SEO</option></optgroup><optgroup label="Demo Department"><option value="16">New Division</option></optgroup><optgroup label="Security "></optgroup><optgroup label="myDepartment"></optgroup><optgroup label="test"></optgroup>                </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-division-container"><span class="select2-selection__rendered" id="select2-division-container" title="Recruitment "><span class="select2-selection__clear">×</span>Recruitment </span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        <span id="divis"></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="designation">Position <sup class="color-red ">*</sup></label>

                                                                                        <select name="pos_id" id="designation" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="">select Designation</option>
                                                                                            <option value="1">Managing Director </option>
                                                                                            <option value="2">Director </option>
                                                                                            <option value="3">Manager</option>
                                                                                            <option value="4">Accounted </option>
                                                                                            <option value="5">Developer </option>
                                                                                            <option value="6">Designer </option>
                                                                                            <option value="7">Engineer </option>
                                                                                            <option value="8">Worker </option>
                                                                                            <option value="9">Security in-charge </option>
                                                                                            <option value="10">Architect </option>
                                                                                            <option value="11">new position </option>
                                                                                            <option value="12">demo position</option>
                                                                                            <option value="13">Software Tester</option>
                                                                                            <option value="14">?????????????</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-designation-container"><span class="select2-selection__rendered" id="select2-designation-container" title="Developer "><span class="select2-selection__clear">×</span>Developer </span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        <span id="desig"></span>

                                                                                    </div>
                                                                                </div>


                                                                            </div>
                                                                            <div class="row">

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="period">Duty Type </label><br>
                                                                                        <select name="duty_type" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1"> Full Time</option>
                                                                                            <option value="2"> Part Time</option>
                                                                                            <option value="3"> Contructual</option>
                                                                                            <option value="4"> Other</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-duty_type-wi-container"><span class="select2-selection__rendered" id="select2-duty_type-wi-container" title=" Full Time"><span class="select2-selection__clear">×</span> Full Time</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>


                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Hire Date <sup class="color-red ">*</sup></label>
                                                                                        <input type="text" class="form-control datepicker" name="hiredate" id="hiredate" placeholder="Hire date" autocomplete="off">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="work_hour">Original Hire Date <sup class="color-red ">*</sup></label>
                                                                                        <input type="text" class="form-control datepicker" name="ohiredate" id="ohiredate" placeholder="Original Hire date" autocomplete="off">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Termination Date </label>
                                                                                        <input type="text" class="form-control datepicker" name="terminatedate" id="tdate" placeholder="Termination date">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="work_hour">Termination Reason</label>
                                                                                        <textarea class="form-control" name="termreason" id="treason" placeholder="Termination Reason"></textarea> 
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="period">Voluntary Termination</label>
                                                                                        <select name="volunt_termination" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value=""> Select One</option>
                                                                                            <option value="1"> Yes</option>
                                                                                            <option value="2">No</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-volunt_termination-29-container"><span class="select2-selection__rendered" id="select2-volunt_termination-29-container"><span class="select2-selection__placeholder">Select option</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Re Hire Date</label>
                                                                                        <input type="text" class="form-control datepicker" name="rehiredate" id="rhdate" placeholder="Rehire date">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="period">Rate Type <sup class="color-red ">*</sup></label>
                                                                                        <select name="rate_type" id="rate_type" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="">Select One</option>
                                                                                            <option value="1">Hourly</option>
                                                                                            <option value="2">Salary</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-rate_type-container"><span class="select2-selection__rendered" id="select2-rate_type-container" title="Salary"><span class="select2-selection__clear">×</span>Salary</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        <span id="rat_tp"></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Rate <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" name="rate" id="rate" placeholder="Rate" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="period">Pay Frequency <sup class="color-red ">*</sup></label><br>

                                                                                        <select name="pay_frequency" id="pay_frequency" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="">Select Frequency</option>
                                                                                            <option value="1">Weekly</option>
                                                                                            <option value="2">Biweekly</option>
                                                                                            <option value="4">Monthly</option>
                                                                                            <option value="3">Annual</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-pay_frequency-container"><span class="select2-selection__rendered" id="select2-pay_frequency-container" title="Monthly"><span class="select2-selection__clear">×</span>Monthly</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        <span id="frequ"></span>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Pay Frequency Text</label>
                                                                                        <input type="text" class="form-control" name="pay_f_text" id="qfre_text" placeholder="Pay Frequency Text">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="work_hour">Hourly rate2</label>
                                                                                        <input type="number" class="form-control" name="h_rate2" id="rate2" placeholder="Hourly Rate2">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Hourly Rate3</label>
                                                                                        <input type="number" class="form-control" name="h_rate3" id="rate3" placeholder="Hourly Rate">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="work_hour">Home Department</label>
                                                                                        <input type="text" class="form-control" name="h_department" id="rate3" placeholder="Home Department">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="work_hour">Department Text</label>
                                                                                        <input type="text" class="form-control" name="h_dep_text" id="hdptext" placeholder="Department Text">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-margin text-right">
                                                                            <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                            <input type="button" class="btn btn-primary btnNext" onclick="valid_inf2()" value="NEXT" autocomplete="off">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu2" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="dfs">Benefit Class code</label>
                                                                                        <input type="text" class="form-control" id="bnfid" name="benifit_c_code[]" placeholder="Benifit Class Code" autocomplete="off">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="l_name">Benefit Description</label>
                                                                                        <input type="text" class="form-control" id="benifit_c_code_d" name="benifit_c_code_d[]" placeholder="Benefit Description">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="l_name">Benefit Accrual Date </label>
                                                                                        <input type="text" class="form-control datepicker" name="benifit_acc_date[]" placeholder="Benefit Accrual Date" autocomplete="off">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="status">Benefit Status <sup class="color-red "></sup></label>
                                                                                        <select name="benifit_sst[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1">Active</option>
                                                                                            <option value="2">Inactive</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-benifit_sst-c5-container"><span class="select2-selection__rendered" id="select2-benifit_sst-c5-container" title="Active"><span class="select2-selection__clear">×</span>Active</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>


                                                                                <a href="#" class="toggleLink"><span class="btn btn-primary">Add More</span></a></div>
                                                                            <div id="addbenifit" class="toggle" style="display: none;">
                                                                                <div class="row">
                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                            <label for="dfs">Benefit Class code</label>
                                                                                            <input type="text" class="form-control" id="bnfid" name="benifit_c_code[]" placeholder="Benifit Class Code">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="l_name">Benefit Description</label>
                                                                                            <input type="text" class="form-control" id="benifit_c_code_d" name="benifit_c_code_d[]" placeholder="Benefit Description">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                            <label for="l_name">Benefit Accrual Date </label>
                                                                                            <input type="text" class="form-control datepicker" name="benifit_acc_date[]" placeholder="Benefit Accrual Date">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="status">Benefit Status <sup class="color-red "></sup></label>
                                                                                            <select name="benifit_sst[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                <option value="1">Active</option>
                                                                                                <option value="2">Inactive</option>
                                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-benifit_sst-q0-container"><span class="select2-selection__rendered" id="select2-benifit_sst-q0-container" title="Active"><span class="select2-selection__clear">×</span>Active</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        </div>
                                                                                    </div>


                                                                                    <a href="#" class="toggleLink"><span class="btn btn-primary">Add More</span></a></div>

                                                                                <div id="addbenifit" class="toggle" style="display: none;">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group">
                                                                                                <label for="dfs">Benefit Class code</label>
                                                                                                <input type="text" class="form-control" id="bnfid" name="benifit_c_code[]" placeholder="Benifit Class Code">
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group form-group-margin">
                                                                                                <label for="l_name">Benefit Description</label>
                                                                                                <input type="text" class="form-control" id="benifit_c_code_d" name="benifit_c_code_d[]" placeholder="Benefit Description">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group">
                                                                                                <label for="l_name">Benefit Accrual Date </label>
                                                                                                <input type="text" class="form-control datepicker" name="benifit_acc_date[]" placeholder="Benefit Accrual Date">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group form-group-margin">
                                                                                                <label for="status">Benefit Status <sup class="color-red "></sup></label>
                                                                                                <select name="benifit_sst[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                    <option value="1">Active</option>
                                                                                                    <option value="2">Inactive</option>
                                                                                                </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-benifit_sst-oj-container"><span class="select2-selection__rendered" id="select2-benifit_sst-oj-container" title="Active"><span class="select2-selection__clear">×</span>Active</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                            </div>
                                                                                        </div>


                                                                                        <a href="#" class="toggleLink"><span class="btn btn-primary">Add More</span></a></div>
                                                                                    <div id="addbenifit" class="toggle" style="display: none;">
                                                                                        <div class="row">
                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group">
                                                                                                    <label for="dfs">Benefit Class code</label>
                                                                                                    <input type="text" class="form-control" id="bnfid" name="benifit_c_code[]" placeholder="Benifit Class Code">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group form-group-margin">
                                                                                                    <label for="l_name">Benefit Description</label>
                                                                                                    <input type="text" class="form-control" id="benifit_c_code_d" name="benifit_c_code_d[]" placeholder="Benefit Description">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group">
                                                                                                    <label for="l_name">Benefit Accrual Date </label>
                                                                                                    <input type="text" class="form-control datepicker" name="benifit_acc_date[]" placeholder="Benefit Accrual Date">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group form-group-margin">
                                                                                                    <label for="status">Benefit Status <sup class="color-red "></sup></label>
                                                                                                    <select name="benifit_sst[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                        <option value="1">Active</option>
                                                                                                        <option value="2">Inactive</option>
                                                                                                    </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-benifit_sst-ut-container"><span class="select2-selection__rendered" id="select2-benifit_sst-ut-container" title="Active"><span class="select2-selection__clear">×</span>Active</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                                </div>
                                                                                            </div>


                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-margin text-right">

                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary btnNext" onclick="valid_inf3()" value="NEXT" autocomplete="off">
                                                                            </div>


                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- class -->
                                                        <div id="classmenu" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="dfs">Class Code</label>
                                                                                        <input type="text" class="form-control" id="c_code" name="c_code" placeholder="Class Code">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="l_name">Class Description</label>
                                                                                        <input type="text" class="form-control" id="c_code_d" name="c_code_d" placeholder="Class Description">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="l_name">Class Accrual date </label>
                                                                                        <input type="text" class="form-control datepicker" id="class_acc_date" name="class_acc_date" placeholder="Class Accrual date">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="status">Class status <sup class="color-red "></sup></label>
                                                                                        <select name="class_sst" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1">Active</option>
                                                                                            <option value="2">Inactive</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-class_sst-y1-container"><span class="select2-selection__rendered" id="select2-class_sst-y1-container" title="Active"><span class="select2-selection__clear">×</span>Active</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>


                                                                            </div>


                                                                            <div class="form-group form-group-margin text-right">

                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary btnNext" onclick="valid_class()" value="NEXT" autocomplete="off">
                                                                            </div>


                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- supervisor -->
                                                        <div id="menu3" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="s_name">Supervisor Name</label>
                                                                                        <select name="supervisorname" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="">Select One</option>
                                                                                            <option value="self"> Self </option>
                                                                                            <option value="5">Adwards Chapman</option>
                                                                                            <option value="4">Roberts  carters </option>
                                                                                            <option value="3">Thoms Brown</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-supervisorname-6a-container"><span class="select2-selection__rendered" id="select2-supervisorname-6a-container"><span class="select2-selection__placeholder">Select option</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="l_name">Is Supervisor</label>
                                                                                        <select name="is_supervisor" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="0">No</option>
                                                                                            <option value="1">Yes</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-is_supervisor-c8-container"><span class="select2-selection__rendered" id="select2-is_supervisor-c8-container" title="No"><span class="select2-selection__clear">×</span>No</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="reports">Supervisor Report </label>
                                                                                        <input type="text" class="form-control" name="reports" placeholder="Reports">
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                            <div class="form-group form-group-margin text-right">

                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary btnNext" onclick="valid_inf4()" value="NEXT" autocomplete="off">
                                                                            </div>


                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu4" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="s_name">Date of Birth<sup class="color-red ">*</sup></label>
                                                                                        <input type="text" class="form-control datepicker" id="dob" name="dob" placeholder="Date of Birth" autocomplete="off">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="gender">Gender<sup class="color-red ">*</sup></label>

                                                                                        <select name="gender" id="gender" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="">Select Gender</option>
                                                                                            <option value="1">Male</option>
                                                                                            <option value="2">Female</option>
                                                                                            <option value="2">Other</option>
                                                                                        </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-gender-container"><span class="select2-selection__rendered" id="select2-gender-container" title="Female"><span class="select2-selection__clear">×</span>Female</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        <span id="gend"></span>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="reports">Marital Status </label>
                                                                                        <select name="marital_status" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1">Single</option>
                                                                                            <option value="2">Married</option>
                                                                                            <option value="3">Divorced</option>
                                                                                            <option value="4">Widowed</option>
                                                                                            <option value="5">Other</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-marital_status-ux-container"><span class="select2-selection__rendered" id="select2-marital_status-ux-container" title="Single"><span class="select2-selection__clear">×</span>Single</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="s_name">Ethnic Group</label>
                                                                                        <input type="text" class="form-control" id="ethnic" name="ethnic" placeholder="Ethnic Group">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="eeo_class">EEO Class</label>
                                                                                        <input type="text" class="form-control" id="eeo_class" name="eeo_class" placeholder="EEO Class" autocomplete="off">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="ssn">SSN <sup class="color-red ">*</sup></label>
                                                                                        <input type="text" class="form-control" id="ssn" name="ssn" placeholder="SSN" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="w_s">Work in State</label>
                                                                                        <select name="w_s" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1">Yes</option>
                                                                                            <option value="2">No</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-w_s-e2-container"><span class="select2-selection__rendered" id="select2-w_s-e2-container" title="Yes"><span class="select2-selection__clear">×</span>Yes</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="l_in_s">Live in State</label>
                                                                                        <select name="l_in_s" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1">Yes</option>
                                                                                            <option value="2">No</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-l_in_s-4c-container"><span class="select2-selection__rendered" id="select2-l_in_s-4c-container" title="Yes"><span class="select2-selection__clear">×</span>Yes</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>


                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="citizenship">Citizenship</label>
                                                                                        <select name="citizenship" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                            <option value="1"> Citizen</option>
                                                                                            <option value="0"> Non-citizen</option>
                                                                                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-citizenship-gw-container"><span class="select2-selection__rendered" id="select2-citizenship-gw-container" title=" Citizen"><span class="select2-selection__clear">×</span> Citizen</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                    </div>
                                                                                </div>


                                                                                <div class="col-sm-6">
                                                                                    <label for="picture">Photograph</label>
                                                                                    <input type="file" accept="image/*" name="picture" onchange="loadFile(event)">
                                                                                    <small id="fileHelp" class="text-muted"><img src="https://newhrm.bdtask.com/hrm_v4.4_demo/assets/img/user/default.jpg" id="output" class="img-thumbnail img-preview">
                                                                                    </small>
                                                                                </div>

                                                                            </div>

                                                                            <div class="form-group form-group-margin text-right">

                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary btnNext" onclick="valid_inf5()" value="NEXT" autocomplete="off">
                                                                            </div>


                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu5" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="s_name">Home Email</label>
                                                                                        <input type="email" class="form-control" id="h_email" name="h_email" placeholder="Home Email" autocomplete="off" style="border-color: green;">
                                                                                        <span id="h_email_v_message"></span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="b_email">Business Email</label>
                                                                                        <input type="email" class="form-control" id="b_email" name="b_email" placeholder="Business Email" autocomplete="off" style="border-color: green;">
                                                                                        <span id="b_email_v_message"></span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="h_phone">Home Phone <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="h_phone" name="h_phone" placeholder="Home Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="w_phone">Business Phone </label>
                                                                                        <input type="number" class="form-control" id="w_phone" name="w_phone" placeholder="Business Phone">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="c_phone">Cell Phone <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="c_phone" name="c_phone" placeholder="Cell Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-margin text-right">

                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary btnNext" onclick="valid_inf6()" value="NEXT" autocomplete="off">
                                                                            </div>


                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu6" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="s_name">Emergency Contact <sup class="color-red ">*</sup></label>

                                                                                        <input type="number" class="form-control" id="em_contact" name="em_contact" placeholder="Emergency Contact" autocomplete="off" style="border-color: green;">

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="e_h_phone">Emergency Home Phone <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="e_h_phone" name="e_h_phone" placeholder="Emergency Home Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="e_w_phone">Emergency Work Phone <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="e_w_phone" name="e_w_phone" placeholder="Emergency Work Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="e_c_relation">Emergency Contact Relation </label>
                                                                                        <input type="text" class="form-control" id="e_c_relation" name="e_c_relation" placeholder="Emergency Contact Relation" autocomplete="off">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="alt_em_cont">Alter Emergency Contact</label>
                                                                                        <input type="number" class="form-control" id="alt_em_cont" name="alt_em_cont" placeholder="Alter Emergency Contact">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group form-group-margin">
                                                                                        <label for="a_e_h_phone">Alt Emergency Home Phone <sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="a_e_h_phone" name="a_e_h_phone" placeholder="Alt Emergency Home Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="a_e_w_phone">Alt Emergency  Work Phone<sup class="color-red ">*</sup></label>
                                                                                        <input type="number" class="form-control" id="a_e_w_phone" name="a_e_w_phone" placeholder="Alt Emergency  Work Phone" autocomplete="off" style="border-color: green;">
                                                                                    </div>
                                                                                </div>
                                                                            </div>



                                                                            <div class="form-group form-group-margin text-right">
                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" class="btn btn-primary" value="Next" onclick="valid_inf7()" autocomplete="off">
                                                                            </div>

                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu7" class="tab-pane fade">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">
                                                                            <span>        
                                                                                <div class="row">
                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                            <label for="c_f_name">Custom Field Name</label>
                                                                                            <input type="text" class="form-control" id="c_f_name" name="c_f_name[]" placeholder="Custom Field Name">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="col-sm-6">
                                                                                        <div class="form-group form-group-margin">
                                                                                            <label for="c_f_type">Custom Field Type</label>
                                                                                            <select name="c_f_type[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                <option value="1">Text</option>
                                                                                                <option value="2">Date</option>
                                                                                                <option value="3">Text Area</option>
                                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-c_f_type-vs-container"><span class="select2-selection__rendered" id="select2-c_f_type-vs-container" title="Text"><span class="select2-selection__clear">×</span>Text</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="col-sm-12">
                                                                                        <div class="form-group form-group-new form-group-margin-left">
                                                                                            <label for="reports">Custom Value </label>
                                                                                            <input type="text" name="customvalue[]" class="form-control" placeholder="custom value">

                                                                                        </div>
                                                                                    </div>

                                                                                </div>

                                                                                <a href="#" class="toggleLink"><span class="btn btn-primary">Add More</span></a></span>
                                                                            <div id="add" class="toggle" style="display: none;">
                                                                                <span>
                                                                                    <div class="row">
                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group">
                                                                                                <label for="c_f_name">Custom Field Name</label>
                                                                                                <input type="text" class="form-control" id="c_f_name" name="c_f_name[]" placeholder="Custom Field Name">
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-sm-6">
                                                                                            <div class="form-group form-group-margin">
                                                                                                <label for="c_f_type">Custom Field Type</label>
                                                                                                <select name="c_f_type[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                    <option value="1">Text</option>
                                                                                                    <option value="2">Date</option>
                                                                                                    <option value="3">Text Area</option>
                                                                                                </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-c_f_type-nx-container"><span class="select2-selection__rendered" id="select2-c_f_type-nx-container" title="Text"><span class="select2-selection__clear">×</span>Text</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-sm-12">
                                                                                            <div class="form-group form-group-new form-group-margin-left">
                                                                                                <label for="reports">Custom Value </label>
                                                                                                <input type="text" name="customvalue[]" class="form-control" placeholder="custom value">

                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                    <a href="#" class="toggleLink"><span class="btn btn-primary">Add More</span></a></span>
                                                                                <div id="add" class="toggle" style="display: none;">
                                                                                    <span>
                                                                                        <div class="row">
                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group">
                                                                                                    <label for="c_f_name">Custom Field Name</label>
                                                                                                    <input type="text" class="form-control" id="c_f_name" name="c_f_name[]" placeholder="Custom Field Name">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-sm-6">
                                                                                                <div class="form-group form-group-margin">
                                                                                                    <label for="c_f_type">Custom Field Type</label>
                                                                                                    <select name="c_f_type[]" class="form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                                                                        <option value="1">Text</option>
                                                                                                        <option value="2">Date</option>
                                                                                                        <option value="3">Text Area</option>
                                                                                                    </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-c_f_type-sv-container"><span class="select2-selection__rendered" id="select2-c_f_type-sv-container" title="Text"><span class="select2-selection__clear">×</span>Text</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-sm-12">
                                                                                                <div class="form-group form-group-new form-group-margin-left">
                                                                                                    <label for="reports">Custom Value </label>
                                                                                                    <input type="text" name="customvalue[]" class="form-control" placeholder="custom value">

                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                    </span>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-margin text-right">
                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous"> <input type="button" class="btn btn-primary btnNext" onclick="valid_inf_custom()" value="NEXT" autocomplete="off"> 

                                                                            </div>


                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="menu8" class="tab-pane fade active in">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="panel">

                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="s_name">User Email <sup class="color-red ">*</sup></label>

                                                                                        <input type="email" class="form-control" id="user_email" name="user_email" readonly="" placeholder="User Email">

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <div class="form-group">
                                                                                        <label for="e_h_phone">Password <sup class="color-red ">*</sup></label>
                                                                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                                                                    </div>
                                                                                </div>

                                                                            </div>



                                                                            <div class="form-group form-group-margin text-right">
                                                                                <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                                                <input type="button" onclick="alert('Your Are In Demo Mode')" class="btn btn-success" value="Save">
                                                                            </div>

                                                                        </div>  
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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

            <!-- Page Footer-->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <nav class="d-flex">
                                <ul class="p-0 m-0">
                                    <li>
                                        <a href="#"> Home </a>
                                    </li>
                                    <li>
                                        <a href="#"> Company </a>
                                    </li>
                                    <li>
                                        <a href="#"> Portfolio </a>
                                    </li>
                                    <li>
                                        <a href="#"> Blog </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-md-6">
                            <p class="copyright d-flex justify-content-end">
                                &copy 2021 Design by <a href="#">Vishweb Design</a> BootStrap
                                Admin Dashboard
                            </p>
                        </div>
                    </div>
                </div>
            </footer>
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

