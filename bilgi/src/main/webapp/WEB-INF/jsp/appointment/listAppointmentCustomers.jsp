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
	<c:url value="/appointment/listAppointmentCustomers.htm" var="listAppointmentCustomers"></c:url>
	<form:form  name="cmaForm" id="cmaForm" >

		<ul id="stepForm" class="ui-accordion-container">
			<li  id="sf1">
			<div class="ui-accordion-left"></div>
			<a href='#' class="ui-accordion-link">
				<div class="ui-accordion-right"></div>
			</a>
			<div>


				<fieldset>
				<legend> Step 2 of 3 - Müşteri Seçim</legend> 

				<table width="80%" cellspacing="0" cellpadding="0" align="center">
							<tbody>
								<tr>
									<td class="tdHeader2"></td>
								</tr>
								<tr>
									<td valign="top" bgcolor="#d0d0d0"
										onmouseover="javascript:prestijTimer=0" height="594">

									<table bgcolor="#ffffff" id="ilan1" width="100%" height="100%"
										cellpadding="1" cellspacing="2" border="0" class="table">
										<tbody>
											<tr>
												<td colspan="4" height="2">
												<img src="/resources/kariyer/tpx(1).gif" width="1" height="2"
													border="0" alt="" /></td>
											</tr>

											<script language="JavaScript">writePrestij(1,'?arn=&sid=',26)</script>
											<!-- Guncel ilanlarin listelendigi bolum.for each ile listelenicek. -->

											<c:forEach var="customer" items="${selectedCustomers}" varStatus="rowCounter">
												<c:if test='${rowCounter.index % 3 == "0"}'>
													<tr>	
												</c:if>

												<td valign="top"
													onmouseover="setDiv(&#39;prestij1&#39;,430,280,1,-40,26,30,10)" width="25%">
													<table class="liste_kutu" width="100%" align="center" ><tr><td>
													<a href="<c:url value="/appointment/getAppointmentForm/${customer.customerId}.htm"/>">
													<c:choose>
													    <c:when test="${not empty customer.profileImage}">
													        <img src="<c:url value="${customer.profileImage}"/>"  border="0" alt="" hspace="0" width="100%" height="170px" />
													    </c:when>
													    <c:otherwise>
													        <img src="<c:url value="/resources/image/customer/user_anonymous_man.png"/>"  border="0" alt="" hspace="0" width="100%" height="170px" />
													    </c:otherwise>
													</c:choose>													
												</a>
												<br/>
												<a href="<c:url value="/appointment/getAppointmentForm/${customer.customerId}.htm"/>">
													<b>
													<c:out value="${customer.name} ${customer.surname}" />
													</b>
											    </a>
											    <br/>
												</td></tr></table>
													</td>

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