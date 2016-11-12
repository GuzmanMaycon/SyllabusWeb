package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.junior.to.Usuario;

@Controller
public class LoginController
{
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public ModelAndView displayLogin(Usuario usuario)
    {
        ModelAndView model = new ModelAndView("login/login");
        model.addObject("usuario", usuario);

        return model;
    }
}

