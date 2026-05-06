package com.govqa.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class LoginRequest {
    // 管理员登录请求参数
    @NotBlank
    private String username;
    @NotBlank
    private String password;
}
