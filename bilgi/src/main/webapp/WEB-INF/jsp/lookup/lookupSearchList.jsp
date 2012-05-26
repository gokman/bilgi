<%@taglib  prefix="form"  uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
</head>

	<%@include file="/WEB-INF/jsp/ana_sayfa/header.jsp" %>
	<!-- ana bolum -->
	<div class="orta_div_sag">
	<form:form action="/bilgi/lookup/lookupMstSearch.htm" method="POST" commandName="lookupSearch" modelAttribute="lookupSearch" enctype="multipart/form-data">
<table width="300px" height="100px">
<tr height="50px">
<td>Ara:</td>
<td>
<form:input  path="baslik"  maxlength="50" /> 
<input  type="submit"  value="Ara"  />
</td></tr>
</table>
</form:form>
<table>
<c:forEach var="look" items="${lookup}">
                    <tr width="300px"><td>
                   <a href="<c:out value="/bilgi/lookup/lookupMstDetail.htm?id=${look.id}"/>">${look.baslik}</a>                    
                    </td></tr>
                </c:forEach>
</table>
</div> 
	<%@include file="/WEB-INF/jsp/ana_sayfa/footer.jsp" %>

</html>