package example_09_23_Interface;

public class ReporterApp {
	
	public static void main(String[] args) {
		String title = "회원목록";
		String[] columns = {"순번", "이름", "연락처"};
		String[] data = {"100", "홍길동", "010-1111-1111"};
		
		ExcelReporter excel = new ExcelReporter(title, columns, data);
		excel.printReport();
		
		System.out.println();
		
		title = "매출현황";
		columns = new String[]{"부서명", "총매출액", "영업이익"};
		data = new String[] {"영업1팀", "100억원", "15억원"};
		excel = new ExcelReporter(title, columns, data);
		excel.printReport();
	}

}
