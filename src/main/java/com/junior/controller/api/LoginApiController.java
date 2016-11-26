package com.junior.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junior.dao.design.IUsuarioDao;
import com.junior.wrapper.LoginWrapper;

@RequestMapping("/api")
@Controller
public class LoginApiController {

    @Autowired
    private IUsuarioDao usuarioDao;

    public void setUsuarioDao(IUsuarioDao usuarioDao)
    {
        this.usuarioDao = usuarioDao;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody LoginWrapper obtenerPorAsignaturaAperturada(
        @RequestParam("username") String username,
        @RequestParam("password") String password)
    {
        LoginWrapper response = new LoginWrapper();
        response.setResponse(usuarioDao.autenticar(username, password) ? "YES" : "NO");
        return response;
    }
}
