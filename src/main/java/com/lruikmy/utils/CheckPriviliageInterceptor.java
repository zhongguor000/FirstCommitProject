package com.lruikmy.utils;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lruikmy.pojo.Priviliage;
import com.lruikmy.pojo.User;

public class CheckPriviliageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			response.sendRedirect("uc/islogin");
			return false;
		}
		String servletPath = request.getServletPath();
		List<Priviliage> priList = user.getRole().getPriList();
		
		for (Priviliage priviliage : priList) {
			if(priviliage!=null&&servletPath.equals("/"+priviliage.getPriUrl())){
				return true;
			}
		}
		response.sendRedirect(basepath+"nopriviliage.jsp");
		return false;
	}
}
