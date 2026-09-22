package com.dyh.doctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 前端页面路由：管理员后台使用 /admin
 */
@Controller
public class PageController {

    @GetMapping({"/admin", "/admin/"})
    public String adminPage() {
        return "forward:/index.html";
    }
}
