<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
	
			<!-- Acordion form js and css -->
			<script type="text/javascript">
			<!--
			function isNumericKey(e) {
			   var k = document.all ? e.keyCode : e.which;
			   return ((k > 47 && k < 58) || k == 8);
			}
			function extractNumeric(str) {
			   return str.replace(/\D/g,"");
			}
			// -->
			</script>
	
	
		<script src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>" type="text/javascript">
		</script>
		<!--  
		<script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script--> 
		<link rel="stylesheet" href="<c:url value="/resources/css/prettyPhoto/prettyPhoto.css"/>" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="<c:url value="/resources/js/jquery.prettyPhoto.js"/>" type="text/javascript" charset="utf-8"></script>
		
			<!-- 
			<link href="<c:url value="/resources/css/ana_sayfa/main.css"/>" rel="stylesheet" type="text/css"/>
			<link rel="stylesheet" href="<c:url value="/resources/css/ana_sayfa/menu_style.css"/>" type="text/css" />
			-->
			<!-- 
			<link rel="stylesheet" href="<c:url value="/resources/css/form/customer_form.css"/>"></link>
			
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.1.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery-1.2.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.form.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.metadata.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.validate.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.maskedinput-1.0.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.dimensions.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/resources/js/form/jquery.accordion.js"/>"></script>
			-->
			<!-- date picker 
				<link rel="stylesheet" href="<c:url value="/resources/css/datepicker/datepicker.css"/>" />
			    <link rel="stylesheet" href="<c:url value="/resources/css/datepicker/layout.css"/>" />
			<!--	 
				<script type="text/javascript" src="<c:url value="/resources/js/datepicker/datepicker.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/eye.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/utils.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/layout.js"/>"></script>
			    <script type="text/javascript" src="<c:url value="/resources/js/datepicker/jquery.js"/>"></script>
			  -->
			<!-- css for this page -->
			<style type="text/css">
			/* ------ one ------------*/
			/* ------------- form specific styles are here  -------------- */
			
			fieldset {
			margin:0;
			border:1px solid #C3DE00;
			padding: 10px;
			/*border:none;
			padding:0;*/
			color:#7563A5;
			}
			legend {
			background-color:#FFFFFF;
			text-align: center;
			color: #097981;
			padding:0 12px;
			}
			label {
			text-align: right;
			width: 298px;
			border-right: 1px dotted #099;
			padding-right: 5px;
			margin:0 0 8px 0;
			float: left;
			clear: left;
			display: block;
			color: #7563A5;
			}
			label.checkbox, label.textarea{
			border:none;
			}
			label.lgfield{
			border:none;
			text-align:center;
			clear:both;
			float:none;
			width:100%;
			}
			fieldset input, fieldset select, fieldset textarea {
			margin-left: 10px;
			margin-bottom: 8px;
			}
			select.longfield{
			margin:0 0 0 115px;
			}
			input[type="radio"],input[type="checkbox"] {
			margin: 2px 0 0 4px;
			}
			textarea {
			width:250px;
			float:left;
			}
			
			/*Get Help Form Styles*/
			p.formDisclaimer{
			text-align:center;
			margin:32px 24px 12px 0;
			font-style:italic;
			}
			div.buttonWrapper{
			margin:28px 0 14px 0;
			clear:both;
			text-align:center;
			}
			.formspacer{
			height:1em;
			clear:both;
			}
			.hideField{
			display:none;
			}
			.pushOpen{
			height:18em;
			}
			/* ----- error message for field validation ----- */
			#stepForm label.warning{
			text-align: left;
			width:auto;
			padding:0;
			margin:0 0 0 10px;
			float: none;
			clear: none;
			display: inline;
			color:#CC3366;
			font-size:10px; 
			border:none;
			border-top:1px dotted #CC3366;
			}
			div.requiredNotice{
			width:140px;
			float:right;
			margin:0 24px 0 0;
			padding:0;
			}
			h3.stepHeader{
			text-align:left;
			font-size:16px;
			font-weight:bold;
			margin:0 0 24px 24px;
			color:#676cac;
			}
			ul#stepForm, ul#stepForm li{
			margin:0;
			padding:0;
			}
			ul#stepForm li{
			list-style:none;
			}
			/* Form Buttons  */
			input.submitbutton, .nextbutton, .prevbutton{
			width:100px;
			height:40px;
			background-color:#663399;
			padding:4px;
			border:1px solid #339933;
			cursor:pointer;
			text-align:center;
			color:#FFFFFF;
			margin:7px;
			}
			input.submitbutton{
			background-color:#006699;
			}
			</style> 
	</head>

<body bgcolor="#AF4555">
	<table align="center" cellspacing="0" cellpadding="0" width="1000px" bgcolor="#FFFFFF">
		<tbody>
		<!-- üst kisim -->
		<tr>
					<jsp:include page="/WEB-INF/jsp/ana_sayfa/header.jsp" />
		</tr>

		<!-- orta kisim -->
		<tr>
			<td>

				<table class="orta_div" align="center">
					<tr>
						<td valign="top">
							<div class="orta_div_sol">
							<!-- kullanıcı giriş bölümü olacak-->
								<div class="kullanici_giris">
									<c:choose>
											<c:when test="${isAuthenticated=='true' }">
												<h3>Merhaba <c:out value="${username}"></c:out></h3>
												<br/>
												<h3><a href="<c:url value="/j_spring_security_logout"/>" value="Logout">logout</a></h3>
											</c:when>
											<c:otherwise>
												<form method="post" action="j_spring_security_check"><br />
												Kullanici adi <br />
												<input type="text" width="10px" name="j_username" /><br />
												Sifre <br />
												<input width="10px" name="j_password" type="password"/><br />
												<input class="dugme_giris" type="submit" width="60px" value=" " />
												<br />
												<a href="<c:url value="/login/requestPassword.htm"/>">Sifremi
												Unuttum</a> <a href="<c:url value="/login/membershipForm.htm"/>">Üye
												Ol</a></form>
											</c:otherwise>
									</c:choose>		 
								</div>
								<div class="sol_menu">
									<img src="<c:url value="/resources/image/ana_sayfa/reklam.jpg"/>"/>
								</div>
							</div>
						</td>
						<td valign="top">
							<c:choose>
								<c:when test="${isAuthenticated=='true'}">

<!-- start -->
				<div class="orta_div_sag">

			<h1>prettyPhoto</h1>
			
			<h2>Gallery</h2>
			<ul class="gallery clearfix">

				<c:forEach var="image" items="${images}" varStatus="rowCounter">
					<li><a href="<c:url value='${image.imagePath}'/>" rel="prettyPhoto[gallery1]"><img src="<c:url value='${image.imagePath}'/>" width="60" height="60"	alt="Red round shape" /></a></li>											
				</c:forEach>
			</ul>

			<!-- 
			<h2>Picture alone</h2>
			<ul class="gallery clearfix">
				<li><a href="images/fullscreen/2.jpg" rel="prettyPhoto" title="&lt;a href=&#x27;http://www.google.ca&#x27; target=&#x27;_blank&#x27; &gt;This will open Google.com in a new window&lt;/a&gt;"><img src="images/thumbnails/t_2.jpg" width="60" height="60" alt="Picture alone 1" /></a></li>
			</ul>
			<div class="fleft">
				<h2>Flash</h2>
				<ul class="gallery clearfix">
					<li><a href="http://www.adobe.com/products/flashplayer/include/marquee/design.swf?width=792&amp;height=294" rel="prettyPhoto[flash]" title="Flash 10 demo"><img src="images/thumbnails/flash-logo.png" width="60" alt="Flash 10 demo" /></a></li>
				</ul>
			</div>
			<div class="fleft">
				<h2>YouTube</h2>
				<ul class="gallery clearfix">
					<li><a href="http://www.youtube.com/watch?v=kh29_SERH0Y?rel=0" rel="prettyPhoto" title="YouTube demo"><img src="images/thumbnails/flash-logo.png" width="60" alt="" /></a></li>
					<li><a href="http://youtu.be/kh29_SERH0Y?rel=0" rel="prettyPhoto" title="YouTube demo"><img src="images/thumbnails/flash-logo.png" width="60" alt="" /></a></li>
				</ul>
			</div>
			<div class="fleft">
				<h2>Vimeo</h2>
				<ul class="gallery clearfix">
					<li><a href="http://vimeo.com/7874398&width=700" rel="prettyPhoto" title="Vimeo video"><img src="images/thumbnails/flash-logo.png" width="60" alt="VIMEO!" /></a></li>
				</ul>
			</div>
			
			<br class="cboth" />
	
			<h2>Movies (.mov)</h2>
			<ul class="gallery clearfix">
				<li><a href="http://trailers.apple.com/movies/disney/tronlegacy/tronlegacy-tsr1_r640s.mov?width=640&height=272" rel="prettyPhoto[movies]" title="Tron!"><img src="images/thumbnails/quicktime-logo.gif" alt="Tron teaser" width="60" /></a></li>
				<li><a href="http://trailers.apple.com/movies/sony_pictures/karatekid/karatekid-tlr3_r640s.mov?width=640&height=304" rel="prettyPhoto[movies]" title="The Karate Kid"><img src="images/thumbnails/quicktime-logo.gif" alt="The Karate Kid" width="60" /></a></li>
				<li><a href="http://trailers.apple.com/movies/paramount/shutterisland/shutterisland-tvspot1_r640s.mov?width=640&height=272" rel="prettyPhoto[movies]" title="Shutter Island"><img src="images/thumbnails/quicktime-logo.gif" alt="Shutter Island" width="60" /></a></li>
			</ul>
	
			<h2>Movies (.mov) alone</h2>
			<ul class="gallery clearfix">
				<li><a href="http://trailers.apple.com/movies/disney/tronlegacy/tronlegacy-tsr1_r640s.mov?width=640&height=272" rel="prettyPhoto" title="Tron!"><img src="images/thumbnails/quicktime-logo.gif" alt="Tron teaser" width="60" /></a></li>
			</ul>
	
			<h2>Unusual sizes</h2>
			<ul class="gallery clearfix">
				<li><a href="images/fullscreen/wide.gif" rel="prettyPhoto[unusual]">Wide image (3000 x 1500)</a></li>
				<li><a href="images/fullscreen/high.gif" rel="prettyPhoto[unusual]">High image (1500 x 3000)</a></li>
				<li><a href="images/fullscreen/huge.gif" rel="prettyPhoto[unusual]">Huge image (3000 x 3000)</a></li>
			</ul>
	
			<h2>Iframe</h2>
			<ul class="gallery clearfix">
				<li><a href="http://www.google.com/search?ie=UTF-8&amp;oe=UTF-8&amp;q=prettyphoto&amp;iframe=true&amp;width=100%&amp;height=100%" rel="prettyPhoto[iframe]">Google.ca</a></li>
				<li><a href="http://www.facebook.com?iframe=true&amp;width=600&amp;height=300" rel="prettyPhoto[iframe]">Facebook</a></li>
				<li><a href="http://nmfe.co?iframe=true&amp;width=300&amp;height=200" rel="prettyPhoto[iframe]">My site</a></li>
			</ul>
	
			<h2>AJAX</h2>
			<ul class="gallery clearfix">
				<li><a href="xhr_response.html?ajax=true&amp;width=400&amp;height=160" rel="prettyPhoto[ajax]">Sample AJAX</a></li>
			</ul>
	
			<h2>Mixed gallery</h2>
			<ul class="gallery clearfix">
				<li><a href="http://www.google.ca?iframe=true&amp;width=1000&amp;height=500" rel="prettyPhoto[mixed]">Google.ca</a></li>
				<li><a href="http://trailers.apple.com/movies/disney/tronlegacy/tronlegacy-tsr1_r640s.mov?width=640&height=272" rel="prettyPhoto[mixed]" title="Tron!"><img src="images/thumbnails/quicktime-logo.gif" alt="Tron teaser" width="60" /></a></li>
				<li><a href="images/fullscreen/5.jpg" rel="prettyPhoto[mixed]"><img src="images/thumbnails/t_5.jpg" width="60" height="60" alt="" /></a></li>
				<li><a href="http://www.adobe.com/products/flashplayer/include/marquee/design.swf?width=792&amp;height=294" rel="prettyPhoto[mixed]" title="Flash 10 demo"><img src="images/thumbnails/flash-logo.png" width="60" alt="Flash 10 demo" /></a></li>
			</ul>
	
			<h2>Inline content</h2>
			<ul class="gallery clearfix">
				<li><a href="#inline_demo" rel="prettyPhoto[inline]">Inline content 1</a></li>
				<li><a href="#inline_demo2" rel="prettyPhoto[inline]">Inline content 2</a></li>
				<li><a href="#inline_demo3" rel="prettyPhoto[inline]">Inline content 3</a></li>
			</ul>
			<div id="inline_demo" style="display:none;">
				<p><a href="http://www.google.ca?iframe=true&amp;width=1000&amp;height=500">Google.ca</a></p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
			<div id="inline_demo2" style="display:none;">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
			<div id="inline_demo3" style="display:none;">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				<p><img src="images/fullscreen/2.jpg" /></p>
			</div>
	
			<h2>Custom content</h2>
			<ul id="custom_content" class="gallery clearfix">
				<li><a href="#?custom=true&width=260&height=270" rel="prettyPhoto">Google Maps</a></li>
				<li><a href="#?custom=true&width=260&height=400" rel="prettyPhoto">Ads</a></li>
			</ul>
			
			<br /><br />
			
			<object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/_HOMoTqEASY&hl=en&fs=1&"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><param name="wmode" value="opaque"></param><embed src="http://www.youtube.com/v/_HOMoTqEASY&hl=en&fs=1&" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="425" height="344" wmode="opaque"></embed></object>
			<iframe title="YouTube video player" width="425" height="344" src="http://www.youtube.com/embed/_HOMoTqEASY" frameborder="0" allowfullscreen></iframe>
			-->
			<script type="text/javascript" charset="utf-8">
			$(document).ready(function(){
				$("area[rel^='prettyPhoto']").prettyPhoto();
				
				$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: true});
				$(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
		
				$("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
					custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
					changepicturecallback: function(){ initialize(); }
				});

				$("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
					custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
					changepicturecallback: function(){ _bsap.exec(); }
				});
			});
			</script>
	
			<!-- Google Maps Code -->
			<script type="text/javascript"
			    src="<c:url value="http://maps.google.com/maps/api/js?sensor=true"/>">
			</script>
			<script type="text/javascript">
			  function initialize() {
			    var latlng = new google.maps.LatLng(-34.397, 150.644);
			    var myOptions = {
			      zoom: 8,
			      center: latlng,
			      mapTypeId: google.maps.MapTypeId.ROADMAP
			    };
			    var map = new google.maps.Map(document.getElementById("map_canvas"),
			        myOptions);
			  }

			</script>
			<!-- END Google Maps Code -->
	
			<!-- BuySellAds.com Ad Code -->
			<style type="text/css" media="screen">
				.bsap a { float: left; }
			</style>
			<script type="text/javascript">
			(function(){
			  var bsa = document.createElement('script');
			     bsa.type = 'text/javascript';
			     bsa.async = true;
			     bsa.src = '//s3.buysellads.com/ac/bsa.js';
			  (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);
			})();
			</script>
			<!-- END BuySellAds.com Ad Code -->
</div>
<!--  end -->


								</c:when>
								<c:otherwise>
									<div class="orta_div_sag">
											Bu icerige erismek icin giris yapmalisiniz.
									</div>
								</c:otherwise>
							</c:choose>		 
						</td>
	
					</tr>
				</table>

			</td>
		</tr>
		<!-- alt kisim -->
		<tr>
					<jsp:include page="/WEB-INF/jsp/ana_sayfa/footer.jsp" />
		</tr>

		</tbody>
	</table>

</body>
</html>