<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload an image</title>
</head>
<body>
<form method = "post" action = "UploadServlet" enctype = "multipart/form-data">
<br/>Enter your username:<br/>
<input type = "text" name = "userName" >
<br/>Choose the image you wish to upload:<br/>
<input type = "file" name = "image">
<br/>Name the image:<br/>
<input type = "text" name = "imageName">
<input type = "submit" value = "upload image">

</form>
</body>
</html>