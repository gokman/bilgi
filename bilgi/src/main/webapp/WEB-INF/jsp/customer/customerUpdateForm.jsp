<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<form:form action="/bilgi/customer/customerUpdate.htm" method="POST" commandName="customerUpdate" 
modelAttribute="customerUpdate" enctype="multipart/form-data">	
<table class="musteri_tablo">
<form:input  path="customerId" value="${musteri_detay.customerId}"></form:input>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="name" /></td>
<td class="musteri_sag_sutun">
<form:input  path="name" value="${musteri_detay.name}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="surname" /></td>
<td class="musteri_sag_sutun">
<form:input  path="surname" value="${musteri_detay.surname}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="salary" /></td>
<td class="musteri_sag_sutun">
<form:input  path="salary" value="${musteri_detay.salary}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="occupation" /></td>
<td class="musteri_sag_sutun">
<form:input  path="occupation" value="${musteri_detay.occupation}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="educationLevel" /></td>
<td class="musteri_sag_sutun">
<form:input  path="educationLevel" value="${musteri_detay.educationLevel}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="placeOfwork" /></td>
<td class="musteri_sag_sutun">
<form:input  path="placeOfWork" value="${musteri_detay.placeOfWork}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="settlementStatus" /></td>
<td class="musteri_sag_sutun">
<form:input  path="settlementStatus" value="${musteri_detay.settlementStatus}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="adress" /></td>
<td class="musteri_sag_sutun">
<form:input  path="adress" value="${musteri_detay.adress}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="phoneNumber" /></td>
<td class="musteri_sag_sutun">
<form:input  path="phoneNumber" value="${musteri_detay.phoneNumber}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="email" /></td>
<td class="musteri_sag_sutun">
<form:input  path="email" value="${musteri_detay.email}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="city" /></td>
<td class="musteri_sag_sutun">
<form:input  path="city" value="${musteri_detay.city}"></form:input>
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="country" /></td>
<td class="musteri_sag_sutun">
<form:input path="country" value="${musteri_detay.country }" />
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="profileImage" /></td>
<td class="musteri_sag_sutun">
<form:input path="profileImage" value="${musteri_detay.profileImage }" />
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="gender" /></td>
<td class="musteri_sag_sutun">
<form:input path="gender" value="${musteri_detay.gender }" />
</td>
</tr>
<tr>
<td class="musteri_sol_sutun"><fmt:message key="maritalStatus" /></td>
<td class="musteri_sag_sutun">
<form:input path="maritalStatus" value="${musteri_detay.maritalStatus}" />
</td>
</tr>
<tr>
<td>
<input type="submit" value="Güncelle"/>
</td>
</tr>
</table>
</form:form>
<%@include file="/WEB-INF/jsp/ana_sayfa/footer.jsp" %>	
</body>
</html>


