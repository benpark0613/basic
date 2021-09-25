package example_09_13_coding;

import java.util.Scanner;
import java.util.concurrent.atomic.AtomicInteger;

public class StudentApp3 {

	public static void main(String[] args) {
		// 학생정보/성적정보를 입력하고, 조회하고, 변경하는 프로그램
		
		// AtomicInteger는 자동으로 업데이트되는 숫자를 제공하는 객체다.
		// new AtomicInteger(숫자) : 지정된 숫자부터 시작한다.
		AtomicInteger atomic = new AtomicInteger(101);
		Scanner scan = new Scanner(System.in);
		Student[] students = new Student[100];
		int position = 0;						// 새로 입력한 학생/시험성적 정보를 저장하는 위치정보를 가지고 있는 객체
		
		// 샘플 학생정보 미리 입력해두기
		students[position++] = new Student(atomic.getAndIncrement(), 1, "김유신", new ScoreDetail(100, 90, 70));
		students[position++] = new Student(atomic.getAndIncrement(), 1, "이순신", new ScoreDetail(90, 80, 60));
		students[position++] = new Student(atomic.getAndIncrement(), 1, "곽재우", new ScoreDetail(70, 30, 70));
		students[position++] = new Student(atomic.getAndIncrement(), 1, "류성룡", new ScoreDetail(50, 40, 50));
		students[position++] = new Student(atomic.getAndIncrement(), 1, "사명당", new ScoreDetail(10, 50, 70));
		
		while (true) {
			System.out.println("-----------------------------------------------");
			System.out.println("1.조회  2.입력  3.수정  4.삭제  0.종료");
			System.out.println("-----------------------------------------------");
			
			System.out.print("메뉴번호 선택: ");
			int menuNo = scan.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[전체 학생/시험성적 정보 출력]");
				if (position == 0) {
					System.out.println("### 등록된 학생/시험성적 정보가 존재하지 않습니다.");
				} else {
					System.out.println("학번\t학년\t이름\t국어\t영어\t수학\t총점\t평균");
					for (Student student : students) {
						// student 참조변수에 null이 대입되면 반복을 중단하고 for문을 탈출한다.
						if (student == null) {
							break;
						}
						System.out.print(student.getNo() + "\t");
						System.out.print(student.getGrade() + "\t");
						System.out.print(student.getName() + "\t");
						System.out.print(student.getScore().getKor() + "\t");
						System.out.print(student.getScore().getEng() + "\t");
						System.out.print(student.getScore().getMath() + "\t");
						System.out.print(student.getScore().getTotal() + "\t");
						System.out.println(student.getScore().getAverage());
					}
					System.out.println("### 등록된 학생/시험성적 정보의 출력이 완료되었습니다.");
				}
			} else if (menuNo == 2) {
				System.out.println("[신규 학생/성적 정보 입력]");
				System.out.println("### 신규 학생/시험성적 정보를 입력하세요.");
				
				// AtomicInteger 객체의 getAndIncrement() 메소드를 실행해서 AtomicInteger객체의 현재 값을 가져오고, 값을 1증가 시킨다.
				int no = atomic.getAndIncrement();
				
				System.out.print("학년입력: ");
				int grade = scan.nextInt();
				
				System.out.print("이름입력: ");
				String name = scan.next();
				
				System.out.print("국어입력: ");
				int kor = scan.nextInt();
				
				System.out.print("영어입력: ");
				int eng = scan.nextInt();
				
				System.out.print("수학입력: ");
				int math = scan.nextInt();
				
				ScoreDetail score = new ScoreDetail(kor, eng, math);
				Student student = new Student(no, grade, name, score);
				
				students[position] = student;
				position++;
				System.out.println("### 학생/시험성적 정보의 저장이 완료되었습니다.");
				
			} else if (menuNo == 3) {
				System.out.println("[학생/시험성적 정보 변경]");
				System.out.println("### 시험성적 정보를 수정합니다.");
				
				System.out.print("수정할 학생의 학번 입력: ");
				int no = scan.nextInt();
				
				System.out.print("수정할 과목명 입력: ");
				String subject = scan.next();
				
				System.out.print("수정된 점수 입력: ");
				int value = scan.nextInt();
				
				// 위에서 입력한 학번과 일치하는 학번을 가진 Student객체의 주소값을 저장할 참조변수 생성
				Student foundStudent = null;
				for (Student student : students) {
					if (student == null) {
						break;
					}
					if (student.getNo() == no) {
						foundStudent = student;
						break;
					} 
				}
				// 위에서 입력한 학번과 일치하는 학번을 가진 Student객체가 존재하는 경우
				if (foundStudent != null) {
					// foundStudent객체가 참조하는 Student객체에 포함된 ScoreDetail객체를 조회해서 그 객체의 주소값을 score 변수에 대입한다.
					ScoreDetail score = foundStudent.getScore();
					// switch문을 사용해서 subject 변수에 저장된 값이 각각 "국어", "영어", "수학" 일 때 해당과목의 성적을 변경한다.
					switch (subject) {
						case "국어":
							score.setKor(value);
							break;
						case "영어":
							score.setEng(value);
							break;
						case "수학":
							score.setMath(value);
							break;
					}
					System.out.println("### 시험성적 정보의 수정이 완료되었습니다.");
				}

			} else if (menuNo == 4) {
				System.out.println("[학생/시험성적 정보 삭제]");
				System.out.println("### 학생정보를 삭제합니다.");
				
				System.out.println("삭제할 번호를 입력: ");
				int no = scan.nextInt();
				
				int foundIndex = -1;
				for (int i = 0; i < position; i++) {
					Student student = students[i];
					if (student.getNo() == no) {
						foundIndex = i;
						break;
					}
				}
				if (foundIndex != -1) {
					students[foundIndex] = students[position - 1];
					students[position - 1] = null;
					position--;
				} else {
					System.out.println("### 입력한 학번과 일치하는 학생정보를 찾을 수 없습니다.");
				}
					
				
			} else if (menuNo == 0) {
				System.out.println("[프로그램을 종료]");
				break;
			}
			System.out.println("\n\n\n");
		}
		scan.close();
	}
}















