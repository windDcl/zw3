package com.govqa.dto;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class SettingUpdateRequest {
    // 系统配置更新请求参数
    private Map<String, String> settings = new HashMap<>();
}
