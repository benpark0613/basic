package example_10_21_store.dao;

import java.sql.SQLException;
import java.util.List;

import example_10_21_store.vo.Product;

/**
 * TB_SAMPLE_PRODUCTS 테이블에 대한 CRUD 작업이 정의된 인터페이스다.
 * @author lee_e
 *
 */
public interface ProductDao {

	/**
	 * TB_SAMPLE_PRODUCTS 테이블의 모든 상품정보를 조회해서 반환한다.
	 * @return 모든 상품정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	List<Product> selectAllProducts() throws SQLException;
	
	/**
	 * 지정된 상품정보를 TB_SAMPLE_PRODUCTS 테이블에 추가한다.
	 * @param product 새 상품정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	void insertProduct(Product product) throws SQLException;
	
	/**
	 * 지정된 번호에 해당하는 상품정보를 TB_SAMPLE_PRODUCTS 테이블에 조회해서 반환한다.
	 * @param productNo 조회할 상품의 상품번호
	 * @return 상품정보, 틀린 상품번호일 경우 null이 반환된다.
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	Product selectProductByNo(int productNo) throws SQLException;
	
	/**
	 * 지정된 상품정보로 TB_SAMPLE_PRODUCTS 테이블에서 해당 정보를 수정한다.
	 * @param product 수정할 상품정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	void updateProduct(Product product) throws SQLException;
	
	/**
	 * 지정된 상품번호에 해당하는 상품정보를 TB_SAMPLE_PRODUCTS 테이블에서 삭제한다.
	 * @param productNo 삭제할 상품번호
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	void deleteProduct(int productNo) throws SQLException;
	
	/**
	 * 지정된 상품이름에 해당하는 상품정보를 TB_SAMPLE_PRODUCTS 테이블에서 조회한다.
	 * @param productName 상품이름
	 * @return 상품정보
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	Product getProductByProductName(String productName) throws SQLException;
	
	/**
	 * 지정된 키워드가 상품이름에 포함된 모든 상품정보를 TB_SAMPLE_PRODUCTS 테이블에서 조회해서 반환한다.
	 * @param keyword 검색어
	 * @return 상품정보 목록
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	List<Product> getProductsByName(String keyword) throws SQLException;
	
	/**
	 * 지정된 카테고리에 속하는 모든 상품정보를 TB_SAMPLE_PRODUCTS 테이블에서 조회해서 반환한다.
	 * @param category 카테고리
	 * @return 상품정보 목록
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	List<Product> getProductsByCategory(String category) throws SQLException;
	
	/**
	 * 지정된 가격범위에 속하는 모든 상품정보를 TB_SAMPLE_PRODUCTS 테이블에서 조회해서 반환한다.
	 * @param minPrice 최소가격
	 * @param maxPrice 최대가격
	 * @return 상품정보 목록
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	List<Product> getProductsByPrice(int minPrice, int maxPrice) throws SQLException;
	
	/**
	 * 지정된 재고량보다 적게 남아있는 모든 상품정보를  TB_SAMPLE_PRODUCTS 테이블에서 조회해서 반환한다.
	 * @param stock 최소 재고량
	 * @return 상품정보 목록
	 * @throws SQLException DB Access 오류시 예외가 발생한다.
	 */
	List<Product> getProductsByStock(int stock) throws SQLException;
}










