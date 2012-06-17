<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
	<title>Ana Sayfa</title>
	<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
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
								<jsp:include page="/WEB-INF/jsp/ana_sayfa/loginuser.jsp" />
								<div class="sol_menu">
									<img src="<c:url value="/resources/image/ana_sayfa/reklam.jpg"/>"/>
								</div>
							</div>
						</td>
						<td valign="top">
							<c:choose>
								<c:when test="${isAuthenticated=='true'}">
	<c:url var="searchCustomerURL" value="/customer/listCustomersWithCriteria.htm" />
	
				<div class="orta_div_sag">
					<form:form action="${searchCustomerURL}" method="POST" 	commandName="searchCriterias" modelAttribute="searchCriterias">
						<table width="300px" height="100px">
							<tr height="50px">
								<td>Ad:</td>
								<td>
									<form:input path="searchCriterias[0]" maxlength="15" /> 
								</td>
								<td>Soyad:</td>
								<td>
									<form:input path="searchCriterias[1]" maxlength="15" /> 
								</td>
								<td>
									<input type="submit" value="Ara" />
								</td>
								
							</tr>
						</table>
					</form:form>

				<table width="100%" cellspacing="0" cellpadding="0" align="center"	class="bordertable2">
							<tbody>
								<tr>
									<td class="tdHeader2">&nbsp;Aktif Musteriler</td>
								</tr>
								<tr>
									<td valign="top" bgcolor="#d0d0d0"
										onmouseover="javascript:prestijTimer=0" height="594">

									<table bgcolor="#ffffff" id="ilan1" width="100%" height="100%"
										cellpadding="1" cellspacing="2" border="0" class="table">
										<tbody>
											<tr>
												<td colspan="4" height="2"><img
													src="/resources/kariyer/tpx(1).gif" width="1" height="2"
													border="0" alt=""></td>
											</tr>

											<script language="JavaScript">writePrestij(1,'?arn=&sid=',26)</script>
											<!-- Guncel ilanlarin listelendigi bolum.for each ile listelenicek. -->

											<c:forEach var="customer" items="${activeCustomers}" varStatus="rowCounter">
												<c:if test='${rowCounter.index % 3 == "0"}'>
													<tr>	
												</c:if>

												<td valign="top"
													onmouseover="setDiv(&#39;prestij1&#39;,430,280,1,-40,26,30,10)"><a
													href="<c:url value="/customer/customerDetail/${customer.customerId}.htm"/>"
													class="prestijBig">
													
													
													<c:choose>
													    <c:when test="${not empty customer.profileImage}">
													        <img src="<c:url value="${customer.profileImage}"/>"  border="0" alt="" hspace="0" width="100" height="140">
													    </c:when>
													    <c:otherwise>
													        <img src="<c:url value="/resources/image/customer/user_anonymous_man.png"/>"  border="0" alt="" hspace="0" width="100" height="140">
													    </c:otherwise>
													</c:choose>													
													
													
												</a>
												</td>
												<td width="50%" valign="top"
													onmouseover="setDiv(&#39;prestij1&#39;,430,280,1,-40,26,30,10)"><span
													id="prestij1" style="position: relative">
												<a
													href="<c:url value="/customer/customerDetail/${customer.customerId}.htm"/>"
													class="prestijBig"><b><c:out
													value="${customer.name}" /><c:out
													value="${rowCounter.index}" /></b></a><br>
												<a
													href="<c:url value="/customer/customerDetail/${customer.customerId}.htm"/>"
													class="prestijBig"><font class="prestij"><c:out
													value="${customer.name}" /></font></a></span></td>

												<c:if test='${rowCounter.index % 3 == "2"}'>
													</tr>	
												</c:if>
											</c:forEach>
											<tr>
												<td colspan="2" height="3"></td>
											</tr>
											<!-- 
											-->
										</tbody>
									</table>

									</td>
								</tr>
							</tbody>
						</table>
						</div>
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
