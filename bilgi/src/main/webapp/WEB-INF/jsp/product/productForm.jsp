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
			
			function isNumericKey(e) {
			   var k = document.all ? e.keyCode : e.which;
			   return ((k > 47 && k < 58) || k == 8);
			}
			function extractNumeric(str) {
			   return str.replace(/\D/g,"");
			}
			
			</script>
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
				 
				<script type="text/javascript" src="<c:url value="/resources/js/datepicker/datepicker.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/eye.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/utils.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/layout.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.js"/>"></script>
			  -->
			<script type="text/javascript">
			// JQUERY FOR THIS PAGE
			
			
// Numeric only control handler
jQuery.fn.ForceNumericOnly =
function()
{
    return this.each(function()
    {
        $(this).keydown(function(e)
        {
            var key = e.charCode || e.keyCode || 0;
            // allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
            return (
                key == 8 || 
                key == 9 ||
                key == 46 ||
                (key >= 37 && key <= 40) ||
                (key >= 48 && key <= 57) ||
                (key >= 96 && key <= 105));
        });
    });
};			
			
			
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
										$("#ebat").ForceNumericOnly();

									});
								});
			</script>
			<!-- css for this page -->
			
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

	<c:url value="/product/saveProductForm.htm" var="saveProduct"></c:url>
	<form:form  name="cmaForm" id="cmaForm" action="${saveProduct}" method="POST" modelAttribute="product"  enctype="multipart/form-data" >
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
				<legend> Adım 1/3 - Ürün Bilgileri</legend> 
				<div class="requiredNotice">* Zorunlu Alan</div>
				<h3 class="stepHeader">Ürün Kayıt Formu</h3>
				<div class="formspacer" > </div>

				<label for="recordProductType" class="input required">Ürün Türü:</label>
				
				<form:select
						path="tip" name="recordProductType" id="recordProductType"
						class="inputclass {required:true}" title="Ürün Türü" >
						<form:option value="Ev" label="Ev" />
						<form:option value="Dükkan" label="Dükkan" />
						<form:option value="Arsa" label="Arsa" />
		       </form:select> 
		      <!--   <form:errors path="tip"></form:errors> -->
		       <br />

				<label for="recordPropertyCity" class="input required">Şehir:</label>
				<form:input path="sehir" name="recordPropertyCity" id="recordPropertyCity" class="formtext" title="Urunun bulundugu sehir" maxlength="100"  onblur="recordClientCity.value = this.value" />
				<form:errors path="sehir" cssClass="warning"></form:errors>
				<br />					
				

				<label for="recordPropertyDistrict" class="input required">Semt:</label>
				<form:input path="semt" name="recordPropertyDistrict" id="recordPropertyDistrict" class="formtext" title="Urunun bulundugu semt" maxlength="150"  onblur="recordClientCity.value = this.value" />
				<form:errors path="semt" cssClass="warning"></form:errors>
				<br />					

				<label for="recordClientAddress1" class="input required">Adres Detay:</label>
				<form:input path="adres_detay" name="recordClientAddress1" id="recordClientAddress1" class="formtext" maxlength="254" title="Adres "/>
				<form:errors path="adres_detay" cssClass="warning"></form:errors>
				<br />

				<label for="ebat" class="input required">Alan:</label>
				<form:input path="ebat" name="ebat" id="ebat" class="formtext" maxlength="254" title="Alan "/>
				<form:errors path="ebat" cssClass="warning"></form:errors>
				<br />

				<label for="recordProductDetail" class="input required">Ürün Detay:</label>
				<form:input path="ozellik_detay" name="recordProductDetail" id="recordProductDetail" class="formtext" maxlength="254" title="Ozellik Detay "/>
				<form:errors path="ozellik_detay" cssClass="warning"></form:errors>
				<br />
				
				<div class="formspacer" > </div>

				<!-- gecici olarak kapatilacak
				<label for="recordClientEmail1" class="input required">Confirm Email:</label>
				<form:input path="" name="recordClientEmail1" id="recordClientEmail1" class="inputclass {required:true, equalTo:'#recordClientEmail'}" maxlength="254"  title="Please confirm your email address"/>
				<br />
			-->
				<label for="productProfileImage" class="input required">Profil Resmi:</label>
				<input type="file" class="inputclass {required:true}" id="productProfileImage" name="productProfileImage" title="Profile image is required" />
				<br />
			

				<br />
				<div class="buttonWrapper">
				<!-- 
				<input name="formNext1" type="button" class="open1 nextbutton" value="Next" alt="Next" title="Next" />
				-->
				<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit"></input>
				
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
	<legend> Adım 2/3 - Meslek ve Faaliyet Alanı Bilgileri</legend>
	<div class="requiredNotice">*Zorunlu Alan</div>
	<h3 class="stepHeader">Sattığınız ürün hakkında bilgi verin</h3>

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
<legend> Adım 3/3 - İletişim Bilgileri</legend>
<div class="requiredNotice">*Zorunlu Alan</div>
<h3 class="stepHeader">İletişim bilgilerinizi girin</h3>
<br />
<div class="buttonWrapper">
<input name="formBack1" type="button" class="open1 prevbutton" value="Back" alt="Back" title="Back"/>
<input name="submit" type="submit" id="submit" value="Submit" class="submitbutton" alt="Submit" title="Submit">
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
											Bu içerige erişmek için giriş yapmalısınız.
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