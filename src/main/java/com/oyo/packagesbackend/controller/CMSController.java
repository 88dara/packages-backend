package com.oyo.packagesbackend.controller;

import com.oyo.packagesbackend.client.CmsRestApiClient;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class CMSController {

    private static final Logger logger = LoggerFactory.getLogger(CMSController.class);

    @Autowired
    CmsRestApiClient cmsRestApiClient;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(Map<String, Object> model) {

        logger.debug("In CMS controller:");

        JSONObject jsonObject = cmsRestApiClient.getInstances("6662");

        model.put("message", jsonObject.get("status"));
        return "welcome";
    }

}
