<!-- 신규 상품 등록 처리 페이지 p206 -->

<!-- 파일 업로드용 라이브러리 추가 -->
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!--
dao : Data Access Object의 줄임말로서, 데이터를 조작하기 위한 기능을
전담하기 위해 만들어진 오브젝트
dto : Data Transfer Object의 줄임말로서 계층간의 데이터를 교환하기 위한 오브젝트
DB와 자바의 데이터타입은 실제로는 같지 않음
자바에서 DB의 데이터를 사용하기 위해 데이터 변환을 해주는 클래스의 객체
-->


<%
request.setCharacterEncoding("UTF-8");

//7장에서 추가
String filename = "";
String realFolder = "C:\\java102\\workspace-sts4\\WebMarket\\WebContent\\resource\\images"; //웹애플리케이션 상의 절대경로
int maxSize = 5*1024*1024; //최대 업로드될 파일의 크기 5MB
String encType = "utf-8";//인코딩 유형

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

/*
MultipartRequest를 사용하여
넘겨받은 데이터를 하나씩 꺼냄
*/
String productId = multi.getParameter("productId");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
String unitsInstock = multi.getParameter("unitsInstock");
String condition = multi.getParameter("condition");

/*
request내장객체를 사용하여
넘겨받은 데이터를 하나씩 꺼냄
*/
/* String productId = request.getParameter("productId");
String name = request.getParameter("name");
String unitPrice = request.getParameter("unitPrice");
String description = request.getParameter("description");
String manufacturer = request.getParameter("manufacturer");
String category = request.getParameter("category");
String unitsInstock = request.getParameter("unitsInstock");
String condition = request.getParameter("condition"); */

/*
넘겨받은 unitPrice가 문자열로 되어있으며,
Product.java의 unitPrice는 정수타입이므로 
데이터 타입을 변경해야함
*/
Integer price;

if(unitPrice.isEmpty()){
	price = 0;
}
else{
	price = Integer.valueOf(unitPrice);
}

//unitsInstock도 마찬가지

long stock;

if(unitsInstock.isEmpty()){
	stock = 0;
}
else{
	stock = Long.valueOf(unitsInstock);
}

//MultipartRequest에 저장된 첨부 파일에 대한 정보 읽어옴
Enumeration files = multi.getFileNames();
String fname = (String)files.nextElement();
String fileName = multi.getFilesystemName(fname);

/*
ProductRepository 클래스 타입의 변수 dao에 싱글톤 방식으로
ProductRepository 클래스 내부에서 생성된 객체를 대입
*/
ProductRepository dao = ProductRepository.getInstance();

/* Product 클래스 타입의 객체 newProduct 생성 */
Product newProduct = new Product();

newProduct.setProductId(productId);
newProduct.setPname(name);
newProduct.setUnitPrice(price);
newProduct.setDescription(description);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInstock(stock);
newProduct.setCondition(condition);

newProduct.setFilename(fileName);

/*
Product 클래스 타입의 데이터를 
dao 객체를 통해서 상품 목록에 저장
*/
dao.addProduct(newProduct);

response.sendRedirect("products.jsp");

%>