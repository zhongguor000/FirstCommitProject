package com.lruikmy.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lruikmy.dto.PageBean;
import com.lruikmy.pojo.User;
import com.lruikmy.service.UserService;

@Controller
@RequestMapping("uc")
public class UserController {
	@Resource
	UserService userService;
	
	@RequestMapping("islogin")
	public String login(User user,HttpServletRequest request){
		if(user.getLoginname()==null&&user.getLoginpwd()==null&&request.getSession().getAttribute("user")!=null){
			return "page/main";
		}
		User loginUser = userService.login(user);
		if(loginUser!=null){
			request.getSession().setAttribute("user", loginUser);
			return "page/main";
		}else{
			request.setAttribute("msg", "用户名或密码错误");
			return "index";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("userpage")
	public String findUserPage(PageBean<List<User>> pageBean,HttpServletRequest request){
		PageBean<List<User>> page = userService.findPage(pageBean);
		request.setAttribute("page", page);
		return "page/frame/uc/user_list";
	}
	
	
	@RequestMapping(value="adduser")
	public String addUser(User user,MultipartFile file,HttpServletRequest request,Model model){
		if(user.getLoginname()==null&&file==null){
			return "page/frame/uc/user_add";
		}
		if("".equals(user.getLoginname())||"".equals(user.getLoginpwd())){
			model.addAttribute("msg","请输入用户名或密码不能为空");
		}else{
			//上传图片
			if(!file.isEmpty()){
				String originalFilename = file.getOriginalFilename();
				System.out.println(file);
				String fileName=UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
				//request.getSession().getServletContext().getRealPath("/uploadfile")
				String path="D:/uploadfile/"+fileName;
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path));
				} catch (IOException e) {
					e.printStackTrace();
				}
				user.setPicpath(fileName);
			}
			boolean b = userService.addUser(user);
			model.addAttribute("isAdd",b);
		}
		return "page/frame/uc/user_add";
	}
	
	
	/**
	 * 变更岗位
	 * @param user
	 * @return
	 */
	@RequestMapping(value="changerole",method=RequestMethod.POST)
	@ResponseBody
	public boolean changeRole(User user){
		boolean update = userService.updateUser(user);
		return update;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value="deleteuser",method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteUser(Integer userid){
		boolean delete = userService.deleteUser(userid);
		return  delete;
	}
	
	
}
