<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File</title>
</head>
<body>
	<h2>Upload File Spring MVC</h2>
	<form action="${upload}" method="post" enctype="multipart/form-data">
		<input type="file" name="picture" multiple />
		<input type="submit" value="Upload" />
	</form>
	<br />
	<c:if test="${not empty listFileName}">
		<c:forEach items="${listFileName}" var="fileName">
			<c:url value="/resources/uploads/${fileName}" var="image"></c:url>
			<img width="300px" alt="" src="${image}">
		</c:forEach>
	</c:if>
</body>
</html>