package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/syllabus")
public class SyllabusController {
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap map)
	{
		map.addAttribute("course_name", "Programacion I");
		return "syllabus_template";
	}	
}
