<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey Result</title>
</head>
<body>
<% // java영역구현 
	request.setCharacterEncoding("UTF-8");
	//getParameter 속성값으로 html에서 name속성값을 불러온다
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String date = request.getParameter("birthday");
	String how = request.getParameter("contactVia");
	String contact = request.getParameter("contact_option");
%> 
<h2>설문조사 결과 페이지 입니다</h2>
<% // 넘어온 값 출력하기 
	out.print("이름: " + name);
	out.print("<br/>전화번호: " + phone);
	out.print("<br/>이메일: " + email);
	out.print("<br/>생일: " + date);
	out.print("<br/>알게된 경로: " + how );
	String[] sports = request.getParameterValues("sports");
	out.print("<br/>좋아하는 스포츠: ");
	for(int i=0; i<sports.length; i++){
		out.print(" " + sports[i]);
	}
	out.print("<br/>연락방법: " + contact);
	
%>

</body>
</html>