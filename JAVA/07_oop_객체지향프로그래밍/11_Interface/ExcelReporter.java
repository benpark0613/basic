package example_09_23_Interface;

public class ExcelReporter implements Reporter {

	private String title;
	private String[] columns;
	private String[] data;
	
	public ExcelReporter(String title, String[] columns, String[] data) {
		this.title = title;
		this.columns = columns;
		this.data = data;
	}
	
	@Override
	public void printReport() {
		// 제목 표시
		System.out.println("[ " + title + " ]");
		
		// 컬럼명 표시
		for (String column : columns) {
			System.out.print(column + "\t");
		}
		System.out.println();
		
		// 데이터 표시
		for (String value : data) {
			System.out.print(value + "\t");
		}
		System.out.println();
	}
}
