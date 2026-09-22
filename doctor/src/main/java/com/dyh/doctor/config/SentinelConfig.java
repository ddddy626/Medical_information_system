package com.dyh.doctor.config;

import com.alibaba.csp.sentinel.annotation.aspectj.SentinelResourceAspect;
import com.alibaba.csp.sentinel.slots.block.RuleConstant;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeRule;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeRuleManager;
import com.alibaba.csp.sentinel.slots.block.flow.FlowRule;
import com.alibaba.csp.sentinel.slots.block.flow.FlowRuleManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class SentinelConfig {

    public static final String AI_SUGGEST_RESOURCE = "aiSuggest";

    @Value("${sentinel.dashboard.server:localhost:8080}")
    private String dashboardServer;

    @Value("${sentinel.ai.qps:5}")
    private double aiQps;

    @Bean
    public SentinelResourceAspect sentinelResourceAspect() {
        return new SentinelResourceAspect();
    }

    @PostConstruct
    public void initRules() {
        // Dashboard 地址通过系统属性供 transport 可选使用；无 transport 依赖时仅本地规则生效
        System.setProperty("csp.sentinel.dashboard.server", dashboardServer);

        List<FlowRule> flowRules = new ArrayList<>();
        FlowRule flow = new FlowRule();
        flow.setResource(AI_SUGGEST_RESOURCE);
        flow.setGrade(RuleConstant.FLOW_GRADE_QPS);
        flow.setCount(aiQps);
        flowRules.add(flow);
        FlowRuleManager.loadRules(flowRules);

        List<DegradeRule> degradeRules = new ArrayList<>();
        DegradeRule degrade = new DegradeRule();
        degrade.setResource(AI_SUGGEST_RESOURCE);
        degrade.setGrade(RuleConstant.DEGRADE_GRADE_EXCEPTION_RATIO);
        degrade.setCount(0.5);
        degrade.setTimeWindow(10);
        degrade.setStatIntervalMs(3000);
        degrade.setMinRequestAmount(5);
        degradeRules.add(degrade);
        DegradeRuleManager.loadRules(degradeRules);
    }
}
