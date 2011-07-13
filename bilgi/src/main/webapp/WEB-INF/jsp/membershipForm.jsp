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
					<form:input type="text" id="username" path="userName"/>
				</td>
				<td>
					<form:errors path="userName" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>	
					<label for="user_surname">Soyad</label>
				</td>
				<td>	
					<form:input path="userSurname" type="text" id="userSurname"/>
				</td>
				<td>
					<form:errors path="userSurname" cssClass="error" />
				</td>				
			</tr>
			<tr>
				<td>
					<label for="nickname">Kullanici Adi</label>
				</td>
				<td>
					<form:input type="text" id="nickname" path="nickName"/>
				</td>
				<td>
					<form:errors path="nickName" cssClass="error" />
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
