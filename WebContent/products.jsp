<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아래 세줄이 꼭 들어가야함 -->    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<!-- 기존 자바빈즈 사용부분을 디렉티브 태그 사용 방식으로 변경. -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
	ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
			for(int i=0; i<listOfProducts.size(); i++){
				//listOfProduct의 i번쨰 데이터를 가져와서 Product 타입의 변수 product에 저장후 출력
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><%=product.getUnitPrice() %>원</p>
				<!-- product.jsp파일로 화면이 이동하며, id에 상품아이디가 담겨간다. -->
				<p> <a href="./product.jsp?id=<%=product.getProductId() %>"
				class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>