package com.oyo.packagesbackend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller

public class SubmitButton {

    @RequestMapping(value = "/submit", method = RequestMethod.GET)
    public String submit(Map<String, Object> model, @RequestParam Map<String, String> requestParams) {

        model.put("location", requestParams.get("location"));
        model.put("duration", requestParams.get("duration"));

        return "submit_search";
    }

}
