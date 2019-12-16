<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet"
	href="/bts/resources/library/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="body">
			<tiles:insertAttribute name="body" />
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>