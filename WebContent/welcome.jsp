<!-- p104 7번문제 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Date" %> --%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Welcome</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<%@ include file="menu.jsp" %>
	<%!
	String greeting = "도서 웹 쇼핑몰";
	String tagline = "Welcome to Web Market!";
	%>
	
	
<!-- 	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">Home</a>
			</div>
		</div>
	</nav> -->
	<div class="jumbotron">
		<div class="container">
			<h1><%=greeting %></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			<%
			/* Date day = new Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds(); */
			
			//Date 클래스 대신 Calendar클래스 사용
			Calendar time = Calendar.getInstance();
			int hour = time.get(Calendar.HOUR_OF_DAY);
			int minute = time.get(Calendar.MINUTE);
			int second = time.get(Calendar.SECOND);
			String am_pm;
			
			if(hour/12==0){
				am_pm = "AM";
			}
			else{
				am_pm = "PM";
				hour = hour-12;
			}
			
			String CT = hour+":"+minute+":"+second+" "+am_pm;
			out.println("현재 접속 시각 : "+CT+"\n");
			%>
		</div>
		
	</div>
	<!-- <footer class="container">
		<p>&copy; WebMarket</p>
	</footer> -->
	
	<%@ include file="footer.jsp" %>
</body>
</html>