package com.govqa.repository;

import com.govqa.entity.Announcement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AnnouncementRepository extends JpaRepository<Announcement, Long> {
    // 公告数据访问：管理端维护与市民端展示
    List<Announcement> findByStatusOrderByIsTopDescPublishTimeDesc(Integer status);
}
