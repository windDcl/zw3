package com.govqa.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "system_setting")
public class SystemSetting {
    // 系统配置项：以 key-value 形式保存运行参数
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "setting_key")
    private String settingKey;
    @Column(name = "setting_value")
    private String settingValue;
    @Column(name = "updated_at", insertable = false, updatable = false)
    private LocalDateTime updatedAt;
}
