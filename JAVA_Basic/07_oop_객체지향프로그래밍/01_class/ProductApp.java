package example_09_06_class;

public class ProductApp {

	public static void main(String[] args) {
		// 상품정보를 여러 개 관리하기 위한 배열 생성하기
		Product[] products = new Product[3];
		
		Product item1 = new Product();
		item1.num = 1;
		item1.productName = "신라면";
		item1.maker = "농심";
		item1.price = 2000;
		item1.discountPrice = 1500;
		item1.stock = 100;
		
		Product item2 = new Product();
		item2.num = 2;
		item2.productName = "진라면";
		item2.maker = "오뚜기";
		item2.price = 1500;
		item2.discountPrice = 1000;
		item2.stock = 110;
		
		Product item3 = new Product();
		item3.num = 3;
		item3.productName = "삼양라면";
		item3.maker = "삼양";
		item3.price = 1800;
		item3.discountPrice = 1200;
		item3.stock = 90;
		
		// 배열에 상품정보 저장하기
		products[0] = item1;		
		products[1] = item2;
		products[2] = item3;
		
		// 모든 상품정보를 화면에 출력하기
		System.out.println("배열에 저장된 모든 상품정보를 출력");
		for (Product product : products) {
			System.out.print(product.num + "\t");
			System.out.print(product.productName + "\t");
			System.out.print(product.maker + "\t");
			System.out.print(product.price + "\t");
			System.out.print(product.discountPrice + "\t");
			System.out.println(product.stock);
		}
		
		System.out.println("배열에 저장된 모든 상품정보의 재고현황을 출력");
		for (Product product : products) {
			System.out.print(product.num + "\t");
			System.out.print(product.productName + "\t");
			System.out.print(product.price + "\t");
			System.out.print(product.stock + "\t");
			System.out.println(product.price*product.stock);
		}
		
		System.out.println("배열에 저장된 모든 상품정보의 총 상품수량, 총 상품재고 가격을 출력");
		int totalStock = 0;
		int totalStockPrice = 0;
		for (Product product : products) {
			totalStock += product.stock;
			totalStockPrice += (product.price*product.stock);			
		}
		System.out.println("총 상품수량: " + totalStock);
		System.out.println("총 재고가격: " + totalStockPrice);
		
	}

}
