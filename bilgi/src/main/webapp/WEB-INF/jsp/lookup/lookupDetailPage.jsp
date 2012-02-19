<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.6.1.min.js"/>"></script>
</head>
<body>
<table>
<c:forEach var="detay" items="${detay}">
                    <tr width="300px"><td>
                   <c:out value="${detay.baslik}"></c:out><br>
                   <c:out value="${detay.id}"></c:out><br>
                    
                    </td></tr>
                </c:forEach>
                </table>
</body>
</html>