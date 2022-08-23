package com.agent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Scanner;

/**
 * @author : cunyu
 * @version : 1.0
 * @className : HelloController
 * @date : 2020/7/21 8:19
 * @description : 控制器
 */

@Controller
public class WelcomeController {
    // 浏览器访问 ip:port/项目名/hello
    @GetMapping("/hello")
    public String sayHello(Model model) {
        String name = "帅哥";
        model.addAttribute("name", name);
        // 访问 /WEB-INF/jsp/hello.jsp
        return "hello";
    }
}

