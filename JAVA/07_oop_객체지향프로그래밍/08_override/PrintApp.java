package example_09_15_override;

public class PrintApp {

	public static void main(String[] args) {
		Printer printer = new Printer();
		
		ColorPrinter colorPrinter = new ColorPrinter();
		colorPrinter.setColors(256);
		
		PhotoPrinter photoPrinter = new PhotoPrinter();
		photoPrinter.setColors(256);
		photoPrinter.setWidth(3);
		photoPrinter.setHeight(4);
		
		System.out.println("### Printer객체의 출력기능 사용하기");
		printer.printBlackAndWhite("휴가신청서.hwp");
		
		System.out.println("### ColorPrinter객체의 출력기능 사용하기");
		colorPrinter.printBlackAndWhite("출장신청서.hwp");
		colorPrinter.printColor("프로젝트발표자료.ppt");
		
		System.out.println("### PhotoPrinter 객체의 출력기능 사용하기");
		photoPrinter.printBlackAndWhite("8월영업실적보고서.xlsx");
		photoPrinter.printColor("8월영업실적.ppt");
		photoPrinter.printPhoto("매장사진.png");
	}
}
