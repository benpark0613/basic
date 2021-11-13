package example_10_21_store.service;

import java.sql.SQLException;
import java.util.List;

import example_10_21_store.dao.ProductDao;
import example_10_21_store.dao.ProductJDBCDao;
import example_10_21_store.exception.StoreException;
import example_10_21_store.vo.Product;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao = new ProductJDBCDao();

	@Override
	public List<Product> getAllProducts() throws SQLException {
		List<Product> productList = productDao.selectAllProducts();
		return productList;
	}

	@Override
	public Product getProductDetail(int productNo) throws SQLException {
		Product product = productDao.selectProductByNo(productNo);
		if (product == null) {
			// StoreException 예외는 업무로직상의 오류가 있을 때 강제 발생시키는 예외다.
			throw new StoreException("["+productNo+"] 상품번호에 해당하는 상품정보가 존재하지 않습니다.");
		}
		return product;
	}

	@Override
	public void addNewProduct(Product product) throws SQLException {
		// 새로 등록하려면 상품의 상품명과 동일한 상품이 있는지 조회한다.
		Product savedProduct = productDao.getProductByProductName(product.getName());
		
		if (savedProduct != null) {
			// 기존 상품의 재고량과 등록하려는 상품의 재고량의 합계를 계산한다.
			int totalStock = savedProduct.getStock() + product.getStock();
			// 상품정보의 재고량의 변경한다.
			savedProduct.setStock(totalStock);
			// 재고량이 변경된 상품정보를 테이블에 반영시킨다.
			productDao.updateProduct(savedProduct);
		} else {
			productDao.insertProduct(product);
		}
	}

	@Override
	public void updateProductPrice(int productNo, int price, int discountPrice) throws SQLException {
		if (discountPrice > price) {
			throw new StoreException("할인가격이 정상가격보다 크게 지정되었습니다.");
		}
		
		// 상품번호에 해당하는 상품정보를 조회한다.
		Product product = this.getProductDetail(productNo);
		// 변경할 항목의 멤버변수값을 변경한다.
		product.setPrice(price);
		product.setDiscountPrice(discountPrice);
		// 변경된 정보가 반영된 Product객체를 전달해서 테이블에 반영되게 한다.
		productDao.updateProduct(product);		
	}

	@Override
	public void removeProduct(int productNo) throws SQLException {
		Product product = productDao.selectProductByNo(productNo);
		if (product == null) {
			throw new StoreException("["+productNo+"] 상품번호에 해당하는 상품정보가 존재하지 않아서, 삭제가 완료되지 않았습니다.");
		}
		productDao.deleteProduct(productNo);
	}

	@Override
	public List<Product> searchProductsByCategory(String category) throws SQLException {
		List<Product> products = productDao.getProductsByCategory(category);
		return products;
	}

	@Override
	public List<Product> searchProductsByName(String keyword) throws SQLException {
		List<Product> products = productDao.getProductsByName(keyword);
		return products;
	}

	@Override
	public List<Product> searchProductsByPrice(int minPrice, int maxPrice) throws SQLException {
		List<Product> products = productDao.getProductsByPrice(minPrice, maxPrice);
		return products;
	}

	@Override
	public List<Product> searchLowerStockProducts(int minStock) throws SQLException {
		List<Product> products = productDao.getProductsByStock(minStock);
		return products;
	}

}
