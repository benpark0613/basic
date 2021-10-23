package example_10_21_store.app;

import static utils.KeyboardUtil.*;		// static import. 지정된 클래스의 모든 static 메소드를 import시킨다.

import java.sql.SQLException;
import java.util.List;

import example_10_21_store.exception.StoreException;
import example_10_21_store.service.ProductService;
import example_10_21_store.service.ProductServiceImpl;
import example_10_21_store.vo.Product;

public class StoreApp {
	
	// 상품관리 업무로직이 구현된 ProductService의 구현객체(ProductServiceImpl객체)를 생성한다.
	private ProductService service = new ProductServiceImpl();

	public void displayMenu() {
		try {
			System.out.println("### 상품 관리 프로그램 ###");
			System.out.println("==================================================================================");
			System.out.println("1.전체조회  2.상세정보  3.검색  4.신규등록  5.수정  6.삭제  0.종료");
			System.out.println("==================================================================================");
			
			System.out.print("메뉴 선택: ");
			int menuNo = readInt();
			
			if (menuNo == 1) {
				전체조회();
			} else if (menuNo == 2) {
				상세정보조회();
			} else if (menuNo == 3) {
				검색();
			} else if (menuNo == 4) {
				신규등록();
			} else if (menuNo == 5) {
				정보수정();
			} else if (menuNo == 6) {
				삭제();
			} else if (menuNo == 0) {
				종료();
			}
		} catch (SQLException e) {
			System.out.println("### [데이터베이스 오류 발생] " + e.getMessage());
			e.printStackTrace();
		} catch (StoreException e) {
			System.out.println("### [업무로직 오류 발생] " + e.getMessage());
		}
		System.out.println();
		
		displayMenu();		
	}
	
	private void 전체조회() throws SQLException {
		System.out.println("[상품 정보 전체 조회]");
		System.out.println("### 전체 상품목록을 표시합니다.");
		
		// 업무로직이 구현된 ProductService 구현객체의 getAllProducts() 실행시켜서 상품정보(Product객체)가 여러개 저장된 List<Product>를 획득한다.
		List<Product> productList = service.getAllProducts();
		
		// List객체가 비어있는지 확인해서 상품리스트를 표시하거나 안내 메세지를 표시한다.
		if (!productList.isEmpty()) {
			System.out.println("### 상품 리스트");
			System.out.println("----------------------------------------------------------------------------------");
			System.out.println("번호\t가격\t할인가격\t상품명");
			System.out.println("----------------------------------------------------------------------------------");
			for (Product product : productList) {
				System.out.print(product.getNo() + "\t");
				System.out.print(product.getPrice() + "\t");
				System.out.print(product.getDiscountPrice() + "\t");
				System.out.println(product.getName());
			}
			System.out.println("----------------------------------------------------------------------------------");
		} else {
			System.out.println("### [안내] 등록된 상품정보가 존재하지 않습니다.");
		}
	}
	
	private void 상세정보조회() throws SQLException {
		System.out.println("[상품 상세 정보]");
		System.out.println("### 입력한 상품번호에 해당하는 상품의 상세정보를 표시합니다.");
		
		System.out.print("상품번호 입력: ");
		int productNo = readInt();
		
		Product product = service.getProductDetail(productNo);
		System.out.println("----------------------------------------------------------------------------------");
		System.out.println("상품번호: " + product.getNo());
		System.out.println("카테고리: " + product.getCategory());
		System.out.println("상품이름: " + product.getName());
		System.out.println("제조회사: " + product.getMaker());
		System.out.println("정상가격: " + product.getPrice());
		System.out.println("할인가격: " + product.getDiscountPrice());
		System.out.println("상품재고: " + product.getStock());
		System.out.println("판매상태: " + product.getOnSale());
		System.out.println("등록일자: " + product.getCreatedDate());
		System.out.println("----------------------------------------------------------------------------------");
	}
	
	private void 검색() throws SQLException {
		while (true) {
			System.out.println("[상품 정보 검색]");
			System.out.println("----------------------------------------------------------------------------------");
			System.out.println("1.카테고리  2.상품명  3.가격  4.재고량  0.종료");
			System.out.println("----------------------------------------------------------------------------------");
			
			System.out.print("검색 메뉴 선택: ");
			int menuNo = readInt();
			
			if (menuNo == 1) {
				System.out.println("### 상품 카테고리별 검색");
				System.out.print("상품 카테고리 입력: ");
				String category = readString();				
				
				this.printProductList(service.searchProductsByCategory(category));
				
			} else if (menuNo == 2) {
				System.out.println("### 상품명 검색");
				System.out.print("검색 키워드 입력: ");
				String keyword = readString();
				
				this.printProductList(service.searchProductsByName(keyword));
				
			} else if (menuNo == 3) {
				System.out.println("### 가격별 검색");
				System.out.print("최소가격 입력: ");
				int minPrice = readInt();
				System.out.print("최대가격 입력: ");
				int maxPrice = readInt();				
				
				this.printProductList(service.searchProductsByPrice(minPrice, maxPrice));
				
			} else if (menuNo == 4) {
				System.out.println("### 재고량 기준 검색");
				System.out.print("기준 재고량 입력: ");
				int stock = readInt();
				
				this.printProductList(service.searchLowerStockProducts(stock));
				
			} else if (menuNo == 0) {
				break;
			}
		}
	}
	
	private void printProductList(List<Product> productList) {
		if (productList.isEmpty()) {
			System.out.println("### [안내] 검색결과가 존재하지 않습니다.");
			return;
		}
		
		System.out.println("### 검색 상품 리스트 ###");
		System.out.println("----------------------------------------------------------------------------------");
		System.out.println("번호\t가격\t할인가격\t재고량\t상품명");
		System.out.println("----------------------------------------------------------------------------------");
		for (Product product : productList) {
			System.out.print(product.getNo() + "\t");
			System.out.print(product.getPrice() + "\t");
			System.out.print(product.getDiscountPrice() + "\t");
			System.out.print(product.getStock() + "\t");
			System.out.println(product.getName());
		}
		System.out.println("----------------------------------------------------------------------------------");
		System.out.println();
	}
	
	private void 신규등록() throws SQLException {
		System.out.println("[신규 상품 등록]");
		System.out.println("### 입력한 상품정보를 등록합니다.");
		System.out.println("### 카테고리, 상품명, 제조회사, 가격, 할인가격, 입고수량을 입력주세요.");
		
		System.out.print("상품 카테고리 입력: ");
		String category = readString();
		
		System.out.print("상품    이름 입력: ");
		String name = readString();
		
		System.out.print("상품 제조회사 입력: ");
		String maker = readString();
		
		System.out.print("상품 정상가격 입력: ");
		int price = readInt();
		
		System.out.print("상품 할인가격 입력: ");
		int discountPrice = readInt();
		
		System.out.print("상품 입고수량 입력: ");
		int amount = readInt();
		
		Product product = new Product();
		product.setCategory(category);
		product.setName(name);
		product.setMaker(maker);
		product.setPrice(price);
		product.setDiscountPrice(discountPrice);
		product.setStock(amount);
		
		service.addNewProduct(product);
		System.out.println("### [안내] 상품등록이 완료되었습니다.");
	}
	
	private void 정보수정() throws SQLException {
		System.out.println("[상품 정보 수정]");
		System.out.println("### 입력한 정보로 상품정보를 수정합니다.");
		System.out.println("### 수정할 상품의 상품번호, 가격, 할인가격을 입력하세요");
		
		System.out.print("상품번호 입력: ");
		int no = readInt();
		System.out.print("상품가격 입력: ");
		int price = readInt();
		System.out.print("할인가격 입력: ");
		int discountPrice = readInt();
		
		service.updateProductPrice(no, price, discountPrice);
		System.out.println("### [안내] 상품 정보 수정이 완료되었습니다.");
		
	}
	
	private void 삭제() throws SQLException {
		System.out.println("[상품 정보 삭제]");
		System.out.println("### 입력한 상품번호에 해당하는 상품정보를 삭제합니다.");
		
		System.out.print("상품번호 입력: ");
		int productNo = readInt();
		
		service.removeProduct(productNo);
		System.out.println("### [안내] 상품 정보가 삭제되었습니다.");
	}
	
	private void 종료() throws SQLException {
		System.out.println("[프로그램 종료]");
		System.out.println("### 프로그램을 종료합니다.");
		
		close();			// KeyboardUtil의 close() 메소드 실행 : 입출력관련 리소스 닫기
		System.exit(0);		// System.exit(정수) : 프로그램을 종료 시킨다. 정수값이 음수면 오류로 인한 종료다.
	}
	
	public static void main(String[] args) {
		new StoreApp().displayMenu();
	}
}
