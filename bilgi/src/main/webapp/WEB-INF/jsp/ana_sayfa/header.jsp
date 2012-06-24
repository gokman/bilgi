<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
 
	<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
 
</head>

<body bgcolor="#AF4555">
	<div align="center">
		<img src="<c:url value="/resources/image/ana_sayfa/ust_resim.jpg"/>" />
	</div>
	<table align="center" cellspacing="0" cellpadding="0" width="1000px" bgcolor="#FFFFFF">
		<tbody>
		<!-- �st kisim -->
		<tr>
			<td align="center">
				<div class="ust_div">
					<div class="ust_div_ust"></div>
					<div class="ust_div_menu">
						<div class="menu" >
								<ul class="menu">
									<li><a href="<c:url value="/index.htm"/>" >Ana Sayfa</a></li>
									<li><a href="#">Ürünler</a>
										<ul>
											<li><a href="<c:url value="/product/addProduct.htm"/>">Ürün Gir</a></li>
											<li><a href="<c:url value="/product/listProducts.htm"/>">Listele</a></li>
									   </ul>
								  </li>
									<li><a href="#">Müşteriler</a>
						                <ul>
						                <li><a href="<c:url value="/customer/listCustomers.htm"/>">Listele</a></li>
						                <li><a href="<c:url value="/customer/addCustomer.htm"/>">Müşteri Gir</a></li>
						                </ul>
						          </li>
									<li><a href="#">İletişim</a></li>
									<li><a href="#">Hakkımızda</a></li>
								</ul>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
	</table>
</body>
</html>