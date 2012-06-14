<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" src="<c:url value="/resources/jquery-1.5.2.js" /> "></script>
<script type="text/javascript" src="<c:url value="/resources/jquery.ui.core.js" /> "></script>
<script type="text/javascript" src="<c:url value="/resources/jquery.ui.datepicker.js" /> "></script>
<script type="text/javascript" src="<c:url value="/resources/jquery.ui.widget.js" /> "></script>
<link rel="stylesheet" href="<c:url value="/resources/css/demos.css" /> "></link>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery.ui.all.css" /> "></link>
<script>
	$(function() {
		$( "#datepicker" ).datepicker();
	});
</script>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="common/header.jsp">
	<jsp:param name="pageTitle" value="Login" />
</jsp:include>
<html>
<head>
<title>User Profile</title>
</head>
<body>


<c:if test="${!empty userProfile}">
	<table>
		<tr>
			<th>Kullanici Adi</th>
		</tr>

		<tr>
			<td><c:out value="${userProfile.username}"/></td>
		</tr>
		<tr>
		<td><h3>Profile Picture</h3></td>
		<td>
		<c:if test="${!empty userProfile }">
			<img src="<%=session.getAttribute("profileImage")%>" alt="profileImage" />
		</c:if>
		</td>		
	</table>
</c:if>
</body>
</html>