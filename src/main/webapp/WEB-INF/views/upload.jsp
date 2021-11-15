<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File</title>
<link href="${pageContext.request.contextPath}/styles/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrapper">
		<h2>Upload File Spring MVC</h2>
		<form method="post" enctype="multipart/form-data">
			<input type="file" name="picture" multiple />
			<input type="submit" value="Upload" />
		</form>
		<br />
		<c:if test="${not empty listFileName}">
			<c:forEach items="${listFileName}" var="fileName">
				<img width="300px" alt="" src="${pageContext.request.contextPath}/resources/uploads/${fileName}">
			</c:forEach>
		</c:if>
	</div>
</body>
</html>