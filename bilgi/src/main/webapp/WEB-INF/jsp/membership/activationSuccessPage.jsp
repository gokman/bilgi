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
							<!-- kullanýcý giriþ bölümü olacak-->
								<jsp:include page="/WEB-INF/jsp/ana_sayfa/loginuser.jsp" />
								<div class="sol_menu">
									<img src="<c:url value="/resources/image/ana_sayfa/reklam.jpg"/>"/>
								</div>
							</div>
						</td>
						<td valign="top">

<!-- start -->

	<!-- Acordion form js and css end -->


		<ul id="stepForm" class="ui-accordion-container">
			<li  id="sf1">
			<div class="ui-accordion-left"></div>
			<a href='#' class="ui-accordion-link">
				<div class="ui-accordion-right"></div>
			</a>
			<div>


				<fieldset>
				<legend> Aktivasyon Islemi Sonuc</legend> 
				<div class="formspacer" > </div>

				<h3>Üyelik aktivasyon işleminiz başarıyla tamamlanmıştır.</h3>
				<br />
		</fieldset> 
		</div>
		</li>
			<!-- end of stage 1 -->
	</ul>			
						
<!--  end -->


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