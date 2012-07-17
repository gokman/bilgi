<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
			

			<link rel="stylesheet" href="<c:url value="/resources/css/form/main_form.css"/>"></link>

			
				<link rel="stylesheet" href="<c:url value="/resources/css/datepicker/jquery.ui.all.css"/>" />
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery-1.7.2.js"/>"></script>				 
				<script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.ui.core.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.ui.widget.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.ui.datepicker.js"/>"></script>


			
				<script type="text/javascript" src="<c:url value="/resources/js/zebra/zebra_dialog.js"/>"></script>

			<link rel="stylesheet" href="<c:url value="/resources/css/zebra/style.css"/>" type="text/css" />
				<link rel="stylesheet" href="<c:url value="/resources/css/zebra/zebra_dialog.css"/>" type="text/css" />
				<link rel="stylesheet" href="<c:url value="/resources/css/zebra/ir_black.css"/>" type="text/css" />
	
  
				<script type="text/javascript" src="<c:url value="/resources/js/zebra/highlight.js"/>"></script>
				<script type="text/javascript" src="<c:url value="/resources/js/zebra/functions.js"/>"></script>

			<script type="text/javascript">
			// JQUERY FOR THIS PAGE

			
			<!--
		-->	
									function saveAppointment(){
										document.cmaForm.action="/bilgi/appointment/saveAppointmentForm.htm";
										
										$.Zebra_Dialog('<strong>Randevu Kayıt </strong>Randevuyu kaydetmek istediğinizden emin misiniz?', {
										    'type':     'question',
										    'title':    'Custom buttons',
										    'buttons':  [
															{caption: 'Vazgeç', callback: function() { }},
										                    {caption: 'Kaydet', callback: function() { document.cmaForm.submit()}},
										                ]
										});										
									}

									function updateAppointment(){
										document.cmaForm.action="/bilgi/appointment/updateAppointmentForm.htm";
										
										$.Zebra_Dialog('<strong>Randevu Güncelleme </strong>Randevuyu güncellemek istediğinizden emin misiniz?', {
										    'type':     'question',
										    'title':    'Custom buttons',
										    'buttons':  [
															{caption: 'Vazgeç', callback: function() { }},
										                    {caption: 'Güncelle', callback: function() { document.cmaForm.submit()}},
										                ]
										});										
									}
									function deleteAppointment(){
										document.cmaForm.action="/bilgi/appointment/deleteAppointmentForm.htm";
										
										$.Zebra_Dialog('<strong>Randevu Güncelleme </strong>Randevuyu silmek istediğinizden emin misiniz?', {
										    'type':     'question',
										    'title':    'Custom buttons',
										    'buttons':  [
															{caption: 'Hayır', callback: function() { }},
										                    {caption: 'Evet', callback: function() { document.cmaForm.submit()}},
										                ]
										});										
									}
									function cancelAppointment(){
										document.cmaForm.action="/bilgi/appointment/cancelAppointmentForm.htm";
										
										$.Zebra_Dialog('<strong>Randevu Güncelleme </strong>Vazgeçmek istediğinizden emin misiniz?', {
										    'type':     'question',
										    'title':    'Custom buttons',
										    'buttons':  [
															{caption: 'Hayır', callback: function() { }},
										                    {caption: 'Evet', callback: function() { $(location).attr('href',"/bilgi/index.htm")}},
										                ]
										});										
									}									
									
			

												
									
									
									
									
									// masked inputs
									$(function($) {
										$("#recordClientNameFirst").attr("disabled", "disabled");
										$("#recordClientNameLast").attr("disabled", "disabled");
										$("#appointmentState").attr("editable", false);
										$( "#datepicker" ).datepicker();
										
									});
			
						
			</script>
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
	<c:url value="/appointment/saveOrUpdateAppointment.htm" var="saveOrUpdateAppointment"></c:url>
	<form:form  name="cmaForm" id="cmaForm" action="${saveOrUpdateAppointment}" modelAttribute="appointment" method="POST" enctype="multipart/form-data" >

		<ul id="stepForm" class="ui-accordion-container">
			<li  id="sf1">
			<div class="ui-accordion-left"></div>
			<a href='#' class="ui-accordion-link">
				<div class="ui-accordion-right"></div>
			</a>
			<div>

				<fieldset>
				<legend> Step 1 of 3 - Randevu Oluşturma</legend> 
				<div class="requiredNotice">* Zorunlu Alan</div>
				<h3 class="stepHeader">Randevu Formu</h3>
				<div class="formspacer" > </div>
				<!-- <label><form:errors path="*" /></label> -->

				<label for="recordClientNameFirst" class="input required">First Name:</label>
				<input name="recordClientNameFirst" id="recordClientNameFirst" class="formtext" value="${customer.name}" ></input>
				<br/>
				<label for="recordClientNameLast" class="input required">Last Name:</label>
				<input class="formtext"  name="recordClientNameLast" id="recordClientNameLast" value="${customer.surname}"/>
				<br />				
				
				<form:hidden path="customerId" value="${customer.customerId }"/>
				<form:hidden path="id" />
				<label for="appointmentState" class="input required">Randevu Durumu:</label>
				<form:select
						path="app_state" name="appointmentState" id="appointmentState"
						class="inputclass {required:true}" title="Randevu Durumu"  >
						<form:option value="B" label="Bekleniyor" selected="selected"/>
		       </form:select> 
				<br />				
		       				
				<label for="appointmentTime" class="input required">Randevu Saati:</label>
				<form:select
						path="app_time" name="appointmentTime" id="appointmentTime"
						class="inputclass {required:true}" title="Randevu Saati"  >
						<form:options items="${hoursOfDay}"  />
						
		       </form:select> 		       				
 
 				<br/>
 				<label for="appDate" class="input required">Randevu Tarihi:</label>
				<form:input type="text" id="datepicker" path="app_date" class="formtext"></form:input>
				
 				<br/>
				<label for="appPlace" class="input required">Randevu Yeri:</label>
				<form:input name="appPlace" id="appPlace" class="formtext" path="app_place"></form:input>
				<br/>

				<label for="description" class="input required">Açıklama:</label>
				<form:textarea style="resize:none;" rows="4" columns="20" name="description" id="description" class="formtextarea"  path="description"></form:textarea>
				<br/>				 				
 
				<div class="buttonWrapper">

				<c:choose>
					<c:when test="${appointment.id != null}">
						<input name="cancel" type="submit" id="cancel" value="Vazgeç" class="submitbutton" alt="Cancel" title="Vazgeç" onclick="cancelAppointment(); return false;"/>
						<input name="update" type="button" id="update" value="Güncelle" class="submitbutton" alt="Submit" title="Güncelle" onclick="updateAppointment(); return false;"/>
						<input name="delete" type="button" id="delete" value="Sil" class="submitbutton" alt="Submit" title="Sil" onclick="deleteAppointment(); return false;"/>
					</c:when>
					<c:otherwise>
						<input name="cancel" type="submit" id="cancel" value="Vazgeç" class="submitbutton" alt="Cancel" title="Vazgeç" onclick="cancelAppointment(); return false;"/>
						<input name="save" type="submit" id="save" value="Kaydet" class="submitbutton" alt="Submit" title="Kaydet" onclick="saveAppointment(); return false;"/>
					</c:otherwise>
				</c:choose>
				
				</div>
		</fieldset> 
		</div>
		</li>
			<!-- end of stage 1 --> 
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