package com.great.talent.controller;

import com.great.talent.entity.User;
import com.great.talent.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Resource
	private UserService userService;

	@RequestMapping("/login")
	public String Welcome(){
		return "login";
	}

	@RequestMapping("/loginAjax")
	@ResponseBody
	public String userLogin(User user){
		User user1=userService.login(user);
		System.out.println(user1);
		return "success";
	}
}
