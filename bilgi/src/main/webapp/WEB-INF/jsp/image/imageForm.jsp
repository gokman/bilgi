<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
	
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
			<link rel="stylesheet" href="<c:url value="/resources/css/form/main_form.css"/>"></link>
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
							<c:choose>
								<c:when test="${isAuthenticated=='true'}">

<!-- start -->
	<div id="wrap">
	<!-- content-wrap starts here -->
	<div id="content-wrap">
	<div id="main">
	<!-- Acordion form js and css end -->
	<c:url value="/image/saveImageForm.htm" var="saveImage"></c:url>
	<form:form  name="cmaForm" id="cmaForm" action="${saveImage}" method="POST" modelAttribute="image"  enctype="multipart/form-data" >
		<form:input path="entityType" type="hidden" name="imageEntityType" id="imageEntityType" value="${image.entityType}" />
		<form:input path="objectID" type="hidden" name="imageObjectID" id="imageObjectID" value="${image.objectID}" />
		<input type="hidden" name="recordClientServices" id="recordClientServices" value="1,3" /> 
		<ul id="stepForm" class="ui-accordion-container">
			<li  id="sf1">
			<div class="ui-accordion-left"></div>
			<a href='#' class="ui-accordion-link">
				<div class="ui-accordion-right"></div>
			</a>
			<div>


				<fieldset>
				<legend>
						<c:if test='${image.entityType == "C"}'>
							<c:out value="Musteri Resimleri"/>	
						</c:if>
						<c:if test='${image.entityType == "P"}'>
							<c:out value="Urun Resimleri"/>	
						</c:if>												
				</legend> 
				<div class="requiredNotice">*Required Field</div>
				<h3 class="stepHeader">
						<c:if test='${image.entityType == "C"}'>
							<c:out value="Musteri Resimleri"/>	
						</c:if>
						<c:if test='${image.entityType == "P"}'>
							<c:out value="Urun Resimleri"/>	
						</c:if>
				</h3>
				<div class="formspacer" > </div>
					<c:forEach var="i" begin="1" end="${imageCount}">
						<label class="input required" for="entityImage<c:out value='${i}'/>" >Profil Resmi:</label>
						<input type="file" class="inputclass {required:true}" id="entityImage<c:out value='${i}'/>" name="entityImage<c:out value='${i}'/>" title="Profile image is required" />
						<br />
					</c:forEach>
				<br />
				<div class="buttonWrapper">
				<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit">
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

<div class="buttonWrapper">
<input name="formBack1" type="button" class="open1 prevbutton" value="Back" alt="Back" title="Back"/>
<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit">
</div>
</fieldset>
</div>
</li>
			
			
						
	</form:form>
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