package com.tenco.blog.handler.exception;

import org.springframework.http.HttpStatus;

public class BoardException extends RuntimeException {
	
	private HttpStatus httpStatus;
	
	public BoardException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
}
