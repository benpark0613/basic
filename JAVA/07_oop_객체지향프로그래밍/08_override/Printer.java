package example_09_15_override;

/**
 * 문서를 흑백으로 출력하는 기능이 구현된 클래스
 * @author 박성근
 *
 */
public class Printer {
	
	/**
	 * 저장된 문서를 흑백으로 출력한다.
	 * @param document 출력할 문서
	 */
	public void printBlackAndWhite(String document) {
		System.out.println("[흑백인쇄] " + document);
	}

}
