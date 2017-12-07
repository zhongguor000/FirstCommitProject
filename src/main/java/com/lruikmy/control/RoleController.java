package com.lruikmy.control;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lruikmy.pojo.Role;
import com.lruikmy.service.RoleService;

@Controller
@RequestMapping("rc")
public class RoleController {

	@Resource
	RoleService roleService;
	
	@ResponseBody
	@RequestMapping(value="roles",method=RequestMethod.POST)
	public List<Role> allRole(){
		return roleService.findAllRole();
	}
	
}
