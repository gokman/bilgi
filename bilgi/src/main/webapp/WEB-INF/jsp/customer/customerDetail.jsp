<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.6.1.min.js"/>"></script>
<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
<link href="<c:url value="/resources/css/ana_sayfa/customer.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="/WEB-INF/jsp/ana_sayfa/header.jsp" %>
<table class="musteri_tablo">
<tr>
<td class="musteri_sol_sutun"><fmt:message key="name" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.name}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="surname" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.surname}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="salary" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.salary}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="occupation" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.occupation}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="educationLevel" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.educationLevel}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="placeOfwork" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.placeOfWork}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="settlementStatus" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.settlementStatus}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="adress" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.adress}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="phoneNumber" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.phoneNumber}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="email" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.email}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="city" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.city}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="country" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.country}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="profileImage" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.profileImage}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="gender" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.gender}"></c:out></td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="maritalStatus" /></td>
<td class="musteri_sag_sutun"><c:out value="${musterim.maritalStatus}"></c:out></td>
</tr>
</table>
		

<%@include file="/WEB-INF/jsp/ana_sayfa/footer.jsp" %>	
</body>
</html>


