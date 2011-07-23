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

<c:url value="/login/membershipFormSave.htm" var="saveMember"></c:url>
<p align="center">Uyelik Sayfasi</p>

<form:form  action="${saveMember}" method="POST" modelAttribute="user">
		<table>
			<tr>
				<td>
					<label for="username">Ad</label>
				</td>	
				<td>
					<form:input type="text" id="name" path="name"/>
				</td>
				<td>
					<form:errors path="name" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>	
					<label for="surname">Soyad</label>
				</td>
				<td>	
					<form:input path="surname" type="text" id="surname"/>
				</td>
				<td>
					<form:errors path="surname" cssClass="error" />
				</td>				
			</tr>
			<tr>
				<td>
					<label for="username">Kullanici Adi</label>
				</td>
				<td>
					<form:input type="text" id="username" path="username"/>
				</td>
				<td>
					<form:errors path="username" cssClass="error" />
				</td>				
			</tr>
			<tr>	
				<td>
					<label for="password">Sifre</label>
				</td>
				<td>
					<form:input type="password" id="password" path="password" />
				</td>
				<td>
					<form:errors path="password" cssClass="error" />
				</td>				
			</tr>
			<tr>	
				<td>
					<label for="date1">Dogum Tarihi</label>
				</td>
				<td>	
					<form:input id="datepicker" type="text" path="dateOfBirth"/>
				</td>	
				<td>
					<form:errors path="dateOfBirth" cssClass="error" />
				</td>				
			</tr>
			<tr>
				<td>
					<label for="birth_place">Dogum Yeri</label>
				</td>
				<td>
					<form:input id="birth_place" type="text" path="birthPlace"/>
				</td>
				<td>
					<form:errors path="birthPlace" cssClass="error" />
				</td>				
			</tr>
			<tr>
				<td>	
					<label for="adress">Adres</label>
				</td>
				<td>
					<form:input type="text" id="adress" path="adress"/>
				</td>
				<td>
					<form:errors path="adress" cssClass="error" />
				</td>				
			</tr>
			<tr>
				<td>
					<label for="email">Email</label>
				</td>
				<td>	
					<form:input type="email" name="email" id="email" path="email"/>			
				</td>
				<td>
					<form:errors path="email" cssClass="error" />
				</td>					
			</tr>
			<tr>
				<td>
					<label for="phoneNumber">Telefon No</label>
				</td>
				<td>	
					<form:input type="text" id="phoneNumber" path="phoneNumber"/>
				</td>
				<td>
					<form:errors path="phoneNumber" cssClass="error" />
				</td>					
			</tr>
			
			<tr>
				<td>
					<input type="submit" id="submitMemberForm" />
				</td>
</form:form>
