package example_09_27_interface;

public class 차App {

	public static void main(String[] args) {
		
		중형차[] 중형차들 = new 중형차[3];
		중형차들[0] = new 쏘나타();
		중형차들[1] = new 그랜져();
		중형차들[2] = new 쏘나타();
		//중형차들[2] = new 마티즈();	// 오류 type mismatch 오류
		//중형차들[2] = new 엑셀();		// 오류 type mismatch 오류
		//중형차들[2] = new 아반떼();	// 오류 type mismatch 오류
		//중형차들[2] = new 제네시스();	// 오류 type mismatch 오류
		
		// 주행보조편의사양이 제공되는 차량
		주행보조편의사양[] 주행보조편의사양차량 = new 주행보조편의사양[3];
		주행보조편의사양차량[0] = new 쏘나타();
		주행보조편의사양차량[1] = new 그랜져();
		주행보조편의사양차량[2] = new 제네시스();
		
		차[] 차량들 = new 차[5];
		차량들[0] = new 마티즈();
		차량들[1] = new 엑셀();
		차량들[2] = new 아반떼();
		차량들[3] = new 쏘나타();
		차량들[4] = new 그랜져();
		차량들[5] = new 제네시스();
		
		
		
	}
}
