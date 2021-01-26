package dto;

import java.io.Serializable;


/*
 * 자바 빈즈 생성 규칙
 * 1. Serializable 인터페이스 상속 구현
 * 2. 멤버변수의 접근제한자를 private으로 사용
 * 3. 멤버변수에 모두 getter/setter 적용
 * 4. 기본 생성자가 반드시 존재
 */

//데이터베이스에서 데이터를 저장하거나 가져올때 사용하는 데이터 타입을 클래스를 통해 규격화!!
public class Product implements Serializable {
	private final static long serialVersionUID = -4274700572038677000L;
	
	private String productId;	//상품아이디
	private String pname;		//상품명
	private Integer unitPrice;	//상품 가격
	private String description;	//상품 설명
	private String manufacturer;//제조사
	private String category;	//분류
	private long unitsInstock;	//재고 수
	private String condition;	//상품 상태
	private String filename;	//파일 이름(7장에서 새로추가함)
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Product() {
		super();
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInstock() {
		return unitsInstock;
	}

	public void setUnitsInstock(long unitsInstock) {
		this.unitsInstock = unitsInstock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
}
