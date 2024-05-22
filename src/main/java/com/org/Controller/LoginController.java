package com.org.Controller;

import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.Dao.UserDao;
import com.org.Model.Persons;
import com.org.Model.Users;
import com.org.Service.PersonService;
import com.org.Service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	PersonService personService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userService;
	
	@ModelAttribute
	public void commonData(Model model) {
		
		model.addAttribute("personService",personService);
		model.addAttribute("userService",userService);
	}

	@RequestMapping("/login")
	public String jumpOnToLogin()
	{
		if((Users) session.getAttribute("loginUser") != null)
		{
			System.out.println("I am inside ");
			
			return "redirect:/persons";
		}
		return"login";
	}
	
	@RequestMapping(path = "/verifyLogin" , method = RequestMethod.POST)
	public String personAction(@RequestParam("email") String email ,  @RequestParam("password") String password	, Model model)
	{
		
		
			List<Users> usersList = userService.getAllUsers();
			Users users = usersList.stream().filter(p->p.getEmail().equals(email) && p.getPassword().equals(password)).findAny().orElse(null);
			System.out.println(users);
			if(users != null) {
				session.setAttribute("loginUser", users);
				return "person";
			}
			else {
				
				
				model.addAttribute("user",new Users());
				
				return "login";
			}
			
		
	
	}
	
	@RequestMapping(path = "/index")
	public String testing() {
		
		return "index";
	}
	
	
	@RequestMapping(path = "/logout")
	public String logOut(Model model	)
	{
		
		session.invalidate();
		model.addAttribute("logoutStatus",true);
		return "redirect:/login";
	}
}
