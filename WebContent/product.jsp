<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!-- 기존 자바빈즈 사용부분을 디렉티브 태그 사용 방식으로 변경. -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품정보</h1>
		</div>
	</div>
	<%
	/*
	products.jsp에서 get방식으로
	request내장 객체에 데이터를 저장하여 전송
	*/
	String id = request.getParameter("id");
	
	/*
	ProductRepository 클래스타입의 변수 dao에
	ProductRepositofy 클래스 내부에서 생성된 객체를 대입
	*/
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	
	
	/* 
	매개변수로 입력한 상품id와 
	동일한 정보가 있을 경우반환함
	
	Product product = productDAO.getProductById(id); */
	%>
	<div class = "container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resource/images/<%= product.getFilename() %>" style="width:100%">
			</div>
			<div class="col-md-6">
				<h3><%= product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p> <b>상품코드 : </b><span class="badge badge-danger"><%=product.getProductId() %></span>
				<p> <b>제조사 : </b><%=product.getManufacturer() %>
				<p> <b>분류 : </b><%=product.getCategory() %>
				<p> <b>재고 수 : </b><%=product.getUnitsInstock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><a href="#" class="btn btn-info">상품주문 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary">상품 목록</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>