package com.govqa.repository;

import com.govqa.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    // 管理员数据访问：登录时按用户名查询
    Optional<Admin> findByUsernameAndStatus(String username, Integer status);
}
