package example_10_13_custom_exception.exception;

public class UserAlreadyExistException extends HtaException {

	public UserAlreadyExistException() {}
	
	public UserAlreadyExistException(String message) {
		super(message);
	}

	public UserAlreadyExistException(String message, Throwable cause) {
		super(message, cause);
	}
}
