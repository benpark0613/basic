package example_09_24_abstract_template;

public class TransferJob extends AbstractBankingJob {

	// AbstractBankingJob에 추상화되어 있는 job()을 구현한다.
	@Override
	public void job() {
		System.out.println("카드를 삽입하세요");
		System.out.println("상대방 계좌번호를 입력하세요");
		System.out.println("이체금액을 입력하세요: 2,000,000원");
		System.out.println("비밀번호를 입력하세요: ****");
		System.out.println("이체처리 중 ......");
		System.out.println("이체처리가 완료되었습니다.");
	}	
}
