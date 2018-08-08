<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Upload an image</title>
	<link rel="stylesheet" type="text/css" href="uploadForm.css" />
	<link rel="stylesheet" type="text/css" href="mainStyle.css" />
</head>

<body>
	<a id="displayButton" href="display.jsp">View all images</a>
	<h1>Upload an Image</h1>
	<p>not too big please.</p>
	
	<form method = "post" action = "UploadServlet" enctype = "multipart/form-data">
		</br>
		<input id = "userName" type = "text" name = "userName" placeholder = "Enter your Username" >
		</br>
		<input id = "imageName" type = "text" name = "imageName" placeholder = "Title your image here">
		</br>
		<input id = "file" type = "file" name = "image" placeholder = "TESTING">
		</br>
		<input id = "submit" type = "submit" value = "Upload image">
	</form>
</body>
</html>