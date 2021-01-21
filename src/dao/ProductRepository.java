//p137부터 참고

package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	//자바빈즈를 이용하는 상품 데이터 접근 클래스
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
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
	
	//상품 목록을 가져오는 메소드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
}
