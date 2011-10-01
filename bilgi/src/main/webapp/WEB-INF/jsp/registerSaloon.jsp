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

<c:url value="/saloon/saveRegisterForm.htm" var="saveSaloonRegister"></c:url>
<p align="center"><fmt:message key="salon.form.header" /></p>


http://www.roseindia.net/tutorial/spring/spring3/web/spring-3-mvc-fileupload-example.html


<form:form  action="${saveSaloonRegister}" method="POST" modelAttribute="saloon" enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					<label for="name">Ad</label>
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
					<input type="submit" id="submitSaloonForm" />
				</td>
				 
        <c:choose>
            <c:when test="${files != null}">
                <c:forEach var="file" items="${files}" varStatus="counter">
                    <tr>
                        <td>${counter.index + 1}</td>
                        <td>${file.filename}</td>
                        <td>${file.notes}</td>
                        <td>${file.type}</td>
                        <td><div align="center"><a href="download.htm?id=${file.id}">Download</a> /
                            <a href="delete.htm?id=${file.id}">Delete</a></div>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
    </table>

    <h2>Add New File</h2>
        <table width="60%" border="1" cellspacing="0">
            <tr>
                <td width="35%"><strong>File to upload</strong></td>
                <td width="65%"><input type="file" name="file" /></td>
            </tr>
            <tr>
                <td><strong>Notes</strong></td>
                <td><input type="text" name="notes" width="60" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" name="submit" value="Add"/></td>
            </tr>
        </table>
</form:form>
