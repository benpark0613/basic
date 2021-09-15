package example_09_15_override;

/**
 * 사진 인쇄 기능을 지원하는 클래스다.
 * @author 박성근
 *
 */
public class PhotoPrinter extends ColorPrinter {
	
	/**
	 * 사진의 너비
	 */
	private int width;
	
	/**
	 * 사진의 높이
	 */
	private int height;
	
	/**
	 * 사진의 너비를 지정된 너비로 설정한다.
	 * @param width 사진의 가로방향 크기
	 */
	public void setWidth(int width) {
		this.width = width;
	}
	
	/**
	 * 사진의 높이를 지정된 높이로 설정한다.
	 * @param height 사진의 세로방향 크기
	 */
	public void setHeight(int height) {
		this.height = height;
	}
	
	/**
	 * 지정된 이미지를 사진으로 출력한다.
	 * @param image 이미지
	 */
	public void printPhoto(String image) {
		System.out.println(width + " x " + height + "크기 [사진 인쇄] " + image);
	}

}
