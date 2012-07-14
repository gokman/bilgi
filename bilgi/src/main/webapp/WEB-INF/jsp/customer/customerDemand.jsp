<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
	
		<script src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>" type="text/javascript"></script>
		<link rel="stylesheet" href="<c:url value="/resources/css/prettyPhoto/prettyPhoto.css"/>" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="<c:url value="/resources/js/jquery.prettyPhoto.js"/>" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="<c:url value="/resources/css/form/main_form.css"/>"></link>
			
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
                                <!-- talep form başla -->
        <c:url value="/customer/saveCustomerDemand.htm" var="saveCustomerDemand"></c:url>             
       <form:form  name="cmaForm" id="cmaForm" action="${saveCustomerDemand}" method="POST" modelAttribute="customer"  enctype="multipart/form-data" >
		<form:input type="hidden" path="musteriId" value="${musteriId}"></form:input>

				<fieldset>
				<legend> Talep Bilgileri</legend> 
				<div class="requiredNotice">* Zorunlu Alan</div>
				<h3 class="stepHeader">Müşteri Talep Formu</h3>
				
				<label for="yapıtipi" class="input required">Yapı Tipi:</label>
				<form:input  path="tip" name="yapıtipi" class="formtext"  maxlength="50" />
				<form:errors  path="tip"></form:errors>
				<br/>
				<label for="semt" class="input required">Semt:</label>
				<form:input  path="semt" name="semt" class="formtext"  maxlength="50" />
				<form:errors  path="semt"></form:errors>
				<br/>
				<label for="sehir" class="input required">Şehir:</label>
				<form:input  path="sehir" name="sehir" class="formtext"  maxlength="50" />
				<form:errors  path="sehir"></form:errors>
				<br/>
				<label for="altsınır" class="input required">Alt Sınır:</label>
				<form:input  path="altdeger" name="altsınır"  class="formtext"  maxlength="50" />
				<form:errors  path="altdeger"></form:errors>
				<br/>
				<label for="üstsınır" class="input required">Üst Sınır:</label>
				<form:input  path="ustdeger" name="üstsınır" class="formtext"  maxlength="50" />
				<form:errors  path="ustdeger"></form:errors>
				<br/>
				<label for="ebat" class="input required">Ebat:</label>
				<form:input path="ebat" name="ebat"  class="formtext"  maxlength="50" />
				<form:errors  path="ebat"></form:errors>
		        <br/>
				
				<br />
				<div class="buttonWrapper">
				<input name="submit" type="submit" id="submit" value="Kaydet" class="submitbutton" alt="Submit" title="Submit"/>
				</div>
				</fieldset> 
				</form:form>
                                <!-- talep form bitir -->
										</div>
<!--  end -->


								</c:when>
								<c:otherwise>
									<div class="orta_div_sag">
											Bu içeriğe erişmek için giriş yapmalısınız.
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