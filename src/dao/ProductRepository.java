//p137부터 참고

package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	//자바빈즈를 이용하는 상품 데이터 접근 클래스
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	/* 싱글톤 패턴 사용함
	싱글톤 : 프로그램상에서 단 하나의 객체만 생성 후
			모두 공유하여 사용하는 방식
	싱글톤 사용법 : private 접근제한자를 사용하여 
			외부에서는 해당 클래스의 객체를 생성못하도록 
			하고, 내부에서 해당 클래스의 객체를 생성하고 
			static으로 정적 멤버로 선언한 후
			getter를 통해서 내부에서 선언된 객체만 공유하여
			사용하는 방법 */
	private static ProductRepository instance = new ProductRepository();
	
	/*
	싱글톤 방식으로 생성된 ProductRepository의
	객체 instance를 공유. static으로 해줘야함 */
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234","iPhone 6s",800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInstock(1000);
		phone.setCondition("New");
		
		Product notebook = new Product("P1235","LG PC 그램",1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInstock(1000);
		notebook.setCondition("Refurbished");

		Product tablet = new Product("P1236","Galaxy Tab S",900000);
		tablet.setDescription("212.8*125.6*6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInstock(1000);
		tablet.setCondition("Old");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//DB에 저장된 모든데이터. 상품 목록을 가져오는 메소드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//0122
	//DB에 저장된 데이터 중 productId가 같은 데이터를 가져오기
	//반환 타입을 Product클래스 타입으로 설정
	public Product getProductById(String productId) {
		Product productById = null; //Product클래스 타입의 변수를 미리 선언. 빈 변수
		
		//DB의 크기만큼 for문을 사용하여 DB 전체의 데이터 중 상품id와 동일한 정보를 찾음
		for (int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			//product객체가 null이 아니고, product 객체가 가진 상품 id가 null이 아니고
			//product객체가 가지고 있는 상품id와 매개변수로 받아온 상품id가 모두 동일한지 비교
			if(product!=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
				
				//product객체를 for문외부의  Product클래스타입객체에 대입
				productById = product;
				
				break; //for문 빠져나감
			}
		}
		return productById;
	}
	
	/*
	listOfProduct라는 ArrayList에(상품목록에) 
	데이터(상품)을 추가한다.
	*/
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
