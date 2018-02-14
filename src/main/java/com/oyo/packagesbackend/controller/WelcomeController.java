package com.oyo.packagesbackend.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class WelcomeController {

    private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

    @RequestMapping(value = "/submit", method = RequestMethod.GET)
    public String submit(Map<String, Object> model, @RequestParam Map<String, String> requestParams) {

        logger.debug("In Welcome controller:");

        model.put("location", requestParams.get("location"));
        model.put("duration", requestParams.get("duration"));

        return "page2";
    }
}
