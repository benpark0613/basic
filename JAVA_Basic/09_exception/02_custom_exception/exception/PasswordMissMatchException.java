package example_10_13_custom_exception.exception;

public class PasswordMissMatchException extends HtaException{

	public PasswordMissMatchException() {}
	
	public PasswordMissMatchException(String message) {
		super(message);
	}

	public PasswordMissMatchException(String message, Throwable cause) {
		super(message, cause);
	}
}
