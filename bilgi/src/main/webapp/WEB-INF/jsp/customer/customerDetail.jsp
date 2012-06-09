<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	
		<script src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>" type="text/javascript">
		</script>
		<!--  
		<script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script--> 
		<link rel="stylesheet" href="<c:url value="/resources/css/prettyPhoto/prettyPhoto.css"/>" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="<c:url value="/resources/js/jquery.prettyPhoto.js"/>" type="text/javascript" charset="utf-8"></script>
		
			<!-- 
			<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
			<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
			-->
			<!-- 
			<link rel="stylesheet" href="<c:url value="/resources/css/form/customer_form.css"/>"></link>
			
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.1.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.form.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.metadata.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.validate.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.maskedinput-1.0.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.dimensions.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.accordion.js"/>"></script>
			-->
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
								<div class="orta_div_sag">

											<table class="musteri_tablo">
												<tr>
													<td class="musteri_sol_sutun"><fmt:message key="name" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.name}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="surname" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.surname}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="salary" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.salary}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="occupation" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.occupation}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="educationLevel" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.educationLevel}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="placeOfwork" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.placeOfWork}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="settlementStatus" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.settlementStatus}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="adress" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.adress}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="phoneNumber" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.phoneNumber}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message key="email" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.email}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message key="city" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.city}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="country" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.country}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="profileImage" />
													</td>
													<td class="musteri_sag_sutun"><c:choose>
															<c:when test="${not empty customer.profileImage}">
																<img src="<c:url value="${customer.profileImage}"/>"
																	border="0" alt="" hspace="0" width="100" height="140">
															</c:when>
															<c:otherwise>
																<img
																	src="<c:url value="/resources/image/customer/user_anonymous_man.png"/>"
																	border="0" alt="" hspace="0" width="100" height="140">
															</c:otherwise>
														</c:choose></td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="gender" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.gender}"></c:out>
													</td>
												</tr>
												<tr>
													<td class="musteri_sol_sutun"><fmt:message
															key="maritalStatus" />
													</td>
													<td class="musteri_sag_sutun"><c:out
															value="${musterim.maritalStatus}"></c:out>
													</td>
												</tr>
												<tr>
													<td><a
														href="<c:url value="/customer/customerUpdatePage/${musterim.customerId}.htm"/>">Güncelle</a>
													</td>
												</tr>
											</table>

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