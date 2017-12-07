package com.lruikmy.control;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lruikmy.pojo.Dept;
import com.lruikmy.service.DeptService;

@Controller
@RequestMapping("dc")
public class DeptController {

	@Resource
	DeptService deptService;
	
	@RequestMapping(value="depts",method=RequestMethod.POST)
	@ResponseBody
	public List<Dept> allDept(){
		return deptService.findAllDept();
	}
	
	
	
}
