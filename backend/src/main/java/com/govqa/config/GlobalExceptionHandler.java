package com.govqa.config;

import com.govqa.common.ApiResponse;
import com.govqa.common.BizException;
import jakarta.validation.ConstraintViolationException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BizException.class)
    public ApiResponse<Void> handleBiz(BizException e) {
        // 业务可预期异常：给前端返回明确提示文案
        return ApiResponse.fail(e.getMessage());
    }

    @ExceptionHandler({MethodArgumentNotValidException.class, BindException.class, ConstraintViolationException.class,
            HttpMessageNotReadableException.class})
    public ApiResponse<Void> handleValidation(Exception e) {
        // 参数校验/反序列化异常统一归口，避免控制器重复 try-catch
        return ApiResponse.fail("请求参数错误: " + e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public ApiResponse<Void> handleUnknown(Exception e) {
        // 兜底异常处理，保证接口始终返回统一结构
        return ApiResponse.fail("系统异常: " + e.getMessage());
    }
}
