package com.govqa.repository;

import com.govqa.entity.SystemSetting;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SystemSettingRepository extends JpaRepository<SystemSetting, Long> {
    // 系统配置数据访问：通过配置 key 读取参数
    Optional<SystemSetting> findBySettingKey(String settingKey);
}
