<%@taglib  prefix="form"  uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link href="/resources/css/ana_sayfa/main.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/resources/css/ana_sayfa/menu_style.css" type="text/css" />
</head>

<body bgcolor="#AF4555">
<div align="center"><img src=<c:url value="/resources/image/ana_sayfa/ust_resim.jpg"/> /></div>
<table align="center" cellspacing="0" cellpadding="0" width="1000px" bgcolor="#FFFFFF">
<tbody>
<!-- üst kisim -->
<tr><td align="center">
<div class="ust_div">
<div class="ust_div_ust"></div>
<div class="ust_div_menu">
<div class="menu">
		<ul>
			<li><a href="#" >Ana Sayfa</a></li>
			<li><a href="#" id="current">UrUnler</a>
				<ul>
					<li><a href="#">UrUn Gir</a></li>
					<li><a href="#">Listele</a></li>
			   </ul>
		  </li>
			<li><a href="#">Musteriler</a>
                <ul>
                <li><a href="#">Listele</a></li>
                <li><a href="#">Musteri Gir</a></li>
                </ul>
          </li>
			<li><a href="#">Iletisim</a></li>
			<li><a href="#">Hakkimizda</a></li>
		</ul>
	</div>
</div>
</div>
</td></tr>

<!-- orta kisim -->
<tr><td>

	<table class="orta_div">
	<tr><td>
	<div class="orta_div_sol">
	<!-- kullanıcı giriş bölümü olacak-->
	<div class="kullanici_giris">
	<form method="post">
	<br />
	Kullanici Adi
	<br />
	<input type="text" width="10px" name="username"/><br />
	Sifre <br />
	<input type="text" width="10px" name="password"/><br />
	<input class="dugme_giris" type="submit" width="60px" value=" "/>
	
	</form>
	</div>
	<div class="sol_menu">
	<img src=<c:url value="/resources/image/ana_sayfa/reklam.jpg"/> />
	</div>
	</div>
	</td><td valign="top">
	<!-- ana bolum -->
	<div class="orta_div_sag">
	<form:form action="/bilgi/lookup/lookupMstSave.htm" method="POST" commandName="lookupMst" modelAttribute="lookupMst" enctype="multipart/form-data">
<table width="300px" height="200px">
<tr height="50px">
<td>Baslik:</td>
<td>
<form:input  path="baslik"  maxlength="50" /><br>
</td></tr>
<tr height="50px"><td></td><td>
<input  type="submit"  value="Submit"  />
</td></tr>
</table>
</form:form>
	</div> 
	</td>
	</tr>
	</table>

</td></tr>

<!-- alt kisim -->
<tr><td align="center">
<div class="alt_div">alt bolum</div>
</td></tr>

</tbody>
</table>
<div align="center"><img src=<c:url value="/resources/image/ana_sayfa/alt_resim.jpg"/> /></div>
</body>

</html>