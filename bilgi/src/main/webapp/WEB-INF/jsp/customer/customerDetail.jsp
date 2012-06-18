<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	
		<script src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>" type="text/javascript">
		</script>
		<!--  
		<script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script--> 
		<link rel="stylesheet" href="<c:url value="/resources/css/prettyPhoto/prettyPhoto.css"/>" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="<c:url value="/resources/js/jquery.prettyPhoto.js"/>" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="<c:url value="/resources/css/form/main_form.css"/>"></link>
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
			
	</head>

<body bgcolor="#AF4555">
	<table align="center" cellspacing="0" cellpadding="0" width="1000px" bgcolor="#FFFFFF">
		<tbody>
		<!-- ï¿½st kisim -->
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
							<!-- kullanï¿½cï¿½ giriï¿½ bï¿½lï¿½mï¿½ olacak-->
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
													<td class="musteri_sag_sutun">
													<c:choose>
															<c:when test="${not empty musterim.profileImage}">
																<img src="<c:url value="${musterim.profileImage}"/>"
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
														href="<c:url value="/customer/customerUpdatePage/${musterim.customerId}.htm"/>">Gï¿½ncelle</a>
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