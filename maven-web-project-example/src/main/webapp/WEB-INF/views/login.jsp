<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:url var="loginUrl" value="/login" />
<form action="${loginUrl}" method="POST">
	<c:if test="${param.error != null}">
		<p>Invalid username and password.</p>
	</c:if>
	<c:if test="${param.logout != null}">
		<p>You have been logged out successfully.</p>
	</c:if>
	ID : <input type="text" name="id" />
	PW : <input type="password" name="pw" />
	<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
	<input type="submit" value="Submit" />
</form>
</body>
</html>