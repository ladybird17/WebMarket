<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아래 세줄이 꼭 들어가야함 -->    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean>
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
	ArrayList<Product> listOfProducts = productDAO.getAllProducts();
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