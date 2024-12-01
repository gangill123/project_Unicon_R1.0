<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 로그아웃 페이지</h1>
	
	<form action="/customLogout" method="post">
	 <!-- CSRF 토근값 생성, 시큐리티 POST 방식 호출시 반드시 필요함 -->
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.tpken}">
	 <input type="submit" value="로그아웃">
	</form>

</body>
</html>