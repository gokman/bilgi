<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<div class="orta_div_sag">
											ana bolum
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
