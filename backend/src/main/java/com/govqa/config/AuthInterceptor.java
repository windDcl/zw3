package com.govqa.config;

import com.govqa.service.AuthService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@RequiredArgsConstructor
public class AuthInterceptor implements HandlerInterceptor {
    private final AuthService authService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String path = request.getRequestURI();
        // 仅拦截后台管理接口；登录接口放行
        if (!path.startsWith("/api/admin") || path.equals("/api/admin/login")) {
            return true;
        }
        String token = request.getHeader("Authorization");
        // token 缺失或无效时直接返回 401，前端据此跳转登录
        if (token == null || token.isBlank() || !authService.isValid(token)) {
            response.setStatus(401);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"code\":401,\"message\":\"未登录或登录已过期\",\"data\":null}");
            return false;
        }
        return true;
    }
}
