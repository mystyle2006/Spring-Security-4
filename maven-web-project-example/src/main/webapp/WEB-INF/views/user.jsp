<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring Security 4 - Hello World Example</h2>
	<hr />
	<h3>User dashboard  </h3>
	
	<security:authorize access="isAuthenticated()">
		<b>Welcome! <security:authentication property="principal.username" /></b>
	</security:authorize>
	
	<br />
	
	<security:authorize access="isAuthenticated()">
		<a href="/">Home</a> | <a href="logout">Logout</a>
	</security:authorize>
</body>
</html>