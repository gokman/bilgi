<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
	
			<!-- Acordion form js and css -->
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
			<!-- 
			<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
			<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
			-->
			<!-- 
			<link rel="stylesheet" href="<c:url value="/resources/css/form/customer_form.css"/>"></link>
			-->
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.1.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.form.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.metadata.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.validate.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.maskedinput-1.0.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.dimensions.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.accordion.js"/>"></script>
			
			<!-- date picker 
				<link rel="stylesheet" href="<c:url value="/resources/css/datepicker/datepicker.css"/>" />
			    <link rel="stylesheet" href="<c:url value="/resources/css/datepicker/layout.css"/>" />
			<!--	 
				<script type="text/javascript" src="<c:url value="/resources/js/datepicker/datepicker.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/eye.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/utils.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/layout.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.js"/>"></script>
			  -->
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

<body bgcolor="#AF4555">
	<table align="center" cellspacing="0" cellpadding="0" width="1000px" bgcolor="#FFFFFF">
		<tbody>
		<!-- üst kisim -->
		<tr>
					<jsp:include page="/WEB-INF/jsp/ana_sayfa/header.jsp" />
		</tr>

		<!-- orta kisim -->
		<tr>
			<td>

				<table class="orta_div" align="center">
					<tr>
						<td valign="top">
							<div class="orta_div_sol">
							<!-- kullanıcı giriş bölümü olacak-->
								<div class="kullanici_giris">
									<c:choose>
											<c:when test="${isAuthenticated=='true' }">
												<h3>Merhaba <c:out value="${username}"></c:out></h3>
												<br/>
												<h3><a href="<c:url value="/j_spring_security_logout"/>" value="Logout">logout</a></h3>
											</c:when>
											<c:otherwise>
												<form method="post" action="j_spring_security_check"><br />
												Kullanici adi <br />
												<input type="text" width="10px" name="j_username" /><br />
												Sifre <br />
												<input width="10px" name="j_password" type="password"/><br />
												<input class="dugme_giris" type="submit" width="60px" value=" " />
												<br />
												<a href="<c:url value="/login/requestPassword.htm"/>">Sifremi
												Unuttum</a> <a href="<c:url value="/login/membershipForm.htm"/>">Üye
												Ol</a></form>
											</c:otherwise>
									</c:choose>		 
								</div>
								<div class="sol_menu">
									<img src="<c:url value="/resources/image/ana_sayfa/reklam.jpg"/>"/>
								</div>
							</div>
						</td>
						<td valign="top">
							<c:choose>
								<c:when test="${isAuthenticated=='true'}">

<!-- start -->
	<div id="wrap">
	<!-- content-wrap starts here -->
	<div id="content-wrap">
	<div id="main">
	<!-- Acordion form js and css end -->
	<c:url value="/customer/saveCustomerForm.htm" var="saveCustomer"></c:url>
	<form:form  name="cmaForm" id="cmaForm" action="${saveCustomer}" method="POST" modelAttribute="customer"  enctype="multipart/form-data" >
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
				<legend> Step 1 of 3 - Kimlik Bilgileri</legend> 
				<div class="requiredNotice">*Required Field</div>
				<h3 class="stepHeader">Musteri Kayit Formu</h3>
<!-- Sahis sirket olayi simdidlik kapali
				<div class="formspacer" > </div>
				<label for="recordPurchaseMetRealtor" class="input required">Musteri Turu</label>
				&nbsp;&nbsp;Sahis: 				
				<form:radiobutton name="recordPurchaseMetRealtor" path="gender" class="inputclass" value="0"/> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sirket: 
				<form:radiobutton name="recordPurchaseMetRealtor" path="gender" class="inputclass {required:true}" value="1" title="Please choose Yes or No" />				
-->
				<div class="formspacer" > </div>

				<label for="recordClientNameFirst" class="input required">First Name:</label>
				<form:input path="name" name="recordClientNameFirst" id="recordClientNameFirst" class="inputclass {required:true}" title="First Name is required" maxlength="254" />
				<br />
				<label for="recordClientNameLast" class="input required">Last Name:</label>
				<form:input path="surname" name="recordClientNameLast" id="recordClientNameLast" class="inputclass {required:true}" maxlength="254" title="Last Name is required" />
				<br />

				<label for="recordForGenderType" class="input required">Cinsiyet</label>
				&nbsp;&nbsp;Bay: 
				<form:radiobutton path="gender" name="recordForGenderType" type="radio" checked="checked" class="inputclass" value="0" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bayan: 
				<form:radiobutton path="gender" name="recordForGenderType" type="radio" class="inputclass {required:true}" value="1" title="Please choose Yes or No" />
				<div class="formspacer" > </div>
				<label for="recordForMaritalStatus" class="input required">Medeni Durum</label>
				&nbsp;&nbsp;Evli: 
				<form:radiobutton path="maritalStatus" name="recordForMaritalStatus" type="radio" checked="checked" class="inputclass" value="0" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bekar: 
				<form:radiobutton path="maritalStatus" name="recordForMaritalStatus" type="radio" class="inputclass {required:true}" value="1" title="Please choose Yes or No" />
				<div class="formspacer" > </div>

				<!-- gecici olarak kapatilacak
				<label for="recordClientEmail1" class="input required">Confirm Email:</label>
				<form:input path="" name="recordClientEmail1" id="recordClientEmail1" class="inputclass {required:true, equalTo:'#recordClientEmail'}" maxlength="254"  title="Please confirm your email address"/>
				<br />
			-->
	
				<label for="customerProfileImage" class="input required">Profil Resmi:</label>
				<input type="file" class="inputclass {required:true}" id="customerProfileImage" name="customerProfileImage" title="Profile image is required" />
				<br />


				<br />
				<div class="buttonWrapper">
				<input name="formNext1" type="button" class="open1 nextbutton" value="Next" alt="Next" title="Next" />
				</div>
		</fieldset> 
		</div>
		</li>
			<!-- end of stage 1 -->
			
<li id="sf2">
	<div class="ui-accordion-left"></div>
	<a href='#' class="ui-accordion-link">
		<div class="ui-accordion-right"></div>
	</a>
	<div>
	<fieldset>
	<legend> Step 2 of 3 - Meslek ve Faaliyet Alani Bilgileri</legend>
	<div class="requiredNotice">*Required Field</div>
	<h3 class="stepHeader">Tell us about the property you're selling</h3>

		<label for="recordEducationLevel" class="input required">Egitim Durumu:</label> 
		<form:select
				path="educationLevel" name="recordEducationLevel" id="recordEducationLevel"
				class="inputclass {required:true}" title="Egitim Durumunuz">
				<form:option value="Ilkogretim" label="Ilkogretim" />
				<form:option value="Lise" label="Lise" />
				<form:option value="Universite" label="Universite" />
				<form:option value="Y.Lisans" label="Y.Lisans" />
       </form:select> 
       <br />

		<label for="recordClientSalary" class="input required">Aylik Gelir:</label>
		<form:input path="salary" name="recordClientSalary" id="recordClientSalary" class="inputclass {required:true}" title="Aylik Gelir" maxlength="254" />
		<br />
	
		<label for="recordClientOccupation" class="input required">Meslek:</label>
		<form:input path="occupation" name="recordClientOccupation" id="recordClientOccupation" class="inputclass {required:true}" title="Meslek" maxlength="254" />
		<br />
		
		<label for="recordClientPlaceOfWork" class="input required">Calisilan Kurum:</label>
		<form:input path="placeOfWork" name="recordClientPlaceOfWork" id="recordClientPlaceOfWork" class="inputclass {required:true}" title="Calisilan Kurum" maxlength="254" />
		<br />
		
		<label for="recordSettlementStatus" class="input required">Ikamet Durumu:</label>
		
		<form:select
				path="settlementStatus" name="recordSettlementStatus" id="recordSettlementStatus"
				class="inputclass {required:true}" title="Ikamet Durumu">
				<form:option value="EvSahibi" label="Ev Sahibi" />
				<form:option value="Kiraci" label="Kiraci" />
				<form:option value="Misafir" label="Misafir" />
       </form:select> 
       <br />
		
	
			<!-- 
	<label for="recordClientAddress2" class="input">Address (2):</label>
	<input name="recordClientAddress2" id="recordClientAddress2" class="inputclass" maxlength="254" />
	<br />
	<label for="recordClientCity" class="input required">City:</label>
	<input name="recordClientCity" id="recordClientCity" class="inputclass {required:true}" maxlength="254" title="City is required"/>
	<br />
	
	<label for="recordClientHomeTypeID" class="input required">Type of property you are selling:</label>
	<select name="recordClientHomeTypeID" id="recordClientHomeTypeID" class="inputclass {required:true}" title="Select a Property Type">
	<option value=""> -Select- </option>
	<option value="1">Single Family Detached</option>
	<option value="7">Other</option>
	</select>
	<br />
	<label for="recordPropertyAddress1" class="input required">Property Street Address:</label>
	<input name="recordPropertyAddress1" id="recordPropertyAddress1" class="inputclass {required:true}" title="Street Address is required" maxlength="254" onblur="recordClientAddress1.value = this.value" /><br />
	<label for="recordPropertyAddress2" class="input">Address (2):</label>
	<input name="recordPropertyAddress2" id="recordPropertyAddress2" class="inputclass" maxlength="254"  onblur="recordClientAddress2.value = this.value" /><br />
	-->
	<!-- 
	<select name="recordPropertyState" id="recordPropertyState" class="inputclass {required:true}" title="Select a State"  onchange="recordClientState.value = this.value" >
	<option value=""> -Select- </option>
	<option value="AL">Alabama</option>
	</select>
	
	<br />
	<label for="recordPropertyZip" class="input required">Zip:</label>
	<input name="recordPropertyZip" id="recordPropertyZip" class="inputclass {required:true}" title="Zip Code is required" maxlength="254"  onblur="recordClientZip.value = this.value" /><br />
	
	<label for="recordClientPropertyValueID" class="input required">Estimated Market Value:</label>
	<select name="recordClientPropertyValueID" id="recordClientPropertyValueID" class="inputclass {required:true}" title="Select a Price Range">
	<option value=""> -Select- </option>
	<option value="1">Less Than $75K</option>
	<option value="2">$75-$100K</option>
	</select>
	<br />
	<label for="recordPropertyBedroomsID" class="input">Bedrooms:</label>
	<select name="recordPropertyBedroomsID" id="recordPropertyBedroomsID" class="inputclass">
	<option value=""> -Select- </option>
	<option value="1">1</option>
	</select>
	<br />
	<label for="recordPropertyBathroomsId" class="input">Bathrooms:</label>
	<select name="recordPropertyBathroomsId" id="recordPropertyBathroomsId" class="inputclass">
	<option value=""> -Select- </option>
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
	-->
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
<legend> Step 3 of 3 - Iletisim Bilgileri</legend>
<div class="requiredNotice">*Required Field</div>
<h3 class="stepHeader">Tell us about your communication info</h3>
<label for="recordClientState" class="input required">State:</label>

	<form:select path="country" name="recordClientState" id="recordClientState" class="inputclass {required:true}" title="Select a State">
		<form:option value="TR" label="TR" />
		<form:option value="GR" label="GR" />
		<form:option value="KKTC" label="KKTC" />
	</form:select> 

	<br />

	<label for="recordClientAddress1" class="input required">Current  Address:</label>
	<form:input path="adress" name="recordClientAddress1" id="recordClientAddress1" class="inputclass {required:true}" maxlength="254" title="Address is required"/>
	<br />

	<label for="recordPropertyCity" class="input required">City:</label>
	<form:input path="city" name="recordPropertyCity" id="recordPropertyCity" class="inputclass {required:true}" title="City is required" maxlength="254"  onblur="recordClientCity.value = this.value" /><br />
	<br />					
	<label for="recordClientEmail" class="input required">Email Address:</label>
	<form:input path="email" name="recordClientEmail" id="recordClientEmail" class="inputclass {required:true, email:true}" maxlength="254" title="Email address is required" />
	<br />
<!-- 	
<label for="recordClientZip" class="input required">Zip:</label>
<input name="recordClientZip" id="recordClientZip" class="inputclass {required:true}" maxlength="12" title="Zip Code is required" />
<br />
-->
<label for="recordClientPhone" class="input required">Phone Number:</label>
<form:input path="phoneNumber" name="recordClientPhone" id="recordClientPhone" class="inputclass {required:true}" maxlength="254" title="Phone Number is required"/>
<br />
<!-- 
<label for="recordClientPhoneAlt" class="input">Alternate Number:</label>
<input name="recordClientPhoneAlt" id="recordClientPhoneAlt" class="inputclass" maxlength="254" />
<br />
-->
<br />
<div class="buttonWrapper">
<input name="formBack1" type="button" class="open1 prevbutton" value="Back" alt="Back" title="Back"/>
<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit"/>
</div>
</fieldset>
</div>
</li>
			
			
						
	</form:form>
</div>
<!--  end -->


								</c:when>
								<c:otherwise>
									<div class="orta_div_sag">
											Bu icerige erismek icin giris yapmalisiniz.
									</div>
								</c:otherwise>
							</c:choose>		 
						</td>
	
					</tr>
				</table>

			</td>
		</tr>
		<!-- alt kisim -->
		<tr>
					<jsp:include page="/WEB-INF/jsp/ana_sayfa/footer.jsp" />
		</tr>

		</tbody>
	</table>

</body>
</html>