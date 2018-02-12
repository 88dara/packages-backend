package com.oyo.packagesbackend.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

//@Controller
//public class welcome {
//
//    @RequestMapping("/")
//    public String welcome(Model modelMap) {
//        modelMap.addAttribute("message", "Welcome to spring boot");
//        return "welcome";
//    }
//}
//
@Controller
public class WelcomeController {

    // inject via application.properties
    @Value("${welcome.message:test}")
    private String message = "Hello World";

    @RequestMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("message", this.message);
        return "welcome";
    }

}