<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<!-- Mirrored from www.gowestwebdesign.com/demos/jQuery-accordion-w-validation/ by HTTrack Website Copier/3.x [XR&CO'2010], Sat, 01 Oct 2011 20:44:02 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8"><!-- /Added by HTTrack -->
<head>
<!-- script to remove non-numeric characters-->
<script type="text/javascript">
<!--
function isNumericKey(e) {
   var k = document.all ? e.keyCode : e.which;
   return ((k > 47 && k < 58) || k == 8);
}
function extractNumeric(str) {
   return str.replace(/\D/g,"");
}
// -->
</script>
<link rel="stylesheet" href="<c:url value="/resources/css/form/customer_form.css"/>"></link>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.metadata.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.maskedinput-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.dimensions.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.accordion.js"/>"></script>
<script type="text/javascript">
// JQUERY FOR THIS PAGE

	$(document)
			.ready(
					function() {
						// add * to required field labels
						$('label.required').append(
								'&nbsp;<strong>*</strong>&nbsp;');

						// IF SAFARI
						if ($.browser.safari) {
							// this alert shows safari detection
							//$( function() { alert("this is safari!"); } ); 
							// hide panels 2&3
							$('#sf2').hide();
							$('#sf3').hide();
							var current = 0;
							var v = $("#cmaForm")
									.validate(
											{
												subformRequired : function(
														element) {
													return !(current == 0
															&& element
																	.parents("#sf1").length
															|| current == 1
															&& element
																	.parents("#sf2").length || current == 2
															&& element
																	.parents("#sf3").length);
												},
												errorClass : "warning",
												errorElement : "label",
												onkeyup : false,
												onblur : false
											});
							// back buttons do not need to run validation
							$("#sf2 .prevbutton").click(function() {
								//accordion.activate(0);
								current = 0;
								$('#sf2').slideUp();
								$('#sf1').slideDown();
							});
							$("#sf3 .prevbutton").click(function() {
								//accordion.activate(1);
								$('#sf3').slideUp();
								$('#sf2').slideDown();
								current = 1;
							});
							// these buttons all run the validation, overridden by specific targets above
							$(".open2").click(function() {
								if (v.form()) {
									$('#sf2').slideUp();
									$('#sf3').slideDown();
									//    accordion.activate (2);
									current = 2;
								}
							});
							$(".open1").click(function() {
								if (v.form()) {
									$('#sf1').slideUp();
									$('#sf2').slideDown();
									//    accordion.activate (1);
									current = 1;
								}
							});
							$(".open0").click(function() {
								if (v.form()) {
									$('#sf2').slideUp();
									$('#sf1').slideDown();
									//    accordion.activate (0);
									current = 0;
								}
							});
							// IF NOT SAFARI
						} else {
							// accordion functions
							var accordion = $("#stepForm").accordion({
								autoheight : true
							});
							var current = 0;
							var v = $("#cmaForm")
									.validate(
											{
												subformRequired : function(
														element) {
													return !(current == 0
															&& element
																	.parents("#sf1").length
															|| current == 1
															&& element
																	.parents("#sf2").length || current == 2
															&& element
																	.parents("#sf3").length);
												},
												errorClass : "warning",
												errorElement : "label",
												onkeyup : false,
												onblur : false
											});
							// back buttons do not need to run validation
							$("#sf2 .prevbutton").click(function() {
								accordion.activate(0);
								current = 0;
							});
							$("#sf3 .prevbutton").click(function() {
								accordion.activate(1);
								current = 1;
							});
							// these buttons all run the validation, overridden by specific targets above
							$(".open2").click(function() {
								if (v.form()) {
									accordion.activate(2);
									current = 2;
								}
							});
							$(".open1").click(function() {
								if (v.form()) {
									accordion.activate(1);
									current = 1;
								}
							});
							$(".open0").click(function() {
								if (v.form()) {
									accordion.activate(0);
									current = 0;
								}
							});

							//end safari IF
						}

						// masked inputs
						$(function($) {
							$("#recordClientPhone").mask("(999) 999-9999");
							$("#recordClientPhoneAlt").mask("(999) 999-9999");
							$("#recordClientZip").mask("99999");
							$("#recordPropertyZip").mask("99999");
							$("#recordPurchaseZip").mask("99999");
						});
					});
</script>



<!-- css for this page -->
<style type="text/css">
/* ------ one ------------*/
body .mainText{
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
}
#demoText h1, .mainText h1{
font-size:130%;
color:#0099FF;
text-decoration:none;
font-family:Arial, Helvetica, sans-serif;
margin:5px 4px 5px 24px;
background:none;
padding:0;
border:none;
text-transform:capitalize;
}
.mainText h2{
font-size:110%;
color:#000033;
font-family:Arial, Helvetica, sans-serif;
text-decoration:none;
background:none;
margin:4px 32px 6px 22px;
text-transform:capitalize;
}
.mainText h3{
font-size:120%;
font-weight:900;
margin:14px 0 0 0;
text-align:center;
color:#000033;
}
.mainText table{
width:95%;
border:1px solid #0099FF;
border-collapse:collapse;
margin:18px 7px;
}
.mainText table td{
background-color:#99CCFF;
color:#000033;
padding:4px;
}
.mainText table th{
background-color:#000033;
color:#99CCFF;
padding:4px;
}
.mainText .linkPar a{
color:#000033;
text-decoration:underline;
}
.mainText .linkPar a:hover{
color:#660033;
text-decoration:none;
font-weight:900;
}
.pusher{
cursor:pointer;
padding:3px 10px 3px 22px;
font-weight:900;
font-size:14px;
}
/* ------------- form specific styles are here  -------------- */

fieldset {
margin:0;
border:1px solid #C3DE00;
padding: 10px;
/*border:none;
padding:0;*/
color:#7563A5;
}
legend {
background-color:#FFFFFF;
text-align: center;
color: #097981;
padding:0 12px;
}
label {
text-align: right;
width: 298px;
border-right: 1px dotted #099;
padding-right: 5px;
margin:0 0 8px 0;
float: left;
clear: left;
display: block;
color: #7563A5;
}
label.checkbox, label.textarea{
border:none;
}
label.lgfield{
border:none;
text-align:center;
clear:both;
float:none;
width:100%;
}
fieldset input, fieldset select, fieldset textarea {
margin-left: 10px;
margin-bottom: 8px;
}
select.longfield{
margin:0 0 0 115px;
}
input[type="radio"],input[type="checkbox"] {
margin: 2px 0 0 4px;
}
textarea {
width:250px;
float:left;
}

/*Get Help Form Styles*/
p.formDisclaimer{
text-align:center;
margin:32px 24px 12px 0;
font-style:italic;
}
div.buttonWrapper{
margin:28px 0 14px 0;
clear:both;
text-align:center;
}
.formspacer{
height:1em;
clear:both;
}
.hideField{
display:none;
}
.pushOpen{
height:18em;
}
/* ----- error message for field validation ----- */
#stepForm label.warning{
text-align: left;
width:auto;
padding:0;
margin:0 0 0 10px;
float: none;
clear: none;
display: inline;
color:#CC3366;
font-size:10px; 
border:none;
border-top:1px dotted #CC3366;
}
div.requiredNotice{
width:140px;
float:right;
margin:0 24px 0 0;
padding:0;
}
h3.stepHeader{
text-align:left;
font-size:16px;
font-weight:bold;
margin:0 0 24px 24px;
color:#676cac;
}
ul#stepForm, ul#stepForm li{
margin:0;
padding:0;
}
ul#stepForm li{
list-style:none;
}


/* Form Buttons  */
input.submitbutton, .nextbutton, .prevbutton{
width:100px;
height:40px;
background-color:#663399;
padding:4px;
border:1px solid #339933;
cursor:pointer;
text-align:center;
color:#FFFFFF;
margin:7px;
}
input.submitbutton{
background-color:#006699;
}
</style> 
</head>
<body>


<!-- wrap starts here -->
<div id="wrap">
<!-- content-wrap starts here -->
<div id="content-wrap">
<div id="main">

<form name="cmaForm" id="cmaForm" method="post" action="http://www.gowestwebdesign.com/demos/jQuery-accordion-w-validation/index.cfm">
<input type="hidden" name="recordRequestPrimaryServiceID" id="recordRequestPrimaryServiceID" value="100" /> 
<input type="hidden" name="recordClientServices" id="recordClientServices" value="1,3" /> 
<ul id="stepForm" class="ui-accordion-container">
<li  id="sf1">
<div class="ui-accordion-left"></div>
<a href='#' class="ui-accordion-link">
<div class="ui-accordion-right"></div>
</a>
<div>
<fieldset>
<legend> Step 1 of 3 </legend> 
<div class="requiredNotice">*Required Field</div>
<h3 class="stepHeader">Tell us about the property you're buying</h3>
<label for="recordPurchaseMetRealtor" class="input required">Are you currently working with a<br />
real estate agent? </label>
&nbsp;&nbsp;No: 
<input name="recordPurchaseMetRealtor" type="radio" checked="checked" class="inputclass" value="0" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes: 
<input name="recordPurchaseMetRealtor" type="radio" class="inputclass {required:true}" value="1" title="Please choose Yes or No" />
<div class="formspacer" > </div>
<label for="recordPurchaseTimeFrameID" class="input required">When would you like to move?</label>
<select name="recordPurchaseTimeFrameID" id="recordPurchaseTimeFrameID" class="inputclass {required:true}" title="Select a Time Frame">
<option value=""> -Select- </option>
<option value="1">Less than 3 months</option>
<option value="2">3-6 months</option>
<option value="3">6-9 months</option>
<option value="4">9-12 months</option>
<option value="5">Over 12 months</option>
</select>
<br />
<label for="recordPurchasePriceRangeID" class="input required">Purchase price range:</label>
<select name="recordPurchasePriceRangeID" id="recordPurchasePriceRangeID" class="inputclass {required:true}" title="Select a Price Range">
<option value=""> -Select- </option>
<option value="1"></option>
<option value="2">$75,000 - $100,000</option>
<option value="3">$100,000 - $125,000</option>
<option value="4">$125,000 - $150,000</option>
<option value="5">$150,000 - $200,000</option>
<option value="6">$200,000 - $250,000</option>
<option value="7">$250,000 - $300,000</option>
<option value="8">$300,000 - $350,000</option>
<option value="9">$350,000 - $400,000</option>
<option value="10">$400,000 - $500,000</option>
<option value="11">$500,000 - $700,000</option>
<option value="12">$700,000 - $900,000</option>
<option value="13">> $900,000</option>
</select>
<br />
<label for="recordPurchaseState" class="input required">State:</label>
<select name="recordPurchaseState" id="recordPurchaseState" class="inputclass {required:true}" title="Select a State" >
<option value=""> -Select- </option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="DC">Dist of Columbia</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option> 
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option> 
<option value="PA" selected="selected">Pennsylvania</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option> 
</select>
<br />

<label for="recordPurchasePropertyTypeID" class="input">Desired property type:</label>
<select name="recordPurchasePropertyTypeID" id="recordPurchasePropertyTypeID" class="inputclass" title="Select a Property Type">
<option value=""> -Select- </option>
<option value="1">Single Family Detached</option>
<option value="2">Condo</option>
<option value="3">Townhouse</option>
<option value="4">Rental</option>
<option value="5">Multi-Family</option>
<option value="6">Vacation Home</option>
<option value="7">Other</option>
</select>
<br />
<div class="buttonWrapper">
<input name="formNext1" type="button" class="open1 nextbutton" value="Next" alt="Next" title="Next" />
</div>
</fieldset> 
</div>
</li>
<li id="sf2">
<div class="ui-accordion-left"></div>
<a href='#' class="ui-accordion-link">
<div class="ui-accordion-right"></div>
</a>
<div>
<fieldset>
<legend> Step 2 of 3 </legend>
<div class="requiredNotice">*Required Field</div>
<h3 class="stepHeader">Tell us about the property you're selling</h3>
<label for="recordClientTimeFrameID" class="input required">When would you like to sell?</label>
<select name="recordClientTimeFrameID" id="recordClientTimeFrameID" class="inputclass {required:true}" title="Select a Time Frame">
<option value=""> -Select- </option>
<option value="1">Less than 3 months</option>
<option value="2">3-6 months</option>
<option value="3">6-9 months</option>
<option value="4">9-12 months</option>
<option value="5">Over 12 months</option>
</select>
<br />
<label for="recordClientHomeTypeID" class="input required">Type of property you are selling:</label>
<select name="recordClientHomeTypeID" id="recordClientHomeTypeID" class="inputclass {required:true}" title="Select a Property Type">
<option value=""> -Select- </option>
<option value="1">Single Family Detached</option>
<option value="2">Condo</option>
<option value="3">Townhouse</option>
<option value="4">Rental</option>
<option value="5">Multi-Family</option>
<option value="6">Vacation Home</option>
<option value="7">Other</option>
</select>
<br />
<label for="recordPropertyAddress1" class="input required">Property Street Address:</label>
<input name="recordPropertyAddress1" id="recordPropertyAddress1" class="inputclass {required:true}" title="Street Address is required" maxlength="254" onblur="recordClientAddress1.value = this.value" /><br />
<label for="recordPropertyAddress2" class="input">Address (2):</label>
<input name="recordPropertyAddress2" id="recordPropertyAddress2" class="inputclass" maxlength="254"  onblur="recordClientAddress2.value = this.value" /><br />
<label for="recordPropertyCity" class="input required">City:</label>
<input name="recordPropertyCity" id="recordPropertyCity" class="inputclass {required:true}" title="City is required" maxlength="254"  onblur="recordClientCity.value = this.value" /><br />
<label for="recordPropertyState" class="input required">State:</label>
<select name="recordPropertyState" id="recordPropertyState" class="inputclass {required:true}" title="Select a State"  onchange="recordClientState.value = this.value" >
<option value=""> -Select- </option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="DC">Dist of Columbia</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option> 
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option> 
<option value="PA" selected="selected">Pennsylvania</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option> 
</select>
<br />
<label for="recordPropertyZip" class="input required">Zip:</label>
<input name="recordPropertyZip" id="recordPropertyZip" class="inputclass {required:true}" title="Zip Code is required" maxlength="254"  onblur="recordClientZip.value = this.value" /><br />

<label for="recordClientPropertyValueID" class="input required">Estimated Market Value:</label>
<select name="recordClientPropertyValueID" id="recordClientPropertyValueID" class="inputclass {required:true}" title="Select a Price Range">
<option value=""> -Select- </option>
<option value="1">Less Than $75K</option>
<option value="2">$75-$100K</option>
<option value="3">$100-$125K</option>
<option value="4">$125-$150K</option>
<option value="5">$150-$200K</option>
<option value="6">$200-$250K</option>
<option value="7">$250-$300K</option>
<option value="8">$300-$350K</option>
<option value="9">$350-$400K</option>
<option value="10">$400-$500K</option>
<option value="11">$500-$700K</option>
<option value="12">$700-$900K</option>
<option value="13">Over $900K</option>
</select>
<br />
<label for="recordPropertyBedroomsID" class="input">Bedrooms:</label>
<select name="recordPropertyBedroomsID" id="recordPropertyBedroomsID" class="inputclass">
<option value=""> -Select- </option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5+</option>
</select>
<br />
<label for="recordPropertyBathroomsId" class="input">Bathrooms:</label>
<select name="recordPropertyBathroomsId" id="recordPropertyBathroomsId" class="inputclass">
<option value=""> -Select- </option>
<option value="1">1</option>
<option value="2">1.5</option>
<option value="3">2</option>
<option value="4">2.5</option>
<option value="5">3</option>
<option value="6">3.5</option>
<option value="7">4+</option>
</select>
<br />
<label for="recordPropertyAgeId" class="input">Approx. Age of Home:</label>
<select name="recordPropertyAgeId" id="recordPropertyAgeId" class="inputclass">
<option value=""> -Select- </option>
<option value="1">Less Than 1 year</option>
<option value="2">1-5 years</option>
<option value="3">6-10 years</option>
<option value="4">11-15 years</option>
<option value="5">More than 15 years</option>
</select>
<br />
<label for="recordPropertySqFt" class="input">Approx. Square Footage:</label>
<input name="recordPropertySqFt" id="recordPropertySqFt" class="inputclass" maxlength="254" /><br />
<div class="buttonWrapper">
<input name="formBack0" type="button" class="open0 prevbutton" value="Back" alt="Back" title="Back"/>
<input name="formNext2" type="button" class="open2 nextbutton" value="Next" alt="Next" title="Next"/>
</div>
</fieldset>
</div>
</li>
<li id="sf3">
<div class="ui-accordion-left"></div>
<a href='#' class="ui-accordion-link">
<div class="ui-accordion-right"></div>
</a>
<div>
<fieldset>
<legend> Step 3 of 3 </legend>
<div class="requiredNotice">*Required Field</div>
<h3 class="stepHeader">Tell us about yourself</h3>
<label for="recordClientNameFirst" class="input required">First Name:</label>
<input name="recordClientNameFirst" id="recordClientNameFirst" class="inputclass {required:true}" title="First Name is required" maxlength="254" />
<br />
<label for="recordClientNameLast" class="input required">Last Name:</label>
<input name="recordClientNameLast" id="recordClientNameLast" class="inputclass {required:true}" maxlength="254" title="Last Name is required" />
<br />
<label for="recordClientAddress1" class="input required">Current  Address:</label>
<input name="recordClientAddress1" id="recordClientAddress1" class="inputclass {required:true}" maxlength="254" title="Address is required"/>
<br />
<label for="recordClientAddress2" class="input">Address (2):</label>
<input name="recordClientAddress2" id="recordClientAddress2" class="inputclass" maxlength="254" />
<br />
<label for="recordClientCity" class="input required">City:</label>
<input name="recordClientCity" id="recordClientCity" class="inputclass {required:true}" maxlength="254" title="City is required"/>
<br />
<label for="recordClientState" class="input required">State:</label>
<select name="recordClientState" id="recordClientState" class="inputclass {required:true}" title="Select a State">
<option value=""> -Select- </option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="DC">Dist of Columbia</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option> 
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option> 
<option value="PA" selected="selected">Pennsylvania</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option> 
</select>
<br />
<label for="recordClientZip" class="input required">Zip:</label>
<input name="recordClientZip" id="recordClientZip" class="inputclass {required:true}" maxlength="12" title="Zip Code is required" />
<br />
<label for="recordClientPhone" class="input required">Phone Number:</label>
<input name="recordClientPhone" id="recordClientPhone" class="inputclass {required:true}" maxlength="254" title="Phone Number is required"/>
<br />
<label for="recordClientPhoneAlt" class="input">Alternate Number:</label>
<input name="recordClientPhoneAlt" id="recordClientPhoneAlt" class="inputclass" maxlength="254" />
<br />
<label for="recordClientEmail" class="input required">Email Address:</label>
<input name="recordClientEmail" id="recordClientEmail" class="inputclass {required:true, email:true}" maxlength="254" title="Email address is required" />
<br />
<label for="recordClientEmail1" class="input required">Confirm Email:</label>
<input name="recordClientEmail1" id="recordClientEmail1" class="inputclass {required:true, equalTo:'#recordClientEmail'}" maxlength="254"  title="Please confirm your email address"/>
<br />
<br />
<div class="buttonWrapper">
<input name="formBack1" type="button" class="open1 prevbutton" value="Back" alt="Back" title="Back"/>
<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit">
</div>
</fieldset>
</div>
</li>
</ul>
</form>
</div>	
<!-- content-wrap ends here -->
</div>
<!-- wrap ends here -->		
</div>	
</body>

<!-- Mirrored from www.gowestwebdesign.com/demos/jQuery-accordion-w-validation/ by HTTrack Website Copier/3.x [XR&CO'2010], Sat, 01 Oct 2011 20:44:11 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8"><!-- /Added by HTTrack -->
</html>