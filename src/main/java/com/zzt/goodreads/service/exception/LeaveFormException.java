package com.zzt.goodreads.service.exception;

/**
 * 请假流程异常
 *
 * @author moqi
 */
public class LeaveFormException extends RuntimeException {
    public LeaveFormException(String message) {
        super(message);
    }
}
