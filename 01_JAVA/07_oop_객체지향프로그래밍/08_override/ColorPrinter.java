package example_09_15_override;

/**
 * 문서를 컬러로 인쇄하는 기능이 구현된 클래스다.
 * @author 박성근
 *
 */
public class ColorPrinter extends Printer {

	/**
	 * 지원되는 색상수
	 */
	private int colors;
	
	/**
	 * 지정된 색상 수를 설정한다.
	 * @param colors
	 */
	public void setColors(int colors) {
		this.colors = colors;
	}
	
	/**
	 * 지정된 문서를 컬러로 인쇄한다.
	 * @param document 출력할 문서
	 */
	public void printColor(String document) {
		System.out.println("["+colors+"색][컬러인쇄] " + document);
	}
	
}
