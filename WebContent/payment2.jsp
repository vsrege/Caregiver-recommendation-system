<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>payment authentication</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/newstyle.css">
<link type="text/css" rel="stylesheet" href="css/loginstyle.css" /> 
<link rel="stylesheet" href="css/jquery-ui.css">
<style>
  html, body, .container-table {
    height: 100%;
}
.container-table {
    display: table;
}
.vertical-center-row {
    display: table-cell;
    vertical-align: middle;
}
  .submit-button {
  margin-top: 10px;
}
.required:after {
 content: " *";
 color:red;
 margin-right:-10px;
 margin-left:8px;
 display:inline-block;
 
}

.myhide{
    overflow:hidden;
    height:0px;
    -webkit-transition:all 0.2s;
    transition:all 0.2s;
}
.unhidden{
    height:34px;
}
.viiva{
    float:right;
    width:20px;
    margin-right:-30px;
    margin-top:5px;
}
</style>
</head>
<body>
<header id="header">
      <div class="container">
        <h1 class="navbar-brand navbar-brand_"><span id="logotxt">CareTakers For You</span><!--  <a href="index.html"><img alt="Grill point" src="img/logo.png"></a>--></h1>
      </div>
      <div class="menuheader">
          <div class="container">
            <nav class="navbar navbar-default navbar-static-top tm_navbar" role="navigation">
                <ul class="nav sf-menu">
                  <li><a href="index.html">home</a>
                   
                  </li>
                  <li><a href="AboutUs.html">About Us</a></li>
                  <li class="active"><a href="Services.html">Services</a>
                 
                  </li>
                  <li><a href="policy.html">Policy</a></li>
                  <li><a href="index-4.html">location</a></li>
                   <li><a href="LocationAnalysis.html">ChartView</a></li>
                </ul>
            </nav>
            <nav class="navbar navbar-default navbar-static-top tm_navbar" role="navigation">
                <ul class="nav sf-menu">
                
                  <li class="active"><a href="ListView.html">List View</a></li>
                  <li><a href="MapView.html">Map View</a></li>
                </ul>
            </nav>
          </div>
      </div>
</header>
<!--==============================content=================================-->
<div id="content">
    <!--==============================row9=================================-->
    <div class="row_9">
        <div class="container">
            <div class="row privacy_page">
                <div id="user"></div> <a id="logout" class="btn btn_red" onclick="logout()">LOGOUT</a> 
              
                    
         <br/><br/><br/>
		   
		<div class="col-md-12">
		<form class="form-horizontal">
        <fieldset>
          <div id="legend">
            <legend>Payment Information</legend>
          </div>
     
          <!-- Name -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="account">Email address</label>
            <div class="col-sm-4">
              <input type="email" id="account" name="account" placeholder="" value="" class="form-control" required>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <div id="legend">
          <legend>Payment Options</legend>
          </div>
		<div class="radio">
		  <label><input type="radio" name="optradio" id="paypal" value="pay"><img src="img/paypal.png" style="width:100px;height:35px"></label>
		  <p></p>
		  <label><input type="radio" name="optradio" id="credit" value="cr"><img src="img/otherPayment.jpg" style="width:350px;height:40px"></label>
		  <p></p>
		</div>
		</fieldset>
    <!-- Name -->
    <div id="creditinfo" style="display:none;">
    <fieldset>
          <div class="form-group has-success has-feedback">
            <label class="control-label col-sm-3 required"  for="username">Name on Card</label>
            <div class="col-sm-4">
              <input type="text" id="username" name="username" placeholder="Name on Card" value="" class="form-control" required>
              <span class="glyphicon glyphicon-ok form-control-feedback"></span>
            </div>
          </div>
    
          <!-- Card Number -->
          <div class="form-group has-feedback">
            <label class="control-label col-sm-3 has-feedback required" for="card">Card Number</label>
            <div class="col-sm-3">
              <input type="text" id="card" pattern="()[0-9]{12}(?:[0-9]{4})?)" name="card" placeholder="1234 5678 1234 5678" class="form-control" required>
              <span class="glyphicon glyphicon-credit-card form-control-feedback"></span>
            </div>
          </div>
     
          <!-- Expiry-->
          <div class="form-group">
            <label class="control-label col-sm-3 required" for="exp">Expiry Date</label>
            <div class="col-sm-2">
              <input type="text" id="exp" name="exp" placeholder="MM/YY" class="form-control" required>
            </div>
          </div>
     
          <!-- CVV -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="ccv">Security Code (CVC)</label>
            <div class="col-sm-2" style="width:100px;">
              <input type="text" id="ccv" name="ccv" placeholder="CVC" class="form-control" required>
              <p class="help-block"></p>
            </div>
          </div>

      </fieldset>
      <fieldset>
          <div id="legend">
            <legend>Company (optional)</legend>
          </div>

          <!-- Company -->
          <div class="form-group">
            <label class="control-label col-sm-3"  for="company">Company Name</label>
            <div class="col-sm-4">
              <input type="text" id="company" name="company" placeholder="" value="" class="form-control">
            </div>
          </div>
          
  
      </fieldset>
      <fieldset>
          <div id="legend">
            <legend>Billing Address</legend>
          </div>

          <!-- Address -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="address1">Street Address</label>
            <div class="col-sm-4">
              <input type="text" id="address1" name="address1" placeholder="" value="" class="form-control" required>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-4">
              <input type="text" id="address2" name="address2" placeholder="" value="" class="form-control">
            </div>
          </div>

          <!-- City -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="city">City</label>
            <div class="col-sm-4">
              <input type="text" id="city" name="city" placeholder="" value="" class="form-control" required>
            </div>
          </div>

          <!-- postal -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="postal">Postal Code</label>
            <div class="col-sm-2">
              <input type="text" id="postal" name="postal" placeholder="" value="" class="form-control" required>
            </div>
          </div>

          <!-- Country -->
          <div class="form-group">
            <label class="control-label col-sm-3 required"  for="country">Country</label>
            <div class="col-sm-4">
              <select name="country" id="country" class="form-control" required>
                <option value="" SELECTED></option>
                <option value="AF">Afghanistan</option>
                <option value="AX">Åland Islands</option>
                <option value="AL">Albania</option>
                <option value="DZ">Algeria</option>
                <option value="AS">American Samoa</option>
                <option value="AD">AndorrA</option>
                <option value="AO">Angola</option>
                <option value="AI">Anguilla</option>
                <option value="AQ">Antarctica</option>
                <option value="AG">Antigua and Barbuda</option>
                <option value="AR">Argentina</option>
                <option value="AM">Armenia</option>
                <option value="AW">Aruba</option>
                <option value="AU">Australia</option>
                <option value="AT">Austria</option>
                <option value="AZ">Azerbaijan</option>
                <option value="BS">Bahamas</option>
                <option value="BH">Bahrain</option>
                <option value="BD">Bangladesh</option>
                <option value="BB">Barbados</option>
                <option value="BY">Belarus</option>
                <option value="BE">Belgium</option>
                <option value="BZ">Belize</option>
                <option value="BJ">Benin</option>
                <option value="BM">Bermuda</option>
                <option value="BT">Bhutan</option>
                <option value="BO">Bolivia</option>
                <option value="BA">Bosnia and Herzegovina</option>
                <option value="BW">Botswana</option>
                <option value="BV">Bouvet Island</option>
                <option value="BR">Brazil</option>
                <option value="IO">British Indian Ocean Territory</option>
                <option value="BN">Brunei Darussalam</option>
                <option value="BG">Bulgaria</option>
                <option value="BF">Burkina Faso</option>
                <option value="BI">Burundi</option>
                <option value="KH">Cambodia</option>
                <option value="CM">Cameroon</option>
                <option value="CA">Canada</option>
                <option value="CV">Cape Verde</option>
                <option value="KY">Cayman Islands</option>
                <option value="CF">Central African Republic</option>
                <option value="TD">Chad</option>
                <option value="CL">Chile</option>
                <option value="CN">China</option>
                <option value="CX">Christmas Island</option>
                <option value="CC">Cocos (Keeling) Islands</option>
                <option value="CO">Colombia</option>
                <option value="KM">Comoros</option>
                <option value="CG">Congo</option>
                <option value="CD">Congo, Democratic Republic</option>
                <option value="CK">Cook Islands</option>
                <option value="CR">Costa Rica</option>
                <option value="CI">Cote D"Ivoire</option>
                <option value="HR">Croatia</option>
                <option value="CU">Cuba</option>
                <option value="CY">Cyprus</option>
                <option value="CZ">Czech Republic</option>
                <option value="DK">Denmark</option>
                <option value="DJ">Djibouti</option>
                <option value="DM">Dominica</option>
                <option value="DO">Dominican Republic</option>
                <option value="EC">Ecuador</option>
                <option value="EG">Egypt</option>
                <option value="SV">El Salvador</option>
                <option value="GQ">Equatorial Guinea</option>
                <option value="ER">Eritrea</option>
                <option value="EE">Estonia</option>
                <option value="ET">Ethiopia</option>
                <option value="FK">Falkland Islands (Malvinas)</option>
                <option value="FO">Faroe Islands</option>
                <option value="FJ">Fiji</option>
                <option value="FI">Finland</option>
                <option value="FR">France</option>
                <option value="GF">French Guiana</option>
                <option value="PF">French Polynesia</option>
                <option value="TF">French Southern Territories</option>
                <option value="GA">Gabon</option>
                <option value="GM">Gambia</option>
                <option value="GE">Georgia</option>
                <option value="DE">Germany</option>
                <option value="GH">Ghana</option>
                <option value="GI">Gibraltar</option>
                <option value="GR">Greece</option>
                <option value="GL">Greenland</option>
                <option value="GD">Grenada</option>
                <option value="GP">Guadeloupe</option>
                <option value="GU">Guam</option>
                <option value="GT">Guatemala</option>
                <option value="GG">Guernsey</option>
                <option value="GN">Guinea</option>
                <option value="GW">Guinea-Bissau</option>
                <option value="GY">Guyana</option>
                <option value="HT">Haiti</option>
                <option value="HM">Heard Island and Mcdonald Islands</option>
                <option value="VA">Holy See (Vatican City State)</option>
                <option value="HN">Honduras</option>
                <option value="HK">Hong Kong</option>
                <option value="HU">Hungary</option>
                <option value="IS">Iceland</option>
                <option value="IN">India</option>
                <option value="ID">Indonesia</option>
                <option value="IR">Iran</option>
                <option value="IQ">Iraq</option>
                <option value="IE">Ireland</option>
                <option value="IM">Isle of Man</option>
                <option value="IL">Israel</option>
                <option value="IT">Italy</option>
                <option value="JM">Jamaica</option>
                <option value="JP">Japan</option>
                <option value="JE">Jersey</option>
                <option value="JO">Jordan</option>
                <option value="KZ">Kazakhstan</option>
                <option value="KE">Kenya</option>
                <option value="KI">Kiribati</option>
                <option value="KP">Korea (North)</option>
                <option value="KR">Korea (South)</option>
                <option value="XK">Kosovo</option>
                <option value="KW">Kuwait</option>
                <option value="KG">Kyrgyzstan</option>
                <option value="LA">Laos</option>
                <option value="LV">Latvia</option>
                <option value="LB">Lebanon</option>
                <option value="LS">Lesotho</option>
                <option value="LR">Liberia</option>
                <option value="LY">Libyan Arab Jamahiriya</option>
                <option value="LI">Liechtenstein</option>
                <option value="LT">Lithuania</option>
                <option value="LU">Luxembourg</option>
                <option value="MO">Macao</option>
                <option value="MK">Macedonia</option>
                <option value="MG">Madagascar</option>
                <option value="MW">Malawi</option>
                <option value="MY">Malaysia</option>
                <option value="MV">Maldives</option>
                <option value="ML">Mali</option>
                <option value="MT">Malta</option>
                <option value="MH">Marshall Islands</option>
                <option value="MQ">Martinique</option>
                <option value="MR">Mauritania</option>
                <option value="MU">Mauritius</option>
                <option value="YT">Mayotte</option>
                <option value="MX">Mexico</option>
                <option value="FM">Micronesia</option>
                <option value="MD">Moldova</option>
                <option value="MC">Monaco</option>
                <option value="MN">Mongolia</option>
                <option value="MS">Montserrat</option>
                <option value="MA">Morocco</option>
                <option value="MZ">Mozambique</option>
                <option value="MM">Myanmar</option>
                <option value="NA">Namibia</option>
                <option value="NR">Nauru</option>
                <option value="NP">Nepal</option>
                <option value="NL">Netherlands</option>
                <option value="AN">Netherlands Antilles</option>
                <option value="NC">New Caledonia</option>
                <option value="NZ">New Zealand</option>
                <option value="NI">Nicaragua</option>
                <option value="NE">Niger</option>
                <option value="NG">Nigeria</option>
                <option value="NU">Niue</option>
                <option value="NF">Norfolk Island</option>
                <option value="MP">Northern Mariana Islands</option>
                <option value="NO">Norway</option>
                <option value="OM">Oman</option>
                <option value="PK">Pakistan</option>
                <option value="PW">Palau</option>
                <option value="PS">Palestinian Territory, Occupied</option>
                <option value="PA">Panama</option>
                <option value="PG">Papua New Guinea</option>
                <option value="PY">Paraguay</option>
                <option value="PE">Peru</option>
                <option value="PH">Philippines</option>
                <option value="PN">Pitcairn</option>
                <option value="PL">Poland</option>
                <option value="PT">Portugal</option>
                <option value="PR">Puerto Rico</option>
                <option value="QA">Qatar</option>
                <option value="RE">Reunion</option>
                <option value="RO">Romania</option>
                <option value="RU">Russian Federation</option>
                <option value="RW">RWANDA</option>
                <option value="SH">Saint Helena</option>
                <option value="KN">Saint Kitts and Nevis</option>
                <option value="LC">Saint Lucia</option>
                <option value="PM">Saint Pierre and Miquelon</option>
                <option value="VC">Saint Vincent and the Grenadines</option>
                <option value="WS">Samoa</option>
                <option value="SM">San Marino</option>
                <option value="ST">Sao Tome and Principe</option>
                <option value="SA">Saudi Arabia</option>
                <option value="SN">Senegal</option>
                <option value="RS">Serbia</option>
                <option value="ME">Montenegro</option>
                <option value="SC">Seychelles</option>
                <option value="SL">Sierra Leone</option>
                <option value="SG">Singapore</option>
                <option value="SK">Slovakia</option>
                <option value="SI">Slovenia</option>
                <option value="SB">Solomon Islands</option>
                <option value="SO">Somalia</option>
                <option value="ZA">South Africa</option>
                <option value="GS">South Georgia and the South Sandwich Islands</option>
                <option value="ES">Spain</option>
                <option value="LK">Sri Lanka</option>
                <option value="SD">Sudan</option>
                <option value="SR">Suriname</option>
                <option value="SJ">Svalbard and Jan Mayen</option>
                <option value="SZ">Swaziland</option>
                <option value="SE">Sweden</option>
                <option value="CH">Switzerland</option>
                <option value="SY">Syrian Arab Republic</option>
                <option value="TW">Taiwan, Province of China</option>
                <option value="TJ">Tajikistan</option>
                <option value="TZ">Tanzania</option>
                <option value="TH">Thailand</option>
                <option value="TL">Timor-Leste</option>
                <option value="TG">Togo</option>
                <option value="TK">Tokelau</option>
                <option value="TO">Tonga</option>
                <option value="TT">Trinidad and Tobago</option>
                <option value="TN">Tunisia</option>
                <option value="TR">Turkey</option>
                <option value="TM">Turkmenistan</option>
                <option value="TC">Turks and Caicos Islands</option>
                <option value="TV">Tuvalu</option>
                <option value="UG">Uganda</option>
                <option value="UA">Ukraine</option>
                <option value="AE">United Arab Emirates</option>
                <option value="GB">United Kingdom</option>
                <option value="US">United States</option>
                <option value="UM">United States Minor Outlying Islands</option>
                <option value="UY">Uruguay</option>
                <option value="UZ">Uzbekistan</option>
                <option value="VU">Vanuatu</option>
                <option value="VE">Venezuela</option>
                <option value="VN">Viet Nam</option>
                <option value="VG">Virgin Islands, British</option>
                <option value="VI">Virgin Islands, U.S.</option>
                <option value="WF">Wallis and Futuna</option>
                <option value="EH">Western Sahara</option>
                <option value="YE">Yemen</option>
                <option value="ZM">Zambia</option>
                <option value="ZW">Zimbabwe</option>
              </select>
            </div>
          </div>
     
          <hr>

          <!-- Submit -->
          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-4">
              <button class="btn btn-primary center-block" id="element" style="background-color:#2e6da4">Pay Now</button>
            </div>
          </div>


        </fieldset>
       </div>
      </form>
      
      </div>
      <div id="paypalinfo" style="display:none;">
	<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"> 
	<input type="hidden" name="business" value="caregivers@gmail.com">
	<input type="hidden" name="cmd" value="_xclick">
	<input type="hidden" name="item_name" id="item_name" >
	<input type="hidden" name="amount" id="amount">
	<input type="hidden" name="currency_code" value="USD">
	<input type="hidden" name="return" value="http://localhost:8080/CaretakersForYou/">
	<input type="hidden" name="rm" value="2">
	<input type="hidden" name="cancel_return" value="http://localhost:8080/CaretakersForYou/"> 
	<input class="col-sm-offset-4 col-sm-4" type="image" name="submit" border="0" src="img/paypal.png" alt="PayPal - The safer, easier way to pay online" style="width:250px;height:40px">
	<img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" > 
	</form>
</div>
		</div>
          
         </div>
                   
                
                
  </div> 

        </div>
    </div>
</div>
<!--==============================footer=================================-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 footercol">
                <ul class="social_icons clearfix">
                     <li><a href="http://www.facebook.com/sharer.php?u=<?php if(is_home()){echo home_url();}else{the_permalink();} ?>" target="_blank" title="Share this page on Facebook"><img src="img/follow_icon1.png" alt=""></a></li>
                     <li><a href="https://plusone.google.com/_/+1/confirm?hl=en&url=<?php if(is_home()){echo home_url();}else{the_permalink();} ?>" target="_blank" title="Plus one this page on Google"><img src="img/follow_icon2.png" alt=""></a></li>
                     <li><a href="http://twitter.com/share?url=<?php if(is_home()){echo home_url();}else{the_permalink();} ?>" target="_blank" title="Tweet this page on Twitter"><img src="img/follow_icon3.png" alt=""></a></li>
                   
                </ul>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 footerlogo footercol">
                <a class="smalllogo2 logo" href="index.html"><span id="logotxtfoot">CareTakers For You</span><!--  <img src="img/logofooter.png" alt="">--></a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 footercol">
                <p class="footerpriv">&copy; 2013 &bull; <a class="privacylink" href="index-5.html">Privacy policy</a></p>
            </div>
        </div>
    </div>
</footer>

<div class="container">
  <div class="row-fluid">
      
      
    </div>
</div>
</body>
<script>
function logout(){
	
	sessionStorage.clear();
	window.location.href="index.html";	
}

if(sessionStorage.length>0)
{

document.getElementById('user').innerHTML="Hi "+sessionStorage.getItem("user")+",";
document.getElementById('logout').style.display="block";
document.getElementById('item_name').value=sessionStorage.getItem("service1")+" by "+sessionStorage.getItem("caretaker_name");
document.getElementById('amount').value=sessionStorage.getItem("totalcharge");

}


$("#paypal").click(function () {
	
	
	$("#paypalinfo").show();
	$("#creditinfo").hide();
			
    });
 
 $("#credit").click(function () {
		
		
		$("#paypalinfo").hide();
		$("#creditinfo").show();		
	    });

</script>
</html>