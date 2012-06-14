<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Spacegallery</title>
    <link rel="stylesheet" media="screen" type="text/css" href="<c:url value="/resources/image_viewer/layout.css"/>" />
    <link rel="stylesheet" media="screen" type="text/css" href="<c:url value="/resources/image_viewer/spacegallery.css"/>" />
    <link rel="stylesheet" media="screen" type="text/css" href="<c:url value="/resources/image_viewer/custom.css" />"/>
    <script type="text/javascript" src="<c:url value="/resources/image_viewer/jquery.js"/>"/></script>
    <script type="text/javascript" src="<c:url value="/resources/image_viewer/eye.js"/>"/></script>
    <script type="text/javascript" src="<c:url value="/resources/image_viewer/utils.js"/>"/></script>
    <script type="text/javascript" src="<c:url value="/resources/image_viewer/spacegallery.js"/>"/>
    <script type="text/javascript" src="<c:url value="/resources/image_viewer/js/layout.js"/>"></script>
</head>
<body>
    <div class="wrapper">
        <h1>Spacegallery</h1>
        <ul class="navigationTabs">
            <li><a href="#about" rel="about">About</a></li>
            <li><a href="#download" rel="download">Download</a></li>
            <li><a href="#implement" rel="implement">Implement</a></li>
        </ul>
        <div class="tabsContent">
            <div class="tab">
                <h2>About</h2>
				<p>Again another image gallery. Click on the images bellow to see it in action.</p>
				<div id="myGallery" class="spacegallery">
					<img src="<c:url value="/resources/image_viewer/bw3.jpg"/>" alt="" />
					<img src="<c:url value="/resources/image_viewer/lights3.jpg"/>" alt=""  />
					<img src="<c:url value="/resources/image_viewer/bw2.jpg"/>" alt="" />
					<img src="<c:url value="/resources/image_viewer/lights2.jpg"/>" alt="" />
					<img src="<c:url value="/resources/image_viewer/bw1.jpg"/>" alt="" />
					<img src="<c:url value="/resources/image_viewer/lights1.jpg"/>" alt="" />
				</div>
            </div>
            <div class="tab">
                <h2>Download</h2>
                <p><a href="spacegallery.zip">spacegallery.zip (205 kb)</a>: jQuery, Javscript files, CSS files, images, examples and instructions.</p>
                <h3>Changelog</h3>
                <dl>
					<dt>09.01.2008</dt>
					<dd>The first release release.</dd>
                </dl>
            </div>
            <div class="tab">
                <h2>Implement</h2>
                <p>Attach the Javascript and CSS files to your document. Edit CSS file and fix the paths to  images and change colors to fit your site theme. <strong>Important:</strong> be sure to include Javascript files in the specific order as in the example below.</p>
                <h3>Invocation code</h3>
                <p>Prepare a block level element with some images inside. All you have to do is to select the elements in a jQuery way and call the plugin.</p>
                <pre>$('#myGallery').spacegallery({loadingClass: 'loading'});
                </pre>
                <h3>Options</h3>
                <p>A hash of parameters. All parameters are optional.</p>
                <table>
                	<tr>
                		<td><strong>border</strong></td>
                		<td>integer</td>
                		<td>Images' border. Default: 0</td>
                	</tr>
                	<tr>
                		<td><strong>duration</strong></td>
                		<td>integer</td>
                		<td>Animation duration. Default 800</td>
                	</tr>
                	<tr>
                		<td><strong>perspective</strong></td>
                		<td>integer</td>
                		<td>Perpective height. Default: 140</td>
                	</tr>
                	<tr>
                		<td><strong>minScale</strong></td>
                		<td>float</td>
                		<td>Minimum scale for the image in the back. Default: 0.2</td>
                	</tr>
                	<tr>
                		<td><strong>loadingClass</strong></td>
                		<td>string</td>
                		<td>CSS class applied to the element while looading images. Default: null</td>
                	</tr>
                	<tr>
                		<td><strong>before</strong></td>
                		<td>function</td>
                		<td>Callback function triggered before going to the next image</td>
                	</tr>
                	<tr>
                		<td><strong>after</strong></td>
                		<td>function</td>
                		<td>Callback function triggered after going to the next image</td>
                	</tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>