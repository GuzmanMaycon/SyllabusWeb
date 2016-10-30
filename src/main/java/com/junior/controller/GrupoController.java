package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/grupos")
public class GrupoController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map)
    {
        return "grupos/index";
    }

}
