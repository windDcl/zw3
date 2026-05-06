package com.govqa.common;

public class BizException extends RuntimeException {
    // 业务异常类型：用于返回可读的业务错误信息
    public BizException(String message) {
        super(message);
    }
}
