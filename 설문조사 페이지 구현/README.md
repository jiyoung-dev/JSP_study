# 설문조사 & 결과 페이지 구현  
설문조사 폼 만들고, 결과값을 jsp로 불러오기 연습!!  
- 설문조사 폼: survey.html  
- 결과값 출력: survey_result.jsp  

## 1. 설문조사 페이지 
![surv3](https://user-images.githubusercontent.com/61649201/104832152-59ecce00-58d2-11eb-8c7a-af6cfd2f61dc.PNG)
![surv1](https://user-images.githubusercontent.com/61649201/104832149-548f8380-58d2-11eb-8587-b649f4db8f73.PNG)
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 페이지</title>
</head>
<body>
<!-- html은 값을 보낼수만 있다. 값을 받을 수가 없다 -->
<!-- 데이터를 받아서 처리하도록 jsp를 사용할것이다 -->
<!-- 전달방식에는 get과 post방식이 있다 -->

<h1>설문 조사</h1>
 아래 항목을 채워주세요.<br><br>
<b> 신상정보 </b><br>

<form action="survey_result.jsp" method=post>
<table>
	<tr>
		<td>이름</td> 
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="tel" name="phone"></td>
	</tr>
	<tr>
		<td>이메일 주소</td>
		<td><input type="email" name="email"></td>
	</tr>
	<tr>
		<td>생일</td>
		<td><input type="date" name="birthday"></td>
	</tr>
</table>
<br>

<b>어떤 경로로 알게 되었습니까?</b><br><br>
<input type="radio" name="contactVia" value="기사">기사
<input type="radio" name="contactVia" value="광고">광고
<input type="radio" name="contactVia" value="기타">기타<br><br>

<b>좋아하는 스포츠는 무엇입니까?</b><br><br>
<input type="checkbox" name="sports" value="야구">야구
<input type="checkbox" name="sports" value="골프">골프
<input type="checkbox" name="sports" value="농구">농구<br>
<input type="checkbox" name="sports" value="스쿼시">스쿼시
<input type="checkbox" name="sports" value="볼링">볼링
<input type="checkbox" name="sports" value="축구">축구<br><br> 

연락방법 
<select name="contact_option">
		<option value="email">email
		<option value="phone" selected>phone
		<option value="sms" selected>sms
	</select><br><br>
	
<input type="checkbox" name="accept" checked> 개인정보 활용에 동의합니다.<br><br>
<button type="submit">Submit</button>
<input type="reset" value="reset">  
<!-- submit과 reset은 내장되어있는 기능이다 -->

</form>
</body>
</html>
```
## 2. 결과 페이지 
![surv2](https://user-images.githubusercontent.com/61649201/104832151-578a7400-58d2-11eb-83d5-e8bb40aabb2e.PNG)
```jsp
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
```  
=> 좋아하는 스포츠는 중복체크가 가능하기 때문에 결과값이 여러개일 수 있다.  
String으로 불러오니까 값이 하나만 출력되어 배열로 구현했다! 메소드는 getParameter대신에 ```getParameterValues```를 써야한다.  
html에서 값을 전달할때 post방식을 사용했는데 전달방식에는 get방식, post방식이 있다.  
GET은 주소줄에 값이 '?' 뒤에 쌍으로 이어붙고 POST 는 숨겨져서(BODY 안에) 보내진다.  
GET은 URL에 이어붙기 때문에 길이 제한이 있어서 많은 양의 데이터는 보내기 어렵고 POST는 많은 양의 보내기에도 적합하다.  
