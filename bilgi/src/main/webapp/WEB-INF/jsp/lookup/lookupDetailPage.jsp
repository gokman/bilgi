<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  prefix="form"  uri="http://www.springframework.org/tags/form"%>
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
</head>
<body>
<%@include file="/WEB-INF/jsp/ana_sayfa/header.jsp" %>
<c:out value="${url.baslik}">${url.baslik}</c:out>
<%@include file="/WEB-INF/jsp/ana_sayfa/footer.jsp" %>	
</body>
</html>