package com.govqa.config;

import com.govqa.service.GraphProperties;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class BeanConfig {
    // Spring Bean 配置：注册项目运行所需基础组件
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean(destroyMethod = "close")
    @ConditionalOnProperty(prefix = "app.graph", name = "enabled", havingValue = "true")
    public Driver neo4jDriver(GraphProperties graphProperties) {
        return GraphDatabase.driver(
                graphProperties.getUri(),
                AuthTokens.basic(graphProperties.getUsername(), graphProperties.getPassword())
        );
    }
}
